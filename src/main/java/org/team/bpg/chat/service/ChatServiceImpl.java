package org.team.bpg.chat.service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.team.bpg.book.DAO.LibraryDAO;
import org.team.bpg.chat.dao.ChatDAO;
import org.team.bpg.member.vo.MemberVO;
import org.team.bpg.chat.vo.BookVO;
import org.team.bpg.chat.vo.RequestLogVO;




@Service("ChatService")
public class ChatServiceImpl implements ChatService {
	@Autowired
	private ChatDAO chatDAO;
	
	@Autowired
	private LibraryDAO libraryDAO;
	
	
	@Autowired
	private PlatformTransactionManager transactionManager;

	DefaultTransactionDefinition def = null;
	TransactionStatus status = null;
	
	
	@Override
	public BookVO getRatestBook() {
		BookVO vo = chatDAO.getRatestBook();
		return vo;
	}

	
	


	
	@Override
	public BookVO getTodayBook() {
		BookVO vo = chatDAO.getTodayBook();
		return vo;
	}
	
	
	@Override
	public int insertTodayBook(BookVO vo) {
		int result = 0;
		result = chatDAO.insertTodayBook(vo);
		return result;
	}
	
	@Override
	public BookVO getRandomBook(int randomIndex) {
		BookVO randomBookVO = chatDAO.randomBook(randomIndex);
		return randomBookVO;
	}
	

	@Override
	public List<Map<String, Object>> chat_extendBook(Map<String, String> paramMap) {
		List<Map<String, Object>> booklist = chatDAO.chat_extendBook(paramMap);
		return booklist;
	}
	
	
	

	@Override
	public int chat_returnBook(String userid, Map<String, String> book_list) {

		try {
			
			def = new DefaultTransactionDefinition();
			def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

			status = transactionManager.getTransaction(def);	
			
			int result1 = 0;
			result1 = libraryDAO.userrent(userid);
			
			int result2 = 0;
			result2 = libraryDAO.updatebookrent(book_list);
			
			int result3 = 0;
			result3 = libraryDAO.updatebooklibreturn(book_list);


			if (result1 == 1 && result2 ==1 && result3 ==1) {
				transactionManager.commit(status);
				return 1;
			}else {
				transactionManager.rollback(status);
				return 0;
			}

		}
		catch (Exception e) {
			return 0;
		}
		
	}
	
	
	
	
	@Override
	public int chat_rentBook(String userid, Map<String, String> book_list) {

		try {
			
			def = new DefaultTransactionDefinition();
			def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

			status = transactionManager.getTransaction(def);	
			
			int result1 = 0;
			result1 = libraryDAO.userborrow(userid);
			
			int result2 = 0;
			result2 = libraryDAO.insertbookrent(book_list);
			
			int result3 = 0;
			result3 = libraryDAO.updatebooklib(book_list);


			if (result1 == 1 && result2 ==1 && result3 ==1) {
				transactionManager.commit(status);
				return 1;
			}else {
				transactionManager.rollback(status);
				return 0;
			}

		}
		catch (Exception e) {
			return 0;
		}
		
	}
	
	
	
	
	
	
	@Override
	public MemberVO searchMember(String id) {
		MemberVO vo = chatDAO.searchMember(id);
		return vo;
	}

	@Override
	public String borrowBook(String bookNumber) {
		return null;
	}

	@Override
	public List<Map<String, Object>> chat_rentstatus(String user_id) {
		List<Map<String, Object>> booklist = chatDAO.chat_rentstatus(user_id);
		return booklist;
	}

}
