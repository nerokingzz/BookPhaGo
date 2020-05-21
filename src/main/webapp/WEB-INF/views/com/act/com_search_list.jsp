<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"  />

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	
	<!-- style by template -->
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
	
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
  	
	<!-- font -->
	<link href="https://fonts.googleapis.com/css2?family=Bowlby+One+SC&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
  	
  	<!-- session 로그인 정보 -->
	<%
		session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		String user_position=(String)session.getAttribute("user_position");
	%>
	
<style>
  *{margin:0;padding:0;}
  ul,li{list-style:none;}
  #slide{height:300px;position:relative;overflow:hidden;}
  #slide ul{width:400%;height:100%;transition:1s;}
  #slide ul:after{content:"";display:block;clear:both;}
  #slide li{float:left;width:25%;height:100%;}
  #slide li:nth-child(1){background:#faa;}
  #slide li:nth-child(2){background:#ffa;}
  #slide li:nth-child(3){background:#faF;}
  #slide li:nth-child(4){background:#aaf;}
  #slide input{display:none;}
  #slide label{display:inline-block;vertical-align:middle;width:10px;height:10px;border:2px solid #666;background:#fff;transition:0.3s;border-radius:50%;cursor:pointer;}
  #slide .pos{text-align:center;position:absolute;bottom:10px;left:0;width:100%;text-align:center;}
  #pos1:checked~ul{margin-left:0%;}
  #pos2:checked~ul{margin-left:-100%;}
  #pos3:checked~ul{margin-left:-200%;}
  #pos4:checked~ul{margin-left:-300%;}
  #pos1:checked~.pos>label:nth-child(1){background:#666;}
  #pos2:checked~.pos>label:nth-child(2){background:#666;}
  #pos3:checked~.pos>label:nth-child(3){background:#666;}
  #pos4:checked~.pos>label:nth-child(4){background:#666;}
  main{
 	padding-top : 20px; 
  }
  div.filter-secs{
  	padding-top: 50px;
    margin: 0 15px;
    padding-bottom: 20px;
    width: 97%;
  }
  .react-links {
	   float: right;
	    width: 30%;
	    display: inline;
	    font-size: 13px;
	}
	
	.usr_quest > h3 {
    color: #000000;
    font-size: 17px;
    font-weight: 600;
    margin-bottom: 20px;
    width: 50%;
    display: inline;
}
	
	.usr_quest {
	    float: none;
	    width: 100%;
	    padding-left: 7%;
	}
	
	
	
	.usr_quest > h3 {
	    color: #000000;
	    font-size: 17px;
	    font-weight: 600;
	    margin-bottom: 20px;
	    width: 50%;
	    display: inline;
	    font-size: 25px;
	}
	
	.quest-tags {
	    float: left;
	    width: 100%;
	    margin-top: 12px;
	}
</style>
	
</head>

<body>
	
	<!-- header -->
	<jsp:include page="../../header.jsp"></jsp:include>
		
	<div class="main-section">
		<div class="container">
			<div class="main-section-data">
			
				<!-- <div style="padding-top:40px;" id="slide">
				  <input type="radio" name="pos" id="pos1" checked>
				  <input type="radio" name="pos" id="pos2">
				  <input type="radio" name="pos" id="pos3">
				  <input type="radio" name="pos" id="pos4">
				  <ul>
				    <li></li>
				    <li></li>
				    <li></li>
				    <li></li>
				  </ul>
				  <p class="pos">
				    <label for="pos1"></label>
				    <label for="pos2"></label>
				    <label for="pos3"></label>
				    <label for="pos4"></label>
				  </p>
				</div>  -->
			
				<div class="row">
					<div class="col-lg-9" style="padding-top: 0px">
						<div class="search-sec">
							<div class="container">
								<div class="search-box" style="padding:0px">
									<form action="community_search.do" method="get">
										<input required type="text" name="search_keyword" placeholder="커뮤니티 검색" style="margin-left : -15px">
										<button type="submit" style="margin-right: -15px;">검색</button>
									</form>
								</div><!--search-box end-->
							</div>
						</div><!--search-sec end-->
					</div>
					
				</div>
			</div>
		</div>			
	</div>	

	<main>
		<div class="main-section">
			<div class="container">
				<div class="main-section-data">
					<div style="padding-top:30px;" class="filter-secs">
						<h1 style="text-align:center; font-size:38px; font-weight:bold; font-family:'Nanum Gothic', sans-serif;">검색 결과</h1>
						
						<c:choose>
							<c:when test="${comSearchListSize > 0}">
								<c:forEach var="i" begin="1" end="${comSearchListSize}">
				                	<div class="forum-questions">
				                     	<div class="usr-question">
				                           	<div style="padding-top:20px" class="usr_quest">
				                            	<h3 style="font-size:23px"><a href="com_act_home.do?community_id=${comSearchList.get(i-1).get('COMMUNITY_ID')}">${comSearchList.get(i-1).get("COMMUNITY_NAME") }</a></h3>
				                              	<ul class="react-links">
				                                 	<li><i class="fas fa-grip-vertical"></i><span style="padding-left:10px">${comSearchList.get(i-1).get("COMMUNITY_CATEGORY") }</span></li>	                              		
				                                 	<li><i class="fas fa-users"></i><span style="padding-left:10px">${comSearchList.get(i-1).get("COMMUNITY_MEMBER_COUNT") }</span></li>
				                                 	<li><i class="fas fa-calendar-alt"></i><span style="padding-left:10px">${comSearchList.get(i-1).get("COMMUNITY_ESTABLISH_DATE") }</span></li>
				                              	</ul>
				                              	<ul class="quest-tags">
				                                 	<span>${comSearchList.get(i-1).get("COMMUNITY_DESCRIPTION") }</span>
				                              	</ul>
				                           	</div><!--usr_quest end-->
				                        </div><!--usr-question end-->
									</div>
								</c:forEach>
								<nav aria-label="Page navigation example" class="full-pagi" style="padding-left:0;display: table;text-align: center;">
									<ul style="display: table; margin-left: auto; margin-right: auto;"
										class="pagination">
										<c:if test="${paging.startPage != 1 }">
											<li class="page-item"><a a class="page-link pvr"
												href="/com_act_board.do?board_id=${boardInfo.get('BOARD_ID') }&community_id=${comInfo.get('COMMUNITY_ID') }&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">Previous</a></li>
										</c:if>

										<c:forEach begin="${paging.startPage }"
											end="${paging.endPage }" var="p">
											<c:choose>
												<c:when test="${p == paging.nowPage }">
													<li class="page-item"><a class="page-link active">${p }</a></li>
												</c:when>
												<c:when test="${p != paging.nowPage }">
													<li class="page-item"><a class="page-link"
														href="/com_act_board.do?board_id=${boardInfo.get('BOARD_ID') }&community_id=${comInfo.get('COMMUNITY_ID') }&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
												</c:when>
											</c:choose>
										</c:forEach>

										<c:if test="${paging.endPage != paging.lastPage}">
											<li class="page-item"><a class="page-link pvr"
												href="/com_act_board.do?board_id=${boardInfo.get('BOARD_ID') }&community_id=${comInfo.get('COMMUNITY_ID') }&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">Next</a></li>
										</c:if>
									</ul>
								</nav>
							</c:when>
							<c:otherwise>
								<hr>
								<h2 style="padding-bottom:20px; text-align:center">검색 결과가 없습니다.</h2>
							</c:otherwise>
						</c:choose>
					</div>
				</div><!-- main-section-data end-->
			</div> 
		</div>
	</main>

	<!-- footer -->
	<jsp:include page="../../footer.jsp"></jsp:include>

	<!-- js by template -->
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/popper.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/flatpickr.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/lib/slick/slick.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/script.js"></script>
	
</body>
</html>