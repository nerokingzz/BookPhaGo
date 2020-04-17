package org.team.bpg.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.team.bpg.book.service.LibraryService;
import org.team.bpg.com.esta.service.ComEstaService;
import org.team.bpg.mylib.dec.service.MyLibDeclareService;

@Controller
public class PageController {
	
	@Autowired
	private MyLibDeclareService myLibDeclareService;
	
	@Autowired
	private ComEstaService comEstaService;
	
	@Autowired
	private LibraryService libraryService;

	//도서메뉴 첫 화면 보여주기
	@RequestMapping(value="book_main", method=RequestMethod.GET)
	public ModelAndView bookMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageInfo=(String)request.getParameter("page");
		System.out.println(pageInfo + "로 이동");
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageInfo", pageInfo);
		
		if (pageInfo != null) {
			if (pageInfo.equals("search")) {
				
			} else if (pageInfo.equals("apply")) {
				
			} else {
				
			}
		} else {
			
		}
		
		mav.setViewName("book/book_main");
		return mav;
	}
	
	//커뮤니티메뉴 첫 화면 보여주기
	@RequestMapping(value="com_main", method=RequestMethod.GET)
	public ModelAndView comMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("com/com_main");
		return mav;
	}
	
	//마이라이브러리메뉴 첫 화면 보여주기
	@RequestMapping(value="myLib_main", method=RequestMethod.GET)
	public ModelAndView declareMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageInfo=(String)request.getParameter("page");
		System.out.println(pageInfo + "로 이동");
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageInfo", pageInfo);
		
		if (pageInfo != null) {
			if (pageInfo.equals("favor")) {

				
			} else if (pageInfo.equals("score")) {
				
			} else if (pageInfo.equals("declare")) {
				
			} else {
				
			}
		} else {
			
		}
		
		mav.setViewName("mylib/myLib_main");
		return mav;
	}
	

	//관리자메뉴 첫 화면 보여주기
	@RequestMapping(value="admin_main", method=RequestMethod.GET)
	public ModelAndView adminMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageInfo=(String)request.getParameter("page");
		System.out.println(pageInfo + "로 이동");
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageInfo", pageInfo);
		
		if (pageInfo != null) {
			if (pageInfo.equals("user_A")) {

			} else if (pageInfo.equals("book_A")) {
				
			} else if (pageInfo.equals("book_status_A")) {
				
			} else if (pageInfo.equals("com_A")) {
				List<Map<String, Object>> comRequestList=comEstaService.comEstaRequestList(request);
				mav.addObject("comRequestList", comRequestList);
				mav.addObject("comRequestListSize", comRequestList.size());
				
			} else if (pageInfo.equals("dec_A")) {
				List<Map<String, Object>> decRequestList=myLibDeclareService.myLibDeclareRequestList(request);
				mav.addObject("decRequestList", decRequestList);
				mav.addObject("decRequestListSize", decRequestList.size());
				
			} else if (pageInfo.equals("chat_A")) {
				
			}
		} else {
			
		}
		
		mav.setViewName("admin/admin_main");
		return mav;
	}
}
