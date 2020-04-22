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
	public Map<String, Object> articleInfo(int article_id) {
		Map<String, Object> articleInfo=sqlSession.selectOne("com_act.article_info", article_id);
		System.out.println("글정보"+articleInfo);
		return articleInfo;
	}

	@Override
	public void articleSubmit(ArticleInfoVO articleInfoVo) {
		sqlSession.insert("com_act.article_submit", articleInfoVo);
		
	}
}
