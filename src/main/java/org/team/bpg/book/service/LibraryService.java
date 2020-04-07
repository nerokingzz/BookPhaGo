package org.team.bpg.book.service;

import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import org.team.bpg.book.VO.BookInfoVO;

public interface LibraryService {

	public ModelAndView adminlibrarylist(Map<String, String> book_list);
	public ModelAndView adminsearchbook(Map<String, String> book_list);
	public void inputlibrary(BookInfoVO bookInfoVO);
	public ModelAndView modfindlibrary(Map<String, String> book_list);
	public void modifylibrary(BookInfoVO bookInfoVO);
	public void librarydelete(BookInfoVO bookInfoVO);
	public ModelAndView userlibrarylist(Map<String, String> book_list);
	public ModelAndView usersearchbook(Map<String, String> book_list);
	

}
