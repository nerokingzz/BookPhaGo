package org.team.bpg.chat.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.AbstractView;
import org.team.bpg.book.service.LibraryService;
import org.team.bpg.chat.service.ChatService;
import org.team.bpg.chat.service.LogService;
import org.team.bpg.chat.service.LogServiceImpl;
import org.team.bpg.chat.vo.RequestLogVO;

import com.ibm.cloud.sdk.core.security.IamAuthenticator;
import com.ibm.watson.assistant.v1.Assistant;
import com.ibm.watson.assistant.v1.model.ListAllLogsOptions;
import com.ibm.watson.assistant.v1.model.Log;
import com.ibm.watson.assistant.v1.model.LogCollection;

@EnableWebMvc
@RestController
@RequestMapping("/log/*")
public class LogController {
	@Autowired
	LogService logService;

	private IamAuthenticator authenticator = new IamAuthenticator("h7PRZ0LHzr0sl-TdVUBSAeV_3ELopOoigC6A39csnqGf");
	private Assistant assistant = new Assistant("2020-04-23", authenticator);
	private String filter = "language::ko,request.context.system.assistant_id::4b05d813-310b-4086-9bb5-db853f49f12e";
	private int pageLimit = 2000;
	private String cursor = "";

	public LogController() {
		// service endpoint
		assistant.setServiceUrl("https://api.kr-seo.assistant.watson.cloud.ibm.com");
		// assistant id
		String workspaceId = "4b05d813-310b-4086-9bb5-db853f49f12e";
		
		this.cursor = "";

	}
	
	
	@RequestMapping("totalID.do")
	//기간에 관계 없이 전체 기간에 걸쳐 누적된 User ID 개수를 구한다.
	public int collectTotalIDs() {
		List<String> originList = new ArrayList<String>();
		
		while (true) {
			
			ListAllLogsOptions options = new ListAllLogsOptions.Builder(filter).pageLimit(pageLimit).cursor(cursor).build();

			LogCollection response = assistant.listAllLogs(options).execute().getResult();

			// String logResult = response.toString();
			List<Log> logList = response.getLogs();

			for (Log log : logList) {
				String userID = "";
				userID = log.getRequest().context().getMetadata().userId();
				originList.add(userID);
			}
			if (response.getPagination().getNextCursor() == null) {
				break;
			} else {
				cursor = response.getPagination().getNextCursor();
			}
		}
		int result = getDistinct(originList);
		return result;
	}
	
	
	@RequestMapping("todayID.do")
	//오늘의 userID 개수 수집해 중복을 제거합니다.
	public List<Integer> collectTodayIDs() {
		List<Integer> resultList = new ArrayList<Integer>();
		
		
		List<String> originList = new ArrayList<String>();
		String filter = this.filter;
		
		//startDate와 endDate를 yyyy-MM-dd 형식으로 바꿔주는 구문
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
		Date date = new Date();
		String dateStr = format1.format(date);
		
		
		filter += ",response_timestamp>=" + dateStr + ",response_timestamp<=" + dateStr;
		
		int logCount = 0;
		while (true) {
			
			ListAllLogsOptions options = new ListAllLogsOptions.Builder(filter).pageLimit(pageLimit).cursor(cursor).build();

			LogCollection response = assistant.listAllLogs(options).execute().getResult();

			// String logResult = response.toString();
			List<Log> logList = response.getLogs();

			for (Log log : logList) {
				String userID = "";
				userID = log.getRequest().context().getMetadata().userId();
				originList.add(userID);
				logCount++;
			}
			if (response.getPagination().getNextCursor() == null) {
				break;
			} else {
				cursor = response.getPagination().getNextCursor();
			}
		}
		int todayResult = getDistinct(originList);
		
		
		resultList.add(todayResult);
		resultList.add(logCount);
		return resultList;
	}
	
	
	
	//intent와 entity의 개수를 count하고 List<Hashmap> 형태로 view에 리턴한다.
	//현재까지 누적된 모든 데이터를 바탕으로 한다.
	@RequestMapping("/ranks.do")
	public List<HashMap> Ranks() {

		List<String> intentList = new ArrayList<String>();
		List<String> entityList = new ArrayList<String>();

		long start = System.currentTimeMillis();
		while (true) {
			
			ListAllLogsOptions options = new ListAllLogsOptions.Builder(filter).pageLimit(pageLimit).cursor(cursor).build();

			LogCollection response = assistant.listAllLogs(options).execute().getResult();

			// String logResult = response.toString();
			List<Log> logList = response.getLogs();

			for (Log log : logList) {

				if (log.getResponse().getIntents().size() != 0) {
					String intent = log.getResponse().getIntents().get(0).intent();
					intentList.add(intent);
				}
				
				if (log.getResponse().getEntities().size() != 0) {
					String entity = log.getResponse().getEntities().get(0).entity();
					entityList.add(entity);
				}
				
			}
			if (response.getPagination().getNextCursor() == null) {
				break;
			} else {
				cursor = response.getPagination().getNextCursor();
			}
		}
		long end = System.currentTimeMillis();

		System.out.println( "api 실행 소요시간 : " + ( end - start )/1000.0 );


		//ArrayList 안의 중복된 키워드의 개수를 세 주는 부분
		HashMap<String, Integer> intentCount = new HashMap<String, Integer>();
        
		for(int i = 0 ; i < intentList.size() ; i++){ // ArrayList 만큼 반복
		    if (intentCount.containsKey(intentList.get(i))) { // HashMap 내부에 이미 key 값이 존재하는지 확인
		        intentCount.put(intentList.get(i), intentCount.get(intentList.get(i))  + 1);  // key가 이미 있다면 value에 +1
		    } else { // key값이 존재하지 않으면
		        intentCount.put(intentList.get(i) , 1); // key 값을 생성후 value를 1로 초기화
		    }
		}

		HashMap<String, Integer> entityCount = new HashMap<String, Integer>();
        
		for(int i = 0 ; i < entityList.size() ; i++){ // ArrayList 만큼 반복
		    if (entityCount.containsKey(entityList.get(i))) { // HashMap 내부에 이미 key 값이 존재하는지 확인
		        entityCount.put(entityList.get(i), entityCount.get(entityList.get(i))  + 1);  // key가 이미 있다면 value에 +1
		    } else { // key값이 존재하지 않으면
		        entityCount.put(entityList.get(i) , 1); // key 값을 생성후 value를 1로 초기화
		    }
		}
		
		System.out.println("intent count......" + intentCount);
		
		System.out.println("entity count......" + entityCount);
		List<HashMap> resultList = new ArrayList();
		//resultList.add(intentCount);
		//resultList.add(entityCount);
		
		HashMap IntentSortedMap = (HashMap) sortByValue(intentCount);
		HashMap EntitySortedMap = (HashMap) sortByValue(entityCount);
		
		resultList.add(IntentSortedMap);
		resultList.add(EntitySortedMap);

		return resultList;
	
	}
	
	

	//내부의 중복된 값을 제거하고 남은 고유 개수를 리턴한다. List<String>을 파라미터로 받는다.
	public int getDistinct(List<String> originList){
		List<String> resultList = new ArrayList<String>();
		
		for(int i = 0; i < originList.size(); i++) {
			
			if(!resultList.contains(originList.get(i))) {
				resultList.add(originList.get(i));
			}
		}
		return resultList.size();
	}
	
	
	//Value를 기준으로 맵을 내림차순 정렬해준다. Map<String, Integer>를 파라미터로 받는다.
	public static Map<String, Integer> sortByValue(Map<String,Integer> map){
		 List<Map.Entry<String, Integer>> list = new LinkedList<>(map.entrySet());
		
		Collections.sort(list, new Comparator<Map.Entry<String, Integer>>() {
           @Override
           public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
               int comparision = (o1.getValue() - o2.getValue()) * -1;
               return comparision == 0 ? o1.getKey().compareTo(o2.getKey()) : comparision;
           }
       });
       
       // 순서유지를 위해 LinkedHashMap을 사용
       Map<String, Integer> sortedMap = new LinkedHashMap<>(); 
       for(Iterator<Map.Entry<String, Integer>> iter = list.iterator(); iter.hasNext();){
           Map.Entry<String, Integer> entry = iter.next();
           sortedMap.put(entry.getKey(), entry.getValue());
       }
       return sortedMap;
		
	}
	 

}
