package org.team.bpg.book.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.team.bpg.book.service.LibraryService;

@Component
public class LogProcesser {
	@Autowired
	private LibraryService libraryService;
	
	@Scheduled(fixedRate = 1000 * 1000000)
	public void handle() throws ParseException {
		List<Map<String, Object>> booklist = libraryService.admin_bookstatus();	
		
		SimpleDateFormat jd = new SimpleDateFormat("yyyy-MM-dd");
		Date currentTime = new Date();
		String current = jd.format(currentTime);
		Date today = jd.parse(current);
		
		for(int i=0; i<booklist.size(); i++) {
			String endTime = (String) booklist.get(i).get("RETURNDATE");
			Date end = jd.parse(endTime);
			String bookstate =  (String) booklist.get(i).get("STATE");
			String rentNumber = String.valueOf(booklist.get(i).get("RENTNUMBER"));
			
			int number = Integer.parseInt(rentNumber);
			
			int result = today.compareTo(end);
			if(result == 1 && bookstate.equals("대출중")) {
				
				libraryService.updatebookrentNumber(number);
			}
		 }

		
		
		
		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		LocalDate onlyDate = LocalDate.now();
//		
//		for(int i=0; i<booklist.size(); i++) {
//			 Date date1 = onlyDate;
//			 Date date2 = sdf.parse((String) booklist.get(i).get("RENTDATE"));
//			 
//			 if(date1.before(date2)){
//			        System.out.println("날짜 뭐가 더 큰지 확인해보는중");
//			 }
//		}
	}
}
