package org.team.bpg.chat.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.team.bpg.chat.vo.BookVO;
import org.team.bpg.chat.vo.RequestLogVO;
import org.team.bpg.member.vo.MemberVO;

public interface ChatService {
	
	public BookVO getRandomBook(int randomIndex);
	public MemberVO searchMember(String id);
	public String borrowBook(String bookNumber);
	public List<Map<String, Object>> chat_rentstatus(String user_id);
	public int chat_returnBook(String userid, Map<String, String> book_list);
	public List<Map<String, Object>> chat_extendBook(Map<String, String> paramMap);
	public int insertTodayBook(BookVO vo);
	
	//public File createCSV(List<RequestLogVO> list);
}
