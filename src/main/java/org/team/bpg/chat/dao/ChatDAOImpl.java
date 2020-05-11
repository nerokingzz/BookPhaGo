package org.team.bpg.chat.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Component;
import org.team.bpg.member.vo.MemberVO;





@Component("chatDAO")
public class ChatDAOImpl implements ChatDAO{
	//@Resource(name = "sqlSessionFactory")
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List<Map<String, Object>> chat_extendBook(Map<String, String> paramMap) {
		List<Map<String, Object>> booklist=sqlSession.selectList("chatMapper.chat_extendBook", paramMap);
		return booklist;
	}
	
	
	@Override
	public List<Map<String, Object>> chat_rentstatus(String user_id) {
		List<Map<String, Object>> booklist=sqlSession.selectList("chatMapper.chat_rentstatus", user_id);
		return booklist;
	}
	
	
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
