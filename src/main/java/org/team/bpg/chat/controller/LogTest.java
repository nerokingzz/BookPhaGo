package org.team.bpg.chat.controller;

import java.util.ArrayList;
import java.util.List;

import com.ibm.cloud.sdk.core.security.IamAuthenticator;
import com.ibm.watson.assistant.v1.Assistant;
import com.ibm.watson.assistant.v1.model.ListAllLogsOptions;
import com.ibm.watson.assistant.v1.model.Log;
import com.ibm.watson.assistant.v1.model.LogCollection;

public class LogTest {

	public static void main(String[] args) {
		


		
		List<String> userIDList = new ArrayList<String>();
<<<<<<< HEAD
		List<String> sessionIDList = new ArrayList<String>();
=======
		List<String> logIDList = new ArrayList<String>();
>>>>>>> branch 'master' of https://github.com/nerokingzz/BookPhaGo.git
		List<String> conversationIDList = new ArrayList<String>();
		
		
		IamAuthenticator authenticator = new IamAuthenticator("h7PRZ0LHzr0sl-TdVUBSAeV_3ELopOoigC6A39csnqGf");
		Assistant assistant = new Assistant("2020-04-23", authenticator);

		// service endpoint
		assistant.setServiceUrl("https://api.kr-seo.assistant.watson.cloud.ibm.com");
		// assistant id
		String workspaceId = "4b05d813-310b-4086-9bb5-db853f49f12e";


		String filter = "language::ko,request.context.system.assistant_id::4b05d813-310b-4086-9bb5-db853f49f12e";

		String cursor = "";
		
		int pageLimit = 2000;
		
		int logCount = 0;
		
		while (true) {
			
			ListAllLogsOptions options = new ListAllLogsOptions.Builder(filter).pageLimit(pageLimit).cursor(cursor).build();

			LogCollection response = assistant.listAllLogs(options).execute().getResult();

			// String logResult = response.toString();
			List<Log> logList = response.getLogs();

			for (Log log : logList) {
<<<<<<< HEAD

				
				if(log.getResponse().getEntities().size() == 0 && log.getResponse().getIntents().size() == 0 
						&& log.getRequest().input().getText().isEmpty() == false) {
					System.out.println("message with weak understanding..." + log.getRequest().input().getText());
				}
				
				
=======
				logIDList.add(log.getLogId());
				conversationIDList.add(log.getRequest().context().getConversationId());
				userIDList.add(log.getRequest().context().getMetadata().userId());
				logCount++;
>>>>>>> branch 'master' of https://github.com/nerokingzz/BookPhaGo.git
			}
			if (response.getPagination().getNextCursor() == null) {
				break;
			} else {
				cursor = response.getPagination().getNextCursor();
			}
			
			
		}
<<<<<<< HEAD
		/*
		System.out.println("Log의 총 개수는 " + logCount + "개입니다.");
		System.out.println("Session ID의 개수는 " + getDistinctLogic(sessionIDList) + "개입니다.");
		System.out.println("Conversation ID의 개수는 " + getDistinctLogic(conversationIDList) + "개입니다.");
		System.out.println("User ID의 개수는 " + getDistinctLogic(userIDList) + "개입니다.");
		*/
=======
>>>>>>> branch 'master' of https://github.com/nerokingzz/BookPhaGo.git
		
<<<<<<< HEAD
=======
		System.out.println("Log의 총 개수는 " + logCount + "개입니다.");
		System.out.println("Log ID의 개수는 " + getDistinctLogic(logIDList) + "개입니다.");
		System.out.println("Conversation ID의 개수는 " + getDistinctLogic(conversationIDList) + "개입니다.");
		System.out.println("User ID의 개수는 " + getDistinctLogic(userIDList) + "개입니다.");

		
>>>>>>> branch 'master' of https://github.com/nerokingzz/BookPhaGo.git
	}
	
	public static int getDistinctLogic(List<String> originList){
		List<String> resultList = new ArrayList<String>();
		
		for(int i = 0; i < originList.size(); i++) {
			
			if(!resultList.contains(originList.get(i))) {
				resultList.add(originList.get(i));
			}
		}
		
		
		return resultList.size();
	}

}
