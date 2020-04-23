package org.team.bpg.com.act.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.team.bpg.com.act.service.ComActService;
import org.team.bpg.com.act.vo.ArticleInfoVO;
import org.team.bpg.com.act.vo.BoardInfoVO;
import org.team.bpg.com.act.vo.ComMemberVO;
import org.team.bpg.utils.PageVO;

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
	
	
	//게시판 관리 화면 보여주기
	@RequestMapping(value="com_board", method=RequestMethod.GET)
	public ModelAndView comBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Map<String, Object>> boardList=comActService.comBoardAdmin(request);
		
		Object[] data=comActService.comInfo(request);
		Map<String, Object> comInfo=(Map<String, Object>) data[1];
		String memChk=(String) data[0];
		String memAuth=(String) data[2];
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("comInfo", comInfo);
		mav.addObject("memChk", memChk);
		mav.addObject("memAuth", memAuth);
		mav.addObject("boardList", boardList);
		mav.addObject("boardListSize", boardList.size());
		
		mav.setViewName("com/act/com_board");
		return mav;
	}
	
	//게시판 추가 화면 보여주기
	@RequestMapping(value="com_add_board", method=RequestMethod.GET)
	public ModelAndView comAddBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Object[] data=comActService.comInfo(request);
		Map<String, Object> comInfo=(Map<String, Object>) data[1];
		String memChk=(String) data[0];
		String memAuth=(String) data[2];
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("comInfo", comInfo);
		mav.addObject("memChk", memChk);
		mav.addObject("memAuth", memAuth);
		mav.setViewName("com/act/add_board");
		
		return mav;
		
	}
	
	//게시판 추가하기
	@RequestMapping(value="add_board", method=RequestMethod.POST)
	public void comAddBoard(@ModelAttribute BoardInfoVO boardInfoVo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		comActService.comAddBoard(boardInfoVo);
	}
	
	//게시판 상태변경
	@ResponseBody
	@RequestMapping(value="board_admin", method=RequestMethod.GET)
	public List<Map<String, Object>> boardAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		comActService.boardAdmin(request);
		List<Map<String, Object>> boardList=comActService.comBoardAdmin(request);
		return boardList;
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
	
	//하나의 게시판 보여주기
	@RequestMapping(value="com_act_board", method=RequestMethod.GET)
	public String comActBoard(PageVO pageVo, Model model,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("값확인");
		System.out.println(pageVo);
		System.out.println(model);
		System.out.println(nowPage);
		System.out.println(cntPerPage);
		
		Object[] data=comActService.comInfo(request);
		Map<String, Object> boardInfo=comActService.boardInfo(request);
		
		Map<String, Object> comInfo=(Map<String, Object>) data[1];
		String memChk=(String) data[0];
		String memAuth=(String) data[2];
		
		model.addAttribute("boardInfo", boardInfo);
		model.addAttribute("comInfo", comInfo);
		model.addAttribute("memChk", memChk);
		model.addAttribute("memAuth", memAuth);
		
		int articleCount = comActService.countArticle(request);
		System.out.println("글 겟수" + articleCount);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		
		pageVo = new PageVO(articleCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<ArticleInfoVO> articleList=comActService.articleList(pageVo, request);
		model.addAttribute("paging", pageVo);
		model.addAttribute("articleList", articleList);
		model.addAttribute("articleListSize", articleList.size());
		
		return "com/act/board";
		
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
	
	//글 본문 보여주기
	@RequestMapping(value="com_article", method=RequestMethod.GET)
	public ModelAndView articleContent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Object[] data=comActService.comInfo(request);
		
		Map<String, Object> articleInfo=comActService.articleInfo(request);
		System.out.println("글정보"+articleInfo);
		
		Map<String, Object> boardInfo=comActService.boardInfo(request);
		
		Map<String, Object> comInfo=(Map<String, Object>) data[1];
		String memChk=(String) data[0];
		String memAuth=(String) data[2];
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("articleInfo", articleInfo);
		mav.addObject("boardInfo", boardInfo);
		mav.addObject("comInfo", comInfo);
		mav.addObject("memChk", memChk);
		mav.addObject("memAuth", memAuth);
		
		mav.setViewName("com/act/article");
		
		return mav;
	}
	
	//글쓰기 화면 보여주기
	@RequestMapping(value="com_article_write", method=RequestMethod.GET)
	public ModelAndView articleWrite(@RequestParam(value="article_id", required=false)String article_id, HttpServletRequest request, HttpServletResponse response) {
		
		Object[] data=comActService.comInfo(request);
		
		Map<String, Object> comInfo=(Map<String, Object>) data[1];
		String memChk=(String) data[0];
		String memAuth=(String) data[2];
		
		Map<String, Object> boardInfo=comActService.boardInfo(request);
		
		ModelAndView mav=new ModelAndView();
		
		if (article_id != null) {
			//글수정 눌렀을때
			System.out.println("수정할 글 번호 : " + article_id);
			Map<String, Object> articleInfo=comActService.articleInfo(request);
			mav.addObject("articleInfo", articleInfo);
		} else {
			//글쓰기 눌렀을때
			
		}
		
		mav.addObject("boardInfo", boardInfo);
		mav.addObject("comInfo", comInfo);
		mav.addObject("memChk", memChk);
		mav.addObject("memAuth", memAuth);
		mav.setViewName("com/act/article_write");
		
		return mav;
		
	}
	
	//글등록
	@ResponseBody
	@RequestMapping(value="article_submit", method=RequestMethod.POST)
	public String articleSubmit(@ModelAttribute ArticleInfoVO articleInfoVo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		comActService.articleSubmit(articleInfoVo, request);
		return "ok";
	}
	
	

	

	
	
	
}
