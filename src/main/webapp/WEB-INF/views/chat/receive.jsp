<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/chat/css/rent.css">
<style>
.chart {
	width: 100%;
	min-height: 450px;
}

.row {
	margin: 0 !important;
}
</style>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>

</head>
<body>
도서 대출내역을 조회할 회원명을 입력하세요 : <input id = "userid" type = "text" > <button id = "getIt">조회</button>
<div id = "successResult"></div>
	
<script type="text/javascript">

var userid = null;

$('#getIt').on('click',function(){
	userid = $('#userid').val();

	alert(userid);
})

$('#getIt').on('click',function(){
	$.ajax({
		url : '${contextPath}/chatUserBookCheck.do',
		data : {"userid" : userid}, 
		type : 'POST',
		success : function(result) {
			console.log(result);
			$('#successResult').append(userid + "님의 조회 결과입니다.<br>");
			for(i in result){
				$('#successResult').append("도서명&nbsp;&nbsp;" + result[i].BOOKNAME + "<br>");
				$('#successResult').append("도서번호&nbsp;&nbsp;" + result[i].BOOKNUMBER + "<br>");
				$('#successResult').append("대여일&nbsp;&nbsp;" + result[i].RENTDATE + "<br>");
				$('#successResult').append("반납예정일&nbsp;&nbsp;" + result[i].RETURNDATE + "<br>");
				$('#successResult').append("상태&nbsp;&nbsp;" + result[i].STATE + "<br><hr>");
			}


		},
		//에러 처리 필요함.
		error : function(result, status) {
			$('#successResult').append("오류가 발생했습니다." + status);
		}
	})
})



</script>
</body>
</html>