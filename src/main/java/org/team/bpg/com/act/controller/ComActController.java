package org.team.bpg.com.act.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.team.bpg.com.act.service.ComActService;
import org.team.bpg.com.act.vo.BoardInfoVO;
import org.team.bpg.com.act.vo.ComMemberVO;

@Controller
public class ComActController {

	@Autowired
	private ComActService comActService;
	
	//커뮤니티 목록 보기
	@RequestMapping(value="com_act_list", method=RequestMethod.GET)
	public ModelAndView comActList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<Map<String, Object>> comList=comActService.comList(request);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("comList", comList);
		mav.addObject("comListSize", comList.size());
		
		System.out.println("사이즈:"+comList.size());
		
		mav.addObject(comList);
		
		mav.setViewName("com/act/com_act_list");
		return mav;
	}
	
	//하나의 커뮤니티 홈 보여주기
	@RequestMapping(value="com_act_home", method=RequestMethod.GET)
	public ModelAndView comInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav=new ModelAndView();
		
		Object[] data=comActService.comInfo(request);
		Map<String, Object> comInfo=(Map<String, Object>) data[1];
		String memChk=(String) data[0];
		String memAuth=(String) data[2];
		
		mav.addObject("comInfo", comInfo);
		mav.addObject("community_id", request.getParameter("community_id"));
		mav.addObject("memChk", memChk);
		mav.addObject("memAuth", memAuth);
		
		
		mav.setViewName("com/act/com_act_home");
		return mav;
	}
	
	//커뮤니티 메인 화면
	@RequestMapping(value="com_act_home_main", method=RequestMethod.GET)
	public ModelAndView comMainChange(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String community_id=request.getParameter("community_id");
		String pageInfo=request.getParameter("page");
		
		ModelAndView mav=new ModelAndView();
		
		Object[] data=comActService.comInfo(request);
		Map<String, Object> comInfo=(Map<String, Object>) data[1];
		
		mav.addObject("comInfo", comInfo);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("community_id", community_id);
		
		mav.setViewName("com/act/com_act_home");
		return mav;
	}
	
	
	//게시판 추가하기
	@RequestMapping(value="com_add_board", method=RequestMethod.POST)
	public void comAddBoard(@ModelAttribute BoardInfoVO boardInfoVo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		comActService.comAddBoard(boardInfoVo);
	}
	
	//게시판 리스트 가져오기
	@ResponseBody
	@RequestMapping(value="board_list", method=RequestMethod.GET)
	public List<Map<String, Object>> boardList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("가져올 게시판의 커뮤니티 아이디");
		System.out.println(request.getParameter("community_id"));
		
		List<Map<String, Object>> boardList=comActService.boardList(request);
		
		return boardList;
	}
	
	//게시판 가져오기
	@RequestMapping(value="com_act_board", method=RequestMethod.GET)
	public ModelAndView comActBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("보여줄 게시판 정보");
		System.out.println(request.getParameter("community_id"));
		System.out.println(request.getParameter("board_id"));
		System.out.println(request.getParameter("page"));
		
		ModelAndView mav=new ModelAndView();
		List<Map<String, Object>> articleList=comActService.articleList(request);
		
		Object[] data=comActService.comInfo(request);
		Map<String, Object> comInfo=(Map<String, Object>) data[1];
		
		mav.addObject("comInfo", comInfo);
		mav.addObject("articleList", articleList);
		mav.addObject("articleListSize", articleList.size());
		mav.addObject("pageInfo", request.getParameter("page"));
		mav.addObject("community_id", request.getParameter("community_id"));
		
		mav.setViewName("com/act/com_act_home");
		
		return mav;
		
	}
	
	//커뮤니티 가입하기 폼 보여주기
	@RequestMapping(value="com_act_mem_form", method=RequestMethod.GET)
	public ModelAndView comActMemForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Object[] data=comActService.comInfo(request);
		Map<String, Object> comInfo=(Map<String, Object>) data[1];
		ModelAndView mav=new ModelAndView();
		mav.addObject("comInfo", comInfo);
		mav.setViewName("com/act/com_act_mem_form");
		return mav;
	}
	
	//커뮤니티 가입하기
	@RequestMapping(value="com_act_mem", method=RequestMethod.POST)
	public void comActMem(@ModelAttribute ComMemberVO comMemberVo, HttpServletRequest request, HttpServletResponse response) throws Exception {

		comActService.comActMem(comMemberVo);
		
	}
	
	//커뮤니티 닉네임 중복체크
	@ResponseBody
	@RequestMapping(value="com_mem_nick_chk", method=RequestMethod.POST)
	public String comMemNickChk(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String chkResult=comActService.comMemNickChk(request);
		
		return chkResult;
	}
	
}
