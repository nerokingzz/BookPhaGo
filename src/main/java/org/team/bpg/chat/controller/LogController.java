package org.team.bpg.chat.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TimeZone;
import java.util.TreeMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.AbstractView;
import org.team.bpg.book.service.LibraryService;
import org.team.bpg.chat.service.ChatService;
import org.team.bpg.chat.service.LogService;
import org.team.bpg.chat.service.LogServiceImpl;
import org.team.bpg.chat.vo.DialVO;
import org.team.bpg.chat.vo.EntityVO;
import org.team.bpg.chat.vo.IntentVO;
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

   public IamAuthenticator authenticator = new IamAuthenticator("h7PRZ0LHzr0sl-TdVUBSAeV_3ELopOoigC6A39csnqGf");
   public Assistant assistant = new Assistant("2020-05-01", authenticator);
   public String filter;
   public long pageLimit = 2000;
   public String cursor = "";


   public LogController() {
      // service endpoint
      assistant.setServiceUrl("https://api.kr-seo.assistant.watson.cloud.ibm.com");
      // assistant id
      String workspaceId = "4b05d813-310b-4086-9bb5-db853f49f12e";
      filter = "language::ko,request.context.system.assistant_id::4b05d813-310b-4086-9bb5-db853f49f12e";
      this.cursor = "";

   }
   

   @RequestMapping("totalID.do")
   public Map returnLogDatas() throws ParseException {
	   //

	   
	   Map selectLogCount = logService.selectLogCount();
	   String totalID = (String)selectLogCount.get("totalID");
	   String todayID = (String)selectLogCount.get("todayID");
	   String logCount = (String)selectLogCount.get("logCount");
	   String failCount = (String)selectLogCount.get("failCount");
	   
	   List<IntentVO> selectLogIntList = logService.selectLogInt();
	   List<EntityVO> selectLogEntList = logService.selectLogEnt();
	   List<DialVO> selectLogDialList = logService.selectLogDial();
	   
	   Map selectLogInt = new LinkedHashMap<>();
	   Map selectLogEnt = new LinkedHashMap<>();
	   Map selectLogDial = new LinkedHashMap<>();
	   
	   for(int i =0; i < selectLogIntList.size() ; i++) {
		   selectLogInt.put(selectLogIntList.get(i).getIntName(), selectLogIntList.get(i).getIntCount());
	   }
	   
	   for(int i =0; i < selectLogEntList.size() ; i++) {
		   selectLogEnt.put(selectLogEntList.get(i).getEntName(), selectLogEntList.get(i).getEntCount());
	   }
	   
	   for(int i =0; i < selectLogDialList.size() ; i++) {
		   selectLogDial.put(selectLogDialList.get(i).getDialDate(), selectLogDialList.get(i).getDialCount());
	   }
	   

	   
	   ArrayList resultList = new ArrayList();
	   
	   resultList.add(selectLogInt);
	   resultList.add(selectLogEnt);
	   
	   Map tm = selectLogDial; 
	    
	   
      Map resultMap = new HashMap<>();
      
      resultMap.put("totalID",totalID);
      resultMap.put("todayID",todayID);
      resultMap.put("logCount",logCount);
      resultMap.put("failCount",failCount);
      resultMap.put("ranks", resultList);
      resultMap.put("linechart", tm);
      
      
      
      return resultMap;
	   
	   
   }
   
	
	@RequestMapping("getLogFile.do")
	@ResponseBody
	public ResponseEntity<byte[]> letsGetLogFile(HttpServletRequest request, HttpServletResponse response) {
		byte[] imageContent=(byte[])logService.getLogFile(request).get(0).get("logFile");
		System.out.println("바이트 배열 객체 주소 : " + imageContent);
		System.out.println("바이트 배열 length : " + imageContent.length);
		
		
		final HttpHeaders headers=new HttpHeaders();
		//headers.setContentType(MediaType.);
		//headers.setContentDispositionFormData(name, filename);
		
		
		// response.setContentType("application/vnd.ms-excel");
        // response.setHeader("Content-disposition",
        //         "attachment; filename=Bookphago_Log" + "" + ".xls");
		
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		Date nowdate = new Date();
		String dateString = formatter.format(nowdate);
		
		String contentType="application/vnd.ms-excel";

	    return ResponseEntity.ok()

	                .contentType(MediaType.parseMediaType(contentType))

//	                .header(HttpHeaders.CONTENT_TYPE, "application/vnd.ms-excel")

	                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + "Bookphago_Log"+dateString +".xls" + "\"")

	                .body(imageContent);

	        
	}
	
	


   

    

}