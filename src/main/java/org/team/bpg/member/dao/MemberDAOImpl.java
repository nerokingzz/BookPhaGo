package org.team.bpg.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
	
	@Override
	public String passForgot(MemberVO vo) throws Exception {
		String result = sql.selectOne("memberMapper.passForgot", vo);
		return result;
	}
	
	@Override
	public int passForgot1(MemberVO vo) throws Exception {
		int result = sql.selectOne("memberMapper.passForgot1", vo);
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

	@Override
	public int emailcheck(MemberVO vo) throws Exception {
		return sql.selectOne("memberMapper.emailcheck", vo);
	}
	
	@Override
	public void emailupdate(MemberVO vo) throws Exception {
		sql.update("memberMapper.emailupdate", vo);
	}
	
	@Override
	public int emailchecknum(MemberVO vo) throws Exception {
		return sql.selectOne("memberMapper.emailchecknum", vo);
	}
	
	@Override
	public void emailupdatenum(MemberVO vo) throws Exception {
		sql.update("memberMapper.emailupdatenum", vo);
	}

	@Override
	public String useridcheck(MemberVO vo) throws Exception {
		return sql.selectOne("memberMapper.useridcheck", vo);
	}

	@Override
	public void badAlertOk(String user_id) {
		sql.update("memberMapper.badAlertOk", user_id);
		
	}

	@Override
	public String test(MemberVO vo) throws Exception {
		return sql.selectOne("memberMapper.test", vo);
	}
	
	@Override
	public String test1(MemberVO vo) throws Exception {
		return sql.selectOne("memberMapper.test1", vo);
	}
	
	@Override
	public int test2(MemberVO vo) throws Exception {
		return sql.selectOne("memberMapper.test2", vo);
	}

	@Override
	public String test3(MemberVO vo) throws Exception {
		return sql.selectOne("memberMapper.test3", vo);
	}
	
	@Override
	public List<Map<String, Object>> userlist() {
		List<Map<String, Object>> userlist=sql.selectList("memberMapper.userlist");
		return userlist;
	}


}
