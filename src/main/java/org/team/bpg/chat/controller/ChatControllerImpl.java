package org.team.bpg.chat.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.team.bpg.chat.service.ChatService;
import org.team.bpg.chat.vo.MemberVO;




@Controller("chatController")
@RequestMapping(value = "/chat/*")
public class ChatControllerImpl implements ChatController{
	@Autowired
	ChatService service;
	
	@Autowired
	MemberVO member;
	
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
			System.out.println("id : " + searchMember.getMem_id());
			System.out.println("bookcount : " + searchMember.getMem_bookcount());
		
			if(searchMember != null) {
			//	hmp001_d002VO = (Hmp001_d002VO)list.get(0);
			//	resultMap = BeanUtils.describe(member);
				resultMap.put("mem_id", searchMember.getMem_id());		
				resultMap.put("mem_bookcount", searchMember.getMem_bookcount());
			}else {
				resultMap.put("error", "DB에 존재하지 않는 아이디입니다.");
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
