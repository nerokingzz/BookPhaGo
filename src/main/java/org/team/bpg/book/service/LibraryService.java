package org.team.bpg.book.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;
import org.team.bpg.book.VO.BookInfoVO;
import org.team.bpg.utils.PageVO;

public interface LibraryService {
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
	public String searchreturn(String userid);
	public List<Map<String, Object>> return_bookNumber(Map<String, Object> book_list);
	public List<Map<String, Object>> myLib_rentstatus(String user_id);
	public List<Map<String, Object>> bookextendlist(String bookNumber);
	public void updateB_BOOK_RENT(String bookNumber);
	public int userborrow(String userid);
	public int insertbookrent(Map<String, String> book_list);
	public int updatebooklib(Map<String, String> book_list);
	public int userrent(String userid);
	public int updatebookrent(Map<String, String> book_list);
	public int updatebooklibreturn(Map<String, String> book_list);
	public String applycnt(String userid);
	public List<Map<String, Object>> myLib_applystatus(String user_id);
	public List<Map<String, Object>> admin_bookstatus();
	public List<Map<String, Object>> adminrentstatus(Map<String, String> book_list);
	public List<Map<String, Object>> admin_applystatus(HttpServletRequest request);
	public void updateapplyDB(Map<String, Object> book_list);
	public List<Map<String, Object>> adminapplystatus(Map<String, String> book_list);
	public List<Map<String, Object>> admin_booklist(HttpServletRequest request);
	public void updatebookrentNumber(int number);
	public List<Map<String, Object>> admin_bookstatus(HttpServletRequest request);
	public void update_applystate(Map<String, Object> book_list);
	public int countbook(HttpServletRequest request);
	public List<Map<String, Object>> userlibrarylist(PageVO pageVo, HttpServletRequest request);
	public int countrent(String user_id);
	public List<Map<String, Object>> myLib_rentstatus(PageVO pageVo, String user_id);
}
