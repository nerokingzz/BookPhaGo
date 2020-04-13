package org.team.bpg.book.service;

import java.util.List;
import java.util.Map;

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
	public void inputlibrary(BookInfoVO bookInfoVO) {
		// TODO Auto-generated method stub
		libraryDAO.inputlibrary(bookInfoVO);
	}

	@Override
	public List<Map<String, Object>> modfindlibrary(Map<String, String> book_list) {
		List<Map<String, Object>> booklist = libraryDAO.modfindlibrary(book_list);
		return booklist;
	}

	@Override
	public void modifylibrary(BookInfoVO bookInfoVO) {
		// TODO Auto-generated method stub
		libraryDAO.modifylibrary(bookInfoVO);
	}

	@Override
	public void librarydelete(BookInfoVO bookInfoVO) {
		// TODO Auto-generated method stub
		libraryDAO.librarydelete(bookInfoVO);
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
	public List<Map<String, Object>> userapplybook(Map<String, String> book_list) {
		List<Map<String, Object>> booklist =  libraryDAO.userapplybook(book_list);
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
}
