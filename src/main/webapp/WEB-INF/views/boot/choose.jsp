<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>이동할 페이지를 선택 후 바로가기 클릭 ㄱㄱ</h1>

<form action = "${contextPath}/goBoot.do" method = "get">
<input type = "radio" name = "bootPage" value = "about">about<br>
<input type = "radio" name = "bootPage" value = "apply-job">apply-job<br>
<input type = "radio" name = "bootPage" value = "companies">companies<br>
<input type = "radio" name = "bootPage" value = "company-profile">company-profile<br>
<input type = "radio" name = "bootPage" value = "forum">forum<br>
<input type = "radio" name = "bootPage" value = "forum-post-view">forum-post-view<br>
<input type = "radio" name = "bootPage" value = "help-center">help-center<br>
<input type = "radio" name = "bootPage" value = "index">index<br>
<input type = "radio" name = "bootPage" value = "jobs">jobs<br>
<input type = "radio" name = "bootPage" value = "messages">messages<br>
<input type = "radio" name = "bootPage" value = "my-profile-feed">my-profile-feed<br>
<input type = "radio" name = "bootPage" value = "profile-account-setting">profile-account-setting<br>
<input type = "radio" name = "bootPage" value = "profiles">profiles<br>
<input type = "radio" name = "bootPage" value = "projects">projects<br>
<input type = "radio" name = "bootPage" value = "project-view">project-view<br>
<input type = "radio" name = "bootPage" value = "sign-in">sign-in<br>
<input type = "radio" name = "bootPage" value = "user-profile">user-profile<br>
<br>
<input type = "submit" value = "바로가기">
</form>

</body>
</html>