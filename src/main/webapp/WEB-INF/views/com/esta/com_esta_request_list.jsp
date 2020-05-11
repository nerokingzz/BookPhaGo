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
  	
  	<!-- session 로그인 정보 -->
	<%
		session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		String user_position=(String)session.getAttribute("user_position");
	%>

</head>

<body>
	<section>
		<h1 style="padding-bottom:20px; padding-top:20px; text-align:center; font-size:25px" class="title">커뮤니티 신청 내역</h1>
			<c:choose>
				<c:when test="${estaListSize gt 0}">	<!-- gt : > -->  
					<div style="padding-top:10px; padding-bottom:10px; font-size:15px" class="row">
						<div class="col-2">
							<h6>번호</h6>
						</div>
						<div class="col-3">
							<h6>날짜</h6>
						</div>
						<div class="col-3">
							<h6>이름</h6>
						</div>
						<div class="col-2">
							<h6>분류</h6>
						</div>
						<div class="col-2">
							<h6>상태</h6>
						</div>
					</div>
					<c:forEach var="i" begin="1" end="${estaListSize}">
					<div style="padding-top:10px; padding-bottom:10px; font-size:15px" class="row">
						<div class="col-2">
							<h6>${i}</h6>
						</div>
						<div class="col-3">
                           	<h6>${estaList.get(i-1).get("COMMUNITY_ESTABLISH_DATE")}</h6>
						</div>
                        <div class="col-3">
	                        <h6>${estaList.get(i-1).get("COMMUNITY_NAME")}</h6>
	                    </div>
	                    <div class="col-2">
	                    	<h6>${estaList.get(i-1).get("COMMUNITY_CATEGORY")}</h6>
	                    </div>
	                    <div class="col-2">
	                        <h6>${estaList.get(i-1).get("COMMUNITY_ESTABLISH_STATUS")}</h6>
	                    </div>
	                </div>
	                </c:forEach>
				</c:when>
				<c:otherwise>
					신청한 내역이 없습니다.
				</c:otherwise>
			</c:choose>
	</section> 
	
	<!-- js by template -->
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/popper.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/flatpickr.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/lib/slick/slick.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/script.js"></script>
	
</body>
</html>