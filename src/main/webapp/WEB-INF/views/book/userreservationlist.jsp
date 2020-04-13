<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<p align="center">도서 예약</p>
<br>

	<c:choose>
		<c:when test="${booklistSize gt 0 }">
			<c:forEach var="i" begin="1" end="${booklistSize }">
				<input type="hidden" name="bookNumber" value="${booklist.get(i-1).get('BOOKNUMBER') }">
				<p align="center"><input type="text" style = "text-align:center;" name="bookNumber" value="${booklist.get(i-1).get('BOOKNAME') }" disabled>를 예약하시겠습니까?</td></p>
			</c:forEach>
		</c:when>
	
	</c:choose>
	<br><br><br>
	<p align="center"><td><input type="button" onclick="change();" value="확인"> <input type="button" onclick="CloseWindow();" value="닫기"></td></p>


<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>	
	
<script type="text/javascript">
function CloseWindow() {
	window.close();
}

function change() {
	var bookNumber=$("input:hidden[name=bookNumber]").val();
	
	$.ajax({
		url:"userreservation.do",
		data:{"bookNumber" : bookNumber},
		method:"POST",
		success:function(data) {
			opener.location.href="userlibrarylist.do";
			window.close();
		}
	});
	
}
</script>

</body>
</html>
