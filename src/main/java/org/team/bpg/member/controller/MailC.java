package org.team.bpg.member.controller;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.team.bpg.member.service.MemberService;
import org.team.bpg.member.vo.MemberVO;



@Controller
@EnableAsync
public class MailC {
	
	@Inject
	MemberService service;
	
    @Autowired
    private MailS mailService1;
 
    @ResponseBody
    @RequestMapping(value = "sendMail1", method = RequestMethod.GET)
    public int sendSimpleMail(@RequestParam("userId")String user_id, @RequestParam("userEmail")String user_email, MemberVO vo, HttpServletRequest request, HttpServletResponse response, HttpSession session, RedirectAttributes rttr)  throws Exception{
		/*
		 * String user_id = (String) session.getAttribute("user_id"); String user_pass =
		 * (String) session.getAttribute("user_pass"); String user_email = (String)
		 * session.getAttribute("user_email");
		 */
    	String result = service.passForgot(vo);
    	int passcnt = service.passForgot1(vo);
    	
    	String subject = user_id + " 님의 비밀번호 찾기.";
    	String content = user_id + "님의 비밀번호는 " + result + " 입니다.";
    	String to = user_email;
    	
    	if(passcnt == 1) {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			mailService1.sendMail(user_email, subject, content);
			System.out.println("이메일전송");
			return passcnt;
    	}
    	
    	else {
    		System.out.println("아이디, 이메일 불일치");
    		return passcnt;
    	}
		
    }
    
    @ResponseBody
    @RequestMapping(value = "sendMailsign", method = RequestMethod.GET)
    public void sendMail1(@RequestParam("userId1")String user_id, @RequestParam("userEmail")String user_email, MemberVO vo, HttpServletRequest request, HttpServletResponse response, HttpSession session, RedirectAttributes rttr)  throws Exception{

    	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		StringBuffer sb = new StringBuffer();

		String subject = "북파고 이메일 인증";

		sb.append("<html><body>");
		sb.append("<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>");
		sb.append("<h1>" + "안녕하세요 북파고입니다" + "<h1><br>");
		sb.append(""+user_id+""+"님 " + "인증하기 버튼을 눌러 인증하세요<br><br>");
		sb.append("<a href='http://localhost:8080/emailupdate?userId="+user_id+"'>이메일 인증하기</a>");
		sb.append("</body></html>");
		String str = sb.toString();

		
		mailService1.sendMail(user_email, subject, str);
		System.out.println("이메일전송");
		
		

    }
}




//////////test

/*
 * @ResponseBody
 * 
 * @RequestMapping(value = "sendMailsign", method = RequestMethod.GET) public
 * void sendMail1(@RequestParam("userId")String
 * user_id, @RequestParam("userEmail")String user_email, MemberVO vo,
 * HttpServletRequest request, HttpServletResponse response, HttpSession
 * session, RedirectAttributes rttr) throws Exception{
 * 
 * StringBuffer sb = new StringBuffer();
 * 
 * String result = service.passForgot(vo); int passcnt =
 * service.passForgot1(vo);
 * 
 * String subject = "북파고 이메일 인증"; String content = user_id + "님의 비밀번호는 " +
 * result + " 입니다."; String to = user_email;
 * 
 * sb.append("<html><body>"); sb.
 * append("<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>"
 * ); sb.append("<h1>"+"제품소개"+"<h1><br>"); sb.append("신간 도서를 소개합니다.<br><br>");
 * sb.
 * append("<a href='http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788956746425&orderClick=LAG&Kc=#N'>"
 * ); sb.
 * append("<img  src='http://image.kyobobook.co.kr/images/book/xlarge/425/x9788956746425.jpg' /> </a><br>"
 * ); sb.append("</a>"); sb.
 * append("<a href='http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788956746425&orderClick=LAG&Kc=#N'>상품보기</a>"
 * ); sb.append("</body></html>"); String str=sb.toString();
 * mailService1.sendMail("수신자@naver.com","신상품을 소개합니다.",str);
 * 
 * request.setCharacterEncoding("utf-8");
 * response.setContentType("text/html;charset=utf-8");
 * mailService1.sendMail(user_email, subject, str); System.out.println("이메일전송");
 * 
 * 
 * 
 * 
 * 
 * 
 * }
 * 
 */