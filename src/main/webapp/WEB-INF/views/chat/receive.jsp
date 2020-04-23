<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
    <%@ include file="watson.jsp" %>   
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.wrap-loading { /*화면 전체를 어둡게 합니다.*/
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	background: rgba(0, 0, 0, 0.2); /*not in ie */
	filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000',
		endColorstr='#20000000');
}

.wrap-loading div { /*로딩 이미지*/
	position: fixed;
	top: 50%;
	left: 50%;
	margin-left: -21px;
	margin-top: -21px;
}

.display-none { /*감추기*/
	display: none;
}

div#rankSection {
	border : 1px solid black;
	margin: 1.5em 0 1.5em 0;
	display: block;
}
</style>
</head>
<body>

<%
   request.setCharacterEncoding( "utf-8" );
%>
<div id="rankSection">
		<div id="resultDiv">
			<div class="wrap-loading display-none">
				<div>
					<img src="${contextPath}/resources/chat/loader.gif" />
				</div>
			</div>
		</div>
	</div>


</body>
</html>