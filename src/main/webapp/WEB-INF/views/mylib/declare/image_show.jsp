<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첨부파일확인</title>
</head>
<body>
<h6><img alt='첨부' width='700' height='700' src="${contextPath }/declareImage.do?declare_id=${declare_id }"></h6>
</body>
</html>