package org.team.bpg.com.act.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.bpg.com.act.dao.ComActDao;
import org.team.bpg.com.act.vo.ArticleInfoVO;
import org.team.bpg.com.act.vo.BoardInfoVO;
import org.team.bpg.com.act.vo.ComMemberVO;
import org.team.bpg.com.act.vo.VoteInfoVO;
import org.team.bpg.utils.PageVO;

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
	public Object[] comInfo(HttpServletRequest request) {
		
		String community_idd=request.getParameter("community_id");
		int community_id=Integer.parseInt(community_idd);
		
		//로그인한 회원이 이 커뮤니티의 멤버인지 확인
		HttpSession session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		Map<String, Object> info=new HashMap<String, Object>();
		info.put("user_id", user_id);
		info.put("community_id", community_id);
		List<Map<String, Object>> memList=comActDao.comMemChk(info);
		
		System.out.println("가져올 커뮤니티 아이디");
		System.out.println(community_id);
		Map<String, Object> comInfo=comActDao.comInfo(community_id);
		
		
		System.out.println("가져온 커뮤니티 정보");
		System.out.println(comInfo);
		
		String memChk="x";
		String memAuth="mem";;
		
		if (memList.size() > 0) {
			
			//커뮤니티의 운영자인지 확인
			if (comInfo.get("COMMUNITY_CAPTAIN").equals(user_id)) {
				memAuth="cap";
			}
			
			memChk="o";
		}
		
		Object[] data= {memChk, comInfo, memAuth};
		return data;
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
	public void comActMem(ComMemberVO comMemberVo) {
		comActDao.comActMem(comMemberVo);
		
	}

	@Override
	public String comMemNickChk(HttpServletRequest request) {
		String community_idd=request.getParameter("community_id");
		int community_id=Integer.parseInt(community_idd);
		String member_nickname=request.getParameter("member_nickname");
		
		Map<String, Object> info=new HashMap<String, Object>();
		info.put("community_id", community_id);
		info.put("member_nickname", member_nickname);
		List<Map<String, Object>> memList=comActDao.comMemNickChk(info);
		
		String chkResult="o";
		
		if (memList.size() > 0) {
			chkResult="x";
		}
		
		return chkResult;
	}

	@Override
	public List<Map<String, Object>> comBoardAdmin(HttpServletRequest request) {
		String community_idd=request.getParameter("community_id");
		int community_id=Integer.parseInt(community_idd);
		List<Map<String, Object>> boardList=comActDao.comBoardAdmin(community_id);
		return boardList;
	}

	@Override
	public void boardAdmin(HttpServletRequest request) {
		System.out.println("변경할 게시판정보");
		System.out.println(request.getParameter("board_id"));
		System.out.println(request.getParameter("board_status"));
		
		String board_idd=request.getParameter("board_id");
		int board_id=Integer.parseInt(board_idd);
		String board_status=request.getParameter("board_status");
		
		Map<String, Object> info=new HashMap<String, Object>();
		info.put("board_id", board_id);
		info.put("board_status", board_status);
		
		comActDao.boardAdmin(info);
		
		
		
	}

	@Override
	public Map<String, Object> boardInfo(HttpServletRequest request) {
		String board_idd=request.getParameter("board_id");
		int board_id=Integer.parseInt(board_idd);
		Map<String, Object> boardInfo=comActDao.boardInfo(board_id);
		return boardInfo;
	}

	
	@Override
	public int countArticle(HttpServletRequest request) {
		String board_idd=request.getParameter("board_id");
		int board_id=Integer.parseInt(board_idd);
		int articleCount=comActDao.countArticle(board_id);
		return articleCount;
	}

	@Override
	public List<ArticleInfoVO> articleList(PageVO pageVo, HttpServletRequest request) {
		String board_idd=request.getParameter("board_id");
		int board_id=Integer.parseInt(board_idd);
		
		System.out.println("가져올 게시판 아이디:" + board_id);
		
		Map<String, Object> info=new HashMap<String, Object>();
		info.put("board_id", board_id);
		info.put("start", pageVo.getStart());
		info.put("end", pageVo.getEnd());
		
		System.out.println(pageVo.getStart());
		System.out.println(pageVo.getEnd());
		
		List<ArticleInfoVO> articleList=comActDao.articleList(info);
		return articleList;
	}
	
	@Override
	public int countvote(HttpServletRequest request) {
		String board_idd=request.getParameter("board_id");
		int board_id=Integer.parseInt(board_idd);
		int voteCount=comActDao.voteArticle(board_id);
		return voteCount;
	}

	@Override
	public List<VoteInfoVO> voteList(PageVO pageVo, HttpServletRequest request) {
		String board_idd=request.getParameter("board_id");
		int board_id=Integer.parseInt(board_idd);
		
		System.out.println("가져올 게시판 아이디:" + board_id);
		
		Map<String, Object> info=new HashMap<String, Object>();
		info.put("board_id", board_id);
		info.put("start", pageVo.getStart());
		info.put("end", pageVo.getEnd());
		
		System.out.println(pageVo.getStart());
		System.out.println(pageVo.getEnd());
		
		List<VoteInfoVO> voteList=comActDao.voteList(info);
		return voteList;
	}

	@Override
	public Map<String, Object> articleInfo(HttpServletRequest request) {
		String article_idd=request.getParameter("article_id");
		int article_id=Integer.parseInt(article_idd);
		
		Map<String, Object> articleInfo=comActDao.articleInfo(article_id);

		return articleInfo;
	}
	
	@Override
	public Map<String, Object> voteInfo(HttpServletRequest request) {
		String vote_idd=request.getParameter("vote_id");
		int vote_id=Integer.parseInt(vote_idd);
		
		Map<String, Object> voteInfo=comActDao.voteInfo(vote_id);

		return voteInfo;
	}

	@Override
	public void articleSubmit(ArticleInfoVO articleInfoVo, HttpServletRequest request) {
		comActDao.articleSubmit(articleInfoVo);
		
	}

	@Override
	public void voteSubmit(VoteInfoVO voteInfoVo, HttpServletRequest request) {
		comActDao.voteSubmit(voteInfoVo);
		
	}

	@Override
	public String boardCategory(HttpServletRequest request) {
		String board_idd=request.getParameter("board_id");
		int board_id=Integer.parseInt(board_idd);
		String board_category=comActDao.boardCategory(board_id);
		return board_category;
	}




}
