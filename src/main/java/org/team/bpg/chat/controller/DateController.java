package org.team.bpg.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DateController {
	
	
	@RequestMapping("showMeDate.do")
	public void showMeDate(@RequestParam("startDate") String startDate,
							@RequestParam("endDate") String endDate) {
		
		System.out.println("start Date is ....." + startDate);
		System.out.println("end Date is ....." + endDate);
		
	}
	

}
