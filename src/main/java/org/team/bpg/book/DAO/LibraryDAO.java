package org.team.bpg.book.DAO;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	public String searchreturn(String userid);
	public List<Map<String, Object>> return_bookNumber(Map<String, Object> book_list);
	public List<Map<String, Object>> myLib_rentstatus(String user_id);
	public List<Map<String, Object>> myLib_rentstatus_score(String user_id);
	public List<BookInfoVO> myLib_rentstatus_favor(String user_id);
	public List<Map<String, Object>> bookextendlist(String bookNumber);
	public void updateB_BOOK_RENT(String bookNumber);
	public int userborrow(String userid);
	public int insertbookrent(Map<String, String> book_list);
	public int updatebooklib(Map<String, String> book_list);
	public int userrent(String userid);
	public int updatebookrent(Map<String, String> book_list);
	public int updatebooklibreturn(Map<String, String> book_list);
	public String applycnt(String userid);
	
	public void scoreUpdate(Map<String, Object> info);
	public List<Map<String, Object>> recomList(String category);
	public List<Map<String, Object>> myLib_applystatus(String user_id);
	public List<Map<String, Object>> admin_bookstatus();
	public List<Map<String, Object>> adminrentstatus(Map<String, String> book_list);
	public List<Map<String, Object>> admin_applystatus();
	public void updateapplyDB(Map<String, Object> book_list);
	public List<Map<String, Object>> adminapplystatus(Map<String, String> book_list);
	public List<Map<String, Object>> admin_booklist();
	public void updatebookrentNumber(int number);
	public List<Map<String, Object>> admin_bookstatus(HttpServletRequest request);
	public void update_applystate(Map<String, Object> book_list);
	public int countbook();
	public List<Map<String, Object>> userlibrarylist(Map<String, Object> info);
	public int countrent(String user_id);
	public List<Map<String, Object>> myLib_rentstatuss(Map<String, Object> info);
	
	public int search_1(Map<String, String> book_list);
	public List<Map<String, Object>> search1_list(Map<String, Object> info);
	public int search_2(String main_search);
	public List<Map<String, Object>> search2_list(Map<String, Object> info);
	public List<Map<String, Object>> autoid(String us_email);
	public List<Map<String, Object>> autobooknumber(String us_email);
	public List<Map<String, Object>> autobookrentlist(String us_email);
	public List<Map<String, Object>> autoreturnbook(Map<String, Object> searchreturn);
}
