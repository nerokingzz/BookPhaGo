package org.team.bpg.chat.service;

import org.team.bpg.chat.vo.MemberVO;

public interface ChatService {
	public MemberVO searchMember(String id);
	public String borrowBook(String bookNumber);
}
