package org.team.bpg.com.act.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.team.bpg.com.act.vo.ArticleInfoVO;
import org.team.bpg.com.act.vo.BoardInfoVO;
import org.team.bpg.com.act.vo.ComMemberVO;
import org.team.bpg.com.act.vo.ReplyInfoVO;
import org.team.bpg.com.act.vo.VoteInfoVO;
import org.team.bpg.com.esta.vo.ComInfoVO;
import org.team.bpg.utils.PageVO;

public interface ComActService {

	public List<Map<String, Object>> comList(HttpServletRequest request);
	public Object[] comInfo(HttpServletRequest request);
	public int memCnt(HttpServletRequest request);
	public Map<String, Object> boardInfo(HttpServletRequest request);
	public void comAddBoard(BoardInfoVO boardInfoVo);
	public List<Map<String, Object>> boardList(HttpServletRequest request);
	public void comActMem(ComMemberVO comMemberVo);
	public String comMemNickChk(HttpServletRequest request);
	public List<Map<String, Object>> comBoardAdmin(HttpServletRequest request);
	public void boardAdmin(HttpServletRequest request);
	
	//페이징관련
	public int countArticle(HttpServletRequest request);
	public int countSearchComm(HttpServletRequest request);
	public int countSearchArticle(HttpServletRequest request);
	public List<ArticleInfoVO> articleList(PageVO pageVo, HttpServletRequest request);
	public List<Map<String, Object>> comSearchList(PageVO pageVo, HttpServletRequest request);
	public List<ComInfoVO> myComList(HttpServletRequest request);
	public List<ComInfoVO> bestComList();
	public List<ArticleInfoVO> newArticle(int community_id);
	public List<ArticleInfoVO> articleSearchList(PageVO pageVo, HttpServletRequest request);
	
	public int countvote(HttpServletRequest request);
	public List<Map<String, Object>> voteIng(HttpServletRequest request);
	public List<VoteInfoVO> voteList(PageVO pageVo, HttpServletRequest request);
	
	public Map<String, Object> articleInfo(HttpServletRequest request);
	public Map<String, Object> voteInfo(HttpServletRequest request);
	
	public void articleSubmit(ArticleInfoVO articleInfoVo, HttpServletRequest request);
	public void articleUpdate(ArticleInfoVO articleInfoVo);
	public void articleDelete(HttpServletRequest request);
	public void articleGood(HttpServletRequest request);
	public void articleBad(HttpServletRequest request);
	public void articleView(HttpServletRequest request);
	public void replySubmit(ReplyInfoVO replyInfoVo);
	public void reReplySubmit(ReplyInfoVO replyInfoVo);
	public int countReply(HttpServletRequest request);
	public List<Map<String, Object>> replyList(HttpServletRequest request);
	public List<Map<String, Object>> reReplyList(Map<String, Object> info);
	
	public List<Map<String, Object>> voteAllList(HttpServletRequest request);
	public void voteAdmin(HttpServletRequest request);
	public void voteSubmit(VoteInfoVO voteInfoVo, HttpServletRequest request);
	public void voteUpdate(VoteInfoVO voteInfoVo);
	public void voting(HttpServletRequest request);
	public void votePart(HttpServletRequest request);
	public void voteRequest(HttpServletRequest request);
	public List<Map<String, Object>> voteReqList(HttpServletRequest request);
	
	public List<Map<String, Object>> comRandomList();
	public String boardCategory(HttpServletRequest request);
	public void comOut(HttpServletRequest request);
	
	public List<Map<String, Object>> memList(HttpServletRequest request);
	public void memPosiUpdate(HttpServletRequest request);
	public List<Map<String, Object>> boardAllList(HttpServletRequest request);

	
}
