package org.team.bpg.com.act.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.team.bpg.com.act.vo.ArticleInfoVO;
import org.team.bpg.com.act.vo.BoardInfoVO;
import org.team.bpg.com.act.vo.ComMemberVO;
import org.team.bpg.com.act.vo.ReplyInfoVO;
import org.team.bpg.com.act.vo.VoteInfoVO;
import org.team.bpg.utils.PageVO;

public interface ComActDao {

	public List<Map<String, Object>> comList(HttpServletRequest request);
	public Map<String, Object> comInfo(int community_id);
	public Map<String, Object> boardInfo(int board_id);
	public void comAddBoard(BoardInfoVO boardInfoVo);
	public List<Map<String, Object>> boardList(int community_id);
	public List<Map<String, Object>> articleList(int board_id);
	public List<Map<String, Object>> comMemChk(Map<String, Object> info);
	public void comActMem(ComMemberVO comMemberVo);
	public List<Map<String, Object>> comMemNickChk(Map<String, Object> info);
	public List<Map<String, Object>> comBoardAdmin(int community_id);
	public void boardAdmin(Map<String, Object> info);
	
	//페이징관련
	public int countArticle(int board_id);
	public int countSearchArticle(Map<String, Object> info);
	public List<ArticleInfoVO> articleList(Map<String, Object> info);
	public List<ArticleInfoVO> articleSearchList(Map<String, Object> info);
	
	public int voteArticle(int board_id);
	public List<Map<String, Object>> voteIng(String board_id);
	public List<VoteInfoVO> voteList(Map<String, Object> info);
	
	public Map<String, Object> articleInfo(int article_id);
	public Map<String, Object> voteInfo(int vote_id);
	public VoteInfoVO voteInfoByVo(int vote_id);
	
	public void articleSubmit(ArticleInfoVO articleInfoVo);
	public void articleUpdate(ArticleInfoVO articleInfoVo);
	public void articleDelete(String article_id);
	public void articleGood(String article_id);
	public void articleBad(String article_id);
	public void articleView(String article_id);
	public void replySubmit(ReplyInfoVO replyInfoVo);
	public void reReplySubmit(ReplyInfoVO replyInfoVo);
	public int countReply(int article_id);
	public List<Map<String, Object>> replyList(String article_id);
	public List<Map<String, Object>> reReplyList(Map<String, Object> info);
	
	public List<Map<String, Object>> voteAllList(String board_id);
	public void voteAdmin(Map<String, String> sts_info);
	public void voteSubmit(VoteInfoVO voteInfoVo);
	public void voteUpdate(VoteInfoVO voteInfoVo);
	public void voting(Map<String, Object> votingInfo);
	public void votePart(String vote_id);
	public void voteRequest(Map<String, Object> requestInfo);
	public List<Map<String, Object>> voteReqList(String board_id);
	
	public String boardCategory(int board_id);
	
}
