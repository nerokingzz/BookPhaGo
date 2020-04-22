package org.team.bpg.chat.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.team.bpg.book.service.LibraryService;
import org.team.bpg.chat.service.ChatService;
import org.team.bpg.chat.service.LogService;
import org.team.bpg.chat.vo.RequestLogVO;
import org.team.bpg.member.vo.MemberVO;




@Controller("chatController")
@RequestMapping(value = "/chat/*")
public class ChatControllerImpl implements ChatController{
	@Autowired
	ChatService service;
	
	@Autowired
	LogService logService;
	
	
	@Autowired
	MemberVO member;
	
	
	@RequestMapping("/getRank.do")
	public String goRank(ModelAndView model, HttpServletRequest request, HttpServletResponse response) {
		return "chat/getRank";
	}
	
	@RequestMapping(value = "down.do", method = RequestMethod.GET)
	public ModelAndView down(HttpServletRequest request){

		List<RequestLogVO> vo;
		File file;
		try {
			vo = logService.exportRequestLogs();
			file = logService.createCSV(vo);
			return new ModelAndView("fileDownloadView","fileDownload", file);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("error가 발생하여 try catch문 안에서 끝나버렸음 ㅜㅜ!!");
			return null;
		}

		/////////////////////////////////////////////////////////////

	}
	

	@RequestMapping("download.do")
	public String goDownload(Model model, HttpServletRequest request, HttpServletResponse response) {
		return "chat/download";
	}
	
	@RequestMapping(value = "cal.do")
	public String goCal(Model model, HttpServletRequest request, HttpServletResponse response) {
		return "chat/cal";
	}
	
	
	@RequestMapping(value = "index.do")
	public String goIndex(Model model, HttpServletRequest request, HttpServletResponse response) {
		return "chat/index";
	}
	
	@RequestMapping(value = "/searchMember.do"
					//consumes = "application/json",
					)
	@ResponseBody
	public Map<String, Object> searchMember(@RequestParam(value="mem_id") String mem_id, HttpServletRequest request, HttpServletResponse response) throws Exception{
		//String mem_id = (String)request.getParameter("mem_id");
		System.out.println("mem_id : " + mem_id);
		
		request.setCharacterEncoding("utf-8");
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			MemberVO searchMember = service.searchMember(mem_id);
			
		
			if(searchMember != null) {
				System.out.println("name : " + searchMember.getUserName());
				resultMap.put("username", searchMember.getUserName());
				resultMap.put("badcnt", searchMember.getBadcnt());	
				resultMap.put("usertaste1", searchMember.getUserTaste1());		
				resultMap.put("usertaste2", searchMember.getUserTaste2());	
				resultMap.put("usertaste3", searchMember.getUserTaste3());	
				
				
				
			}else {
				System.out.println("searchMember is null");
			}
		}catch(Exception e) {
			resultMap.put("error", "DB에 존재하지 않는 아이디입니다.");
			e.printStackTrace();
		}
		//mav.addObject("searchMember",searchMember);
		return resultMap;
	}


	@RequestMapping(value = "/borrowBook.do"
	// consumes = "application/json",
	)
	@ResponseBody
	public Map<String, Object> chatBorrowBook(@RequestParam(value = "bookNumber") String bookNumber,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("bookNumber : " + bookNumber);

		request.setCharacterEncoding("utf-8");

		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			String borrow_result = service.borrowBook(bookNumber);
			/*System.out.println("id : " + searchMember.getMem_id());
			System.out.println("bookcount : " + searchMember.getMem_bookcount());

			if (searchMember != null) {
				// hmp001_d002VO = (Hmp001_d002VO)list.get(0);
				// resultMap = BeanUtils.describe(member);
				resultMap.put("mem_id", searchMember.getMem_id());
				resultMap.put("mem_bookcount", searchMember.getMem_bookcount());
			} else {
				resultMap.put("error", "DB에 존재하지 않는 아이디입니다.");
			}
			*/
		} catch (Exception e) {
			resultMap.put("error", "DB에 존재하지 않는 아이디입니다.");
			e.printStackTrace();
		}
		return resultMap;
	}
}
