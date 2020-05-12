package org.team.bpg.admin.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.team.bpg.book.VO.BookInfoVO;
import org.team.bpg.book.service.LibraryService;
import org.team.bpg.com.act.service.ComActService;
import org.team.bpg.com.act.vo.ArticleInfoVO;
import org.team.bpg.com.esta.service.ComEstaService;
import org.team.bpg.com.esta.vo.ComInfoVO;
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
	private ComActService comActService;
	
	@Autowired
	private LibraryService libraryService;
	
	@GetMapping(value="errors")
	public String defaultError() {
		return "errors";
	}

	//도서메뉴 첫 화면 보여주기
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
	               mav.setViewName("book/book_main");
	            } else if(search_option != null && search_value != null && main_search == null){      
	               Map<String, String> book_list=new HashMap<String, String>();
	               book_list.put("search_option", search_option);
	               book_list.put("search_value", search_value);
	               
	               int search_1 = libraryService.search_1(book_list);
	               
	               if (nowPage == null && cntPerPage == null) {
	                  nowPage = "1";
	                  cntPerPage = "10";
	               } else if (nowPage == null) {
	                  nowPage = "1";
	               } else if (cntPerPage == null) { 
	                  cntPerPage = "10";
	               }
	               
	               pageVo = new PageVO(search_1, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	               List<Map<String, Object>> booklist = libraryService.usersearchbook(pageVo, search_option, search_value);
	               
	               mav.addObject("paging", pageVo);
	               mav.addObject("booklist", booklist);
	               mav.addObject("booklistSize", booklist.size());
	               mav.setViewName("book/book_main");
	            } else if (main_search!= null && search_option == null && search_value == null) {
	               int search_2 = libraryService.search_2(main_search);
	               
	               if (nowPage == null && cntPerPage == null) {
	                  nowPage = "1";
	                  cntPerPage = "10";
	               } else if (nowPage == null) {
	                  nowPage = "1";
	               } else if (cntPerPage == null) { 
	                  cntPerPage = "10";
	               }
	               
	               pageVo = new PageVO(search_2, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	               List<Map<String, Object>> booklist = libraryService.search2_list(pageVo, main_search);
	               
	               mav.addObject("paging", pageVo);
	               mav.addObject("booklist", booklist);
	               mav.addObject("booklistSize", booklist.size());
	               mav.setViewName("book/book_main");
	            }
	            
	            
	         } else if (pageInfo.equals("apply")) {
	            String userid = (String)session.getAttribute("user_id");
	            
	            
	            String user_id = request.getParameter("user_id");
	            String isbn = request.getParameter("isbn");
	            String applyDate = request.getParameter("applyDate");
	            String applyReason = request.getParameter("applyReason");
	            String applyState = "신청중";
	            String bookName = request.getParameter("bookName");
	            
	            
	            
	            if(userid != null) {
	               String booklist = libraryService.applycnt(userid);
	               mav.addObject("applycnt", booklist);

	               mav.setViewName("book/book_main");
	            }else if(userid == null) {
	               System.out.println("asdasdasdas");
	               response.sendRedirect("/sign");
	            }
	         
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

	         mav.setViewName("book/book_main");
	         } 
	      
	      }
	      return mav;
	   }
	
	
	//커뮤니티메뉴 첫 화면 보여주기
	@RequestMapping(value="com_main", method=RequestMethod.GET)
	public ModelAndView comMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<ComInfoVO> myComLists=comActService.myComList(request);
		
		List<ComInfoVO> bestComList=comActService.bestComList();
		
		System.out.println("멤버수 순위"+bestComList);
		
		List<List<ArticleInfoVO>> newArticleList=new ArrayList<>();
		
		/*
		 * for(int i=0; i<myComList.size(); i++) { int
		 * community_id=myComList.get(i).getCommunity_id(); List<ArticleInfoVO>
		 * newArticle=comActService.newArticle(community_id);
		 * newArticleList.add(newArticle); System.out.println("새글5개"+newArticle); }
		 * 
		 * System.out.println("새글들 목록" + newArticleList);
		 */
		
		
		//추천 커뮤니티
		List<Map<String, Object>> comRandomList=comActService.comRandomList();
		System.out.println("랜덤 커뮤니티정보" + comRandomList);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("myComLists", myComLists);
		mav.addObject("myComListsSize", myComLists.size());
		mav.addObject("comRandomList", comRandomList);
		mav.addObject("comRandomListSize", comRandomList.size());
		
//		System.out.println(myComLists.get(0).getCommunity_name());
//		myComLists.get(1).getCommunity_name();
		
		mav.addObject("newArticleList", newArticleList);
		mav.addObject("newArticleListSize", newArticleList.size());
		
		mav.addObject("bestComList", bestComList);
		mav.addObject("bestComListSize", bestComList.size());
		
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
				System.out.println("취향분석합니다");
				HttpSession session=request.getSession();
				String user_id = (String) session.getAttribute("user_id");
				List<BookInfoVO> scoreList=libraryService.myLib_rentstatus_favor(user_id);
				
				String[] cateScore= {" ", " "};
				int B000Score=0;
				int B001Score=0;
				int B002Score=0;
				int B003Score=0;
				int B004Score=0;
				int B005Score=0;
				int B006Score=0;
				int B007Score=0;
				int B008Score=0;
				int B009Score=0;
				
				int B000Cnt=0;
				int B001Cnt=0;
				int B002Cnt=0;
				int B003Cnt=0;
				int B004Cnt=0;
				int B005Cnt=0;
				int B006Cnt=0;
				int B007Cnt=0;
				int B008Cnt=0;
				int B009Cnt=0;
				
				System.out.println("취향분석할 첵 목록"+scoreList);
				
				for(int i=0; i<scoreList.size(); i++) {
					int score=scoreList.get(i).getBookScore();
					String genre=(String) scoreList.get(i).getBookGenre();
					
					System.out.println("장르이름 : " + genre);
					
					switch(genre) {
					case "총류":
						B000Score+=score;
						B000Cnt+=1;
						
					case "철학":
						B001Score+=score;
						B001Cnt+=1;
						
					case "종교":
						B002Score+=score;
						B002Cnt+=1;
						
					case "사회과학":
						B003Score+=score;
						B003Cnt+=1;
						
					case "자연과학":
						B004Score+=score;
						B004Cnt+=1;
						
					case "기술과학":
						B005Score+=score;
						B005Cnt+=1;
						
					case "예술":
						B006Score+=score;
						B006Cnt+=1;
						
					case "언어":
						B007Score+=score;
						B007Cnt+=1;
						
					case "문학":
						B008Score+=score;
						B008Cnt+=1;
						
					case "역사":
						B009Score+=score;
						B009Cnt+=1;
					}
					
				}
				
				System.out.println("종류총점" + B000Score);
				System.out.println("총류갯수" + B000Cnt);
				System.out.println("종교총점" + B001Score);
				System.out.println("종교갯수" + B001Cnt);
				System.out.println("철학총점" + B002Score);
				System.out.println("철학갯수" + B002Cnt);
				System.out.println("사회과학총점" + B003Score);
				System.out.println("사회과학갯수" + B003Cnt);
				System.out.println("자연과학총점" + B004Score);
				System.out.println("자연과학갯수" + B004Cnt);
				System.out.println("기술과학총점" + B005Score);
				System.out.println("기술과학갯수" + B005Cnt);
				
				System.out.println("예술총점" + B006Score);
				System.out.println("예술갯수" + B006Cnt);
				System.out.println("언어총점" + B007Score);
				System.out.println("언어갯수" + B007Cnt);
				System.out.println("문학총점" + B008Score);
				System.out.println("문학갯수" + B008Cnt);
				System.out.println("역사총점" + B009Score);
				System.out.println("역사갯수" + B009Cnt);
				
				//각 종류별 평균
				float B000Avg=0;
				float B001Avg=0;
				float B002Avg=0;
				float B003Avg=0;
				float B004Avg=0;
				float B005Avg=0;
				float B006Avg=0;
				float B007Avg=0;
				float B008Avg=0;
				float B009Avg=0;
				
				if (B000Cnt==0) {
					B000Avg=0;
				} else {
					B000Avg=(float)B000Score/B000Cnt;
				}
				if (B001Cnt==0) {
					B001Avg=0;
				} else {
					B001Avg=(float)B001Score/B001Cnt;
				}
				if (B002Cnt==0) {
					B002Avg=0;
				} else {
					B002Avg=(float)B002Score/B002Cnt;
				}
				if (B003Cnt==0) {
					B003Avg=0;
				} else {
					B003Avg=(float)B003Score/B003Cnt;
				}
				if (B004Cnt==0) {
					B004Avg=0;
				} else {
					B004Avg=(float)B004Score/B004Cnt;
				}
				if (B005Cnt==0) {
					B005Avg=0;
				} else {
					B005Avg=(float)B005Score/B005Cnt;
				}
				if (B006Cnt==0) {
					B006Avg=0;
				} else {
					B006Avg=(float)B006Score/B006Cnt;
				}
				if (B007Cnt==0) {
					B007Avg=0;
				} else {
					B007Avg=(float)B007Score/B007Cnt;
				}
				if (B008Cnt==0) {
					B008Avg=0;
				} else {
					B008Avg=(float)B008Score/B008Cnt;
				}
				if (B009Cnt==0) {
					B009Avg=0;
				} else {
					B009Avg=(float)B009Score/B009Cnt;
				}
				
				System.out.println("총류평균" + B000Avg);
				System.out.println("철학평균" + B001Avg);
				System.out.println("종교평균" + B002Avg);
				System.out.println("사회과학평균" + B003Avg);
				System.out.println("자연과학평균" + B004Avg);
				System.out.println("기술과학평균" + B005Avg);
				System.out.println("예술평균" + B006Avg);
				System.out.println("언어평균" + B007Avg);
				System.out.println("문학평균" + B008Avg);
				System.out.println("역사평균" + B009Avg);
				
				//취향분석을 위해 각 카테고리별 점수 저장
				String[] cateNames= {"총류","철학","종교","사회과학","자연과학","기술과학","예술","언어","문학","역사"};
				float[] cateArray= {B000Avg, B001Avg, B002Avg, B003Avg, B004Avg, B005Avg, B006Avg, B007Avg, B008Avg, B009Avg};
				
				float max=cateArray[0];
				int maxCateName=0;
				for (int i=1; i<cateArray.length; i++) {
					if (cateArray[i]>=max) {
						max=cateArray[i];
						maxCateName=i;
					}
				}
				
				System.out.println("최댓값"+max);
				System.out.println("최댓값카테고리"+maxCateName);
				System.out.println("최댓값카테고리이름"+cateNames[maxCateName]);
				
				System.out.println("점수 있는 책 리스트" + scoreList);
				
				//카테고리에 맞는 책 추천
				List<Map<String, Object>> recomList=libraryService.recomList(cateNames[maxCateName]);
				System.out.println("추천도서" + recomList);
				
				mav.addObject("favorite", cateNames[maxCateName]);
				mav.addObject("recomList", recomList);
				mav.addObject("recomListSize", recomList.size());
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
			mav.addObject("pageInfo", "score");
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