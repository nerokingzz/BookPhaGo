package org.team.bpg.member.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.team.bpg.member.vo.BoardVO;
import org.team.bpg.member.vo.Criteria;
import org.team.bpg.member.vo.MemberVO;
import org.team.bpg.member.vo.SearchCriteria;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject SqlSession sql;
	// 회원가입

	@Override
	public void register(MemberVO vo) throws Exception {
		sql.insert("memberMapper.register", vo);
	}
	
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		
		return sql.selectOne("memberMapper.login", vo);
	}
	
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		// vo에 담긴 파라미터들은 memberMapper.xml에 memberMapper라는 namespace에 
		// 아이디가 memberUpdate인 쿼리에 파라미터들을 넣어줍니다.
		sql.update("memberMapper.memberUpdate", vo); 
	}
	
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		// MemberVO에 담긴 값들을 보내줍니다.
		// 그럼 xml에서 memberMapper.memberDelete에 보시면
		//  #{userId}, #{userPass}에 파라미터값이 매칭이 되겠지요.
		sql.delete("memberMapper.memberDelete", vo);
	}
	
	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("memberMapper.passChk", vo);
		return result;
	}
	
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("memberMapper.idChk", vo);
		return result;
	}
	
	
	
	//관리자게시판

	// 게시글 작성
	@Override
	public void write(MemberVO memberVO) throws Exception {
		sql.insert("memberMapper.insert", memberVO);
	}

	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
	
		return sql.selectList("memberMapper.listPage", scri);
	}
	
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
	
		return sql.selectOne("memberMapper.listCount", scri);
	}
	
	@Override
	public int adminDelete(String id) throws Exception {
		return sql.delete("memberMapper.adminDelete", id);
	}
}
