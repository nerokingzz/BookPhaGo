<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 목록</title>
</head>

	<%
		session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		String user_position=(String)session.getAttribute("user_position");
	%>

<body>

	<c:choose>
	
		<%-- 일반회원용 리스트 --%>
		<c:when test="${user_position eq 'general'}"> <!-- eq : == -->
			<h3> 커뮤니티 리스트</h3>
			<c:choose>
				<c:when test="${comListSize gt 0}">	<!-- gt : > -->  
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>이름</th>
								<th>분류</th>
								<th>설명</th>
							</tr>
						
							<c:forEach var="i" begin="1" end="${comListSize}">
								<tr>
									<td>${i}</td>
									<td><a href="com_act_home.do?community_id=${comList.get(i-1).get("COMMUNITY_ID")}">${comList.get(i-1).get("COMMUNITY_NAME")}</a></td>
									<td>${comList.get(i-1).get("COMMUNITY_CATEGORY")}</td>
									<td>${comList.get(i-1).get("COMMUNITY_DESCRIPTION")}</td>
								</tr>
							</c:forEach>
						</thead>
					</table>
				</c:when>
			</c:choose>
		</c:when>
		
		<%-- 관리자용 리스트 --%>
		<c:when test="${user_position eq 'admin'}"> <!-- eq : == -->
			<h3> 커뮤니티 리스트</h3>
			<c:choose>
				<c:when test="${comListSize gt 0}">	<!-- gt : > -->  
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>이름</th>
								<th>분류</th>
								<th>설명</th>
							</tr>
						
							<c:forEach var="i" begin="1" end="${comListSize}">
								<tr>
									<td>${i}</td>
									<td><a href="com_act_home.do?community_id=${comList.get(i-1).get("COMMUNITY_ID")}">${comList.get(i-1).get("COMMUNITY_NAME")}</a></td>
									<td>${comList.get(i-1).get("COMMUNITY_CATEGORY")}</td>
									<td>${comList.get(i-1).get("COMMUNITY_DESCRIPTION")}</td>
								</tr>
							</c:forEach>
						</thead>
					</table>
				</c:when>
			</c:choose>
		</c:when>
	</c:choose>

</body>
</html>