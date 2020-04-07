package org.team.bpg.chat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.team.bpg.chat.dao.ChatDAO;
import org.team.bpg.chat.vo.BookVO;
import org.team.bpg.chat.vo.MemberVO;




@Service("ChatService")
@Transactional(propagation = Propagation.REQUIRED)
public class ChatServiceImpl implements ChatService {
	@Autowired
	private ChatDAO chatDAO;
	
	@Override
	public MemberVO searchMember(String id) {
		MemberVO vo = chatDAO.searchMember(id);
		return vo;
	}

	@Override
	public BookVO borrow(MemberVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

}
