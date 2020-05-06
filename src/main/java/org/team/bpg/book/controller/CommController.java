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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.team.bpg.book.VO.BookInfoVO;
import org.team.bpg.book.service.LibraryService;

@Controller
public class CommController {

	@Autowired
	private LibraryService libraryService;

	@RequestMapping(value = "adminlibrarylist")
	public ModelAndView adminlibrarylist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		List<Map<String, Object>> booklist = libraryService.adminlibrarylist();

		mav.addObject("booklist", booklist);
		mav.addObject("booklistSize", booklist.size());
		mav.setViewName("book/adminlibrarylist");
		return mav;
	}

	@RequestMapping(value = "adminsearchbook")
	public ModelAndView adminsearchbook(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String search_option = request.getParameter("search_option");
		String search_value = request.getParameter("search_value");

		ModelAndView mav = new ModelAndView();

		Map<String, String> book_list = new HashMap<String, String>();
		book_list.put("search_option", search_option);
		book_list.put("search_value", search_value);

		List<Map<String, Object>> booklist = libraryService.adminsearchbook(book_list);

		mav.addObject("booklist", booklist);
		mav.addObject("booklistSize", booklist.size());
		mav.setViewName("book/adminlibrarylist");
		return mav;
	}

	@RequestMapping(value = "inputlibrary")
	public void inputlibrary(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String isbn = request.getParameter("isbn");
		String bookNumber = request.getParameter("bookNumber");
		String bookGenre = request.getParameter("bookGenre");
		String bookRent = request.getParameter("bookRent");
		String bookReservation = request.getParameter("bookReservation");

		Map<String, String> book_list = new HashMap<String, String>();
		book_list.put("bookNumber", bookNumber);
		book_list.put("isbn", isbn);
		book_list.put("bookGenre", bookGenre);
		book_list.put("bookRent", bookRent);
		book_list.put("bookReservation", bookReservation);

		libraryService.inputlibrary(book_list);
	}

	@RequestMapping(value = "modfindlibrary")
	public ModelAndView modfindlibrary(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String bookNumber = request.getParameter("bookNumber");

		ModelAndView mav = new ModelAndView();

		Map<String, String> book_list = new HashMap<String, String>();
		book_list.put("bookNumber", bookNumber);

		List<Map<String, Object>> booklist = libraryService.modfindlibrary(book_list);

		mav.addObject("booklist", booklist);
		mav.addObject("booklistSize", booklist.size());
		mav.setViewName("book/modBookForm");
		return mav;
	}

	@RequestMapping(value = "modifylibrary")
	public void modifylibrary(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String bookNumber = request.getParameter("bookNumber");
		String bookGenre = request.getParameter("bookGenre");
		String bookRent = request.getParameter("bookRent");
		String bookReservation = request.getParameter("bookReservation");

		Map<String, String> book_list = new HashMap<String, String>();
		book_list.put("bookNumber", bookNumber);
		book_list.put("bookGenre", bookGenre);
		book_list.put("bookRent", bookRent);
		book_list.put("bookReservation", bookReservation);

		libraryService.modifylibrary(book_list);
	}

	@RequestMapping(value = "librarydelete")
	public void librarydelete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String bookNumber = request.getParameter("bookNumber");

		Map<String, String> book_list = new HashMap<String, String>();
		book_list.put("bookNumber", bookNumber);

		libraryService.librarydelete(book_list);
	}

	@RequestMapping(value = "userlibrarylist")
	public ModelAndView userlibrarylist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		List<Map<String, Object>> booklist = libraryService.userlibrarylist();

		mav.addObject("booklist", booklist);
		mav.addObject("booklistSize", booklist.size());
		mav.setViewName("book/userlibrarylist");
		return mav;
	}

	@RequestMapping(value = "usersearchbook")
	public ModelAndView usersearchbook(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String search_option = request.getParameter("search_option");
		String search_value = request.getParameter("search_value");

		ModelAndView mav = new ModelAndView();

		Map<String, String> book_list = new HashMap<String, String>();
		book_list.put("search_option", search_option);
		book_list.put("search_value", search_value);

		List<Map<String, Object>> booklist = libraryService.usersearchbook(book_list);

		mav.addObject("booklist", booklist);
		mav.addObject("booklistSize", booklist.size());
		mav.setViewName("book/userlibrarylist");
		return mav;
	}

	@RequestMapping(value = "userreservationlist")
	public ModelAndView userreservationlist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String bookNumber = request.getParameter("bookNumber");

		ModelAndView mav = new ModelAndView();

		Map<String, String> book_list = new HashMap<String, String>();
		book_list.put("bookNumber", bookNumber);

		List<Map<String, Object>> booklist = libraryService.userreservationlist(book_list);

		mav.addObject("booklist", booklist);
		mav.addObject("booklistSize", booklist.size());
		mav.setViewName("book/userreservationlist");
		return mav;
	}

	@RequestMapping(value = "userreservation")
	public void userreservation(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		String bookNumber = request.getParameter("bookNumber");
		String resesrvationDate = "2020-04-20";

		Map<String, String> book_list = new HashMap<String, String>();
		book_list.put("bookNumber", bookNumber);
		book_list.put("user_id", user_id);
		book_list.put("resesrvationDate", resesrvationDate);

		libraryService.insertuserreservation(book_list);
		libraryService.userreservation(book_list);

	}

	@RequestMapping(value = "userapplyinfo")
	public ModelAndView userapplyinfo(ModelAndView mv) throws Exception {
		mv.setViewName("book/userapplyinfo");
		return mv;
	}

	// ����� ���� ��û ������
	@RequestMapping(value = "userapply")
	public ModelAndView userapply(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		session.setAttribute("user_id", user_id);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("book/userapply");
		return mv;
	}

	@RequestMapping(value = "userapplysearch")
	public ModelAndView userapplysearchbook(ModelAndView mv) throws Exception {
		mv.setViewName("book/userapplysearch");
		return mv;
	}

	@RequestMapping(value = "userapplysearchbook")
	public ModelAndView userapplysearchbook(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String search_value = request.getParameter("search_value");

		ModelAndView mav = new ModelAndView();

		Map<String, String> book_list = new HashMap<String, String>();
		book_list.put("search_value", search_value);

		List<Map<String, Object>> booklist = libraryService.userapplysearch(book_list);

		mav.addObject("booklist", booklist);
		mav.addObject("booklistSize", booklist.size());
		mav.setViewName("book/userapplysearch");
		return mav;
	}

	@RequestMapping(value = "userapplybook")
	public void userapplybook(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String user_id = request.getParameter("user_id");
		String isbn = request.getParameter("isbn");
		String applyDate = request.getParameter("applyDate");
		String applyReason = request.getParameter("applyReason");
		String applyState = "신청중";

		Map<String, String> book_list = new HashMap<String, String>();
		book_list.put("userid", user_id);
		book_list.put("isbn", isbn);
		book_list.put("applyDate", applyDate);
		book_list.put("applyReason", applyReason);
		book_list.put("applyState", applyState);

		libraryService.userapplybook(book_list);

	}

	@RequestMapping(value = "adminisbnsearchlist")
	public ModelAndView userisbnsearchlist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("book/adminisbnsearchlist");
		return mav;
	}

	@RequestMapping(value = "adminisbnsearch")
	public ModelAndView adminisbnsearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		String search_option = request.getParameter("search_option");
		String search_value = request.getParameter("search_value");

		Map<String, String> book_list = new HashMap<String, String>();
		book_list.put("search_value", search_value);
		book_list.put("search_option", search_option);

		List<Map<String, Object>> booklist = libraryService.adminisbnsearch(book_list);

		mav.addObject("booklist", booklist);
		mav.addObject("booklistSize", booklist.size());
		mav.setViewName("book/adminisbnsearchlist");
		return mav;
	}

	@Transactional
	@RequestMapping(value = "a")
	public @ResponseBody Map<String, Object> saveCode(@RequestBody Map<String, Object> param) {
		String bookGenre = (String) param.get("bookGenre");

		System.out.println(bookGenre);

		Map<String, Object> book_list = new HashMap<String, Object>();

		try {
			String booklist = libraryService.booknumbersearch(bookGenre);
			if (booklist != null) {
				book_list.put("bookNumber", booklist);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return book_list;
	}

	@Transactional
	@RequestMapping(value = "b")
	public @ResponseBody Map<String, Object> applybookCode(@RequestBody Map<String, Object> param) {
		String isbn = (String) param.get("isbn");

		System.out.println(isbn);

		Map<String, Object> book_list = new HashMap<String, Object>();

		try {
			String booklist = libraryService.applybookcheck(isbn);
			if (booklist != null) {
				book_list.put("bookNumber", booklist);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return book_list;

	}

	@Transactional
	@RequestMapping(value = "c")
	public @ResponseBody Map<String, Object> searchuserid(@RequestBody Map<String, Object> param) {
		String userid = (String) param.get("userid");

		System.out.println(userid);

		Map<String, Object> book_list = new HashMap<String, Object>();

		try {
			String booklist = libraryService.searchuserid(userid);
			if (booklist != null) {
				book_list.put("borrowcnt", booklist);
			}else {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return book_list;

	}

	@Transactional
	@RequestMapping(value = "d")
	public @ResponseBody Map<String, Object> searchbnumber(@RequestBody Map<String, Object> param) {
		String bookNumber = (String) param.get("bookNumber");

		System.out.println(bookNumber);

		Map<String, Object> book_list = new HashMap<String, Object>();

		try {
			List<Map<String, Object>> booklist = libraryService.searchbnumber(bookNumber);
			if (booklist != null) {
				System.out.println(booklist);
				book_list.put("booklist", booklist);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return book_list;

	}

	@Transactional
	@RequestMapping(value = "return_borrowcnt")
	public @ResponseBody Map<String, Object> return_borrowcnt(@RequestBody Map<String, Object> param) {
		String userid = (String) param.get("userid");

		System.out.println(userid);

		Map<String, Object> book_list = new HashMap<String, Object>();

		try {
			String booklist = libraryService.searchreturn(userid);
			if (booklist != null) {
				book_list.put("borrowcnt", booklist);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return book_list;

	}

	@Transactional
	@RequestMapping(value = "return_bookNumber")
	public @ResponseBody Map<String, Object> return_bookNumber(@RequestBody Map<String, Object> param) {
		String bookNumber = (String) param.get("bookNumber");
		String userid = (String) param.get("userid");

		System.out.println(bookNumber);
		System.out.println(userid);

		
		  Map<String, Object> book_list = new HashMap<String, Object>();
		  book_list.put("bookNumber", bookNumber);
		  book_list.put("userid", userid);
		  
		  Map<String, Object> book_list1 = new HashMap<String, Object>();
		  
		  try { 
			  List<Map<String, Object>> booklist = libraryService.return_bookNumber(book_list); 
			  if(booklist != null) {book_list1.put("booklist", booklist); } 
		  } catch(Exception e) { e.printStackTrace(); }
	
		return book_list1;

	}
	
	@RequestMapping(value = "bookextend")
	public ModelAndView bookextendlist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String bookNumber = request.getParameter("bookNumber");

		ModelAndView mav = new ModelAndView();

		List<Map<String, Object>> booklist = libraryService.bookextendlist(bookNumber);

		mav.addObject("booklist", booklist);
		mav.addObject("booklistSize", booklist.size());
		mav.setViewName("book/extendlist");
		return mav;
	}
	
}
