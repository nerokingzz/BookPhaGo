package org.team.bpg.member.dao;

import org.team.bpg.member.vo.MemberVO;

public interface MemberDAO {
	
	// 회원가입
	public void register(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;

	public void memberUpdate(MemberVO vo)throws Exception;

	public void memberDelete(MemberVO vo)throws Exception;

	public int passChk(MemberVO vo) throws Exception;
	
	public int idChk(MemberVO vo) throws Exception;
}