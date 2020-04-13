package org.team.bpg.boot;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BootController {
	@RequestMapping(value = "/goBoot.do", method = RequestMethod.GET)
	public String goBoot(Model model, HttpServletRequest request, HttpServletResponse response) {
		String bootPage = request.getParameter("bootPage");
		System.out.println(bootPage + "bootPage.");
		/*
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate);
		
		
		HttpSession session=request.getSession(true);
		*/
		
		return "boot/" + bootPage;
	}
	
	
	@RequestMapping(value = "/chooseBoot.do", method = RequestMethod.GET)
	public String goChoose(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		/*
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate);
		
		
		HttpSession session=request.getSession(true);
		*/
		
		return "boot/choose";
	}
}
