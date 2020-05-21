package org.team.bpg.chat.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Component;
import org.team.bpg.chat.vo.BookVO;
import org.team.bpg.chat.vo.DialVO;
import org.team.bpg.chat.vo.EntityVO;
import org.team.bpg.chat.vo.IntentVO;
import org.team.bpg.member.vo.MemberVO;





@Component("chatDAO")
public class ChatDAOImpl implements ChatDAO{
	//@Resource(name = "sqlSessionFactory")
	@Autowired
	private SqlSession sqlSession;
	
	
	
	//select chat_logCount
	@Override
	public Map selectLogCount() {
		Map result = sqlSession.selectOne("chatMapper.chat_logCount_s");
		return result;
	}
	
	
	//select chat_logInt
	@Override
	public List<IntentVO> selectLogInt() {
		List<IntentVO> result = sqlSession.selectList("chatMapper.chat_logInt_s");
		return result;
	}
	
	
	//select chat_logEnt
	@Override
	public List<EntityVO> selectLogEnt() {
		List<EntityVO> result = sqlSession.selectList("chatMapper.chat_logEnt_s");
		return result;
	}
	
	
	//select chat_logDial
	@Override
	public List<DialVO> selectLogDial() {
		List<DialVO> result = sqlSession.selectList("chatMapper.chat_logDial_s");
		return result;
	}
	
	
	
	//chat_logCount
	@Override
	public int insertLogCount(Map logDataMap) {
		int result = sqlSession.insert("chatMapper.chat_logCount", logDataMap);
		return result;
	}
	
	
	//chat_logInt
	@Override
	public int insertLogInt(Map logDataMap) {
		int result = sqlSession.insert("chatMapper.chat_logInt", logDataMap);
		return result;
	}
	
	
	//chat_logEnt
	@Override
	public int insertLogEnt(Map logDataMap) {
		int result = sqlSession.insert("chatMapper.chat_logEnt", logDataMap);
		return result;
	}
	
	
	//chat_logDial
	public int insertLogDial(Map logDataMap) {
		int result = sqlSession.insert("chatMapper.chat_logDial", logDataMap);
		return result;
	}
	
	
	@Override
	public int insertLogFile(Map LogFileMap) {
		int result = sqlSession.insert("chatMapper.chat_saveLogFile", LogFileMap);
		return result;
	}
	
	
	@Override
	public BookVO getRatestBook() {
		BookVO vo = sqlSession.selectOne("chatMapper.index_getRatestBook");
		return vo;
	}
	
	
	
	@Override
	public List<Map<String, Object>> getLogFile() {
		List<Map<String, Object>> logFileList =sqlSession.selectList("chatMapper.chat_getLogFile");
		return logFileList;
	}
	
	
	@Override
	public BookVO getTodayBook() {
		BookVO vo = sqlSession.selectOne("chatMapper.index_getTodayBook");
		return vo;
	}
	
	
	@Override
	public int insertTodayBook(BookVO vo) {
		int result = 0;
		result = sqlSession.insert("chatMapper.index_insertRandomBook", vo);
		return result;
	}
	
	
	@Override
	public BookVO randomBook(int randomIndex) {
		BookVO randomBookVO = sqlSession.selectOne("chatMapper.index_getRandomBook", randomIndex);
		return randomBookVO;
	}
	
	
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
