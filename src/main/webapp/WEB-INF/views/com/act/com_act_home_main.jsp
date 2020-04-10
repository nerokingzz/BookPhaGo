<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>




<body>
	
	${comInfo.get("COMMUNITY_ID") }
	
 	<c:choose>
 		<c:when test="${pageInfo eq 'com_detail' }">
			<jsp:include page="com_detail.jsp">
				<jsp:param name="community_id" value='${comInfo.get("COMMUNITY_ID") }'></jsp:param>
			</jsp:include>
		</c:when>
		<c:when test="${pageInfo eq 'mem_detail' }">
			<jsp:include page="mem_detail.jsp">
				<jsp:param name="community_id" value='${comInfo.get("COMMUNITY_ID") }'></jsp:param>
			</jsp:include>
		</c:when>
		<c:when test="${pageInfo eq 'add_board' }">
			<jsp:include page="add_board.jsp">
				<jsp:param name="community_id" value='${comInfo.get("COMMUNITY_ID") }'></jsp:param>
			</jsp:include>
		</c:when> 
		<c:when test="${pageInfo eq 'mem_list' }">
			<jsp:include page="mem_list.jsp">
				<jsp:param name="community_id" value='${comInfo.get("COMMUNITY_ID") }'></jsp:param>
			</jsp:include>
		</c:when>
		<c:when test="${pageInfo eq 'board' }">
			<jsp:include page="board.jsp">
				<jsp:param name="community_id" value='${comInfo.get("COMMUNITY_ID") }'></jsp:param>
			</jsp:include>
		</c:when>
		<c:otherwise>
			메인
		</c:otherwise>
	</c:choose>


</body>


</html>