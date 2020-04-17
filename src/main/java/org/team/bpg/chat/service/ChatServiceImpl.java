package org.team.bpg.chat.service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.team.bpg.chat.dao.ChatDAO;
import org.team.bpg.member.vo.MemberVO;
import org.team.bpg.chat.vo.RequestLogVO;




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
	public String borrowBook(String bookNumber) {
		return null;
	}

	

}
