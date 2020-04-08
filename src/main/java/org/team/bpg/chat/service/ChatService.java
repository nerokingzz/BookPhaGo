package org.team.bpg.chat.service;

import org.team.bpg.chat.vo.BookVO;
import org.team.bpg.chat.vo.MemberVO;

public interface ChatService {
	public MemberVO searchMember(String id);
	public BookVO borrow(MemberVO vo);
}
