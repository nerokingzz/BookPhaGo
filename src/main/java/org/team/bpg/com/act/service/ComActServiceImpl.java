package org.team.bpg.com.act.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.bpg.com.act.dao.ComActDao;
import org.team.bpg.com.act.vo.ArticleInfoVO;
import org.team.bpg.com.act.vo.BoardInfoVO;
import org.team.bpg.com.act.vo.ComMemberVO;
import org.team.bpg.com.act.vo.ReplyInfoVO;
import org.team.bpg.com.act.vo.VoteInfoVO;
import org.team.bpg.com.esta.vo.ComInfoVO;
import org.team.bpg.utils.PageVO;

@Service
public class ComActServiceImpl implements ComActService {

	@Autowired
	private ComActDao comActDao;
	
	@Override
	public List<Map<String, Object>> comList(HttpServletRequest request) {
		List<Map<String, Object>> comList=comActDao.comList(request);
		
		System.out.println("comList에 들어있는 내용");
		System.out.println(comList);
		
		return comList;
	}

	@Override
	public Object[] comInfo(HttpServletRequest request) {
		
		String community_idd=request.getParameter("community_id");
		int community_id=Integer.parseInt(community_idd);
		
		//로그인한 회원이 이 커뮤니티의 멤버인지 확인
		HttpSession session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		Map<String, Object> info=new HashMap<String, Object>();
		
		info.put("user_id", user_id);
		info.put("community_id", community_id);	
		
		System.out.println("가져올 커뮤니티 아이디");
		System.out.println(community_id);
		Map<String, Object> comInfo=comActDao.comInfo(community_id);
		
		System.out.println("가져온 커뮤니티 정보");
		System.out.println(comInfo);
		
		String memNick=null;
		String memId=null;
		String memChk="x";
		String memAuth="mem";
		
		List<Map<String, Object>> memList=comActDao.comMemChk(info);
		
		System.out.println("멤버리스트:" + memList);
		
		if (memList.size() > 0) {
			
			memNick=(String) memList.get(0).get("MEMBER_NICKNAME");
			memId=(String) memList.get(0).get("MEMBER_ID");
			
			//커뮤니티의 운영자인지 확인
			if (comInfo.get("COMMUNITY_CAPTAIN").equals(user_id)) {
				memAuth="cap";
			}
			
			memChk="o";
		}
		
		Object[] data= {memChk, comInfo, memAuth, memNick, memId};
		return data;
	}
	
	@Override
	public int memCnt(HttpServletRequest request) {
		int memCnt=comActDao.memCnt(Integer.parseInt(request.getParameter("community_id")));
		return memCnt;
	}

	@Override
	public void comAddBoard(BoardInfoVO boardInfoVo) {
		
		comActDao.comAddBoard(boardInfoVo);
		
	}

	@Override
	public List<Map<String, Object>> boardList(HttpServletRequest request) {
		String community_idd=request.getParameter("community_id");
		int community_id=Integer.parseInt(community_idd);
		
		System.out.println("가져올 커뮤니티 아이디");
		System.out.println(community_id);
		List<Map<String, Object>> boardList=comActDao.boardList(community_id);
		
		System.out.println("가져온 게시판 리스트");
		System.out.println(boardList);
		
		return boardList;
	}

	@Override
	public void comActMem(ComMemberVO comMemberVo) {
		comActDao.comActMem(comMemberVo);
		
	}

	@Override
	public String comMemNickChk(HttpServletRequest request) {
		String community_idd=request.getParameter("community_id");
		int community_id=Integer.parseInt(community_idd);
		String member_nickname=request.getParameter("member_nickname");
		
		Map<String, Object> info=new HashMap<String, Object>();
		info.put("community_id", community_id);
		info.put("member_nickname", member_nickname);
		List<Map<String, Object>> memList=comActDao.comMemNickChk(info);
		
		String chkResult="o";
		
		if (memList.size() > 0) {
			chkResult="x";
		}
		
		return chkResult;
	}

	@Override
	public List<Map<String, Object>> comBoardAdmin(HttpServletRequest request) {
		String community_idd=request.getParameter("community_id");
		int community_id=Integer.parseInt(community_idd);
		List<Map<String, Object>> boardList=comActDao.comBoardAdmin(community_id);
		return boardList;
	}

	@Override
	public void boardAdmin(HttpServletRequest request) {
		System.out.println("변경할 게시판정보");
		System.out.println(request.getParameter("board_id"));
		System.out.println(request.getParameter("board_status"));
		
		String board_idd=request.getParameter("board_id");
		int board_id=Integer.parseInt(board_idd);
		String board_status=request.getParameter("board_status");
		
		Map<String, Object> info=new HashMap<String, Object>();
		info.put("board_id", board_id);
		info.put("board_status", board_status);
		
		comActDao.boardAdmin(info);
		
		
		
	}

	@Override
	public Map<String, Object> boardInfo(HttpServletRequest request) {
		String board_idd=request.getParameter("board_id");
		int board_id=Integer.parseInt(board_idd);
		Map<String, Object> boardInfo=comActDao.boardInfo(board_id);
		return boardInfo;
	}

	
	@Override
	public int countArticle(HttpServletRequest request) {
		String board_idd=request.getParameter("board_id");
		int board_id=Integer.parseInt(board_idd);
		int articleCount=comActDao.countArticle(board_id);
		return articleCount;
	}
	
	@Override
	public int countSearchComm(HttpServletRequest request) {
		String search_keyword=request.getParameter("search_keyword");
		int comSearchCount=comActDao.countSearchComm(search_keyword);
		return comSearchCount;
	}
	
	@Override
	public int countSearchArticle(HttpServletRequest request) {
		String search_option=request.getParameter("search_option");
		String search_keyword=request.getParameter("search_keyword");
		String board_idd=request.getParameter("board_id");
		int board_id=Integer.parseInt(board_idd);
		
		Map<String, Object> info=new HashMap<>();
		info.put("board_id", board_id);
		info.put("search_option", search_option);
		info.put("search_keyword", search_keyword);
		
		int articleCount=comActDao.countSearchArticle(info);
		return articleCount;
	}

	@Override
	public List<ArticleInfoVO> articleList(PageVO pageVo, HttpServletRequest request) {
		String board_idd=request.getParameter("board_id");
		int board_id=Integer.parseInt(board_idd);
		
		System.out.println("가져올 게시판 아이디:" + board_id);
		
		Map<String, Object> info=new HashMap<String, Object>();
		info.put("board_id", board_id);
		info.put("start", pageVo.getStart());
		info.put("end", pageVo.getEnd());
		
		System.out.println(pageVo.getStart());
		System.out.println(pageVo.getEnd());
		
		List<ArticleInfoVO> articleList=comActDao.articleList(info);
		return articleList;
	}
	
	@Override
	public List<Map<String, Object>> comSearchList(PageVO pageVo, HttpServletRequest request) {
		String search_keyword=request.getParameter("search_keyword");
		
		Map<String, Object> info=new HashMap<String, Object>();
		info.put("search_keyword", search_keyword);
		info.put("start", pageVo.getStart());
		info.put("end", pageVo.getEnd());
		
		System.out.println(pageVo.getStart());
		System.out.println(pageVo.getEnd());
		
		List<Map<String, Object>> comSearchList=comActDao.comSearchList(info);
		return comSearchList;
	}
	
	@Override
	public List<ComInfoVO> myComList(HttpServletRequest request) {
		HttpSession session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		
		List<ComInfoVO> myComList=comActDao.myComList(user_id);
		return myComList;
	}
	
	@Override
	public List<ComInfoVO> bestComList() {
		List<ComInfoVO> bestComList=comActDao.bestComList();
		return bestComList;
	}
	
	@Override
	public List<ArticleInfoVO> newArticle(int community_id) {
		List<ArticleInfoVO> newArticle=comActDao.newArticle(community_id);
		return newArticle;
	}
	
	@Override
	public List<ArticleInfoVO> articleSearchList(PageVO pageVo, HttpServletRequest request) {
		String board_idd=request.getParameter("board_id");
		int board_id=Integer.parseInt(board_idd);
		
		System.out.println("가져올 게시판 아이디:" + board_id);
		
		Map<String, Object> info=new HashMap<String, Object>();
		info.put("search_option", request.getParameter("search_option"));
		info.put("search_keyword", request.getParameter("search_keyword"));
		info.put("board_id", board_id);
		info.put("start", pageVo.getStart());
		info.put("end", pageVo.getEnd());
		
		System.out.println(pageVo.getStart());
		System.out.println(pageVo.getEnd());
		
		List<ArticleInfoVO> articleSearchList=comActDao.articleSearchList(info);
		return articleSearchList;
	}
	
	@Override
	public int countvote(HttpServletRequest request) {
		String board_idd=request.getParameter("board_id");
		int board_id=Integer.parseInt(board_idd);
		int voteCount=comActDao.voteArticle(board_id);
		return voteCount;
	}

	@Override
	public List<VoteInfoVO> voteList(PageVO pageVo, HttpServletRequest request) {
		String board_idd=request.getParameter("board_id");
		int board_id=Integer.parseInt(board_idd);
		
		System.out.println("가져올 게시판 아이디:" + board_id);
		
		Map<String, Object> info=new HashMap<String, Object>();
		info.put("board_id", board_id);
		info.put("start", pageVo.getStart());
		info.put("end", pageVo.getEnd());
		
		System.out.println(pageVo.getStart());
		System.out.println(pageVo.getEnd());
		
		List<VoteInfoVO> voteList=comActDao.voteList(info);
		return voteList;
	}

	@Override
	public Map<String, Object> articleInfo(HttpServletRequest request) {
		String article_idd=request.getParameter("article_id");
		int article_id=Integer.parseInt(article_idd);
		
		Map<String, Object> articleInfo=comActDao.articleInfo(article_id);

		return articleInfo;
	}
	
	@Override
	public Map<String, Object> voteInfo(HttpServletRequest request) {
		String vote_idd=request.getParameter("vote_id");
		int vote_id=Integer.parseInt(vote_idd);
		
		Map<String, Object> voteInfo=comActDao.voteInfo(vote_id);

		return voteInfo;
	}

	@Override
	public void articleSubmit(ArticleInfoVO articleInfoVo, HttpServletRequest request) {
		comActDao.articleSubmit(articleInfoVo);
		
	}

	@Override
	public void voteSubmit(VoteInfoVO voteInfoVo, HttpServletRequest request) {
		comActDao.voteSubmit(voteInfoVo);
		
	}

	@Override
	public String boardCategory(HttpServletRequest request) {
		String board_idd=request.getParameter("board_id");
		int board_id=Integer.parseInt(board_idd);
		String board_category=comActDao.boardCategory(board_id);
		return board_category;
	}

	@Override
	public void articleUpdate(ArticleInfoVO articleInfoVo) {
		
		comActDao.articleUpdate(articleInfoVo);
		
	}
	
	@Override
	public void voteUpdate(VoteInfoVO voteInfoVo) {
		
		comActDao.voteUpdate(voteInfoVo);
		
	}

	@Override
	public void articleDelete(HttpServletRequest request) {
		String article_id=request.getParameter("article_id");
		comActDao.articleDelete(article_id);
		
	}

	@Override
	public void articleGood(HttpServletRequest request) {
		String article_id=request.getParameter("article_id");
		comActDao.articleGood(article_id);
		
	}

	@Override
	public void articleBad(HttpServletRequest request) {
		String article_id=request.getParameter("article_id");
		comActDao.articleBad(article_id);
		
	}

	@Override
	public void articleView(HttpServletRequest request) {
		String article_id=request.getParameter("article_id");
		comActDao.articleView(article_id);
		
	}

	@Override
	public List<Map<String, Object>> voteIng(HttpServletRequest request) {
		String board_id=request.getParameter("board_id");
		List<Map<String, Object>> ingVote=comActDao.voteIng(board_id);
		return ingVote;
	}

	@Override
	public void voting(HttpServletRequest request) {
		String vote_idd=request.getParameter("vote_id");
		int vote_id=Integer.parseInt(vote_idd);
		String vote_selection=request.getParameter("vote_selection");
		String [] selectionInfo=vote_selection.split(":");
		
		System.out.println("선택된 옵션 : " + selectionInfo[1]);
		
		VoteInfoVO voteInfo=comActDao.voteInfoByVo(vote_id);
		Map<String, Object> votingInfo=new HashMap<>();
		
		votingInfo.put("vote_id", vote_id);
		
		int selection_option1_count=voteInfo.getSelection_option1_count();
		if (voteInfo.getSelection_option1().equals(selectionInfo[1])) {
			selection_option1_count+=1;
			votingInfo.put("selection_option1_count", selection_option1_count);
		} else if (!voteInfo.getSelection_option1().equals(selectionInfo[1])) {
			selection_option1_count+=0;
			votingInfo.put("selection_option1_count", selection_option1_count);
		}
		
		int selection_option2_count=voteInfo.getSelection_option2_count();
		if (voteInfo.getSelection_option2().equals(selectionInfo[1])) {
			selection_option2_count+=1;
			votingInfo.put("selection_option2_count", selection_option2_count);
		} else if (!voteInfo.getSelection_option2().equals(selectionInfo[1])) {
			selection_option2_count+=0;
			votingInfo.put("selection_option2_count", selection_option2_count);
		}
		
		int selection_option3_count=voteInfo.getSelection_option3_count();
		if (voteInfo.getSelection_option3().equals(selectionInfo[1])) {
			selection_option3_count+=1;
			votingInfo.put("selection_option3_count", selection_option3_count);
		} else if (!voteInfo.getSelection_option3().equals(selectionInfo[1])) {
			selection_option3_count+=0;
			votingInfo.put("selection_option3_count", selection_option3_count);
		}
		
		int selection_option4_count=voteInfo.getSelection_option4_count();
		if (voteInfo.getSelection_option4().equals(selectionInfo[1])) {
			selection_option4_count+=1;
			votingInfo.put("selection_option4_count", selection_option4_count);
		} else if (!voteInfo.getSelection_option4().equals(selectionInfo[1])) {
			selection_option4_count+=0;
			votingInfo.put("selection_option4_count", selection_option4_count);
		}
		
		int selection_option5_count=voteInfo.getSelection_option5_count();
		if (voteInfo.getSelection_option5().equals(selectionInfo[1])) {
			selection_option5_count+=1;
			votingInfo.put("selection_option5_count", selection_option5_count);
		} else if (!voteInfo.getSelection_option5().equals(selectionInfo[1])) {
			selection_option5_count+=0;
			votingInfo.put("selection_option5_count", selection_option5_count);
		}

		comActDao.voting(votingInfo);
		
	}

	@Override
	public void votePart(HttpServletRequest request) {
		String vote_id=request.getParameter("vote_id");
		comActDao.votePart(vote_id);
		
	}

	@Override
	public List<Map<String, Object>> voteAllList(HttpServletRequest request) {
		String board_id=request.getParameter("board_id");
		List<Map<String, Object>> voteAllList=comActDao.voteAllList(board_id);
		return voteAllList;
	}

	@Override
	public void voteAdmin(HttpServletRequest request) {
		String vote_id=request.getParameter("vote_id");
		String vote_status=request.getParameter("admin_sts");
		
		Map<String, String> sts_info=new HashMap<String, String>();
		sts_info.put("vote_id", vote_id);
		sts_info.put("vote_status", vote_status);
		
		comActDao.voteAdmin(sts_info);
		
	}

	@Override
	public void voteRequest(HttpServletRequest request) {
		String request_content=request.getParameter("request_content");
		String request_writer=request.getParameter("request_writer");
		String board_id=request.getParameter("board_id");
		
		Map<String, Object> requestInfo=new HashMap<>();
		requestInfo.put("request_content", request_content);
		requestInfo.put("request_writer", request_writer);
		requestInfo.put("board_id", board_id);
		
		comActDao.voteRequest(requestInfo);
		
	}

	@Override
	public List<Map<String, Object>> voteReqList(HttpServletRequest request) {
		String board_id=request.getParameter("board_id");
		List<Map<String, Object>> voteReqList=comActDao.voteReqList(board_id);
		return voteReqList;
	}

	@Override
	public void replySubmit(ReplyInfoVO replyInfoVo) {
		comActDao.replySubmit(replyInfoVo);
		
	}

	@Override
	public int countReply(HttpServletRequest request) {
		String article_idd=request.getParameter("article_id");
		int article_id=Integer.parseInt(article_idd);
		int replyCount=comActDao.countReply(article_id);
		return replyCount;
	}

	@Override
	public List<Map<String, Object>> replyList(HttpServletRequest request) {
		String article_id=request.getParameter("article_id");
		List<Map<String, Object>> replyList=comActDao.replyList(article_id);
		return replyList;
	}
	
	@Override
	public List<Map<String, Object>> reReplyList(Map<String, Object> info) {

		List<Map<String, Object>> repRelyList=comActDao.reReplyList(info);
		return repRelyList;
	}

	@Override
	public void reReplySubmit(ReplyInfoVO replyInfoVo) {
		
		comActDao.reReplySubmit(replyInfoVo);
		
	}

	@Override
	public List<Map<String, Object>> comRandomList() {
		List<Map<String, Object>> comRandomList=comActDao.comRandomList();
		return comRandomList;
	}

	@Override
	public void comOut(HttpServletRequest request) {
		int community_id=Integer.parseInt(request.getParameter("community_id"));
		String member_id=request.getParameter("member_id");
		
		Map<String, Object> info=new HashMap<>();
		info.put("community_id", community_id);
		info.put("member_id", member_id);
		comActDao.comOut(info);
		
	}

	@Override
	public List<Map<String, Object>> memList(HttpServletRequest request) {
		int community_id=Integer.parseInt(request.getParameter("community_id"));
		String member_id=request.getParameter("member_id");
		Map<String, Object> info=new HashMap<>();
		info.put("community_id", community_id);
		info.put("member_id", member_id);
		List<Map<String, Object>> memList=comActDao.memList(info);
		return memList;
	}

	@Override
	public void memPosiUpdate(HttpServletRequest request) {
		int community_id=Integer.parseInt(request.getParameter("community_id"));
		String member_id=request.getParameter("member_id");
		String member_position=request.getParameter("member_position");
		Map<String, Object> info=new HashMap<>();
		info.put("community_id", community_id);
		info.put("member_id", member_id);
		info.put("member_position", member_position);
		comActDao.memPosiUpdate(info);
		
	}

	@Override
	public List<Map<String, Object>> boardAllList(HttpServletRequest request) {
		int community_id=Integer.parseInt(request.getParameter("community_id"));
		List<Map<String, Object>> boardAllList=comActDao.boardAllList(community_id);
		return boardAllList;
	}




}
