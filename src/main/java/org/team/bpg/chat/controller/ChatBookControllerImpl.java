package org.team.bpg.chat.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import org.team.bpg.book.VO.BookInfoVO;
import org.team.bpg.book.service.LibraryService;
import org.team.bpg.chat.service.ChatService;
import org.team.bpg.member.vo.MemberVO;


@RestController
public class ChatBookControllerImpl {
	
	@Autowired
	private ChatService chatService;
	
	@Autowired
	private LibraryService libraryService;
	
	
	
	@Transactional
	@RequestMapping("/chat/ExtendBook.do")
	public int chatExtendBook(@RequestParam(value="userid") String userid,
			@RequestParam(value="bookNumber") String bookNumber,
			HttpServletRequest request,
			HttpServletResponse response) throws ParseException {
		
		int totalResult = 0;
		
		Map<String, String> paramMap = new HashMap<String,String>();
		paramMap.put("user_id", userid);
		paramMap.put("bookNumber", bookNumber);
		
		if(userid != null && bookNumber != null) {
			List<Map<String, Object>> book_list = chatService.chat_extendBook(paramMap);
			
			if(book_list.size() == 1) {
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

				
				Date rentDate =  transFormat.parse((String)book_list.get(0).get("RENTDATE"));
				Date returnDate = transFormat.parse((String)book_list.get(0).get("RETURNDATE"));
				
				long calDate = returnDate.getTime() - rentDate.getTime(); 
		        
		        // Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를 반환해준다. 
		        // 이제 24*60*60*1000(각 시간값에 따른 차이점) 을 나눠주면 일수가 나온다.
		        long calDateDays = calDate / ( 24*60*60*1000); 
		 
		        //반납일자 - 대출일자. calDateDays가 7이 아니면 연장이 불가능한 상태이므로 return 0
		        calDateDays = Math.abs(calDateDays);
				
		        if(calDateDays == 7) {
		        	 libraryService.updateB_BOOK_RENT(bookNumber);
		        	 totalResult = 1;
		        }
			}

			System.out.println("total Result is ... " + totalResult);
		}
		
		return totalResult;
		
	}
	
	
	
	
	@RequestMapping(value = "extendID.do")
	@ResponseBody
	public Map<String, Object> extendIDCheck(@RequestParam(value="userid") String mem_id,
			HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException{
		System.out.println("mem_id : " + mem_id);
		
		request.setCharacterEncoding("utf-8");
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		try {

			List<Map<String, Object>> rentList = chatService.chat_rentstatus(mem_id);
			
			resultMap.put("rentList", rentList);
			resultMap.put("error", null);
			
		}catch(Exception e) {
			resultMap.put("error", "DB에 존재하지 않는 아이디입니다.");
			e.printStackTrace();
		}
		return resultMap;
		
	}
	
	
	@Transactional
	@RequestMapping(value = "/chat/checkID.do")
	public @ResponseBody Map<String, Object> searchuserid(@RequestBody Map<String, Object> param) {
		String userid = (String) param.get("userid");

		System.out.println(userid);

		Map<String, Object> book_list = new HashMap<String, Object>();

		try {
			String booklist = libraryService.searchuserid(userid);
			if (booklist != null) {
				book_list.put("borrowcnt", booklist);
			}else {
				book_list.put("borrowcnt", null);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return book_list;

	}
	
	
	
	
	@Transactional
	@RequestMapping("/chat/ReturnBook.do")
	public int chatReturnbBook(@RequestParam(value="userid") String userid,
			@RequestParam(value="bookNumber") String bookNumber,
			HttpServletRequest request,
			HttpServletResponse response) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date timeInDate = new Date();
        String RreturnDate = sdf.format(timeInDate);
		
		String bookState = "반납완료";
		int totalResult = 0;
		
		if(userid != null && bookNumber != null) {
			Map<String, String> book_list=new HashMap<String, String>();
			book_list.put("userid", userid);
			book_list.put("bookNumber", bookNumber);
			book_list.put("RreturnDate", RreturnDate);
			book_list.put("bookState", bookState);
			
			totalResult = chatService.chat_returnBook(userid, book_list);
			System.out.println("total Result is ... " + totalResult);
		}
		
		return totalResult;
		
	}
	
	
	@RequestMapping(value = "/chat/searchMember.do")
	@ResponseBody
	public Map<String, Object> searchMember(@RequestParam(value="mem_id") String mem_id, HttpServletRequest request, HttpServletResponse response) throws Exception{
		//String mem_id = (String)request.getParameter("mem_id");
		System.out.println("mem_id : " + mem_id);
		
		request.setCharacterEncoding("utf-8");
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			MemberVO searchMember = chatService.searchMember(mem_id);

			//가입일 변환//
			
			List<Map<String, Object>> rentList = chatService.chat_rentstatus(mem_id);
			
			
			if(searchMember != null) {
				//가입일 변환///
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date timeInDate = searchMember.getRegDate();
	            String fomtdRegDate = sdf.format(timeInDate);
				
				System.out.println("name : " + searchMember.getUserName());
				resultMap.put("username", searchMember.getUserName());
				resultMap.put("regdate", fomtdRegDate);
				resultMap.put("useremail", searchMember.getUserEmail());
				resultMap.put("badcnt", searchMember.getBadcnt());	
				resultMap.put("usertaste1", searchMember.getUserTaste1());		
				resultMap.put("usertaste2", searchMember.getUserTaste2());	
				resultMap.put("usertaste3", searchMember.getUserTaste3());	
				
				resultMap.put("rentList", rentList);
				
			}else {
				resultMap.put("error", "DB에 존재하지 않는 아이디입니다.");
				System.out.println("searchMember is null");
			}
		}catch(Exception e) {
			resultMap.put("error", "DB에 존재하지 않는 아이디입니다.");
			e.printStackTrace();
		}
		return resultMap;
	}

	
	
	@RequestMapping("chatUserBookCheck.do")
	public List<Map<String, Object>> ChatUserBookCheck(@RequestParam("userid") String userid){
		System.out.println("요기로 넘어온 userid는 ...." + userid);
		
		List<Map<String, Object>> result = libraryService.myLib_rentstatus(userid);
		
		return result;
	}
	
	
	@RequestMapping("chatBookRent.do")
	public int chatRentBook(@RequestParam("userid") String userid, @RequestParam("bookNumber") String bookNumber) {
		
		System.out.println("chatRent 안이지롱 ㅋ");
		
		int totalResult;
		
		String bookState = "대출중";
		String bookState1 = "대출불가";
		String bookState2 = "예약가능";
		System.out.println("1111111");
		
		Map<String, String> book_list=new HashMap<String, String>();
		book_list.put("userid", userid);
		book_list.put("bookNumber", bookNumber);
		book_list.put("bookState", bookState);
		book_list.put("bookState1", bookState1);
		book_list.put("bookState2", bookState2);
		
		
		int result1 = 0;
		int result2 = 0;		
		int result3 = 0;	
		
		if(userid != null && bookNumber != null) {
			result1 = libraryService.userborrow(userid);
			result2 = libraryService.insertbookrent(book_list);
			result3 = libraryService.updatebooklib(book_list);
			
			System.out.println(result1);
			System.out.println(result2);
			System.out.println(result3);
			System.out.println("도서대출완료");
		}
		
		if(result1 == 1 && result2 == 1 && result3 ==1) {
			totalResult = 1;
		}else {
			totalResult = 0;
		}
		
		return totalResult;
	}
	
	
	
	@ResponseBody
	@RequestMapping("chatSearchBook.do")
	public List<Map<String, Object>> chatSearchBook (@RequestParam("searchKeyword") String searchKeyword){


		Map<String, String> _searchKeyword = new HashMap<>();
		//챗봇을 통한 도서 검색은 도서명을 기준으로 한 검색
		_searchKeyword.put("search_option", "bookName");
		_searchKeyword.put("search_value", searchKeyword);
		List<Map<String, Object>> booklist;
		
		
		booklist = libraryService.usersearchbook(_searchKeyword);
		

		return booklist;
	}

	
	
	
	@RequestMapping("chatSearchRentBook.do")
	public @ResponseBody Map<String, Object> chatSearchRentBook (@RequestParam("searchKeyword") String searchKeyword){
	
		String bookNumber = searchKeyword;

		Map<String, Object> book_list = new HashMap<String, Object>();

		try {
			List<Map<String, Object>> booklist = libraryService.searchbnumber(bookNumber);
			if (booklist != null) {
				System.out.println(booklist);
				book_list.put("booklist", booklist);
			}
		} catch (Exception e) {
			System.out.println("catch문 안입니다요 ㅠㅠㅠ");
			e.printStackTrace();
		}
			
	
		return book_list;
	}
	
	
	
}
