package org.team.bpg.book.DAO;

import java.util.List;
import java.util.Map;

import org.team.bpg.book.VO.BookInfoVO;

public interface LibraryDAO {
	
	public List<Map<String, Object>> adminlibrarylist(Map<String, String> book_list);
	public List<Map<String, Object>> adminsearchbook(Map<String, String> book_list);
	public void inputlibrary(BookInfoVO bookInfoVO);
	public List<Map<String, Object>> modfindlibrary(Map<String, String> book_list);
	public void modifylibrary(BookInfoVO bookInfoVO);
	public void librarydelete(BookInfoVO bookInfoVO);
	public List<Map<String, Object>> userlibrarylist(Map<String, String> book_list);
	public List<Map<String, Object>> usersearchbook(Map<String, String> book_list);
	public List<Map<String, Object>> userreservationlist(Map<String, String> book_list);
	public List<Map<String, Object>> userapplysearch(Map<String, String> book_list);
	public List<Map<String, Object>> userapplybook(Map<String, String> book_list);
	

}
