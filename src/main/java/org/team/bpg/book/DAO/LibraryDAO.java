package org.team.bpg.book.DAO;

import java.util.List;
import java.util.Map;

import org.team.bpg.book.VO.BookInfoVO;

public interface LibraryDAO {
	
	public List<Map<String, Object>> adminlibrarylist();
	public List<Map<String, Object>> adminsearchbook(Map<String, String> book_list);
	public void inputlibrary(BookInfoVO bookInfoVO);
	public List<Map<String, Object>> modfindlibrary(Map<String, String> book_list);
	public void librarydelete(BookInfoVO bookInfoVO);
	public List<Map<String, Object>> userlibrarylist();
	public List<Map<String, Object>> usersearchbook(Map<String, String> book_list);	
	public List<Map<String, Object>> userreservationlist(Map<String, String> book_list);
	public List<Map<String, Object>> userapplysearch(Map<String, String> book_list);
	public List<Map<String, Object>> userapplybook(Map<String, String> book_list);
	public void userreservation(Map<String, String> book_list);
	public void insertuserreservation(Map<String, String> book_list);
	public void modifylibrary(Map<String, String> book_list);
	public List<Map<String, Object>> adminisbnsearch(Map<String, String> book_list);
	public List<Map<String, Object>> adminisbnsearchlist();

}
