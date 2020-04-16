<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<title>게시판</title>
	</head>
	<body>
		<div id="root">
				<h1> 관리자화면</h1>
			
			<section id="container">
				<form role="form" method="post" action="/member/write">
					<table border="1">
						<tr><th>아이디</th><th>비밀번호</th><th>이름</th><th>이메일</th><th>전화번호</th><th>나이</th><th>등록일</th></tr>
						
						<c:forEach items="${list}" var = "list">
							<tr>
								<td><c:out value="${member.userId}" /></td>
								<td><c:out value="${member.userPass}" /></td>
								<td><c:out value="${member.userName}" /></td>
								<td><c:out value="${member.userEmail}" /></td>
								<td><c:out value="${member.userTel}" /></td>
								<td><c:out value="${member.userAge}" /></td>
								<td><fmt:formatDate value="${regdate}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
						
					</table>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>