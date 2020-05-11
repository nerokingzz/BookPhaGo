package org.team.bpg.member.controller;

import java.io.UnsupportedEncodingException;
import java.lang.ProcessBuilder.Redirect;
import java.lang.reflect.Member;
import java.util.Locale;
import java.util.Random;

import javax.activation.DataSource;
import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.team.bpg.chat.controller.MailService;
import org.team.bpg.member.service.MemberService;
import org.team.bpg.member.vo.Criteria;
import org.team.bpg.member.vo.MemberVO;
import org.team.bpg.member.vo.PageMaker;
import org.team.bpg.member.vo.SearchCriteria;

import com.sun.mail.util.logging.MailHandler;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;

	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	@ResponseBody
	@RequestMapping(value="bad_cnt_read", method=RequestMethod.POST)
	public void badAlertOk(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String user_id=request.getParameter("user_id");
		service.badAlertOk(user_id);
	}
	
	// 회원가입 get
	@RequestMapping(value = "registerForm", method = RequestMethod.GET)
	public String getRegister() throws Exception {
		return "member/register";
	}
	
	// 회원가입 post
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo, HttpServletRequest request) throws Exception {
		
		logger.info("post register");

		
				
				service.register(vo);
		
			// 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기 
			// 존재하지 않는다면 -> register

	
		int result = service.idChk(vo);
		
		if(result == 1) {
			return "register.do";
		}else if(result == 0) {
			service.register(vo);
		}
		
		return "member/sign-in";
	}
	
	//  로그인 get
	@RequestMapping(value = "loginForm", method = RequestMethod.GET)
	public String getLogin() throws Exception {
		return "member/home";
	}
	
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("post login");
		
		HttpSession session = req.getSession();
		MemberVO login = service.login(vo);
		String useridcheck = service.useridcheck(vo);
		
		if(login == null || service.emailcheck(vo)==0) {
			logger.info(useridcheck);
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "member/sign-in";
		}
		else if(login != null && service.emailcheck(vo)==1) {
			session.setAttribute("member", login);
			session.setAttribute("user_id", login.getUserId());
			session.setAttribute("user_position", login.getUserposition());
			session.setAttribute("user_pass", login.getUserPass());

			int badCnt=login.getBadcnt();
			
			req.setAttribute("badCnt", badCnt);
			System.out.println("횟수"+badCnt);
			return "index";
		} else {
			return "member/sign-in";
		}
		
	
	}
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "index";
	}
	
	// 정보 수정
	@RequestMapping(value="update", method = RequestMethod.GET)
	public String updateForm(HttpSession session) {
		return "member/memberUpdateView";
	}
	
	@RequestMapping(value="memberUpdate", method = RequestMethod.POST)
	public String registerUpdate(MemberVO vo, HttpSession session) throws Exception{
		
		service.memberUpdate(vo);
		
		session.invalidate();
		
		return "member/sign-in";
	}
	

	// 회원 탈퇴 get
		@RequestMapping(value="delete", method = RequestMethod.GET)
		public String memberDeleteView() throws Exception{
			return "member/memberDeleteView";
		}
		
		// 회원 탈퇴 post
		@RequestMapping(value="memberDelete", method = RequestMethod.POST)
		public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
			
			// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
			MemberVO member = (MemberVO) session.getAttribute("member");
			// 세션에있는 비밀번호
			String sessionPass = member.getUserPass();
			// vo로 들어오는 비밀번호
			String voPass = vo.getUserPass();
			
			if(!(sessionPass.equals(voPass))) {
				rttr.addFlashAttribute("msg", false);
				return "member/memberDeleteView";
			}
			service.memberDelete(vo);
			session.invalidate();
			return "home";
		}
		
		@ResponseBody
		@RequestMapping(value="passChk", method = RequestMethod.POST)
		public int passChk(MemberVO vo) throws Exception {
			int result = service.passChk(vo);
			return result;
		}
		
		@ResponseBody
		@RequestMapping(value="idChk", method = RequestMethod.POST)
		public int idChk(MemberVO vo) throws Exception {
			int result = service.idChk(vo);
			return result;
		}
		
		
		//관리자게시판
		@RequestMapping(value = "/member/writeView", method = RequestMethod.GET)
		public void writeView() throws Exception{
			logger.info("writeView");
			
		}
		
		// 게시판 글 작성
		@RequestMapping(value = "/member/write", method = RequestMethod.POST)
		public String write(MemberVO memberVO) throws Exception{
			logger.info("write");
			
			service.write(memberVO);
			
			return "redirect:/";
		}
		
		
		
		
		
		//sign-in 페이지
		
		
		
		@RequestMapping(value = "list", method = RequestMethod.GET)
		public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
			logger.info("list");
			
			model.addAttribute("list",service.list(scri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(service.listCount(scri));
			
			model.addAttribute("pageMaker", pageMaker);

			return "member/list";
			
		}
		
		
		@RequestMapping(value="adminDelete", method = RequestMethod.GET)
		public ModelAndView adminDelete(@RequestParam("id") String id,
				HttpServletRequest request, HttpServletResponse response) throws Exception{
			service.adminDelete(id);
			ModelAndView mav = new ModelAndView("redirect: list");
			return mav;
		}

		
		@RequestMapping(value = "sign", method = RequestMethod.GET)
		public String sign() throws Exception {
			return "member/sign-in";
		}
		
		
		@RequestMapping(value = "test", method = RequestMethod.GET)
		public String test() throws Exception {
			return "member/test";
		}
		
		//정보수정
		@RequestMapping(value = "update1", method = RequestMethod.GET)
		public String memberUpdateView1() throws Exception {
			return "member/sign-in-update";
		}
		
		
		
		//로그인
		@RequestMapping(value = "login1", method = RequestMethod.POST)
		public String login1(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
			logger.info("post login");
			
			HttpSession session = req.getSession();
			MemberVO login = service.login(vo);
			
			if(login == null) {
				session.setAttribute("member", null);
				rttr.addFlashAttribute("msg", false);
				
			}
			else{
				session.setAttribute("member", login);
				
			}
			return "member/sign-in";
		}
		
		// 회원탈퇴 get
				@RequestMapping(value = "delete1", method = RequestMethod.GET)
				public String membeDelete() throws Exception {
					return "member/sign-in-delete";
				}
				
		// 회원 탈퇴 post
				@RequestMapping(value="memberDelete1", method = RequestMethod.POST)
				public String memberDelete1(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
					
					
					// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
					MemberVO member = (MemberVO) session.getAttribute("member");
				
					// 세션에있는 비밀번호
					String sessionPass = member.getUserPass();
					
					// vo로 들어오는 비밀번호
					String voPass = vo.getUserPass();
					if(!(sessionPass.equals(voPass))) {
						rttr.addFlashAttribute("msg", false);
						return "member/sign-in-delete";
					}
					service.memberDelete(vo);
					session.invalidate();
					return "member/sign-in";
				}
		
				//비밀번호찾기
				@RequestMapping(value = "forgot")
				public String forgot() throws Exception {
					return "member/sign-in-forgot";
				}
				
				//String
				@ResponseBody
				@RequestMapping(value="passForgot")
				public String passForgot(MemberVO vo) throws Exception {
					String result = service.passForgot(vo);					
					logger.info(result);
					return result;
				}
				
				//int
				@ResponseBody
				@RequestMapping(value="passForgot1")
				public int passForgot1(MemberVO vo) throws Exception {
					
					int result = service.passForgot1(vo);
					
					return result;
				}
				
				// 비밀번호찾기
				@RequestMapping(value="pass")
				public String forgot(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
						
					logger.info("pass");
						return "member/sign-in";
	
				}

				@RequestMapping(value="emailupdate")
				public String emailupdate(@RequestParam("userId")String user_id, MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
						service.emailupdate(vo);
					logger.info("emailupdate");
						return "member/sign-in";
	
				}
				
				@ResponseBody
				@RequestMapping(value="emailchecknum", method = RequestMethod.POST)
				public int emailcheck(MemberVO vo) throws Exception {
					int result = service.emailchecknum(vo);
					return result;
				}
				
				@ResponseBody
				@RequestMapping(value="useridcheck", method = RequestMethod.POST)
				public String useridcheck(MemberVO vo) throws Exception {
					String result = service.useridcheck(vo);
					logger.info(result);
					return result;
				}


				//test
				//
				//
				
				@RequestMapping(value="test")
				public String test(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
						
					logger.info("test");
						return "member/test";
				}

				
	
}