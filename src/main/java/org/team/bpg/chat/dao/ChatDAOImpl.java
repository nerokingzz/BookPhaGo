package org.team.bpg.chat.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Component;
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
	public String borrowBook(String bookNumber) {
		// TODO Auto-generated method stub
		return null;
	}
	
}