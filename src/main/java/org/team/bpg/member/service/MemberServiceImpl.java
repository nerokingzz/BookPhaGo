package org.team.bpg.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import org.team.bpg.member.dao.MemberDAO;
import org.team.bpg.member.vo.BoardVO;
import org.team.bpg.member.vo.Criteria;
import org.team.bpg.member.vo.MemberVO;
import org.team.bpg.member.vo.SearchCriteria;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject MemberDAO dao;
	
	@Override
	public void register(MemberVO vo) throws Exception {
		dao.register(vo);
	}
	
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}
	
	//Controller에서 보내는 파라미터들을 memberUpdate(MemberVO vo)로 받고
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		
		//받은 vo를 DAO로 보내줍니다.
		dao.memberUpdate(vo);
	}
	
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		dao.memberDelete(vo);
	}
	
	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = dao.passChk(vo);
		return result;
	}
	
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}
	
	
	//관리자게시판		
	// 게시글 작성
	@Override
	public void write(MemberVO memberVO) throws Exception {
		dao.write(memberVO);
	}

	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {

		return dao.list(scri);
	}
	
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}
	
	@Override
	public int adminDelete(String id) throws Exception {
		return dao.adminDelete(id);
	}
	
}
