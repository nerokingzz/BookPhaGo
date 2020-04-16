package org.team.bpg.chat.dao;

import org.team.bpg.member.vo.MemberVO;

public interface ChatDAO {
	public void memberRequest(String id);
	public MemberVO searchMember(String id);
	public String borrowBook(String bookNumber);
}
