package org.team.bpg.member.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.team.bpg.member.dao.MemberDAO;
import org.team.bpg.member.vo.BoardVO;
import org.team.bpg.member.vo.Criteria;
import org.team.bpg.member.vo.MemberVO;
import org.team.bpg.member.vo.SearchCriteria;

import com.ibm.watson.assistant.v1.model.Log;
import com.sun.mail.util.logging.MailHandler;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject MemberDAO dao;
	
	
	@Override
	public void register(MemberVO vo) throws Exception {
		dao.register(vo);
	}
	
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}
	
	//Controller에서 보내는 파라미터들을 memberUpdate(MemberVO vo)로 받고
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		
		//받은 vo를 DAO로 보내줍니다.
		dao.memberUpdate(vo);
	}
	
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		dao.memberDelete(vo);
	}
	
	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = dao.passChk(vo);
		return result;
	}
	
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}
	
	@Override
	public String passForgot(MemberVO vo) throws Exception {
		String result = dao.passForgot(vo);
		return result;
	}
	
	@Override
	public int passForgot1(MemberVO vo) throws Exception {
		int result = dao.passForgot1(vo);
		return result;
	}
	
	//관리자게시판		
	// 게시글 작성
	@Override
	public void write(MemberVO memberVO) throws Exception {
		dao.write(memberVO);
	}

	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {

		return dao.list(scri);
	}
	
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}
	
	@Override
	public int adminDelete(String id) throws Exception {
		return dao.adminDelete(id);
	}

	
	public int emailcheck(MemberVO vo) throws Exception {
		int result = dao.emailcheck(vo);
		return result;
	}
	
	public void emailupdate(MemberVO vo) throws Exception {
		dao.emailupdate(vo);
	}
	
	public int emailchecknum(MemberVO vo) throws Exception {
		int result = dao.emailchecknum(vo);
		return result;
	}
	
	public void emailupdatenum(MemberVO vo) throws Exception {
		dao.emailupdatenum(vo);
	}
	
	public String useridcheck(MemberVO vo) throws Exception {
		String result = dao.useridcheck(vo);
		return result;
	}

	@Override
	public void badAlertOk(String user_id) {
		dao.badAlertOk(user_id);
		
	}
	

	public String test(MemberVO vo) throws Exception {
		String result = dao.test(vo);
		return result;
	}
	
	public String test1(MemberVO vo) throws Exception {
		String result = dao.test1(vo);
		return result;
	}
	
	public int test2(MemberVO vo) throws Exception {
		int result = dao.test2(vo);
		return result;
	}
	
	public String test3(MemberVO vo) throws Exception {
		String result = dao.test3(vo);
		return result;
	}
	
	@Override
	public List<Map<String, Object>> userlist() throws Exception{
		List<Map<String, Object>> userlist=dao.userlist();
		return userlist;
	}


}
