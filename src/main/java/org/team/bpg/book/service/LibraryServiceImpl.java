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
	public ModelAndView adminlibrarylist(Map<String, String> book_list) {
		List<Map<String, Object>> requestList=libraryDAO.adminlibrarylist(book_list);

		System.out.println(requestList);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("requestList", requestList);
		mav.addObject("requestListSize", requestList.size());
		
		System.out.println("requestList :"+requestList.size());
		
		return mav;
	}

	@Override
	public ModelAndView adminsearchbook(Map<String, String> book_list) {
		List<Map<String, Object>> requestList=libraryDAO.adminsearchbook(book_list);

		System.out.println(requestList);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("requestList", requestList);
		mav.addObject("requestListSize", requestList.size());
		
		System.out.println("requestList :"+requestList.size());
		
		return mav;
	}

	@Override
	public void inputlibrary(BookInfoVO bookInfoVO) {
		// TODO Auto-generated method stub
		libraryDAO.inputlibrary(bookInfoVO);
	}

	@Override
	public ModelAndView modfindlibrary(Map<String, String> book_list) {
		List<Map<String, Object>> requestList=libraryDAO.modfindlibrary(book_list);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("requestList", requestList);
		mav.addObject("requestListSize", requestList.size());
		
		
		return mav;
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
	public ModelAndView userlibrarylist(Map<String, String> book_list) {
		List<Map<String, Object>> requestList=libraryDAO.userlibrarylist(book_list);

		System.out.println(requestList);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("requestList", requestList);
		mav.addObject("requestListSize", requestList.size());
		
		System.out.println("requestList :"+requestList.size());
		
		return mav;
	}

	@Override
	public ModelAndView usersearchbook(Map<String, String> book_list) {
		List<Map<String, Object>> requestList=libraryDAO.usersearchbook(book_list);

		System.out.println(requestList);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("requestList", requestList);
		mav.addObject("requestListSize", requestList.size());
		
		System.out.println("requestList :"+requestList.size());
		
		return mav;
	}

	@Override
	public ModelAndView userreservationlist(Map<String, String> book_list) {
		List<Map<String, Object>> requestList=libraryDAO.userreservationlist(book_list);

		System.out.println(requestList);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("requestList", requestList);
		mav.addObject("requestListSize", requestList.size());
		
		System.out.println("requestList :"+requestList.size());
		
		return mav;
	}

	@Override
	public ModelAndView userapplysearch(Map<String, String> book_list) {
		List<Map<String, Object>> requestList=libraryDAO.userapplysearch(book_list);

		System.out.println(requestList);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("requestList", requestList);
		mav.addObject("requestListSize", requestList.size());
		
		System.out.println("requestList :"+requestList.size());
		
		return mav;
	}

	@Override
	public ModelAndView userapplybook(Map<String, String> book_list) {
		List<Map<String, Object>> requestList=libraryDAO.userapplybook(book_list);

		System.out.println(requestList);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("requestList", requestList);
		mav.addObject("requestListSize", requestList.size());
		
		System.out.println("requestList :"+requestList.size());
		
		return mav;
	}
	



}
