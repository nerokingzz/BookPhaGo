package org.team.bpg.chat.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@EnableAsync
public class MailController {
    @Autowired
    private MailService mailService;
 
    @RequestMapping(value = "/sendMail.do", method = RequestMethod.GET)
    public String sendSimpleMail(@RequestParam("content")String content, HttpServletRequest request, HttpServletResponse response){
    	try {
    		request.setCharacterEncoding("utf-8");
    		String mail_subject= "북파고에 대한 새로운 피드백을 확인해주세요.";
    		String mail_content = content;
    		response.setContentType("text/html;charset=utf-8");
    		mailService.sendMail("bitbookphago@gmail.com",mail_subject,mail_content);
    		//mailService.sendPreConfiguredMail(content);
    		System.out.println(content + " 라는 내용으로 메일을 보냈습니다.");
    		return "okay";
        
    	}catch(Exception e) {
    		e.printStackTrace();
    		return "error";
    	}
    }
}


