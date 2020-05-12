package org.team.bpg.chat.controller;

import java.io.UnsupportedEncodingException;

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

	//오늘의 도서 기능
	//하루에 한 번씩 B_BOOK_LIB의 책들 중 랜덤하게 하나를 골라 새 테이블에 등록한다.
	@Scheduled(fixedRate = 86400000)
	public void todaysBook() {
		
		
		//B_BOOK_LIB 테이블에 담긴 도서 갯수
		final int TOTALBOOKLISTSIZE = 58;
		
		//B_BOOK_LIB의 랜덤 번째 책을 가져오기 
		int randomIndex = (int)((Math.random()*TOTALBOOKLISTSIZE)+1);
		BookVO randomBookVO = chatService.getRandomBook(randomIndex);
		
		//Math.random으로 랜덤한 인덱스의 책을 골라 B_BOOK_TODAY에 넣기
		int result = chatService.insertTodayBook(randomBookVO);
		
		System.out.println("scheduler를 통해 오늘의 randomBook을 insert한 결과... " + result + "건");
		
		
	}
	
	
	
	
	/*
	
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
	*/
	
	
	
}
