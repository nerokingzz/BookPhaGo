package org.team.bpg.com.act.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.team.bpg.com.act.vo.BoardInfoVO;

public interface ComActDao {

	public List<Map<String, Object>> comList(HttpServletRequest request);
	public Map<String, Object> comInfo(int community_id);
	public void comAddBoard(BoardInfoVO boardInfoVo);
	public List<Map<String, Object>> boardList(int community_id);
	public List<Map<String, Object>> articleList(int board_id);
	
}
