package org.team.bpg.com.act.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team.bpg.com.act.vo.ArticleInfoVO;
import org.team.bpg.com.act.vo.BoardInfoVO;
import org.team.bpg.com.act.vo.ComMemberVO;
import org.team.bpg.com.act.vo.ReplyInfoVO;
import org.team.bpg.com.act.vo.VoteInfoVO;
import org.team.bpg.utils.PageVO;

@Repository
public class ComActDaoImpl implements ComActDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Map<String, Object>> comList(HttpServletRequest request) {
		List<Map<String, Object>> comList=sqlSession.selectList("com_act.com_act_list");
		return comList;
	}

	@Override
	public Map<String, Object> comInfo(int community_id) {
		Map<String, Object> comInfo=sqlSession.selectOne("com_act.com_info", community_id);
		return comInfo;
	}

	@Override
	public void comAddBoard(BoardInfoVO boardInfoVo) {
		sqlSession.insert("com_act.com_add_board", boardInfoVo);
		
	}

	@Override
	public List<Map<String, Object>> boardList(int community_id) {
		List<Map<String, Object>> boardList=sqlSession.selectList("com_act.com_board_info_side", community_id);
		return boardList;
	}

	@Override
	public List<Map<String, Object>> articleList(int board_id) {
		List<Map<String, Object>> articleList=sqlSession.selectList("com_act.com_article_list", board_id);
		return articleList;
	}

	@Override
	public List<Map<String, Object>> comMemChk(Map<String, Object> info) {
		
		List<Map<String, Object>> memList=sqlSession.selectList("com_act.com_mem_chk", info);
		return memList;
	}

	@Override
	public void comActMem(ComMemberVO comMemberVo) {
		sqlSession.insert("com_act.com_mem", comMemberVo);
		
	}

	@Override
	public List<Map<String, Object>> comMemNickChk(Map<String, Object> info) {
		List<Map<String, Object>> memList=sqlSession.selectList("com_act.com_mem_nick_chk", info);
		return memList;
	}

	@Override
	public List<Map<String, Object>> comBoardAdmin(int community_id) {
		List<Map<String, Object>> boardList=sqlSession.selectList("com_act.com_board_info", community_id);
		
		System.out.println("게시판리스트" + boardList);
		return boardList;
	}

	@Override
	public void boardAdmin(Map<String, Object> info) {
		sqlSession.update("com_act.board_admin", info);
		
	}

	@Override
	public Map<String, Object> boardInfo(int board_id) {
		Map<String, Object> boardInfo=sqlSession.selectOne("com_act.board_info", board_id);
		return boardInfo;
	}

	@Override
	public int countArticle(int board_id) {
		int articleCount=sqlSession.selectOne("com_act.article_count", board_id);
		return articleCount;
	}

	@Override
	public List<ArticleInfoVO> articleList(Map<String, Object> info) {
		List<ArticleInfoVO> articleList=sqlSession.selectList("com_act.article_list", info);
		System.out.println("글목록"+articleList);
		return articleList;
	}
	
	@Override
	public int voteArticle(int board_id) {
		int voteCount=sqlSession.selectOne("com_act.vote_count", board_id);
		return voteCount;
	}

	@Override
	public List<VoteInfoVO> voteList(Map<String, Object> info) {
		List<VoteInfoVO> voteList=sqlSession.selectList("com_act.vote_list", info);
		System.out.println("투표목록"+voteList);
		return voteList;
	}

	@Override
	public Map<String, Object> articleInfo(int article_id) {
		Map<String, Object> articleInfo=sqlSession.selectOne("com_act.article_info", article_id);
		System.out.println("글정보"+articleInfo);
		return articleInfo;
	}
	
	@Override
	public Map<String, Object> voteInfo(int vote_id) {
		Map<String, Object> voteInfo=sqlSession.selectOne("com_act.vote_info", vote_id);
		System.out.println("투표정보"+voteInfo);
		return voteInfo;
	}
	
	@Override
	public VoteInfoVO voteInfoByVo(int vote_id) {
		VoteInfoVO voteInfoVo=sqlSession.selectOne("com_act.vote_info2", vote_id);
		System.out.println("투표정보"+voteInfoVo);
		return voteInfoVo;
	}

	@Override
	public void articleSubmit(ArticleInfoVO articleInfoVo) {
		sqlSession.insert("com_act.article_submit", articleInfoVo);
		
	}

	@Override
	public void voteSubmit(VoteInfoVO voteInfoVo) {
		sqlSession.insert("com_act.vote_submit", voteInfoVo);
		
	}

	@Override
	public String boardCategory(int board_id) {
		String board_category=sqlSession.selectOne("com_act.board_category", board_id);
		return board_category;
	}

	@Override
	public void articleUpdate(ArticleInfoVO articleInfoVo) {
		sqlSession.update("com_act.article_update", articleInfoVo);
		
	}
	
	@Override
	public void voteUpdate(VoteInfoVO voteInfoVo) {
		sqlSession.update("com_act.vote_update", voteInfoVo);
		
	}

	@Override
	public void articleDelete(String article_id) {
		sqlSession.delete("com_act.article_delete", article_id);
		
	}

	@Override
	public void articleGood(String article_id) {
		sqlSession.update("com_act.article_good", article_id);
		
	}

	@Override
	public void articleBad(String article_id) {
		sqlSession.update("com_act.article_bad", article_id);
		
	}

	@Override
	public void articleView(String article_id) {
		sqlSession.update("com_act.article_view", article_id);
		
	}

	@Override
	public List<Map<String, Object>> voteIng(String board_id) {
		List<Map<String, Object>> ingVote=sqlSession.selectList("com_act.vote_ing", board_id);
		return ingVote;
	}

	@Override
	public void voting(Map<String, Object> votingInfo) {
		sqlSession.update("com_act.voting", votingInfo);
		
	}

	@Override
	public void votePart(String vote_id) {
		sqlSession.update("com_act.votePart", vote_id);
		
	}

	@Override
	public List<Map<String, Object>> voteAllList(String board_id) {
		int board_idd=Integer.parseInt(board_id);
		List<Map<String, Object>> voteAllList=sqlSession.selectList("com_act.vote_all", board_idd);
		return voteAllList;
	}

	@Override
	public void voteAdmin(Map<String, String> sts_info) {
		sqlSession.update("com_act.vote_sts_update", sts_info);
		
	}

	@Override
	public void voteRequest(Map<String, Object> requestInfo) {
		sqlSession.insert("com_act.vote_request", requestInfo);
		
	}

	@Override
	public List<Map<String, Object>> voteReqList(String board_id) {
		int board_idd=Integer.parseInt(board_id);
		List<Map<String, Object>> voteReqList=sqlSession.selectList("com_act.vote_req", board_idd);
		return voteReqList;
	}

	@Override
	public void replySubmit(ReplyInfoVO replyInfoVo) {
		sqlSession.insert("com_act.reply_submit", replyInfoVo);
		
	}
	
	@Override
	public void reReplySubmit(ReplyInfoVO replyInfoVo) {
		
		System.out.println("입력하는 닉" + replyInfoVo.getReply_writer());
		System.out.println("번들아이디" + replyInfoVo.getBundle_id());
		
		sqlSession.insert("com_act.re_reply_submit", replyInfoVo);
		
	}

	@Override
	public int countReply(int article_id) {
		int replyCount=sqlSession.selectOne("com_act.reply_count", article_id);
		return replyCount;
	}

	@Override
	public List<Map<String, Object>> replyList(String article_id) {
		List<Map<String, Object>> replyList=sqlSession.selectList("com_act.reply_list", article_id);
		return replyList;
	}
	
	@Override
	public List<Map<String, Object>> reReplyList(String article_id) {
		List<Map<String, Object>> reReplyList=sqlSession.selectList("com_act.re_reply_list", article_id);
		return reReplyList;
	}






}
