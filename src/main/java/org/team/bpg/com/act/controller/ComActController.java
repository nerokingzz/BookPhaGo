package org.team.bpg.com.act.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
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
import org.springframework.web.servlet.ModelAndView;
import org.team.bpg.com.act.service.ComActService;
import org.team.bpg.com.act.vo.ArticleInfoVO;
import org.team.bpg.com.act.vo.BoardInfoVO;
import org.team.bpg.com.act.vo.ComMemberVO;
import org.team.bpg.com.act.vo.ReplyInfoVO;
import org.team.bpg.com.act.vo.VoteInfoVO;
import org.team.bpg.utils.PageVO;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

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
		
		int memCnt=comActService.memCnt(request);
		
		//최신글 5개 가져오기
		List<ArticleInfoVO> newArticleList=comActService.newArticle(Integer.parseInt(request.getParameter("community_id")));
		System.out.println("새로운 글들이옵니다" + newArticleList);
		
		Map<String, Object> comInfo=(Map<String, Object>) data[1];
		String memChk=(String) data[0];
		String memAuth=(String) data[2];
		String memNick=(String) data[3];
		
		mav.addObject("comInfo", comInfo);
		mav.addObject("community_id", request.getParameter("community_id"));
		mav.addObject("memChk", memChk);
		mav.addObject("memAuth", memAuth);
		mav.addObject("memCnt", memCnt);
		mav.addObject("memNick", memNick);
		
		mav.addObject("newArticleList", newArticleList);
		mav.addObject("newArticleListSize", newArticleList.size());
		
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
		
		int memCnt=comActService.memCnt(request);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("comInfo", comInfo);
		mav.addObject("memChk", memChk);
		mav.addObject("memAuth", memAuth);
		mav.addObject("boardList", boardList);
		mav.addObject("boardListSize", boardList.size());
		mav.addObject("memCnt", memCnt);
		
		mav.setViewName("com/act/com_board");
		return mav;
	}
	
	//게시판 관리 데이터 가져오기 -> ibsheet
	@ResponseBody
	@RequestMapping(value="ib_board_list", method=RequestMethod.POST)
	public Map<String, Object> ibBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Map<String, Object>> ibBoardList=comActService.boardAllList(request);
		
		Map<String, Object> ibsheetMap=new HashMap<String, Object>();
		ibsheetMap.put("data", ibBoardList);
		
		return ibsheetMap;	
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
	@RequestMapping(value="board_admin", method=RequestMethod.POST)
	public String boardAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		comActService.boardAdmin(request);
		return "ok";
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
		
		int memCnt=comActService.memCnt(request);
		
		model.addAttribute("boardInfo", boardInfo);
		model.addAttribute("comInfo", comInfo);
		model.addAttribute("memChk", memChk);
		model.addAttribute("memAuth", memAuth);
		model.addAttribute("memCnt", memCnt);
		
		String board_category=comActService.boardCategory(request);
		System.out.println("이 게시판의 종류" + board_category);
		
		if (board_category.equals("BD000")) {
			
			//일반게시판일때
			int articleCount = comActService.countArticle(request);
			System.out.println("글 갯수" + articleCount);
			
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
			
		} else if (board_category.equals("BD001")) {
			
			//투표게시판일때
			
			//현재 진행중인 투표 가져오기
			Map<String, Object> ingVote=comActService.voteIng(request).get(0);
			String dbEndDate=(String) ingVote.get("VOTE_END");
			String[] endDate=dbEndDate.split("-");
			String voteYear=endDate[0];
			String voteMonth=endDate[1];
			String voteDate=endDate[2];
			
			String voteEndDate=voteYear+voteMonth+voteDate;
			
			System.out.println("투표끝날짜 : " + voteEndDate);
			
			Calendar cal = Calendar.getInstance();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String todayDate = sdf.format(cal.getTime());
			
			System.out.println("오늘날짜 : " + todayDate);
			
			String voteIngChk="x";
			
			if (Integer.parseInt(voteEndDate) > Integer.parseInt(todayDate)) {
				voteIngChk="o";
			}
			
			int voteCount = comActService.countvote(request);
			System.out.println("투표 갯수" + voteCount);
			
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "10";
			}
			
			pageVo = new PageVO(voteCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			List<VoteInfoVO> voteList=comActService.voteList(pageVo, request);
			model.addAttribute("paging", pageVo);
			model.addAttribute("voteList", voteList);
			model.addAttribute("voteListSize", voteList.size());
			
			model.addAttribute("ingVote", ingVote);
			model.addAttribute("voteIngChk", voteIngChk);

		}
		return "com/act/board";
		
	}
	
	//게시판 내 검색
	@RequestMapping(value="article_search", method=RequestMethod.POST)
	public String articleSearch(PageVO pageVo, Model model,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		Object[] data=comActService.comInfo(request);
		Map<String, Object> boardInfo=comActService.boardInfo(request);
		
		Map<String, Object> comInfo=(Map<String, Object>) data[1];
		String memChk=(String) data[0];
		String memAuth=(String) data[2];
		int memCnt=comActService.memCnt(request);
		
		
		model.addAttribute("boardInfo", boardInfo);
		model.addAttribute("comInfo", comInfo);
		model.addAttribute("memChk", memChk);
		model.addAttribute("memAuth", memAuth);
		model.addAttribute("memCnt", memCnt);
		
		String board_category=comActService.boardCategory(request);
		System.out.println("이 게시판의 종류" + board_category);
		
		if (board_category.equals("BD000")) {
			
			//일반게시판일때
			int articleCount = comActService.countSearchArticle(request);
			System.out.println("검색 글 갯수" + articleCount);
			
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "10";
			}
			
			System.out.println("nowPage:" + nowPage);
			System.out.println("cntPerPage:" + cntPerPage);
			
			pageVo = new PageVO(articleCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			List<ArticleInfoVO> articleSearchList=comActService.articleSearchList(pageVo, request);
			
			model.addAttribute("paging", pageVo);
			model.addAttribute("articleList", articleSearchList);
			model.addAttribute("articleListSize", articleSearchList.size());
			
		} else if (board_category.equals("BD001")) {
			
			//투표게시판일때
			
			//현재 진행중인 투표 가져오기
			Map<String, Object> ingVote=comActService.voteIng(request).get(0);
			String dbEndDate=(String) ingVote.get("VOTE_END");
			String[] endDate=dbEndDate.split("-");
			String voteYear=endDate[0];
			String voteMonth=endDate[1];
			String voteDate=endDate[2];
			
			String voteEndDate=voteYear+voteMonth+voteDate;
			
			System.out.println("투표끝날짜 : " + voteEndDate);
			
			Calendar cal = Calendar.getInstance();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String todayDate = sdf.format(cal.getTime());
			
			System.out.println("오늘날짜 : " + todayDate);
			
			String voteIngChk="x";
			
			if (Integer.parseInt(voteEndDate) > Integer.parseInt(todayDate)) {
				voteIngChk="o";
			}
			
			int voteCount = comActService.countvote(request);
			System.out.println("투표 갯수" + voteCount);
			
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "10";
			}
			
			pageVo = new PageVO(voteCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			List<VoteInfoVO> voteList=comActService.voteList(pageVo, request);
			model.addAttribute("paging", pageVo);
			model.addAttribute("voteList", voteList);
			model.addAttribute("voteListSize", voteList.size());
			
			model.addAttribute("ingVote", ingVote);
			model.addAttribute("voteIngChk", voteIngChk);

		}
		return "com/act/board";
		
	}
	
	//커뮤니티 가입하기 폼 보여주기
	@RequestMapping(value="com_act_mem_form", method=RequestMethod.GET)
	public ModelAndView comActMemForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Object[] data=comActService.comInfo(request);
		Map<String, Object> comInfo=(Map<String, Object>) data[1];
		String memChk=(String) data[0];
		String memAuth=(String) data[2];
		
		int memCnt=comActService.memCnt(request);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("comInfo", comInfo);
		mav.addObject("memChk", memChk);
		mav.addObject("memAuth", memAuth);
		mav.addObject("memCnt", memCnt);
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
		
		//조회수 증가
		comActService.articleView(request);
		
		Map<String, Object> articleInfo=comActService.articleInfo(request);
		
		System.out.println("글정보"+articleInfo);
		
		//댓글수 가져오기
		int replyCount = comActService.countReply(request);
		
		//원댓글 가져오기
		List<Map<String, Object>> replyList=comActService.replyList(request);
		
		
		//대댓글 가져오기
//		List<Map<String, Object>> reReplyList=comActService.newReReplyList(request);
//		System.out.println("대댓글들은 이러합니다" + reReplyList);
//		
//		replyList.get(0).get("BUNDLE_ID");
//		for (int i=0; i<reReplyList.size(); i++) {
//			if (replyList.get(0).get("BUNDLE_ID")==reReplyList.get(i).get("BUNDLE_ID")) {
//				replyList.get(0).put("reReplyList", reReplyList.get(i));
//			}
//		}
//		

		
		Map<String, Object> boardInfo=comActService.boardInfo(request);
		
		Map<String, Object> comInfo=(Map<String, Object>) data[1];
		String memChk=(String) data[0];
		String memAuth=(String) data[2];
		String memNick=(String) data[3];
		String memId=(String) data[4];
		
		int memCnt=comActService.memCnt(request);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("articleInfo", articleInfo);
		mav.addObject("boardInfo", boardInfo);
		mav.addObject("comInfo", comInfo);
		mav.addObject("memChk", memChk);
		mav.addObject("memAuth", memAuth);
		mav.addObject("memNick", memNick);
		mav.addObject("memId", memId);
		mav.addObject("memCnt", memCnt);
		
		mav.addObject("replyCount", replyCount);
		mav.addObject("replyList", replyList);
		mav.addObject("replyListSize", replyList.size());
//		mav.addObject("reReplyList", reReplyList);
//		//System.out.println("대댓글목록:"+reReplyList);
//		mav.addObject("reReplyListSize", reReplyList.size());
		
		mav.setViewName("com/act/article");
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="re_reply_list", method=RequestMethod.POST)
	public List<Map<String, Object>> reReplyList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String article_id=request.getParameter("article_id");
		String bundle_id= request.getParameter("bundle_id");
		
		Map<String, Object> info=new HashMap<>();
		info.put("article_id", article_id);
		info.put("bundle_id", bundle_id);
		
		List<Map<String, Object>> reReList=comActService.reReplyList(info);
		return reReList;
		
	}
	
	//글쓰기 화면 보여주기
	@RequestMapping(value="com_article_write", method=RequestMethod.GET)
	public ModelAndView articleWrite(@RequestParam(value="article_id", required=false)String article_id, HttpServletRequest request, HttpServletResponse response) {
		
		Object[] data=comActService.comInfo(request);
		
		Map<String, Object> comInfo=(Map<String, Object>) data[1];
		String memChk=(String) data[0];
		String memAuth=(String) data[2];
		String memNick=(String) data[3];
		String memId=(String) data[4];
		int memCnt=comActService.memCnt(request);
		
		
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
		mav.addObject("memNick", memNick);
		mav.addObject("memId", memId);
		mav.addObject("memCnt", memCnt);
		mav.setViewName("com/act/article_write");
		
		return mav;
		
	}
	
	//투표 등록 화면 보여주기
	@RequestMapping(value="com_vote_write", method=RequestMethod.GET)
	public ModelAndView voteWrite(@RequestParam(value="vote_id", required=false)String vote_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Object[] data=comActService.comInfo(request);
		
		Map<String, Object> comInfo=(Map<String, Object>) data[1];
		String memChk=(String) data[0];
		String memAuth=(String) data[2];
		int memCnt=comActService.memCnt(request);
		
		Map<String, Object> boardInfo=comActService.boardInfo(request);
		
		ModelAndView mav=new ModelAndView();
		
		if (vote_id != null) {
			//투표관리 눌렀을때
			System.out.println("관리할 투표 번호 : " + vote_id);
			
		} else {
			//투표등록 눌렀을때
		}
		
		mav.addObject("boardInfo", boardInfo);
		mav.addObject("comInfo", comInfo);
		mav.addObject("memChk", memChk);
		mav.addObject("memAuth", memAuth);
		mav.addObject("memCnt", memCnt);
		
		mav.setViewName("com/act/vote_write");
		
		return mav;
	}
	
	//투표하기 화면 보여주기
	@RequestMapping(value="ing_vote_form", method=RequestMethod.GET)
	public ModelAndView ingVoteForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Object[] data=comActService.comInfo(request);
		
		Map<String, Object> voteInfo=comActService.voteInfo(request);
		
		System.out.println("투표정보"+voteInfo);
		
		Map<String, Object> boardInfo=comActService.boardInfo(request);
		
		Map<String, Object> comInfo=(Map<String, Object>) data[1];
		String memChk=(String) data[0];
		String memAuth=(String) data[2];
		String memNick=(String) data[3];
		String memId=(String) data[4];
		int memCnt=comActService.memCnt(request);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("voteInfo", voteInfo);
		mav.addObject("boardInfo", boardInfo);
		mav.addObject("comInfo", comInfo);
		mav.addObject("memChk", memChk);
		mav.addObject("memAuth", memAuth);
		mav.addObject("memNick", memNick);
		mav.addObject("memId", memId);
		mav.addObject("memCnt", memCnt);
		
		
		mav.setViewName("com/act/voting");
		
		return mav;
	}
	
	//글등록
	@ResponseBody
	@RequestMapping(value="article_submit", method=RequestMethod.POST)
	public String articleSubmit(@ModelAttribute ArticleInfoVO articleInfoVo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String func=request.getParameter("fun");
		String article_id=request.getParameter("article_id");
		
		if (func.equals("update")) {
			System.out.println("글 수정");
			System.out.println("이글번호" + article_id);
			
			System.out.println("수정할 글 정보" + articleInfoVo);
			
			comActService.articleUpdate(articleInfoVo);
			
		} else if (func.equals("insert")) {
			System.out.println("글 등록");
			System.out.println("이글번호" + article_id);
			
			comActService.articleSubmit(articleInfoVo, request);
		}
			
		return "ok";
	}
	
	//글삭제
	@ResponseBody
	@RequestMapping(value="article_delete", method=RequestMethod.POST)
	public String articleDelete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		comActService.articleDelete(request);
		return "ok";
	}
	
	//좋아요
	@ResponseBody
	@RequestMapping(value="article_good", method=RequestMethod.POST)
	public void articleGood(HttpServletRequest request, HttpServletResponse response) throws Exception {
		comActService.articleGood(request);
	}
	
	//싫어요
	@ResponseBody
	@RequestMapping(value="article_bad", method=RequestMethod.POST)
	public void articleBad(HttpServletRequest request, HttpServletResponse response) throws Exception {
		comActService.articleBad(request);
	}
	
	//투표등록
	@ResponseBody
	@RequestMapping(value="vote_submit", method=RequestMethod.POST)
	public String voteSubmit(@ModelAttribute VoteInfoVO voteInfoVo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String func=request.getParameter("fun");
		String vote_id=request.getParameter("vote_id");
		
		System.out.println(voteInfoVo);
		
		if (func.equals("update")) {
			System.out.println("투표 수정");
			System.out.println("이투표번호" + vote_id);
			
			System.out.println("수정할 투표 정보" + voteInfoVo);
			
			comActService.voteUpdate(voteInfoVo);
			
		} else if (func.equals("insert")) {
			System.out.println("투표 등록");
			System.out.println("이투표번호" + vote_id);
			
			comActService.voteSubmit(voteInfoVo, request);
		}
		
		return "ok";
	}
	
	//투표 본문 가져오기
	@RequestMapping(value="com_vote", method=RequestMethod.GET)
	public ModelAndView voteInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Object[] data=comActService.comInfo(request);
		
		Map<String, Object> voteInfo=comActService.voteInfo(request);
		System.out.println("투표정보"+voteInfo);
		
		Map<String, Object> boardInfo=comActService.boardInfo(request);
		
		Map<String, Object> comInfo=(Map<String, Object>) data[1];
		String memChk=(String) data[0];
		String memAuth=(String) data[2];
		int memCnt=comActService.memCnt(request);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("voteInfo", voteInfo);
		mav.addObject("boardInfo", boardInfo);
		mav.addObject("comInfo", comInfo);
		mav.addObject("memChk", memChk);
		mav.addObject("memAuth", memAuth);
		mav.addObject("memCnt", memCnt);
		
		mav.setViewName("com/act/vote");
		
		return mav;
	}
	
	//투표하기
	@ResponseBody
	@RequestMapping(value="voting", method=RequestMethod.POST)
	public void voting(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(request.getParameter("vote_selection"));
		System.out.println(request.getParameter("vote_id"));
		
		comActService.votePart(request);
		comActService.voting(request);
	}
	
	//투표관리
	@RequestMapping(value="com_vote_admin_form", method=RequestMethod.GET)
	public ModelAndView voteAdminForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Object[] data=comActService.comInfo(request);
		
		Map<String, Object> boardInfo=comActService.boardInfo(request);
		
		Map<String, Object> comInfo=(Map<String, Object>) data[1];
		String memChk=(String) data[0];
		String memAuth=(String) data[2];
		int memCnt=comActService.memCnt(request);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("boardInfo", boardInfo);
		mav.addObject("comInfo", comInfo);
		mav.addObject("memChk", memChk);
		mav.addObject("memAuth", memAuth);
		mav.addObject("memCnt", memCnt);
		
		mav.setViewName("com/act/vote_admin");
		
		return mav;
	}
	
	//투표관리 -> ibsheet
	@ResponseBody
	@RequestMapping(value="com_vote_admin", method=RequestMethod.POST)
	public Map<String, Object> voteAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Map<String, Object>> voteAllList=comActService.voteAllList(request);
		
		Map<String, Object> ibsheetMap=new HashMap<String, Object>();
		ibsheetMap.put("data", voteAllList);
		
		return ibsheetMap;	
	}
	
	//투표상태변경
	@ResponseBody
	@RequestMapping(value="vote_sts_update", method=RequestMethod.POST)
	public String voteStsUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//db에 변경 내용 update하기
		comActService.voteAdmin(request);
				
		return "ok";
	}
	
	//투표결과보기 (운영자)
	@RequestMapping(value="vote_chart", method=RequestMethod.GET)
	public ModelAndView voteChart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> voteInfo=comActService.voteInfo(request);
		ModelAndView mav=new ModelAndView();
		mav.addObject("voteInfo", voteInfo);
		mav.setViewName("com/act/vote_chart");
		return mav;
	}
	
	//투표신청 양식 보여주기 (사용자)
	@RequestMapping(value="com_vote_request_form", method=RequestMethod.GET)
	public ModelAndView voteRequestForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Object[] data=comActService.comInfo(request);
		
		Map<String, Object> boardInfo=comActService.boardInfo(request);
		
		Map<String, Object> comInfo=(Map<String, Object>) data[1];
		String memChk=(String) data[0];
		String memAuth=(String) data[2];
		String memNick=(String) data[3];
		String memId=(String) data[4];
		int memCnt=comActService.memCnt(request);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("boardInfo", boardInfo);
		
		mav.addObject("comInfo", comInfo);
		mav.addObject("memChk", memChk);
		mav.addObject("memAuth", memAuth);
		mav.addObject("memNick", memNick);
		mav.addObject("memId", memId);
		mav.addObject("memCnt", memCnt);
		mav.setViewName("com/act/vote_request_form");
		
		return mav;
	}
	
	//투표신청 insert
	@ResponseBody
	@RequestMapping(value="vote_request", method=RequestMethod.POST)
	public void voteRequest(HttpServletRequest request, HttpServletResponse resonse) throws Exception {
		comActService.voteRequest(request);
	}
	
	//투표신청내역 화면보여주기 
	@RequestMapping(value="vote_request_list", method=RequestMethod.GET)
	public ModelAndView voteRequsetList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> boardInfo=comActService.boardInfo(request);
		ModelAndView mav=new ModelAndView();
		mav.addObject("boardInfo", boardInfo);
		mav.setViewName("com/act/vote_request_list");
		return mav;
	}
	
	//투표신청내역 -> ibsheet
	@ResponseBody
	@RequestMapping(value="vote_req_list", method=RequestMethod.POST)
	public Map<String, Object> voteReqList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("qq:"+request.getParameter("board_id"));
		
		List<Map<String, Object>> voteReqList=comActService.voteReqList(request);
		
		Map<String, Object> ibsheetMap=new HashMap<String, Object>();
		ibsheetMap.put("data", voteReqList);
		
		return ibsheetMap;	
	}
	
	//원댓글입력
	@ResponseBody
	@RequestMapping(value="reply_submit", method=RequestMethod.POST)
	public void replySubmit(@ModelAttribute ReplyInfoVO replyInfoVo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		comActService.replySubmit(replyInfoVo);
	}
	
	//대댓글입력
	@ResponseBody
	@RequestMapping(value="re_reply_submit", method=RequestMethod.POST)
	public void reReplySubmit(@ModelAttribute ReplyInfoVO replyInfoVo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		comActService.reReplySubmit(replyInfoVo);
	}
	
	
	//커뮤니티 검색
	@RequestMapping(value="community_search", method=RequestMethod.GET)
	public String comList(PageVO pageVo, Model model,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int comSearchCount = comActService.countSearchComm(request);
		System.out.println("검색된 커뮤니티갯수" + comSearchCount);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		
		pageVo = new PageVO(comSearchCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<Map<String, Object>> comSearchList=comActService.comSearchList(pageVo, request);
		model.addAttribute("paging", pageVo);
		model.addAttribute("comSearchList", comSearchList);
		model.addAttribute("comSearchListSize", comSearchList.size());
		
		return "com/act/com_search_list";
	}
	
	//커뮤니티 상세보기
	@RequestMapping(value="com_detail", method=RequestMethod.GET)
	public ModelAndView comDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Object[] data=comActService.comInfo(request);
		Map<String, Object> comInfo=(Map<String, Object>) data[1];
		String memChk=(String) data[0];
		String memAuth=(String) data[2];
		
		
		int memCnt=comActService.memCnt(request);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("comInfo", comInfo);
		mav.addObject("memChk", memChk);
		mav.addObject("memAuth", memAuth);
		mav.addObject("memCnt", memCnt);
		mav.setViewName("com/act/com_detail");
		
		return mav;
	}
	
	//커뮤니티 탈퇴
	@ResponseBody
	@RequestMapping(value="com_out", method=RequestMethod.POST)
	public void comOut(HttpServletRequest request, HttpServletResponse response) throws Exception {
		comActService.comOut(request);
	}
	
	//커뮤니티 멤버 확인
	@RequestMapping(value="com_mem_list", method=RequestMethod.GET)
	public ModelAndView comMemListForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Object[] data=comActService.comInfo(request);
		Map<String, Object> comInfo=(Map<String, Object>) data[1];
		String memChk=(String) data[0];
		String memAuth=(String) data[2];
		
		int memCnt=comActService.memCnt(request);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("comInfo", comInfo);
		mav.addObject("memChk", memChk);
		mav.addObject("memAuth", memAuth);
		mav.addObject("memCnt", memCnt);
		mav.setViewName("com/act/com_member_list");
		return mav;
		
	}
	
	//멤버관리 -> ibsheet
	@ResponseBody
	@RequestMapping(value="mem_list", method=RequestMethod.POST)
	public Map<String, Object> memAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("dkddlkdldd"+request.getParameter("community_id"));
		List<Map<String, Object>> memList=comActService.memList(request);
		
		
		
		Map<String, Object> ibsheetMap=new HashMap<String, Object>();
		ibsheetMap.put("data", memList);
		
		return ibsheetMap;	
	}
	
	//회원등급 변경
	@ResponseBody
	@RequestMapping(value="mem_posi_up", method=RequestMethod.POST)
	public String memPosiUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//db에 변경 내용 update하기
		comActService.memPosiUpdate(request);
				
		return "ok";
	}

	
	
	
}
