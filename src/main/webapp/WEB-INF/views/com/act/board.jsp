<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/css/animate.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/css/flatpickr.min.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/css/line-awesome.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/css/line-awesome-font-awesome.min.css">
	<link href="${contextPath}/resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/lib/slick/slick.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/lib/slick/slick-theme.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/css/style.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/css/responsive.css">
</head>

	<%
		session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		String user_position=(String)session.getAttribute("user_position");
	%>
	
<script type="text/javascript">
	
	function articleWrite() {
		location.href="com_article_write.do?community_id=${comInfo.get('COMMUNITY_ID')}&board_id=${boardInfo.get('BOARD_ID') }";
	}
	
	function voteWrite() {
		location.href="com_vote_write.do?community_id=${comInfo.get('COMMUNITY_ID')}&board_id=${boardInfo.get('BOARD_ID') }";
	}
	
	function voteAdmin() {
		location.href="com_vote_admin_form.do?community_id=${comInfo.get('COMMUNITY_ID')}&board_id=${boardInfo.get('BOARD_ID') }";
	}
	
	function voteRequest() {
		var newWin=window.open("com_vote_request_form.do?community_id=${comInfo.get('COMMUNITY_ID')}&board_id=${boardInfo.get('BOARD_ID') }", "투표주제신청", "width=500, height=500");
	}
	
	function voteReqAdmin() {
		var newWin=window.open("vote_request_list.do?community_id=${comInfo.get('COMMUNITY_ID')}&board_id=${boardInfo.get('BOARD_ID') }", "투표주제신청내역", "width=500, height=500");
	}

	
</script>

<body>	

	<div class="wrapper">	

	<!-- header -->
	<jsp:include page="../../header.jsp"></jsp:include>

		<main>
			<div class="main-section">
				<div class="container">
					<div class="main-section-data">
						<div class="row">
							<div class="col-lg-3 col-md-4 pd-left-none no-pd">
								<div class="main-left-sidebar no-margin">
									<div class="user-data full-width">

										<ul class="user-fw-status">
											<li>
												<h4>커뮤니티 정보</h4>
													운영자 ${comInfo.get("COMMUNITY_CAPTAIN")} <br>
													개설날짜 ${comInfo.get("COMMUNITY_ESTABLISH_DATE")} <br>
													총 회원수 ${memCnt} <br>
													<span><a href="com_detail.do?community_id=${comInfo.get('COMMUNITY_ID') }">커뮤니티 상세보기</a></span>
											</li>
											<li>
											<c:choose>
												<c:when test="${memChk eq 'x' }">
													<h4><a onclick="window.open('com_act_mem_form.do?community_id=${comInfo.get('COMMUNITY_ID') }', '가입 신청', 'width=500, height=600')">가입하기</a></h4>
												</c:when>
												<c:when test="${memChk eq 'o' }">
													<h4><a onclick="commOut()">탈퇴하기</a></h4>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${memAuth eq 'cap'}">
													<h4><a href="com_mem_list.do?community_id=${comInfo.get('COMMUNITY_ID') }">커뮤니티 멤버</a></h4>
													<h4><a href="com_board.do?community_id=${comInfo.get('COMMUNITY_ID') }">게시판 관리</a></h4>
												</c:when>
											</c:choose>
											</li>
										</ul>
									</div><!--user-data end-->
									<div class="suggestions full-width">
										<div class="sd-title">
											<h3 style="text-align:center; padding-bottom:10px">게시판목록</h3>
											<div id="board_list"></div>
										</div><!--sd-title end-->

									</div><!--suggestions end-->
								</div><!--main-left-sidebar end-->
							</div>
							<div class="col-lg-9 col-md-8 no-pd">
								<div class="main-ws-sec">
									<div class="post-topbar">
										<a href="com_act_home.do?community_id=${comInfo.get('COMMUNITY_ID') }"><h1 style="font-size:50px">${comInfo.get("COMMUNITY_NAME")}</h1></a>
										${boardInfo.get("BOARD_NAME") }
										
										<c:choose>
											<c:when test="${memChk eq'o' && memAuth eq 'cap' && boardInfo.get('BOARD_CATEGORY') eq 'BD001'}">
												<input type="button" value="투표등록" onclick="voteWrite()">
												<input type="button" value="투표관리" onclick="voteAdmin()">
												<input type="button" value="신청내역" onclick="voteReqAdmin()">
											</c:when>
											<c:when test="${memChk eq'o' && memAuth eq 'cap' && boardInfo.get('BOARD_CATEGORY') eq 'BD000'}">
												<input type="button" value="글쓰기" onclick="articleWrite()">
											</c:when>
											<c:when test="${memChk eq'o' && memAuth eq 'mem' && boardInfo.get('BOARD_CATEGORY') eq 'BD001'}">
												<input type="button" value="투표신청" onclick="voteRequest()">
											</c:when>
											<c:when test="${memChk eq'o' && memAuth eq 'mem' && boardInfo.get('BOARD_CATEGORY') eq 'BD000'}">
												<input type="button" value="글쓰기" onclick="articleWrite()">
											</c:when>
										</c:choose>
										
									</div><!--post-topbar end-->
									
									
									<div class="posts-section">
				                    	<div class="col-12">
				                    	<c:choose>
											<c:when test="${articleListSize <= 0}">
												<h3>결과가 존재하지 않습니다</h3>
												<a onclick="history.back();" >뒤로가기</a>
											</c:when>
											<c:otherwise>
												<div class="freelancerbiding">
					                        	<c:choose>
					                        		<c:when test="${boardInfo.get('BOARD_CATEGORY') eq 'BD000'}">
					                        		
															<form action="article_search.do" method="post">
																<select name="search_option">
																    <option value="">조건</option>
																    <option value="article_title">제목</option>
																    <option value="article_writer">작성자</option>
																    <option value="article_content">내용</option>
																</select>
																<input type="text" name="search_keyword" placeholder="게시판 내 검색">
																<input type="hidden" name="community_id" value="${comInfo.get('COMMUNITY_ID') }">
																<input type="hidden" name="board_id" value="${boardInfo.get('BOARD_ID') }">
																<button type="submit">검색</button>
															</form>
					                        			
							                      		<div class="row">
							                                <div class="col-md-1 col-sm-1">
							                                    <h6>글번호</h6>
							                                </div>
							                                <div class="col-md-4 col-sm-4">
							                                	<h6>글제목</h6>
							                                </div>
							                                <div class="col-md-2 col-sm-2">
							                                    <h6>작성자</h6>
							                                </div>
							                                <div class="col-md-2 col-sm-2">
							                                	<h6>날짜</h6>
							                                </div>
							                                <div class="col-md-1 col-sm-1">
							                                    <h6>조회수</h6>
							                                </div>
							                                <div class="col-md-1 col-sm-1">
							                                	<h6>좋아요</h6>
							                                </div>
							                                <div class="col-md-1 col-sm-1">
							                                	<h6>싫어요</h6>
							                                </div>
							                            </div>
					                            
							                            <c:forEach var="i" begin="1" end="${articleListSize}">
							                            <hr>
							                            <div class="row">
							                                <div class="col-md-1 col-sm-1">
							                                    <h6>${articleList.get(i-1).getArticle_id()}</h6>
							                                </div>
							                                <div class="col-md-4 col-sm-4">
							                                	<h6><a href="com_article.do?article_id=${articleList.get(i-1).getArticle_id()}&board_id=${boardInfo.get('BOARD_ID') }&community_id=${comInfo.get('COMMUNITY_ID')}">${articleList.get(i-1).getArticle_title()}</a></h6>
							                                </div>
							                                <div class="col-md-2 col-sm-2">
							                                    <h6>${articleList.get(i-1).getArticle_writer()}</h6>
							                                </div>
							                                <div class="col-md-2 col-sm-2">
							                                	<h6>${articleList.get(i-1).getArticle_date()}</h6>
							                                </div>
							                                <div class="col-md-1 col-sm-1">
							                                    <h6>${articleList.get(i-1).getArticle_view_count()}</h6>
							                                </div>
							                                <div class="col-md-1 col-sm-1">
							                                	<h6>${articleList.get(i-1).getArticle_good_count()}</h6>
							                                </div>
							                                <div class="col-md-1 col-sm-1">
							                                	<h6>${articleList.get(i-1).getArticle_bad_count()}</h6>
							                                </div>
							                            </div>
							                            </c:forEach>
							                            
							                          	<hr>
							                          	
											            <nav aria-label="Page navigation example" class="full-pagi">
															<ul class="pagination">
																<c:if test="${paging.startPage != 1 }">
																	<li class="page-item"><a a class="page-link pvr" href="/com_act_board.do?board_id=${boardInfo.get('BOARD_ID') }&community_id=${comInfo.get('COMMUNITY_ID') }&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">Previous</a></li>
																</c:if>	
																
																<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
																	<c:choose>
																		<c:when test="${p == paging.nowPage }">
																			<li class="page-item"><a class="page-link active">${p }</a></li>
																		</c:when>
																		<c:when test="${p != paging.nowPage }">
																			<li class="page-item"><a class="page-link" href="/com_act_board.do?board_id=${boardInfo.get('BOARD_ID') }&community_id=${comInfo.get('COMMUNITY_ID') }&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
																		</c:when>
																	</c:choose>
																</c:forEach>
																
																<c:if test="${paging.endPage != paging.lastPage}">
																	<li class="page-item"><a class="page-link pvr" href="/com_act_board.do?board_id=${boardInfo.get('BOARD_ID') }&community_id=${comInfo.get('COMMUNITY_ID') }&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">Next</a></li>
																</c:if>
															</ul>
														</nav>
														
					                        		</c:when>
					                        		
					                        		<c:when test="${boardInfo.get('BOARD_CATEGORY') eq 'BD001'}">
					                        			<c:choose>
															<c:when test="${voteIngChk eq 'o' }">
																<div class="bids-detail">
																	<div class="row">
																		<h1>진행중 투표</h1>
									                                    <div class="col-12 appliedjob">
																			<h2><a href="ing_vote_form.do?vote_id=${ingVote.get('VOTE_ID') }&board_id=${boardInfo.get('BOARD_ID') }&community_id=${comInfo.get('COMMUNITY_ID')}">${ingVote.get('VOTE_TITLE') }</a></h2>			
									                                        <div class="bids-time">
									                                           <h3>${ingVote.get('VOTE_START') } ~ ${ingVote.get('VOTE_END') }</h3>
									                                        </div>
									                                    </div>
									                                 </div>
								                                </div>
															</c:when>
					                        			</c:choose>
					                        		
														<div class="row">
							                                <div class="col-md-2 col-sm-2">
							                                    <h6>번호</h6>
							                                </div>
							                                <div class="col-md-10 col-sm-10">
							                                	<h6>주제</h6>
							                                </div>
							                            </div>	
							                            
							                            <c:forEach var="i" begin="1" end="${voteListSize}">
							                            <hr>
							                            <div class="row">
							                                <div class="col-md-2 col-sm-2">
							                                    <h6>${voteList.get(i-1).getVote_id()}</h6>
							                                </div>
							                                <div class="col-md-10 col-sm-10">
							                                	<h6><a href="com_vote.do?vote_id=${voteList.get(i-1).getVote_id()}&board_id=${boardInfo.get('BOARD_ID') }&community_id=${comInfo.get('COMMUNITY_ID')}">${voteList.get(i-1).getVote_title()}</a></h6>
	
							                                </div>
							                            </div>
							                            </c:forEach>
							                            
							                            <hr>
							                          	
											            <nav aria-label="Page navigation example" class="full-pagi">
															<ul class="pagination">
																<c:if test="${paging.startPage != 1 }">
																	<li class="page-item"><a a class="page-link pvr" href="/com_act_board.do?board_id=${boardInfo.get('BOARD_ID') }&community_id=${comInfo.get('COMMUNITY_ID') }&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">Previous</a></li>
																</c:if>	
																
																<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
																	<c:choose>
																		<c:when test="${p == paging.nowPage }">
																			<li class="page-item"><a class="page-link active">${p }</a></li>
																		</c:when>
																		<c:when test="${p != paging.nowPage }">
																			<li class="page-item"><a class="page-link" href="/com_act_board.do?board_id=${boardInfo.get('BOARD_ID') }&community_id=${comInfo.get('COMMUNITY_ID') }&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
																		</c:when>
																	</c:choose>
																</c:forEach>
																
																<c:if test="${paging.endPage != paging.lastPage}">
																	<li class="page-item"><a class="page-link pvr" href="/com_act_board.do?board_id=${boardInfo.get('BOARD_ID') }&community_id=${comInfo.get('COMMUNITY_ID') }&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">Next</a></li>
																</c:if>
															</ul>
															
														</nav>
														
					                        		</c:when>
					                        	</c:choose>
					                        	
	
					                        </div>
											</c:otherwise>
										</c:choose>
				                    	
				                    	
				                        
				                    	</div>
									</div><!--posts-section end-->
								</div><!--main-ws-sec end-->
							</div>

						</div>
					</div><!-- main-section-data end-->
				</div> 
			</div>
		</main>

	<!-- footer -->
	<jsp:include page="../../footer.jsp"></jsp:include>

	</div><!--theme-layout end-->
	
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
	var community_id=${comInfo.get("COMMUNITY_ID")};
	$(document).ready(function() {
		$.ajax({
			url:"board_list.do",
			contentType: 'application/json; charset=utf-8',
			data:{"community_id" : community_id},
			method:"GET",
			success:function(data) {
				console.log(data[0].BOARD_NAME);
				console.log(data[0].COMMUNITY_ID);
				console.log(data[0].BOARD_ID);
				
				for (var i=0; i<data.length; i++) {
					
					$("#board_list").append("<li style=\"list-style:none; padding-top:10px\"><a href='com_act_board.do?board_id="+data[i].BOARD_ID+"&community_id="+data[i].COMMUNITY_ID+"'>"+data[i].BOARD_NAME+"</a></li>");
					
				}

			}
			
		})
	})
	</script>


<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/popper.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/flatpickr.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/lib/slick/slick.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/script.js"></script>

</body>
</html>