<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>신고 내역</title>
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

<body>

	<%
		session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		String user_position=(String)session.getAttribute("user_position");
	%>

<body>
	
		<main>
			<div class="main-section">
				<div class="container">
					<div class="main-section-data">
						<div class="row">
							<div class="col-lg-12 col-md-12 no-pd">
								<div class="main-ws-sec">

									<div class="posts-section">
				                    	<div class="col-12">
				                        <div class="freelancerbiding">
				                            <div class="row">
				                                <div class="col-md-1 col-sm-1">
				                                    <h6>번호</h6>
				                                </div>
				                                <div class="col-md-1 col-sm-1">
				                                	<h6>날짜</h6>
				                                </div>
				                                <div class="col-md-2 col-sm-2">
				                                    <h6>신고자</h6>
				                                </div>
				                                <div class="col-md-2 col-sm-2">
				                                	<h6>피신고자</h6>
				                                </div>
				                                <div class="col-md-1 col-sm-1">
				                                    <h6>분류</h6>
				                                </div>
				                                <div class="col-md-1 col-sm-1">
				                                	<h6>이유</h6>
				                                </div>
				                                <div class="col-md-1 col-sm-1">
				                                	<h6>첨부</h6>
				                                </div>
				                                <div class="col-md-2 col-sm-2">
				                                	<h6>상태</h6>
				                                </div>
				                                <div class="col-md-1 col-sm-1">
				                                	
				                                </div>
				                            </div>
				                            
				                            <c:forEach var="i" begin="1" end="${decRequestListSize}">
				                            <hr>
				                            <div class="row">
				                                <div class="col-md-1 col-sm-1">
				                                    <h6>${i }</h6>
				                                </div>
				                                <div class="col-md-1 col-sm-1">
				                                	<h6>${decRequestList.get(i-1).getDeclare_date() }</h6>
				                                </div>
				                                <div class="col-md-2 col-sm-2">
				                                    <h6>${decRequestList.get(i-1).getDo_user() }</h6>
				                                </div>
				                                <div class="col-md-2 col-sm-2">
				                                	<h6>${decRequestList.get(i-1).getBe_done_user() }</h6>
				                                </div>
				                                <div class="col-md-1 col-sm-1">
				                                    <h6>${decRequestList.get(i-1).getDeclare_category() }</h6>
				                                </div>
				                                <div class="col-md-1 col-sm-1">
				                                	<h6>${decRequestList.get(i-1).getDeclare_reason() }</h6>
				                                </div>
				                                <div class="col-md-1 col-sm-1">
				                                	<h6><img alt="첨부" width="100" height="100" src="${contextPath }/declareImage.do?declare_id=${decRequestList.get(i-1).getDeclare_id() }"></h6>
				                                </div>
				                                <div class="col-md-2 col-sm-2">
				                                	<h6>${decRequestList.get(i-1).getDeclare_status() }</h6>
				                                </div>
				                                <div class="col-md-1 col-sm-1">
					                                <input type="hidden" name="index" value="${i}">
													<input type="hidden" name="declare_id" value='${decRequestList.get(i-1).getDeclare_id() }'>										
													<input type="button" value="처리" onclick="decStsAdmin('${i}')">
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
				                        </div>
				                    	</div>
									</div><!--posts-section end-->
								</div><!--main-ws-sec end-->
							</div>

						</div>
					</div><!-- main-section-data end-->
				</div> 
			</div>
		</main>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
		
		var indexList=new Array();
		var idList=new Array();
	
		//결과선택
		$(document).ready(function() {
			
			//index 배열
			$("input[name=index]").each(function(index, item) {
				indexList.push($(item).val());
			});

			
			//declare_id 배열
			$("input[name=declare_id]").each(function(index, item) {
				idList.push($(item).val());
			});
			
		});
		
		function decStsAdmin(i) {
			alert(i);
			alert(idList[i-1]);
			var declare_id=idList[i-1];
			window.open("mylib_declare_admin_form.do?declare_id="+declare_id, "신고 처리", "width=500, height=500");
		}

	</script>
	
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/popper.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/flatpickr.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/lib/slick/slick.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/script.js"></script>

</body>
</html>