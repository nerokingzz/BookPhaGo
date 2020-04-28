package org.team.bpg.book.DAO;

import java.util.List;
import java.util.Map;

import org.team.bpg.book.VO.BookInfoVO;

public interface LibraryDAO {
	public List<Map<String, Object>> adminlibrarylist();
	public List<Map<String, Object>> adminsearchbook(Map<String, String> book_list);
	public List<Map<String, Object>> modfindlibrary(Map<String, String> book_list);
	public List<Map<String, Object>> userlibrarylist();
	public List<Map<String, Object>> usersearchbook(Map<String, String> book_list);	
	public List<Map<String, Object>> userreservationlist(Map<String, String> book_list);
	public List<Map<String, Object>> userapplysearch(Map<String, String> book_list);
	public void userreservation(Map<String, String> book_list);
	public void insertuserreservation(Map<String, String> book_list);
	public void modifylibrary(Map<String, String> book_list);
	public List<Map<String, Object>> adminisbnsearch(Map<String, String> book_list);
	public List<Map<String, Object>> adminisbnsearchlist();
	public void librarydelete(Map<String, String> book_list);
	public void inputlibrary(Map<String, String> book_list);
	public void userapplybook(Map<String, String> book_list);
	public String booknumbersearch(String bookGenre);
	public String applybookcheck(String isbn);
	public String searchuserid(String userid);
	public List<Map<String, Object>> searchbnumber(String bookNumber);
	public void userborrow(String userid);
	public void insertbookrent(Map<String, String> book_list);
	public void updatebooklib(Map<String, String> book_list);
	public String searchreturn(String userid);
	public void userrent(String userid);
	public void updatebookrent(Map<String, String> book_list);
	public void updatebooklibreturn(Map<String, String> book_list);
	public List<Map<String, Object>> return_bookNumber(Map<String, Object> book_list);
	public List<Map<String, Object>> myLib_rentstatus(String user_id);
	public List<Map<String, Object>> bookextendlist(String bookNumber);
	public void updateB_BOOK_RENT(String bookNumber);
}
