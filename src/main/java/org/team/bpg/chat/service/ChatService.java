package org.team.bpg.chat.service;

import java.io.File;
import java.util.List;


import org.team.bpg.chat.vo.RequestLogVO;
import org.team.bpg.member.vo.MemberVO;

public interface ChatService {
	public MemberVO searchMember(String id);
	public String borrowBook(String bookNumber);
	//public File createCSV(List<RequestLogVO> list);
}
