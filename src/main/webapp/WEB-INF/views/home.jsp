<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<a href="com_esta_form.do">커뮤니티 신청</a>
<a href="com_esta_request_list.do">커뮤니티 신청 내역</a>
<a href="adminlibrarylist.do">괸리자 도서목록</a>
<a href="userlibrarylist.do">사용자 도거목록</a>
<a href="userapplyinfo.do">사용자 도거신청목록</a>
<a href="registerForm.do">회원가입</a>
<a href="loginForm.do">로그인</a>
<a href="update.do">정보수정</a>

</body>
</html>
