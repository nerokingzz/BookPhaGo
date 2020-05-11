package org.team.bpg.mylib.mylibrary.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.team.bpg.book.service.LibraryService;

@Controller
public class MyLibBookController {
	
	@Autowired
	private LibraryService libraryService;
	
	//평가를 위해 도서대출정보 가져오기 -> ibsheet
	@ResponseBody
	@RequestMapping(value="book_history", method=RequestMethod.POST)
	public Map<String, Object> bookHistory(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		
		List<Map<String, Object>> bookHisList=libraryService.myLib_rentstatus_score(user_id);
		
		System.out.println("가져온책들" + bookHisList);
		
		Map<String, Object> ibsheetMap=new HashMap<String, Object>();
		ibsheetMap.put("data", bookHisList);
		
		return ibsheetMap;	
	}
	
	//책점수 수정
	@ResponseBody
	@RequestMapping(value="book_scroe_update", method=RequestMethod.POST)
	public String bookScoreUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//db에 변경 내용 update하기
		libraryService.scoreUpdate(request);
						
		return "ok";
	}
	
	//취향분석 새로고침
	@ResponseBody
	@RequestMapping(value="favor_refresh", method=RequestMethod.POST)
	public List<Map<String, Object>> favorRefresh(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String category=request.getParameter("favorite");
		List<Map<String, Object>> recomList=libraryService.recomList(category);
		
		return recomList;
		
	}
	

}
