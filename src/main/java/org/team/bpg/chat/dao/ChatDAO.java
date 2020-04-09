package org.team.bpg.chat.dao;

import org.team.bpg.chat.vo.BookVO;
import org.team.bpg.chat.vo.MemberVO;

public interface ChatDAO {
	public void memberRequest(String id);
	public MemberVO searchMember(String id);
	public String borrowBook(String bookNumber);
}
