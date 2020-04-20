package org.team.bpg.com.act.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.team.bpg.com.act.vo.BoardInfoVO;
import org.team.bpg.com.act.vo.ComMemberVO;

public interface ComActService {

	public List<Map<String, Object>> comList(HttpServletRequest request);
	public Object[] comInfo(HttpServletRequest request);
	public void comAddBoard(BoardInfoVO boardInfoVo);
	public List<Map<String, Object>> boardList(HttpServletRequest request);
	public List<Map<String, Object>> articleList(HttpServletRequest request);
	public void comActMem(ComMemberVO comMemberVo);
	public String comMemNickChk(HttpServletRequest request);

	
}
