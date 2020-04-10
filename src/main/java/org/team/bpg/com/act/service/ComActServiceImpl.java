package org.team.bpg.com.act.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.bpg.com.act.dao.ComActDao;
import org.team.bpg.com.act.vo.BoardInfoVO;

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
	public Map<String, Object> comInfo(HttpServletRequest request) {
		
		String community_idd=request.getParameter("community_id");
		int community_id=Integer.parseInt(community_idd);
		
		System.out.println("가져올 커뮤니티 아이디");
		System.out.println(community_id);
		Map<String, Object> comInfo=comActDao.comInfo(community_id);
		
		
		System.out.println("가져온 커뮤니티 정보");
		System.out.println(comInfo);
		
		return comInfo;
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
	public List<Map<String, Object>> articleList(HttpServletRequest request) {
		String community_idd=request.getParameter("community_id");
		int community_id=Integer.parseInt(community_idd);
		
		String board_idd=request.getParameter("board_id");
		int board_id=Integer.parseInt(board_idd);
		
		Map<String, Object> info=new HashMap<String,Object>();
		info.put("community_id", community_id);
		info.put("board_id", board_id);

		List<Map<String, Object>> articleList=comActDao.articleList(board_id);
		return articleList;
	}
}
