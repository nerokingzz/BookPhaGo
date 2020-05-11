package org.team.bpg.chat.dao;

import java.util.List;
import java.util.Map;

import org.team.bpg.chat.vo.BookVO;
import org.team.bpg.member.vo.MemberVO;

public interface ChatDAO {
	
	public BookVO randomBook(int randomIndex);
	
	public void memberRequest(String id);
	public MemberVO searchMember(String id);
	public String borrowBook(String bookNumber);
	
	public List<Map<String, Object>> chat_rentstatus(String user_id);
	public List<Map<String, Object>> chat_extendBook(Map<String, String> paramMap);
	public int insertTodayBook(BookVO vo);
}
