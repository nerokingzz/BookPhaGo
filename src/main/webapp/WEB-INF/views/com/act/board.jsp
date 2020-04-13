<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	${articleListSize}
	${comInfo.get("COMMUNITY_NAME")}
	커뮤니티 아이디: <%=request.getParameter("community_id")%>
	
	<h3>게시글목록</h3>

</body>
</html>