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
	public String searchreturn(String userid) {
		String booklist=sqlSession.selectOne("book.searchreturn", userid);
		return booklist;
	}

	@Override
	public List<Map<String, Object>> return_bookNumber(Map<String, Object> book_list) {
		List<Map<String, Object>> booklist=sqlSession.selectList("book.return_bookNumber", book_list);
		return booklist;
	}

	@Override
	public List<Map<String, Object>> myLib_rentstatus(String user_id) {
		List<Map<String, Object>> booklist=sqlSession.selectList("book.myLib_rentstatus", user_id);
		return booklist;
	}

	@Override
	public List<Map<String, Object>> bookextendlist(String bookNumber) {
		List<Map<String, Object>> booklist=sqlSession.selectList("book.bookextendlist", bookNumber);
		return booklist;
	}

	@Override
	public void updateB_BOOK_RENT(String bookNumber) {
		sqlSession.update("book.updateB_BOOK_RENT", bookNumber);
	}

	@Override
	public int userborrow(String userid) {
		int result = 0;
		result = sqlSession.update("book.userborrow", userid);
		return result;
	}

	@Override
	public int insertbookrent(Map<String, String> book_list) {
		int result = 0;
		result = sqlSession.insert("book.insertbookrent", book_list);
		return result;
	}

	@Override
	public int updatebooklib(Map<String, String> book_list) {
		int result = 0;
		result = sqlSession.update("book.updatebooklib", book_list);
		return result;
	}

	@Override
	public int userrent(String userid) {
		int result = 0;
		result = sqlSession.update("book.userrent", userid);
		return result;
	}

	@Override
	public int updatebookrent(Map<String, String> book_list) {
		int result = 0;
		result = sqlSession.update("book.updatebookrent", book_list);
		return result;
	}

	@Override
	public int updatebooklibreturn(Map<String, String> book_list) {
		int result = 0;
		result = sqlSession.update("book.updatebooklibreturn", book_list);
		return result;
	}

	@Override
	public String applycnt(String userid) {
		String booklist=sqlSession.selectOne("book.applycnt", userid);
		return booklist;
	}

	@Override
	public List<Map<String, Object>> myLib_applystatus(String user_id) {
		List<Map<String, Object>> booklist=sqlSession.selectList("book.myLib_applystatus", user_id);
		return booklist;
	}

	@Override
	public List<Map<String, Object>> admin_bookstatus() {
		List<Map<String, Object>> booklist=sqlSession.selectList("book.admin_bookstatus");
		return booklist;
	}

	@Override
	public List<Map<String, Object>> adminrentstatus(Map<String, String> book_list) {
		List<Map<String, Object>> booklist=sqlSession.selectList("book.adminrentstatus", book_list);
		return booklist;
	}

	@Override
	public List<Map<String, Object>> admin_applystatus() {
		List<Map<String, Object>> booklist=sqlSession.selectList("book.admin_applystatus");
		return booklist;
	}

	@Override
	public void updateapplyDB(Map<String, Object> book_list) {
		sqlSession.update("book.updateapplyDB", book_list);
	}

	@Override
	public List<Map<String, Object>> adminapplystatus(Map<String, String> book_list) {
		List<Map<String, Object>> booklist=sqlSession.selectList("book.adminapplystatus", book_list);
		return booklist;
	}
}
