package org.team.bpg.member.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service("mailService1")
public class MailS {
	@Autowired
	 private JavaMailSender mailSender1;
    @Autowired
    private SimpleMailMessage preConfiguredMessage;
 
    @Async
	public void sendMail(String to, String subject, String body) {
      MimeMessage message = mailSender1.createMimeMessage();
      try {
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		//messageHelper.setCc("zzzzzz@naver.com");
		messageHelper.setFrom("bitbookphago@gmail.com", "북파고");
		messageHelper.setSubject(subject);
		messageHelper.setTo(to); 
		messageHelper.setText(body,true );
		mailSender1.send(message);  
      }catch(Exception e){
		e.printStackTrace();
	  }
	}
 
	@Async
	public void sendPreConfiguredMail(String message) {
	  SimpleMailMessage mailMessage = new SimpleMailMessage(preConfiguredMessage);
	  mailMessage.setText(message);
	  mailSender1.send(mailMessage);
	}
}
