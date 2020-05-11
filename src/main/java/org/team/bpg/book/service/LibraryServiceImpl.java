package org.team.bpg.book.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.team.bpg.book.DAO.LibraryDAO;
import org.team.bpg.book.VO.BookInfoVO;

@Service
public class LibraryServiceImpl implements LibraryService{
	
	@Autowired
	private LibraryDAO libraryDAO;
	
	@Override
	public List<Map<String, Object>> adminlibrarylist() {
		List<Map<String, Object>> booklist = libraryDAO.adminlibrarylist();
		return booklist;
	}

	@Override
	public List<Map<String, Object>> adminsearchbook(Map<String, String> book_list) {
		List<Map<String, Object>> booklist = libraryDAO.adminsearchbook(book_list);
		return booklist;
	}

	@Override
	public List<Map<String, Object>> modfindlibrary(Map<String, String> book_list) {
		List<Map<String, Object>> booklist = libraryDAO.modfindlibrary(book_list);
		return booklist;
	}
	
	@Override
	public List<Map<String, Object>> userlibrarylist() {
		List<Map<String, Object>> booklist =  libraryDAO.userlibrarylist();
		return booklist;
	}

	@Override
	public List<Map<String, Object>> usersearchbook(Map<String, String> book_list) {
		List<Map<String, Object>> booklist =  libraryDAO.usersearchbook(book_list);
		return booklist;
	}
	
	@Override
	public List<Map<String, Object>> userreservationlist(Map<String, String> book_list) {
		List<Map<String, Object>> booklist =  libraryDAO.userreservationlist(book_list);
		return booklist;
	}
	
	@Override
	public List<Map<String, Object>> userapplysearch(Map<String, String> book_list) {
		List<Map<String, Object>> booklist =  libraryDAO.userapplysearch(book_list);
		return booklist;
	}

	@Override
	public void userreservation(Map<String, String> book_list) {
		libraryDAO.userreservation(book_list);
	}

	@Override
	public void insertuserreservation(Map<String, String> book_list) {
		libraryDAO.insertuserreservation(book_list);
	}

	@Override
	public void modifylibrary(Map<String, String> book_list) {
		libraryDAO.modifylibrary(book_list);
	}

	@Override
	public List<Map<String, Object>> adminisbnsearch(Map<String, String> book_list) {
		List<Map<String, Object>> booklist =  libraryDAO.adminisbnsearch(book_list);
		return booklist;
	}

	@Override
	public List<Map<String, Object>> adminisbnsearchlist() {
		List<Map<String, Object>> booklist =  libraryDAO.adminisbnsearchlist();
		return booklist;
	}

	@Override
	public void librarydelete(Map<String, String> book_list) {
		libraryDAO.librarydelete(book_list);
		
	}

	@Override
	public void inputlibrary(Map<String, String> book_list) {
		libraryDAO.inputlibrary(book_list);
	}

	@Override
	public void userapplybook(Map<String, String> book_list) {
		libraryDAO.userapplybook(book_list);
	}

	@Override
	public String booknumbersearch(String bookGenre) {
		String booklist = libraryDAO.booknumbersearch(bookGenre);
		return booklist;
	}

	@Override
	public String applybookcheck(String isbn) {
		String booklist = libraryDAO.applybookcheck(isbn);
		return booklist;
	}

	@Override
	public String searchuserid(String userid) {
		String booklist = libraryDAO.searchuserid(userid);
		return booklist;
	}

	@Override
	public List<Map<String, Object>> searchbnumber(String bookNumber) {
		List<Map<String, Object>> booklist =  libraryDAO.searchbnumber(bookNumber);
		return booklist;
	}

	@Override
	public String searchreturn(String userid) {
		String booklist = libraryDAO.searchreturn(userid);
		return booklist;
	}

	@Override
	public List<Map<String, Object>> return_bookNumber(Map<String, Object> book_list) {
		List<Map<String, Object>> booklist =  libraryDAO.return_bookNumber(book_list);
		return booklist;
	}

	@Override
	public List<Map<String, Object>> myLib_rentstatus(String user_id) {
		List<Map<String, Object>> booklist = libraryDAO.myLib_rentstatus(user_id);
		return booklist;
	}
	
	@Override
	public List<Map<String, Object>> myLib_rentstatus_score(String user_id) {
		List<Map<String, Object>> booklist = libraryDAO.myLib_rentstatus_score(user_id);
		return booklist;
	}
	
	@Override
	public List<BookInfoVO> myLib_rentstatus_favor(String user_id) {
		List<BookInfoVO> booklist = libraryDAO.myLib_rentstatus_favor(user_id);
		
		return booklist;
	}

	@Override
	public List<Map<String, Object>> bookextendlist(String bookNumber) {
		List<Map<String, Object>> booklist = libraryDAO.bookextendlist(bookNumber);
		return booklist;
	}

	@Override
	public void updateB_BOOK_RENT(String bookNumber) {
		libraryDAO.updateB_BOOK_RENT(bookNumber);
	}

	@Override
	public int userborrow(String userid) {
		int result = 0;
		result = libraryDAO.userborrow(userid);
		return result;
	}

	@Override
	public int insertbookrent(Map<String, String> book_list) {
		int result = 0;
		result = libraryDAO.insertbookrent(book_list);
		return result;
	}

	@Override
	public int updatebooklib(Map<String, String> book_list) {
		int result = 0;
		result = libraryDAO.updatebooklib(book_list);
		return result;
	}

	@Override
	public int userrent(String userid) {
		int result = 0;
		result = libraryDAO.userrent(userid);
		return result;
	}

	@Override
	public int updatebookrent(Map<String, String> book_list) {
		int result = 0;
		result = libraryDAO.updatebookrent(book_list);
		return result;
	}

	@Override
	public int updatebooklibreturn(Map<String, String> book_list) {
		int result = 0;
		result = libraryDAO.updatebooklibreturn(book_list);
		return result;
	}
	
	@Override
	public String applycnt(String userid) {
		String booklist = libraryDAO.applycnt(userid);
		return booklist;
	}

	@Override
	public void scoreUpdate(HttpServletRequest request) {
		String user_id=request.getParameter("user_id");
		String book_number=request.getParameter("book_number");
		String book_score=request.getParameter("book_score");
		
		System.out.println(user_id);
		System.out.println(book_number);
		System.out.println(book_score);
		
		Map<String, Object> info=new HashMap<>();
		info.put("user_id", user_id);
		info.put("book_number", book_number);
		info.put("book_score", book_score);
		
		libraryDAO.scoreUpdate(info);
		
	}

	@Override
	public List<Map<String, Object>> recomList(String category) {
		List<Map<String, Object>> recomList=libraryDAO.recomList(category);
		return recomList;
	}

}
