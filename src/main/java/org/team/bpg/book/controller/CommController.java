package org.team.bpg.book.controller;

import java.util.HashMap;
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
	
	//������ ���� ���
	@RequestMapping(value="adminlibrarylist")
	public ModelAndView adminlibrarylist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		
		Map<String, String> book_list=new HashMap<String, String>();
		
		mav=libraryService.adminlibrarylist(book_list);
		
		
		mav.setViewName("book/adminlibrarylist");
		return mav;	
	}
	
	//������ ���� �˻�
	@RequestMapping(value="adminsearchbook")
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
	
	//������ ���� ���
	@RequestMapping(value="inputlibrary")
	public void inputlibrary(@ModelAttribute BookInfoVO bookInfoVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		libraryService.inputlibrary(bookInfoVO);
		RequestDispatcher dis = request.getRequestDispatcher("adminlibrarylist.do");
		dis.forward(request, response);
	}
	
	//������ ���� ���� ���
	@RequestMapping(value="modfindlibrary")
	public ModelAndView modfindlibrary(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String bookNumber = request.getParameter("bookNumber");
		
		Map<String, String> book_list=new HashMap<String, String>();
		book_list.put("bookNumber", bookNumber);
		
		ModelAndView mav=new ModelAndView();
		mav=libraryService.modfindlibrary(book_list);
		
		mav.setViewName("book/modBookForm");
		return mav;	
	}
	
	//������ ���� ����
	@RequestMapping(value="modifylibrary")
	public void modifylibrary(@ModelAttribute BookInfoVO bookInfoVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		libraryService.modifylibrary(bookInfoVO);
		RequestDispatcher dis = request.getRequestDispatcher("modfindlibrary.do");
		dis.forward(request, response);
	}
	
	//������ ���� ���� 
	@RequestMapping(value="librarydelete")
	public void librarydelete(@ModelAttribute BookInfoVO bookInfoVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		libraryService.librarydelete(bookInfoVO);
		RequestDispatcher dis = request.getRequestDispatcher("adminlibrarylist.do");
		dis.forward(request, response);
	}
	
	
	//����� ���� ���
	@RequestMapping(value="userlibrarylist")
	public ModelAndView userlibrarylist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, String> book_list=new HashMap<String, String>();
		
		ModelAndView mav=new ModelAndView();
		mav=libraryService.userlibrarylist(book_list);
		
		mav.setViewName("book/userlibrarylist");
		return mav;	
	}
	
	//����� ���� �˻�
	@RequestMapping(value="usersearchbook")
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
	
	//����� ���� ���� ���
	@RequestMapping(value="userreservationlist")
	public ModelAndView userreservationlist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String bookNumber = request.getParameter("bookNumber");
		
		Map<String, String> book_list=new HashMap<String, String>();
		book_list.put("bookNumber", bookNumber);
		
		ModelAndView mav=new ModelAndView();
		mav=libraryService.userreservationlist(book_list);
		mav.setViewName("book/userreservationlist");
		return mav;	
	}
	
	
	//����� ���� ����
	@RequestMapping(value="userreservation")
	public void userreservation(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String bookNumber = request.getParameter("bookNumber");
		String bookName = request.getParameter("bookName");
		
		System.out.println(bookName);
		System.out.println(bookNumber);
	}
	
	//����� ���� ��û�ȳ�
	@RequestMapping(value="userapplyinfo")
	public ModelAndView userapplyinfo(ModelAndView mv) throws Exception {
		mv.setViewName("book/userapplyinfo");
		return mv;
	}
	
	//����� ���� ��û ������
	@RequestMapping(value="userapply")
	public ModelAndView userapply(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		session.setAttribute("user_id", user_id);
		
		String bookName = request.getParameter("bookName");
		System.out.println(bookName);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("book/userapply");
		return mv;
	}
	
	//����� ���� ��û �˻�������
	@RequestMapping(value="userapplysearch")
	public ModelAndView userapplysearchbook(ModelAndView mv) throws Exception {
		mv.setViewName("book/userapplysearch");
		return mv;
	}
	
	//����� ���� ��û �˻� userapplysearchbook
	@RequestMapping(value="userapplysearchbook")
	public ModelAndView userapplysearchbook (HttpServletRequest request, HttpServletResponse response) throws Exception {
		String search_value = request.getParameter("search_value");
		
		System.out.println(search_value);
		Map<String, String> book_list=new HashMap<String, String>();
		book_list.put("search_value", search_value);
		
		ModelAndView mav=new ModelAndView();
		mav=libraryService.userapplysearch(book_list);
	
		mav.setViewName("book/userapplysearch");
		return mav;
	}
	
	//����� ���� ��û 
	@RequestMapping(value="userapplybook")
	public ModelAndView userapplybook (HttpServletRequest request, HttpServletResponse response) throws Exception {
		String user_id = request.getParameter("user_id");
		String isbn = request.getParameter("isbn");
		String applyDate = request.getParameter("applyDate");
		String applyReason = request.getParameter("applyReason");
		String applyState = "��û��";
		
		Map<String, String> book_list=new HashMap<String, String>();
		book_list.put("userid", user_id);
		book_list.put("isbn", isbn);
		book_list.put("applyDate", applyDate);
		book_list.put("applyReason", applyReason);
		book_list.put("applyState", applyState);
		
		ModelAndView mav=new ModelAndView();
		mav=libraryService.userapplybook(book_list);
		
		mav.setViewName("book/userapplyinfo");
		return mav;
	}
}
