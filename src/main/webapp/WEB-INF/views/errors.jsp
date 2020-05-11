<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>에러 안내</title>

	<!-- font -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Chango" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Kirang+Haerang&display=swap" rel="stylesheet">

	<!-- style by template -->
	<link type="text/css" rel="stylesheet" href="${contextPath}/resources/css/style_error.css" />

</head>

<body>

	<div id="notfound">
		<div class="notfound">
			<div>
				<div class="notfound-404">
					<h1>!</h1>
				</div>
				<h2 style="margin-top:-25px">Error</h2>
				<p style="text-align:center; font-family: 'Kirang Haerang', cursive; font-size:25px">앗, 무언가가 잘못된 것 같습니다! <br> 다시 시도해주세요! <br> <a style="text-align:center; font-family: 'Kirang Haerang', cursive; font-size:30px" href="/">홈으로 이동하기</a></p>
			</div>
		</div>
	</div>

</body>

</html>
