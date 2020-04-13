package org.team.bpg.book.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	@RequestMapping(value="adminlibrarylist")
	public ModelAndView adminlibrarylist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		
		List<Map<String, Object>> booklist = libraryService.adminlibrarylist();
		
		mav.addObject("booklist", booklist);
		mav.addObject("booklistSize", booklist.size());
		mav.setViewName("book/adminlibrarylist");
		return mav;		
	}
	
	//관리자 도서 검색
	@RequestMapping(value="adminsearchbook")
	public ModelAndView adminsearchbook (HttpServletRequest request, HttpServletResponse response) throws Exception {
		String search_option = request.getParameter("search_option");
		String search_value = request.getParameter("search_value");
		
		ModelAndView mav=new ModelAndView();
		
		Map<String, String> book_list=new HashMap<String, String>();
		book_list.put("search_option", search_option);
		book_list.put("search_value", search_value);
		
		
		List<Map<String, Object>> booklist = libraryService.adminsearchbook(book_list);
	
		
		mav.addObject("booklist", booklist);
		mav.addObject("booklistSize", booklist.size());
		mav.setViewName("book/adminlibrarylist");
		return mav;
	}
	
	//관리자 도서 등록
	@RequestMapping(value="inputlibrary")
	public void inputlibrary(@ModelAttribute BookInfoVO bookInfoVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		libraryService.inputlibrary(bookInfoVO);
		RequestDispatcher dis = request.getRequestDispatcher("adminlibrarylist.do");
		dis.forward(request, response);
	}
	
	//관리자 도서 수정 목록
	@RequestMapping(value="modfindlibrary")
	public ModelAndView modfindlibrary(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String bookNumber = request.getParameter("bookNumber");
		
		ModelAndView mav=new ModelAndView();
		
		Map<String, String> book_list=new HashMap<String, String>();
		book_list.put("bookNumber", bookNumber);
		
		List<Map<String, Object>> booklist = libraryService.modfindlibrary(book_list);
		
		mav.addObject("booklist", booklist);
		mav.addObject("booklistSize", booklist.size());
		mav.setViewName("book/modBookForm");
		return mav;	
	}
	
	//관리자 도서 수정
	@RequestMapping(value="modifylibrary")
	public void modifylibrary(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String bookNumber = request.getParameter("bookNumber");
		String bookGenre = request.getParameter("bookGenre");
		String bookRent = request.getParameter("bookRent");
		String bookReservation = request.getParameter("bookReservation");
		
		Map<String, String> book_list=new HashMap<String, String>();
		book_list.put("bookNumber", bookNumber);
		book_list.put("bookGenre", bookGenre);
		book_list.put("bookRent", bookRent);
		book_list.put("bookReservation", bookReservation);
		
		libraryService.modifylibrary(book_list);
	}
	
	//관리자 도서 삭제 
	@RequestMapping(value="librarydelete")
	public void librarydelete(@ModelAttribute BookInfoVO bookInfoVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		libraryService.librarydelete(bookInfoVO);
		RequestDispatcher dis = request.getRequestDispatcher("adminlibrarylist.do");
		dis.forward(request, response);
	}
	
	//사용자 도서 목록
	@RequestMapping(value="userlibrarylist")
	public ModelAndView userlibrarylist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		
		List<Map<String, Object>> booklist = libraryService.userlibrarylist();		
				
		mav.addObject("booklist", booklist);
		mav.addObject("booklistSize", booklist.size());
		mav.setViewName("book/userlibrarylist");
		return mav;	
	}
	
	//사용자 도서 검색
	@RequestMapping(value="usersearchbook")
	public ModelAndView usersearchbook (HttpServletRequest request, HttpServletResponse response) throws Exception {
		String search_option = request.getParameter("search_option");
		String search_value = request.getParameter("search_value");
		
		ModelAndView mav=new ModelAndView();
		
		Map<String, String> book_list=new HashMap<String, String>();
		book_list.put("search_option", search_option);
		book_list.put("search_value", search_value);
		
		
		List<Map<String, Object>> booklist = libraryService.usersearchbook(book_list);
		
		mav.addObject("booklist", booklist);
		mav.addObject("booklistSize", booklist.size());
		mav.setViewName("book/userlibrarylist");
		return mav;
	}

	//사용자 도서 예약 목록
	@RequestMapping(value="userreservationlist")
	public ModelAndView userreservationlist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String bookNumber = request.getParameter("bookNumber");
		
		ModelAndView mav=new ModelAndView();
		
		Map<String, String> book_list=new HashMap<String, String>();
		book_list.put("bookNumber", bookNumber);
		
		List<Map<String, Object>> booklist = libraryService.userreservationlist(book_list);
		
		mav.addObject("booklist", booklist);
		mav.addObject("booklistSize", booklist.size());
		mav.setViewName("book/userreservationlist");
		return mav;
	}
	
	//사용자 도서 예약
	@RequestMapping(value="userreservation")
	public void userreservation(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		String bookNumber = request.getParameter("bookNumber");
		String resesrvationDate = "2020-04-20";
	
		Map<String, String> book_list=new HashMap<String, String>();
		book_list.put("bookNumber", bookNumber);
		book_list.put("user_id", user_id);
		book_list.put("resesrvationDate", resesrvationDate);
		
		libraryService.insertuserreservation(book_list);
		libraryService.userreservation(book_list);
		
	}
	
	//사용자 도서 신청안내
	@RequestMapping(value="userapplyinfo")
	public ModelAndView userapplyinfo(ModelAndView mv) throws Exception {
		mv.setViewName("book/userapplyinfo");
		return mv;
	}
	
	//사용자 도서 신청 페이지
	@RequestMapping(value="userapply")
	public ModelAndView userapply(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		session.setAttribute("user_id", user_id);
				
		ModelAndView mv = new ModelAndView();
		mv.setViewName("book/userapply");
		return mv;
	}
	
	//사용자 도서 신청 검색페이지
	@RequestMapping(value="userapplysearch")
	public ModelAndView userapplysearchbook(ModelAndView mv) throws Exception {
		mv.setViewName("book/userapplysearch");
		return mv;
	}
	
	//사용자 도서 신청 검색 
	@RequestMapping(value="userapplysearchbook")
	public ModelAndView userapplysearchbook (HttpServletRequest request, HttpServletResponse response) throws Exception {
		String search_value = request.getParameter("search_value");
		
		ModelAndView mav=new ModelAndView();
		
		Map<String, String> book_list=new HashMap<String, String>();
		book_list.put("search_value", search_value);
		
		List<Map<String, Object>> booklist = libraryService.userapplysearch(book_list);
		
		mav.addObject("booklist", booklist);
		mav.addObject("booklistSize", booklist.size());
		mav.setViewName("book/userapplysearch");
		return mav;
	}

	//사용자 도서 신청 
	@RequestMapping(value="userapplybook")
	public ModelAndView userapplybook (HttpServletRequest request, HttpServletResponse response) throws Exception {
		String user_id = request.getParameter("user_id");
		String isbn = request.getParameter("isbn");
		String applyDate = request.getParameter("applyDate");
		String applyReason = request.getParameter("applyReason");
		String applyState = "신청중";
		
		ModelAndView mav=new ModelAndView();
		
		Map<String, String> book_list=new HashMap<String, String>();
		book_list.put("userid", user_id);
		book_list.put("isbn", isbn);
		book_list.put("applyDate", applyDate);
		book_list.put("applyReason", applyReason);
		book_list.put("applyState", applyState);
		
		List<Map<String, Object>> booklist = libraryService.userapplybook(book_list);
		
		mav.addObject("booklist", booklist);
		mav.addObject("booklistSize", booklist.size());
		mav.setViewName("book/userapplyinfo");
		return mav;
	}
	
	//관리자 isbn search 리스트
	@RequestMapping(value="adminisbnsearchlist")
	public ModelAndView userisbnsearchlist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		
		List<Map<String, Object>> booklist = libraryService.adminisbnsearchlist();
		
		mav.addObject("booklist", booklist);
		mav.addObject("booklistSize", booklist.size());
		mav.setViewName("book/adminisbnsearchlist");
		return mav;		
	}
		
	//관리자 isbn search
	@RequestMapping(value="adminisbnsearch")
	public ModelAndView adminisbnsearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		
		String search_option = request.getParameter("search_option");
		String search_value = request.getParameter("search_value");
		
		Map<String, String> book_list=new HashMap<String, String>();
		book_list.put("search_value", search_value);
		book_list.put("search_option", search_option);
		
		List<Map<String, Object>> booklist = libraryService.adminisbnsearch(book_list);
		
		mav.addObject("booklist", booklist);
		mav.addObject("booklistSize", booklist.size());
		mav.setViewName("book/adminisbnsearchlist");
		return mav;		
	}
}
