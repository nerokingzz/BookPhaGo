package org.team.bpg.com.act.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team.bpg.com.act.vo.BoardInfoVO;
import org.team.bpg.com.act.vo.ComMemberVO;

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
		List<Map<String, Object>> boardList=sqlSession.selectList("com_act.com_board_list", community_id);
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
}
