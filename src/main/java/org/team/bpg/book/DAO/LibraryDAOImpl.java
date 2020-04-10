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
	public List<Map<String, Object>> adminlibrarylist(Map<String, String> book_list) {
		List<Map<String, Object>> requestList=sqlSession.selectList("book.adminlibrary_request_list", book_list);
		return requestList;
	}

	@Override
	public List<Map<String, Object>> adminsearchbook(Map<String, String> book_list) {
		List<Map<String, Object>> requestList=sqlSession.selectList("book.adminsearchbook", book_list);
		System.out.println(book_list.get("search_option"));
		System.out.println("222222222222222");
		return requestList;
	}

	@Override
	public void inputlibrary(BookInfoVO bookInfoVO) {
		// TODO Auto-generated method stub
		sqlSession.insert("com_esta.inputlibrary", bookInfoVO);
	}

	@Override
	public List<Map<String, Object>> modfindlibrary(Map<String, String> book_list) {
		List<Map<String, Object>> requestList=sqlSession.selectList("book.modfindlibrary", book_list);
		return requestList;
	}

	@Override
	public void modifylibrary(BookInfoVO bookInfoVO) {
		// TODO Auto-generated method stub
		sqlSession.update("book.modifylibrary", bookInfoVO);
	}

	
	@Override
	public void librarydelete(BookInfoVO bookInfoVO) {
		// TODO Auto-generated method stub
		sqlSession.delete("book.librarydelete", bookInfoVO);
	}

	@Override
	public List<Map<String, Object>> userlibrarylist(Map<String, String> book_list) {
		List<Map<String, Object>> requestList=sqlSession.selectList("book.userlibrarylist", book_list);
		return requestList;
	}

	@Override
	public List<Map<String, Object>> usersearchbook(Map<String, String> book_list) {
		List<Map<String, Object>> requestList=sqlSession.selectList("book.usersearchbook", book_list);
		return requestList;
	}

	@Override
	public List<Map<String, Object>> userreservationlist(Map<String, String> book_list) {
		List<Map<String, Object>> requestList=sqlSession.selectList("book.userreservationlist", book_list);
		return requestList;
	}

	@Override
	public List<Map<String, Object>> userapplysearch(Map<String, String> book_list) {
		List<Map<String, Object>> requestList=sqlSession.selectList("book.userapplysearch", book_list);
		return requestList;
	}

	@Override
	public List<Map<String, Object>> userapplybook(Map<String, String> book_list) {
		List<Map<String, Object>> requestList=sqlSession.selectList("book.userapplybook", book_list);
		return requestList;
	}

	

	

	
}
