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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

	@RequestMapping(value="book_main")
	public ModelAndView bookMain(PageVO pageVo,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		String pageInfo=(String)request.getParameter("page");
		System.out.println(pageInfo + "로 이동");
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageInfo", pageInfo);
		
		if (pageInfo != null) {
			if (pageInfo.equals("search")) {
				String search_option = request.getParameter("search_option");
				String search_value = request.getParameter("search_value");
				String main_search = request.getParameter("main_search");
				
				if(search_option == null && search_value == null && main_search == null) {				
					int bookCount = libraryService.countbook(request);
					
					if (nowPage == null && cntPerPage == null) {
						nowPage = "1";
						cntPerPage = "10";
					} else if (nowPage == null) {
						nowPage = "1";
					} else if (cntPerPage == null) { 
						cntPerPage = "10";
					}
					
					pageVo = new PageVO(bookCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
					List<Map<String, Object>> booklist =libraryService.userlibrarylist(pageVo, request);
					
					mav.addObject("paging", pageVo);
					mav.addObject("booklist", booklist);
					mav.addObject("booklistSize", booklist.size());
				} else if(search_option != null && search_value != null && main_search == null){
					Map<String, String> book_list=new HashMap<String, String>();
					book_list.put("search_option", search_option);
					book_list.put("search_value", search_value);
					
					List<Map<String, Object>> booklist = libraryService.usersearchbook(book_list);
					mav.addObject("booklist", booklist);
					mav.addObject("booklistSize", booklist.size());
				} else if (main_search!= null && search_option == null && search_value == null) {
					System.out.println(main_search);
				}
				
				
			} else if (pageInfo.equals("apply")) {
				String userid = (String)session.getAttribute("user_id");
				
				String user_id = request.getParameter("user_id");
				String isbn = request.getParameter("isbn");
				String applyDate = request.getParameter("applyDate");
				String applyReason = request.getParameter("applyReason");
				String applyState = "신청중";
				String bookName = request.getParameter("bookName");
				
				String booklist = libraryService.applycnt(userid);
				mav.addObject("applycnt", booklist);
				
//				if(userid != null) {
//					
//				}else if(userid == null) {
//					System.out.println("asdasdasdas");
//					response.sendRedirect("/sign");
//				}
			
			  if(user_id != null && isbn != null && applyDate != null && applyReason !=
			  null && applyState != null) { Map<String, String> book_list=new
			  HashMap<String, String>();
			  book_list.put("userid", user_id);
			  book_list.put("isbn", isbn); 
			  book_list.put("applyDate", applyDate);
			  book_list.put("applyReason", applyReason); 
			  book_list.put("applyState",applyState);
			  book_list.put("bookName",bookName);
			  
			  libraryService.userapplybook(book_list);
			  
			  System.out.println("도서 신청 완료"); }
			  
			} 
		
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
	
	@RequestMapping(value="myLib_main")
	public ModelAndView declareMain(PageVO pageVo,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageInfo=(String)request.getParameter("page");
		System.out.println(pageInfo + "로 이동");
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageInfo", pageInfo);
		
		if (pageInfo != null) {
			if (pageInfo.equals("favor")) {

				
			} else if (pageInfo.equals("score")) {
				
			} else if (pageInfo.equals("declare")) {
				
			} else if (pageInfo.equals("status")) {
				HttpSession session=request.getSession();
				String user_id = (String) session.getAttribute("user_id");
				String bookNumber = request.getParameter("bookNumber");
				
				if (user_id != null && bookNumber == null) {
					int rentCount = libraryService.countrent(user_id);
					
					if (nowPage == null && cntPerPage == null) {
						nowPage = "1";
						cntPerPage = "10";
					} else if (nowPage == null) {
						nowPage = "1";
					} else if (cntPerPage == null) { 
						cntPerPage = "10";
					}
					
					pageVo = new PageVO(rentCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
					List<Map<String, Object>> booklist =libraryService.myLib_rentstatus(pageVo, user_id);
					List<Map<String, Object>> booklist1 =libraryService.myLib_applystatus(user_id); 
					mav.addObject("booklist1", booklist1); mav.addObject("booklistSize1", booklist1.size());
					
					mav.addObject("paging", pageVo);
					mav.addObject("booklist", booklist);
					mav.addObject("booklistSize", booklist.size());
					
				}   else if(user_id != null && bookNumber != null) {
					  
					 libraryService.updateB_BOOK_RENT(bookNumber); 
				}
				/*
				 * if (user_id != null && bookNumber == null) { List<Map<String, Object>>
				 * booklist = libraryService.myLib_rentstatus(user_id);
				 * 
				 * mav.addObject("booklist", booklist); mav.addObject("booklistSize",
				 * booklist.size());
				 * 
				 * List<Map<String, Object>> booklist1 =
				 * libraryService.myLib_applystatus(user_id); mav.addObject("booklist1",
				 * booklist1); mav.addObject("booklistSize1", booklist1.size());
				 * 
				 * } else if(user_id != null && bookNumber != null) {
				 * 
				 * libraryService.updateB_BOOK_RENT(bookNumber); }
				 */
			}else {
				
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
//				String search_option = request.getParameter("search_option");
//				String search_value = request.getParameter("search_value");
				String isbn = request.getParameter("isbn");
				String bookName = request.getParameter("bookName");
				String bookContents = request.getParameter("bookContents");
				String bookWriter = request.getParameter("bookWriter");
				String bookTrans = request.getParameter("bookTrans");
				String bookPublisher = request.getParameter("bookPublisher");
				String bookDate = request.getParameter("bookDate");
				String bookGenre = request.getParameter("bookGenre");
				String bookNumber1 = request.getParameter("bookNumber");
				String bookThum = request.getParameter("bookThum");
				String bookRent = request.getParameter("bookRent");
				String bookReservation1 = request.getParameter("bookReservation");
//				
//				
//				
//				
//				//도서 리스트
//				if(search_option == null && search_value == null && bookNumber == null && bookGenre == null && bookRent == null && bookReservation == null && isbn == null) {
//					List<Map<String, Object>> booklist = libraryService.adminlibrarylist();
//					
//					mav.addObject("booklist", booklist);
//					mav.addObject("booklistSize", booklist.size());
//				} 
//				//도서 검색
//				else if(search_option != null && search_value != null && bookNumber == null && bookGenre == null && bookRent == null && bookReservation == null && isbn == null) {
//					Map<String, String> book_list=new HashMap<String, String>();
//					book_list.put("search_option", search_option);
//					book_list.put("search_value", search_value);
//					
//					List<Map<String, Object>> booklist = libraryService.adminsearchbook(book_list);
//				
//					mav.addObject("booklist", booklist);
//					mav.addObject("booklistSize", booklist.size());
//				} 
//				//도서 삭제
//				else if(search_option == null && search_value == null && bookNumber != null && bookGenre == null && bookRent == null && bookReservation == null && isbn == null) {
//					Map<String, String> book_list=new HashMap<String, String>();
//					book_list.put("bookNumber", bookNumber);
//					
//					libraryService.librarydelete(book_list);
//					
//					List<Map<String, Object>> booklist = libraryService.adminlibrarylist();
//					
//					mav.addObject("booklist", booklist);
//					mav.addObject("booklistSize", booklist.size());
//				} 
//				//도서 수정
//				else if (search_option == null && search_value == null && bookNumber != null && bookGenre == null && bookRent != null && bookReservation != null && isbn == null) {
//					Map<String, String> book_list=new HashMap<String, String>();
//					book_list.put("bookNumber", bookNumber);
//					book_list.put("bookRent", bookRent);
//					book_list.put("bookReservation", bookReservation);
//					
//					libraryService.modifylibrary(book_list);
//				}
				//도서 등록
				if (bookNumber1 != null && bookGenre != null && bookRent != null && bookReservation1 != null && isbn != null) {

					Map<String, String> book_list=new HashMap<String, String>();
					book_list.put("isbn", isbn);
					book_list.put("bookName", bookName);
					book_list.put("bookContents", bookContents);
					book_list.put("bookWriter", bookWriter);
					book_list.put("bookTrans", bookTrans);
					book_list.put("bookPublisher", bookPublisher);
					book_list.put("bookDate", bookDate);
					book_list.put("bookGenre", bookGenre);
					book_list.put("bookNumber", bookNumber1);
					book_list.put("bookThum", bookThum);
					book_list.put("bookRent", bookRent);
					book_list.put("bookReservation", bookReservation1);
					
					libraryService.inputlibrary(book_list);
					
//					List<Map<String, Object>> booklist = libraryService.adminlibrarylist();
//					
//					mav.addObject("booklist", booklist);
//					mav.addObject("booklistSize", booklist.size());
				}
//				
			}  else if (pageInfo.equals("book_status_A")) {
				/*
				 * String search_option = request.getParameter("search_option"); String
				 * search_value = request.getParameter("search_value"); String search_option1 =
				 * request.getParameter("search_option1"); String search_value1 =
				 * request.getParameter("search_value1");
				 * 
				 * if(search_option == null && search_value == null && search_option1 == null &&
				 * search_value1 == null) { List<Map<String, Object>> booklist =
				 * libraryService.admin_bookstatus(); List<Map<String, Object>> booklist1 =
				 * libraryService.admin_applystatus(); mav.addObject("booklist", booklist);
				 * mav.addObject("booklistSize", booklist.size()); mav.addObject("booklist1",
				 * booklist1); mav.addObject("booklistSize1", booklist1.size());
				 * System.out.println("111111111111111111111111111"); }else if (search_option !=
				 * null && search_value != null && search_option1 == null && search_value1 ==
				 * null) { Map<String, String> book_list=new HashMap<String, String>();
				 * book_list.put("search_option", search_option); book_list.put("search_value",
				 * search_value);
				 * 
				 * List<Map<String, Object>> booklist =
				 * libraryService.adminrentstatus(book_list);
				 * 
				 * mav.addObject("booklist", booklist); mav.addObject("booklistSize",
				 * booklist.size()); }else if (search_option == null && search_value == null &&
				 * search_option1 != null && search_value1 != null) { Map<String, String>
				 * book_list=new HashMap<String, String>(); book_list.put("search_option1",
				 * search_option1); book_list.put("search_value1", search_value1);
				 * 
				 * List<Map<String, Object>> booklist =
				 * libraryService.adminapplystatus(book_list);
				 * 
				 * mav.addObject("booklist", booklist); mav.addObject("booklistSize",
				 * booklist.size()); }
				 */
			} else if (pageInfo.equals("com_A")) {
//				List<Map<String, Object>> comRequestList=comEstaService.comEstaRequestList(request);
//				mav.addObject("comRequestList", comRequestList);
//				mav.addObject("comRequestListSize", comRequestList.size());
				
			} else if (pageInfo.equals("dec_A")) {
//				int declareCount = myLibDeclareService.countDeclare(request);
//				
//				String nowPage=request.getParameter("nowPage");
//				String cntPerPage=request.getParameter("cntPerPage");
//				
//				if (nowPage == null && cntPerPage == null) {
//					nowPage = "1";
//					cntPerPage = "5";
//				} else if (nowPage == null) {
//					nowPage = "1";
//				} else if (cntPerPage == null) { 
//					cntPerPage = "5";
//				}
//				
//				PageVO pageVo=new PageVO();
//				
//				pageVo = new PageVO(declareCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
//				List<DeclareInfoVO> declareList=myLibDeclareService.declareList(pageVo, request);
//				
//				mav.addObject("paging", pageVo);
//				mav.addObject("decRequestList", declareList);
//				mav.addObject("decRequestListSize", declareList.size());
				
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
					int result1 = libraryService.userborrow(userid);
					int result2 = libraryService.insertbookrent(book_list);
					int result3 = libraryService.updatebooklib(book_list);
					
					System.out.println(result1);
					System.out.println(result2);
					System.out.println(result3);
					System.out.println("도서대출완료");
				}
			}else if (pageInfo.equals("return_A")) {
				System.out.println("111111111111");
				String bookReservation = request.getParameter("bookReservationn");
				String userid = request.getParameter("userid2");
				String bookNumber = request.getParameter("bookNumber2");
				String RreturnDate = request.getParameter("RreturnDate");
				String bookState = "반납완료";
				
				System.out.println(bookReservation);
				
				
				if(userid != null && bookNumber != null) {
					Map<String, String> book_list=new HashMap<String, String>();
					book_list.put("userid", userid);
					book_list.put("bookNumber", bookNumber);
					book_list.put("RreturnDate", RreturnDate);
					book_list.put("bookState", bookState);
					
					int result1 = libraryService.userrent(userid);
					int result2 = libraryService.updatebookrent(book_list);
					int result3 = libraryService.updatebooklibreturn(book_list);
					
					System.out.println(result1);
					System.out.println(result2);
					System.out.println(result3);
				}
			}
		} else {
			
		}
		
		//mav.setViewName("admin/admin_main");
		mav.setViewName("admin/ibsheet_basic");
		return mav;
	}
	
	
	
	//ibsheet 내부 기능 
	
}
