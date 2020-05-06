package org.team.bpg.chatWeb;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatWebSocketHandler extends TextWebSocketHandler {
	
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	private Map<String, Map<String, WebSocketSession>> chatroomMap=new HashMap<>();
	
	
	//사용자가 연결했을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log(session.getId() + " 연결 됨");
		users.put(session.getId(), session);
		
	}
	
	//사용자가 연결을 끊었을때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log(session.getId() + " 연결 종료됨");
		users.remove(session.getId());
		
		for(String key : chatroomMap.keySet() ) {
    		Map<String, WebSocketSession> chatmemMap = chatroomMap.get(key);
    		chatmemMap.remove(session.getId());
    	}

	}
	
	//사용자가 웹소켓서버로 메세지를 전송했을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log(session.getId() + "로부터 메시지 수신: " + message.getPayload());
		
		//전달된 메세지를 분석해서 각 커뮤니티아이디에 맞는 방으로 들어가게
		
		//msgContext배열 -> community_id, mem_nickname, msg (json으로 전달해도 됨)
		String[] msgContext=message.getPayload().split(":");
		String community_id=msgContext[0]; //커뮤니티아이디
		String mem_nickname=msgContext[1]; //사용자닉네임
		String msg=msgContext[2]; //메세지내용
		
		//커뮤니티아이디들이 들어있는 리스트
		List<String> chatIdList=new ArrayList<>();
		chatIdList.add("21");
		chatIdList.add("42");
		
		for(String chatroomId : chatIdList) {
			if(chatroomMap.containsKey(chatroomId)) { 		// 이미 열린 채팅방일 경우
				Map<String, WebSocketSession> chatmemMap = chatroomMap.get(chatroomId);
				chatmemMap.put(session.getId(), session);
			} else {										// 열리지 않은 채팅방일 경우
				Map<String, WebSocketSession> chatmemMap = new HashMap<String, WebSocketSession>();
				chatmemMap.put(session.getId(), session);
				chatroomMap.put(chatroomId, chatmemMap);
			}
		}
		
		Map<String, WebSocketSession> chatmemList=chatroomMap.get(community_id);
		
		System.out.println("멤버리스트:"+chatmemList);
		
		for(String key : chatmemList.keySet()) {
			WebSocketSession ws = chatmemList.get(key);
			System.out.println("이힛:"+ws);
			ws.sendMessage(message);
			log(ws.getId() + "에 메시지 발송: " + message.getPayload()); 
		}
		
	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());
	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}
	
	
	

}
