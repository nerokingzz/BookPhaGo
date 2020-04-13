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
<form action="userreservation.do" method="get">
	<c:choose>
		<c:when test="${booklistSize gt 0 }">
			<c:forEach var="i" begin="1" end="${booklistSize }">
				<input type="hidden" name="bookNumber" value="${booklist.get(i-1).get('BOOKNUMBER') }">
				<p align="center"><td width="400"><input type="text" style = "text-align:center;" name="bookNumber" value="${booklist.get(i-1).get('BOOKNAME') }" disabled>를 예약하시겠습니까?</td></p>
			</c:forEach>
		</c:when>
	
	</c:choose>
	<br><br><br>
	<p align="center"><td><input type="submit" onclick="CloseWindow();" value="확인"> <input type="button" onclick="CloseWindow();" value="닫기"></td></p>
</form>

<script type="text/javascript">
function CloseWindow() {
	opener.location.href="userlibrarylist.do";
	window.close();
}
</script>

</body>
</html>

