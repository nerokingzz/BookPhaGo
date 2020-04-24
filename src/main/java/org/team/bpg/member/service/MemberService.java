package org.team.bpg.member.service;

import java.lang.reflect.Member;
import java.util.List;

import org.team.bpg.member.vo.BoardVO;
import org.team.bpg.member.vo.Criteria;
import org.team.bpg.member.vo.MemberVO;
import org.team.bpg.member.vo.SearchCriteria;

public interface MemberService {

	public void register(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
	
	public void memberUpdate(MemberVO vo) throws Exception;

	public void memberDelete(MemberVO vo) throws Exception;
	
	public int passChk(MemberVO vo) throws Exception;
	
	public int idChk(MemberVO vo) throws Exception;
	
	public String passForgot(MemberVO vo) throws Exception;
	
	public int passForgot1(MemberVO vo) throws Exception;
	
	//관리자
	public void write(MemberVO memberVO) throws Exception;
	
	public List<BoardVO> list(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
	
	public int adminDelete(String id) throws Exception;

	
	
	
	
}
