package org.team.bpg.book.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import org.team.bpg.book.VO.BookInfoVO;
import org.team.bpg.book.service.LibraryService;

@Controller
public class CommController {

	@Autowired
	private LibraryService libraryService;
	
	
	//관리자 도서 목록
	@RequestMapping(value="adminlibrarylist", method=RequestMethod.GET)
	public ModelAndView adminlibrarylist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, String> book_list=new HashMap<String, String>();
		
		ModelAndView mav=new ModelAndView();
		mav=libraryService.adminlibrarylist(book_list);
		
		mav.setViewName("book/adminlibrarylist");
		return mav;	
	}
	
	//관리자 도서 검색
	@RequestMapping(value="adminsearchbook", method=RequestMethod.GET)
	public ModelAndView adminsearchbook (HttpServletRequest request, HttpServletResponse response) throws Exception {
		String search_option = request.getParameter("search_option");
		String search_value = request.getParameter("search_value");
		
		System.out.println("search_option : " + search_option);
		System.out.println(search_value);
		System.out.println("11");
		
		Map<String, String> book_list=new HashMap<String, String>();
		book_list.put("search_option", search_option);
		book_list.put("search_value", search_value);
		
		System.out.println("22");
		ModelAndView mav=new ModelAndView();
		mav=libraryService.adminsearchbook(book_list);
		
		System.out.println("33");
		mav.setViewName("book/adminlibrarylist");
		return mav;
	}
	
	//관리자 도서 등록
	@RequestMapping(value="inputlibrary", method=RequestMethod.POST)
	public void inputlibrary(@ModelAttribute BookInfoVO bookInfoVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		libraryService.inputlibrary(bookInfoVO);
	}
	
	//관리자 도서 수정 목록
	@RequestMapping(value="modfindlibrary", method=RequestMethod.GET)
	public ModelAndView modfindlibrary(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String bookNumber = request.getParameter("bookNumber");
		
		Map<String, String> book_list=new HashMap<String, String>();
		book_list.put("bookNumber", bookNumber);
		
		ModelAndView mav=new ModelAndView();
		mav=libraryService.modfindlibrary(book_list);
		
		mav.setViewName("book/modBookForm");
		return mav;	
	}
	
	//관리자 도서 수정
	@RequestMapping(value="modifylibrary", method=RequestMethod.POST)
	public void modifylibrary(@ModelAttribute BookInfoVO bookInfoVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String bookNumberr = request.getParameter("bookNumber");
		System.out.println("bookNumberr : "  + bookNumberr);
		libraryService.modifylibrary(bookInfoVO);
	}
	
	//관리자 도서 삭제 
	@RequestMapping(value="librarydelete", method=RequestMethod.POST)
	public void librarydelete(@ModelAttribute BookInfoVO bookInfoVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		libraryService.librarydelete(bookInfoVO);
	}
	
	
	//사용자 도서 목록
	@RequestMapping(value="userlibrarylist", method=RequestMethod.GET)
	public ModelAndView userlibrarylist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, String> book_list=new HashMap<String, String>();
		
		ModelAndView mav=new ModelAndView();
		mav=libraryService.userlibrarylist(book_list);
		
		mav.setViewName("book/userlibrarylist");
		return mav;	
	}
	
	//사용자 도서 검색
	@RequestMapping(value="usersearchbook", method=RequestMethod.GET)
	public ModelAndView usersearchbook (HttpServletRequest request, HttpServletResponse response) throws Exception {
		String search_option = request.getParameter("search_option");
		String search_value = request.getParameter("search_value");
		
		
		Map<String, String> book_list=new HashMap<String, String>();
		book_list.put("search_option", search_option);
		book_list.put("search_value", search_value);
		
		ModelAndView mav=new ModelAndView();
		mav=libraryService.usersearchbook(book_list);
		
		System.out.println("33");
		mav.setViewName("book/userlibrarylist");
		return mav;
	}
}
