<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<%@ include file="../chat/watson.jsp" %>
<html>
<head>
	<title>Home</title>
		<!-- 합쳐지고 최소화된 최신 CSS -->
	 <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
	<!-- 부가적인 테마 -->
	 <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
	 
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
</head>

<script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="logout.do";
		})
		$("#listBtn").on("click", function(){
			location.href="list.do";
		})
		
		$("#registerBtn").on("click", function(){
			location.href="registerForm.do";
		})
		
		$("#memberUpdateBtn").on("click", function(){
			location.href="update.do";
		})
		
		$("#memberDeleteBtn").on("click", function(){
			location.href="delete.do";
		})
		
 
	})
	

</script>
<body>
<h1>로그인화면</h1>
	<form name='homeForm' method="post" action="login.do">
		<c:if test="${member == null}">
			<div>
				<label for="userId">ID</label>
				<input type="text" id="userId1" name="userId1">
			</div>
			<div>
				<label for="userPass">PW</label>
				<input type="password" id="userPass1" name="userPass1">
			</div>
			<div>
				<button id= "login" type="submit">로그인</button>
				<button id="registerBtn" type="button">회원가입</button>
			</div>
		</c:if>
		<c:if test="${member != null}">
			<div>
				<h1><p>${member.userId}님 로그인</p></h1>
				<button id="memberUpdateBtn" type="button">회원정보수정</button>
				<button id="memberDeleteBtn" type="button">회원탈퇴</button>
				<button id="logoutBtn" type="button">로그아웃</button>
			</div>
		</c:if>
		
		<c:if test="${member != null && member.userId == 'admin'}">
						<div>
							<button id="listBtn" type="button">회원정보보기 (관리자)</button><br />
						</div>
		</c:if>
		
		<c:if test="${msg == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>

	</form>

</body>
</html>