package org.team.bpg.com.act.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.team.bpg.com.act.vo.ArticleInfoVO;
import org.team.bpg.com.act.vo.BoardInfoVO;
import org.team.bpg.com.act.vo.ComMemberVO;
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
	public List<ArticleInfoVO> articleList(Map<String, Object> info);
	
	public int voteArticle(int board_id);
	public List<VoteInfoVO> voteList(Map<String, Object> info);
	
	public Map<String, Object> articleInfo(int article_id);
	public Map<String, Object> voteInfo(int vote_id);
	
	public void articleSubmit(ArticleInfoVO articleInfoVo);
	public void voteSubmit(VoteInfoVO voteInfoVo);
	
	public String boardCategory(int board_id);
	
}
