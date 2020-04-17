package org.team.bpg.chat.service;

import java.util.List;


import org.team.bpg.chat.vo.RequestLogVO;
import org.team.bpg.member.vo.MemberVO;

public interface ChatService {
	public MemberVO searchMember(String id);
	public String borrowBook(String bookNumber);
	public void createCSV(List<RequestLogVO> list);
}
