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
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
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
//@Controller
//@RequestMapping("/log/*")
public class LogController {
	@Autowired
	LogService logService;

	IamAuthenticator authenticator = new IamAuthenticator("ANyIMEYJfIaxhSkiW7A4BOUWpzjXvESa-ODxVh4GPd24");
	Assistant assistant = new Assistant("2020-04-14", authenticator);

	public LogController() {
		// service endpoint
		assistant.setServiceUrl("https://api.kr-seo.assistant.watson.cloud.ibm.com");
		// assistant id
		String workspaceId = "f9343fcd-8c38-425c-ae72-28dcfd5ade16";

	}

	// @RequestMapping("downloadCsv.do")
	public List<RequestLogVO> exportRequestLogs() throws UnsupportedEncodingException {

		Assistant assistant = this.assistant;

		String filter = "language::ko,request.context.system.assistant_id::f9343fcd-8c38-425c-ae72-28dcfd5ade16";

		ListAllLogsOptions options = new ListAllLogsOptions.Builder(filter).pageLimit(10).build();

		LogCollection response = assistant.listAllLogs(options).execute().getResult();

		String logResult = response.toString();
		List<Log> logList = response.getLogs();

		List<RequestLogVO> logObjectList = new ArrayList<RequestLogVO>();

		for (Log log : logList) {
			RequestLogVO vo = new RequestLogVO();
			String userID = "";
			String requestText = "";
			String requestTime = log.getRequestTimestamp().toString();
			userID = log.getRequest().context().getMetadata().userId();

			if (userID != null) {
				if (userID.contains("anonymous_IBMuid"))
					userID = "비회원";
				userID = URLDecoder.decode(userID, "UTF-8");
			}

			requestText = log.getRequest().input().getText();
			vo.setUserId(userID);
			vo.setInputText(requestText);
			vo.setRequestTime(requestTime);
			logObjectList.add(vo);
		}

		return logObjectList;

	}

	public void keepAsking() throws UnsupportedEncodingException {

		Assistant assistant = this.assistant;
		String cursor = "";

		String filter = "language::ko,request.context.system.assistant_id::f9343fcd-8c38-425c-ae72-28dcfd5ade16";
		
		List<RequestLogVO> logObjectList = new ArrayList<RequestLogVO>();

		while (true) {

			ListAllLogsOptions options = new ListAllLogsOptions.Builder(filter).pageLimit(500).cursor(cursor).build();

			LogCollection response = assistant.listAllLogs(options).execute().getResult();

			// String logResult = response.toString();
			List<Log> logList = response.getLogs();

			for (Log log : logList) {

				RequestLogVO vo = new RequestLogVO();
				String userID = "";
				String requestText = "";
				String requestTime = log.getRequestTimestamp().toString();
				userID = log.getRequest().context().getMetadata().userId();

				if (userID != null) {
					if (userID.contains("anonymous_IBMuid"))
						userID = "비회원";
					userID = URLDecoder.decode(userID, "UTF-8");
				}

				requestText = log.getRequest().input().getText();
				vo.setUserId(userID);
				vo.setInputText(requestText);
				vo.setRequestTime(requestTime);
				logObjectList.add(vo);
			}

			if (response.getPagination().getNextCursor() == null) {
				break;
			} else {
				cursor = response.getPagination().getNextCursor();
			}
		}
		
		if(logObjectList.size() == 0) {
			LogService lService = new LogServiceImpl();
			lService.createCSV(logObjectList);
		}
		else {
			System.out.println("this is null.......T.T");
		}

	}

}
