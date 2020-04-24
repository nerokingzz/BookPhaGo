package org.team.bpg.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.team.bpg.book.service.LibraryService;
import org.team.bpg.com.act.vo.ArticleInfoVO;
import org.team.bpg.com.esta.service.ComEstaService;
import org.team.bpg.mylib.dec.service.MyLibDeclareService;
import org.team.bpg.mylib.dec.vo.DeclareInfoVO;
import org.team.bpg.utils.PageVO;

@Controller
public class PageController {
	
	@Autowired
	private MyLibDeclareService myLibDeclareService;
	
	@Autowired
	private ComEstaService comEstaService;
	
	@Autowired
	private LibraryService libraryService;

	//도서메뉴 첫 화면 보여주기
		@RequestMapping(value="book_main")
		public ModelAndView bookMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
			HttpSession session=request.getSession();
			String pageInfo=(String)request.getParameter("page");
			System.out.println(pageInfo + "로 이동");
			ModelAndView mav=new ModelAndView();
			mav.addObject("pageInfo", pageInfo);
			
			if (pageInfo != null) {
				if (pageInfo.equals("search")) {
					String search_option = request.getParameter("search_option");
					String search_value = request.getParameter("search_value");
					String bookNumber = request.getParameter("bookNumber");
					
					if(search_option == null && bookNumber == null) {
						List<Map<String, Object>> booklist = libraryService.userlibrarylist();		
						
						mav.addObject("booklist", booklist);
						mav.addObject("booklistSize", booklist.size());
					}
					else if(search_option != null && bookNumber ==null){
						Map<String, String> book_list=new HashMap<String, String>();
						book_list.put("search_option", search_option);
						book_list.put("search_value", search_value);
						
						List<Map<String, Object>> booklist = libraryService.usersearchbook(book_list);
						mav.addObject("booklist", booklist);
						mav.addObject("booklistSize", booklist.size());
					}
					else {
						String user_id=(String)session.getAttribute("user_id");
						String resesrvationDate = "2020-04-20";
						
						Map<String, String> book_list=new HashMap<String, String>();
						book_list.put("bookNumber", bookNumber);
						book_list.put("user_id", user_id);
						book_list.put("resesrvationDate", resesrvationDate);
						
						libraryService.insertuserreservation(book_list);
						libraryService.userreservation(book_list);
					}
				} else if (pageInfo.equals("apply")) {
					String user_id = request.getParameter("user_id");
					String isbn = request.getParameter("isbn");
					String applyDate = request.getParameter("applyDate");
					String applyReason = request.getParameter("applyReason");
					String applyState = "신청중";
					
					if(user_id != null && isbn != null && applyDate != null && applyReason != null && applyState != null) {
						Map<String, String> book_list=new HashMap<String, String>();
						book_list.put("userid", user_id);
						book_list.put("isbn", isbn);
						book_list.put("applyDate", applyDate);
						book_list.put("applyReason", applyReason);
						book_list.put("applyState", applyState);
						
						libraryService.userapplybook(book_list);
						
						System.out.println("도서 신청 완료");
					}
					
					
				} 
			} else {
				System.out.println("11111111");
			}
			
			mav.setViewName("book/book_main");
			return mav;
		}
	
	
	//커뮤니티메뉴 첫 화면 보여주기
	@RequestMapping(value="com_main", method=RequestMethod.GET)
	public ModelAndView comMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("com/com_main");
		return mav;
	}
	
	//마이라이브러리메뉴 첫 화면 보여주기
	@RequestMapping(value="myLib_main", method=RequestMethod.GET)
	public ModelAndView declareMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageInfo=(String)request.getParameter("page");
		System.out.println(pageInfo + "로 이동");
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageInfo", pageInfo);
		
		if (pageInfo != null) {
			if (pageInfo.equals("favor")) {

				
			} else if (pageInfo.equals("score")) {
				
			} else if (pageInfo.equals("declare")) {
				
			} else {
				
			}
		} else {
			
		}
		
		mav.setViewName("mylib/myLib_main");
		return mav;
	}
	

	//관리자메뉴 첫 화면 보여주기
	@RequestMapping(value="admin_main")
	public ModelAndView adminMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageInfo=(String)request.getParameter("page");
		System.out.println(pageInfo + "로 이동");
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageInfo", pageInfo);
		
		if (pageInfo != null) {
			if (pageInfo.equals("user_A")) {

			} else if (pageInfo.equals("book_A")) {
				String search_option = request.getParameter("search_option");
				String search_value = request.getParameter("search_value");
				String isbn = request.getParameter("isbn");
				String bookName = request.getParameter("bookName");
				String bookContents = request.getParameter("bookContents");
				String bookWriter = request.getParameter("bookWriter");
				String bookTrans = request.getParameter("bookTrans");
				String bookPublisher = request.getParameter("bookPublisher");
				String bookDate = request.getParameter("bookDate");
				String bookGenre = request.getParameter("bookGenre");
				String bookNumber = request.getParameter("bookNumber");
				String bookThum = request.getParameter("bookThum");
				String bookRent = request.getParameter("bookRent");
				String bookReservation = request.getParameter("bookReservation");
				
				
				
				
				//도서 리스트
				if(search_option == null && search_value == null && bookNumber == null && bookGenre == null && bookRent == null && bookReservation == null && isbn == null) {
					List<Map<String, Object>> booklist = libraryService.adminlibrarylist();
					
					mav.addObject("booklist", booklist);
					mav.addObject("booklistSize", booklist.size());
				} 
				//도서 검색
				else if(search_option != null && search_value != null && bookNumber == null && bookGenre == null && bookRent == null && bookReservation == null && isbn == null) {
					Map<String, String> book_list=new HashMap<String, String>();
					book_list.put("search_option", search_option);
					book_list.put("search_value", search_value);
					
					List<Map<String, Object>> booklist = libraryService.adminsearchbook(book_list);
				
					mav.addObject("booklist", booklist);
					mav.addObject("booklistSize", booklist.size());
				} 
				//도서 삭제
				else if(search_option == null && search_value == null && bookNumber != null && bookGenre == null && bookRent == null && bookReservation == null && isbn == null) {
					Map<String, String> book_list=new HashMap<String, String>();
					book_list.put("bookNumber", bookNumber);
					
					libraryService.librarydelete(book_list);
					
					List<Map<String, Object>> booklist = libraryService.adminlibrarylist();
					
					mav.addObject("booklist", booklist);
					mav.addObject("booklistSize", booklist.size());
				} 
				//도서 수정
				else if (search_option == null && search_value == null && bookNumber != null && bookGenre == null && bookRent != null && bookReservation != null && isbn == null) {
					Map<String, String> book_list=new HashMap<String, String>();
					book_list.put("bookNumber", bookNumber);
					book_list.put("bookRent", bookRent);
					book_list.put("bookReservation", bookReservation);
					
					libraryService.modifylibrary(book_list);
				}
				//도서 등록
				else if (search_option == null && search_value == null && bookNumber != null && bookGenre != null && bookRent != null && bookReservation != null && isbn != null) {
					System.out.println(search_option);
					
					Map<String, String> book_list=new HashMap<String, String>();
					book_list.put("isbn", isbn);
					book_list.put("bookName", bookName);
					book_list.put("bookContents", bookContents);
					book_list.put("bookWriter", bookWriter);
					book_list.put("bookTrans", bookTrans);
					book_list.put("bookPublisher", bookPublisher);
					book_list.put("bookDate", bookDate);
					book_list.put("bookGenre", bookGenre);
					book_list.put("bookNumber", bookNumber);
					book_list.put("bookThum", bookThum);
					book_list.put("bookRent", bookRent);
					book_list.put("bookReservation", bookReservation);
					
					libraryService.inputlibrary(book_list);
					
					List<Map<String, Object>> booklist = libraryService.adminlibrarylist();
					
					mav.addObject("booklist", booklist);
					mav.addObject("booklistSize", booklist.size());
				}
				
			} else if (pageInfo.equals("book_status_A")) {
				
			} else if (pageInfo.equals("com_A")) {
				List<Map<String, Object>> comRequestList=comEstaService.comEstaRequestList(request);
				mav.addObject("comRequestList", comRequestList);
				mav.addObject("comRequestListSize", comRequestList.size());
				
			} else if (pageInfo.equals("dec_A")) {
				int declareCount = myLibDeclareService.countDeclare(request);
				
				String nowPage=request.getParameter("nowPage");
				String cntPerPage=request.getParameter("cntPerPage");
				
				if (nowPage == null && cntPerPage == null) {
					nowPage = "1";
					cntPerPage = "5";
				} else if (nowPage == null) {
					nowPage = "1";
				} else if (cntPerPage == null) { 
					cntPerPage = "5";
				}
				
				PageVO pageVo=new PageVO();
				
				pageVo = new PageVO(declareCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				List<DeclareInfoVO> declareList=myLibDeclareService.declareList(pageVo, request);
				
				mav.addObject("paging", pageVo);
				mav.addObject("decRequestList", declareList);
				mav.addObject("decRequestListSize", declareList.size());
				
			} else if (pageInfo.equals("chat_A")) {
				
			} else if (pageInfo.equals("rent_A")) {
				String userid = request.getParameter("userid");
				String bookNumber = request.getParameter("bookNumber1");
				
				String bookState = "대출중";
				String bookState1 = "대출불가";
				String bookState2 = "예약가능";
				System.out.println("1111111");
				
				Map<String, String> book_list=new HashMap<String, String>();
				book_list.put("userid", userid);
				book_list.put("bookNumber", bookNumber);
				book_list.put("bookState", bookState);
				book_list.put("bookState1", bookState1);
				book_list.put("bookState2", bookState2);
				
				if(userid != null && bookNumber != null) {
					libraryService.userborrow(userid);
					libraryService.insertbookrent(book_list);
					libraryService.updatebooklib(book_list);
					System.out.println("도서대출완료");
				}
			}
		} else {
			
		}
		
		mav.setViewName("admin/admin_main");
		return mav;
	}
}
