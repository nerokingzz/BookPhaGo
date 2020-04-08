<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Bookphago</title>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<script
	src="https://web-chat.global.assistant.watson.appdomain.cloud/loadWatsonAssistantChat.js"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<style>
	body{
		font-family: 'Nanum Pen Script', cursive;
		font-size: 17pt;
	}

</style>
</head>

<body>
<h1>
	Bookphago v0.003
</h1>
	<br>
	<form onsubmit="return false;">
	<div id = "status" style = "font-weight:bold;">현재 상태 : 비회원</div><br>
	로그인 하시겠습니까?<br><br>
	<input type = "text" id = "newID" placeholder = "아이디를 입력하세요">&nbsp;<input type = "submit" value = "로그인" id="login"><br><br>
 	</form>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72e7bf23ab0472efaf8d58b131cc552d"></script>
</body>
<script src = "resources/chat/js/map.js" ></script>
<script src = "resources/chat/js/member.js" ></script>
<script src = "resources/chat/js/watsonjs.js" ></script>
</html>
