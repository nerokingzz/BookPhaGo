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
<a href="com_act_list.do">커뮤니티 목록보기</a>
<br>

<a href="mylib_declare_form.do">신고하기</a>
<a href="mylib_declare_request_list.do">신고내역 확인</a>
<br>

<a href="adminlibrarylist.do">괸리자 도서목록</a>
<a href="userlibrarylist.do">사용자 도서목록</a>
<a href="userapplyinfo.do">사용자 도서신청목록</a>
<br>

<a href="loginForm.do">로그인</a>
<a href="list.do">리스트</a>
<a href="sign.do>">로그인페이지</a>

<%@ include file="chat/watson.jsp" %>

</body>
</html>
