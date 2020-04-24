package org.team.bpg.book.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team.bpg.book.VO.BookInfoVO;

@Repository
public class LibraryDAOImpl implements LibraryDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Map<String, Object>> adminlibrarylist() {
		List<Map<String, Object>> booklist=sqlSession.selectList("book.adminlibrary_request_list");
		return booklist;
	}
	
	@Override
	public List<Map<String, Object>> adminsearchbook(Map<String, String> book_list) {
		List<Map<String, Object>> booklist=sqlSession.selectList("book.adminsearchbook", book_list);
		return booklist;
	}

	@Override
	public List<Map<String, Object>> modfindlibrary(Map<String, String> book_list) {
		List<Map<String, Object>> booklist=sqlSession.selectList("book.modfindlibrary", book_list);
		return booklist;
	}

	@Override
	public List<Map<String, Object>> userlibrarylist() {
		List<Map<String, Object>> booklist=sqlSession.selectList("book.userlibrarylist");
		return booklist;
	}
	
	@Override
	public List<Map<String, Object>> usersearchbook(Map<String, String> book_list) {
		List<Map<String, Object>> booklist=sqlSession.selectList("book.usersearchbook", book_list);
		return booklist;
	}
	
	@Override
	public List<Map<String, Object>> userreservationlist(Map<String, String> book_list) {
		List<Map<String, Object>> booklist=sqlSession.selectList("book.userreservationlist", book_list);
		return booklist;
	}

	@Override
	public List<Map<String, Object>> userapplysearch(Map<String, String> book_list) {
		List<Map<String, Object>> booklist=sqlSession.selectList("book.userapplysearch", book_list);
		return booklist;
	}

	@Override
	public void userreservation(Map<String, String> book_list) {
		sqlSession.update("book.userreservationupdate", book_list);
	}

	@Override
	public void insertuserreservation(Map<String, String> book_list) {
		sqlSession.insert("book.insertuserreservation", book_list);
		
	}

	@Override
	public void modifylibrary(Map<String, String> book_list) {
		sqlSession.update("book.modifylibrary", book_list);
	}

	@Override
	public List<Map<String, Object>> adminisbnsearch(Map<String, String> book_list) {
		List<Map<String, Object>> booklist=sqlSession.selectList("book.adminisbnsearch", book_list);
		return booklist;
	}

	@Override
	public List<Map<String, Object>> adminisbnsearchlist() {
		List<Map<String, Object>> booklist=sqlSession.selectList("book.adminisbnsearchlist");
		return booklist;
	}

	@Override
	public void librarydelete(Map<String, String> book_list) {
		sqlSession.delete("book.librarydelete", book_list);
	}

	@Override
	public void inputlibrary(Map<String, String> book_list) {
		sqlSession.insert("book.inputlibrary", book_list);
	}

	@Override
	public void userapplybook(Map<String, String> book_list) {
		sqlSession.insert("book.userapplybook", book_list);
	}

	@Override
	public String booknumbersearch(String bookGenre) {
		String booklist=sqlSession.selectOne("book.booknumbersearch", bookGenre);
		return booklist;
	}

	@Override
	public String applybookcheck(String isbn) {
		String booklist=sqlSession.selectOne("book.applybookcheck", isbn);
		return booklist;
	}

	@Override
	public String searchuserid(String userid) {
		String booklist=sqlSession.selectOne("book.searchuserid", userid);
		return booklist;
	}

	@Override
	public List<Map<String, Object>> searchbnumber(String bookNumber) {
		List<Map<String, Object>> booklist=sqlSession.selectList("book.searchbnumber", bookNumber);
		return booklist;
	}

	@Override
	public void userborrow(String userid) {
		sqlSession.update("book.userborrow", userid);
	}

	@Override
	public void insertbookrent(Map<String, String> book_list) {
		sqlSession.insert("book.insertbookrent", book_list);
	}

	@Override
	public void updatebooklib(Map<String, String> book_list) {
		sqlSession.update("book.updatebooklib", book_list);
	}
}
