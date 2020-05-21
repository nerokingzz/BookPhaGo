package org.team.bpg.chat.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.team.bpg.chat.service.ChatService;
import org.team.bpg.chat.service.LogService;
import org.team.bpg.chat.vo.BookVO;

@Component
public class BatchComp {
	
	@Autowired
	private ChatService chatService;
	
	@Autowired
	private LogService logService;
	

	
	/*
	  //하루에 한 번씩 C_LOG 테이블에 데이터를 insert한다
	  //실행시킬때 주석풀기 시작
	  
	  @Scheduled(fixedRate = 86400000)
	  public void insertLogDatas() throws ParseException {
	  
	  
	  Map originMap = logService.collectTotalIDs();
	  originMap.put("todayID",logService.collectTodayIDs());
	  
	  int result = logService.insertLogDatas(originMap);
	  
	  
	  System.out.println("모든 insert 결과값 : " + result); 
	  }
	 
	


	
	
	//하루에 한 번 C_LOG_FILE에 xls 파일을 저장하는 schedule
	@Scheduled(fixedRate = 86400000)
	public void logFileInsert() {
		int result = 0;
		
		try {
			result = logService.insertLogFile();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("logFileInsert 결과는 ...." + result);
		
	}
	
	  //실행시킬때 주석풀기 끝
	*/
	
		
	/* 테스트 코드
	  originMap.put("totalID","종합유저수"); originMap.put("todayID","금일이용자수");
	  originMap.put("logCount","총대화수"); originMap.put("failCount","실패대화수");
	  
	  
	  
	  Map intentList = new LinkedHashMap<>(); intentList.put("1등이름","1등count");
	  intentList.put("2등이름","2등count"); intentList.put("3등이름","3등count");
	  intentList.put("4등이름","4등count"); intentList.put("5등이름","5등count");
	  intentList.put("6등이름","6등count"); originMap.put("intentList",intentList);
	  
	  
	  Map entityList = new LinkedHashMap<>(); entityList.put("1등이름","1등count");
	  entityList.put("2등이름","2등count"); entityList.put("3등이름","3등count");
	  entityList.put("4등이름","4등count"); entityList.put("5등이름","5등count");
	  entityList.put("6등이름","6등count"); originMap.put("entityList",entityList);
	  
	  
	  Map linechart = new LinkedHashMap<>(); linechart.put("05-01","20");
	  linechart.put("05-02","10"); linechart.put("05-03","35");
	  originMap.put("linechart",linechart);
	 */
	
	
	
}
