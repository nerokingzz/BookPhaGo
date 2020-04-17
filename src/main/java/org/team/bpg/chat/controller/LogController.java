package org.team.bpg.chat.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.team.bpg.book.service.LibraryService;
import org.team.bpg.chat.service.ChatService;
import org.team.bpg.chat.vo.RequestLogVO;

import com.ibm.cloud.sdk.core.security.IamAuthenticator;
import com.ibm.watson.assistant.v1.Assistant;
import com.ibm.watson.assistant.v1.model.ListAllLogsOptions;
import com.ibm.watson.assistant.v1.model.Log;
import com.ibm.watson.assistant.v1.model.LogCollection;

@Controller
public class LogController {
	
	@Autowired
	ChatService chatService;
	
	IamAuthenticator authenticator = new IamAuthenticator("ANyIMEYJfIaxhSkiW7A4BOUWpzjXvESa-ODxVh4GPd24");
	Assistant assistant = new Assistant("2020-04-14", authenticator);
	
	public LogController() {
		//service endpoint
		assistant.setServiceUrl("https://api.kr-seo.assistant.watson.cloud.ibm.com");
		//assistant id
		String workspaceId = "f9343fcd-8c38-425c-ae72-28dcfd5ade16";

	}
	
	public void exportRequestLogs() throws UnsupportedEncodingException {
		Assistant assistant = this.assistant;
		
		String filter = "language::ko,request.context.system.assistant_id::f9343fcd-8c38-425c-ae72-28dcfd5ade16";

		ListAllLogsOptions options = new ListAllLogsOptions.Builder(filter).pageLimit(900).build();

		LogCollection response = assistant.listAllLogs(options).execute().getResult();
		
		String logResult = response.toString();
		List<Log> logList = response.getLogs();
		
		List<RequestLogVO> logObjectList = new ArrayList<RequestLogVO>();


		for(Log log : logList) {
			RequestLogVO vo = new RequestLogVO();
			String userID = "";
			String requestText = "";
			String requestTime = log.getRequestTimestamp().toString();
			userID = log.getRequest().context().getMetadata().userId();
			
			if(userID != null) {
				if(userID.contains("anonymous_IBMuid")) userID = "비회원";
				userID = URLDecoder.decode(userID, "UTF-8");
			}
		
			
			requestText = log.getRequest().input().getText();
			
			vo.setUserId(userID);
			vo.setInputText(requestText);
			vo.setRequestTime(requestTime);
			logObjectList.add(vo);
		}
		
		/*
		for(int i =0; i < logObjectList.size(); i++) {
			System.out.println("=======================================");
			System.out.println(i+ "번째 requestLogVO의 id ...." + logObjectList.get(i).getUserId());
			System.out.println(i+ "번째 requestLogVO의 text ...." + logObjectList.get(i).getInputText());
			System.out.println("=======================================");
		}
		*/
		
		
			chatService.createCSV(logObjectList);
		
		
	}
			
			
			
		
}
