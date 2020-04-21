package org.team.bpg.com.act.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.team.bpg.com.act.vo.ArticleInfoVO;
import org.team.bpg.com.act.vo.BoardInfoVO;
import org.team.bpg.com.act.vo.ComMemberVO;
import org.team.bpg.utils.PageVO;

public interface ComActService {

	public List<Map<String, Object>> comList(HttpServletRequest request);
	public Object[] comInfo(HttpServletRequest request);
	public Map<String, Object> boardInfo(HttpServletRequest request);
	public void comAddBoard(BoardInfoVO boardInfoVo);
	public List<Map<String, Object>> boardList(HttpServletRequest request);
	public void comActMem(ComMemberVO comMemberVo);
	public String comMemNickChk(HttpServletRequest request);
	public List<Map<String, Object>> comBoardAdmin(HttpServletRequest request);
	public void boardAdmin(HttpServletRequest request);
	
	//페이징관련
	public int countArticle(HttpServletRequest request);
	public List<ArticleInfoVO> articleList(PageVO pageVo, HttpServletRequest request);
	
	public Map<String, Object> articleInfo(HttpServletRequest request);

	
}
