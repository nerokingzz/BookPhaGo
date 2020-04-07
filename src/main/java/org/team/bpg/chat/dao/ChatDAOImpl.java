package org.team.bpg.chat.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.team.bpg.chat.vo.BookVO;
import org.team.bpg.chat.vo.MemberVO;





@Component("chatDAO")
public class ChatDAOImpl implements ChatDAO{
	//@Resource(name = "sqlSessionFactory")
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void memberRequest(String id) {
		sqlSession.selectOne("chatMapper.searchMember", id);
		
	}
	

	@Override
	public MemberVO searchMember(String id) throws DataAccessException{
		
		MemberVO member = sqlSession.selectOne("chatMapper.searchMember", id);
		
		return member;
	}

	@Override
	public BookVO borrow(MemberVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
