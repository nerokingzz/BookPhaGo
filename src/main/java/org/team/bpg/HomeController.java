package org.team.bpg;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate);
		
		
		HttpSession session=request.getSession(true);
		
		
//		session.setAttribute("user_id", "shyguy_hulk");
//		session.setAttribute("user_position", "general");
//		
//		
//		session.setAttribute("user_id", "captain_A");
//		session.setAttribute("user_position", "admin");
		
		return "index";
	}
	

	// 왓슨 챗봇 페이지로 이동시켜주는 메소드

	@RequestMapping(value = "/watson.do", method = RequestMethod.GET)
	public String goWatson(Model model, HttpServletRequest request, HttpServletResponse response) {
		return "chat/watson";
	}
	
	
	
	
	@RequestMapping(value = "/send.do", method = RequestMethod.GET)
	public String goSend(Model model, HttpServletRequest request, HttpServletResponse response) {
		return "chat/send";
	}
	
	
	@RequestMapping(value = "/receive.do", method = RequestMethod.GET)
	public String goReceive(Model model, HttpServletRequest request, HttpServletResponse response) {
		return "chat/receive";
	}
	
	//member
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "home";
	}
	
}
