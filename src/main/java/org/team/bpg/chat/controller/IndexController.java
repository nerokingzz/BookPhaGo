package org.team.bpg.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.team.bpg.book.service.LibraryService;
import org.team.bpg.chat.service.ChatService;
import org.team.bpg.chat.vo.BookVO;

@Component
public class IndexController {

	@Autowired
	private ChatService chatService;
	
	//오늘의 도서 기능
	//하루에 한 번씩 B_BOOK_LIB의 책들 중 랜덤하게 하나를 골라 새 테이블에 등록한다.
	@Scheduled(fixedRate = (1000*60*60*24))
	public void todaysBook() {
		
		
		//B_BOOK_LIB 테이블에 담긴 도서 갯수
		final int TOTALBOOKLISTSIZE = 58;
		
		//B_BOOK_LIB의 랜덤 번째 책을 가져오기 
		int randomIndex = (int)((Math.random()*TOTALBOOKLISTSIZE)+1);
		BookVO randomBookVO = chatService.getRandomBook(randomIndex);
		
		System.out.println(randomBookVO.getBookName());
		System.out.println("===========================");
		System.out.println(randomBookVO.getBookContents());
		System.out.println("===========================");
		System.out.println(randomBookVO.getBookGenre());
		System.out.println("===========================");
		System.out.println(randomBookVO.getBookWriter());
		System.out.println("===========================");
		System.out.println(randomBookVO.getBookThum().length);
		
		
		
		//Math.random으로 랜덤한 인덱스의 책을 골라 B_BOOK_TODAY에 넣기
		int result = chatService.insertTodayBook(randomBookVO);
		
		System.out.println("scheduler를 통해 오늘의 randomBook을 insert한 결과... " + result + "건");
		
		
	}
}
