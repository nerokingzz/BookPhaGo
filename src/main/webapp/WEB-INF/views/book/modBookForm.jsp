<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.cls1 {
	font-size: 20px;
	text-align: center;
}
</style>
</head>
<body>
	<h3 class="cls1">도서 정보 수정창</h3>
		<table align="center">
			<c:choose>
				<c:when test="${booklistSize==0 }">
					<br>
					<br>
					<br>
					<br>
					<br>
					<p align="center">잘못된 값 입력</p>
				</c:when>

				<c:when test="${booklistSize gt 0 }">
					<c:forEach var="i" begin="1" end="${booklistSize }">
						<tr>
							<td width="200">
								<p align="right">도서번호 :
							</td>
							<td width="400"><input type="text" name="bookNumber"
								value="${booklist.get(i-1).get('BOOKNUMBER') }" readonly></td>
						</tr>
						<tr>
							<td width="200">
								<p align="right">장르 :
							</td>
							<td width="400"><input type="text" name="bookGenre"
								value="${booklist.get(i-1).get('BOOKGENRE') }"></td>
						</tr>
						<tr>
							<td width="200">
								<p align="right">대출여부 :
							</td>
							<td width="400"><input type="text" name="bookRent"
								value="${booklist.get(i-1).get('BOOKRENT') }"></td>
						</tr>
						<tr>
							<td width="200">
								<p align="right">예약여부 :
							</td>
							<td width="400"><input type="text" name="bookReservation"
								value="${booklist.get(i-1).get('BOOKRESERVATION') }"></td>
						</tr>
						<tr>
							<td width="200">
								<p align="right">isbn :
							</td>
							<td width="400"><input type="text" name="isbn"
								value="${booklist.get(i-1).get('ISBN') }" disabled></td>
						</tr>
						<tr align="center">
							<td colspan="2" width="400"><input type="button"
								onclick="change();" value="수정하기"> <input
								type="button" value="닫기" onclick="CloseWindow();"></td>
						</tr>

					</c:forEach>
				</c:when>
			</c:choose>
		</table>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>	
	
<script type="text/javascript">
function CloseWindow() {
	window.close();
}

function change() {
	var bookNumber = $("input:text[name=bookNumber]").val();
	var bookGenre = $("input:text[name=bookGenre]").val();
	var bookRent = $("input:text[name=bookRent]").val();
	var bookReservation = $("input:text[name=bookReservation]").val();
	
	$.ajax({
		url:"admin_main.do?page=book_A",
		data:{"bookNumber" : bookNumber, "bookGenre" : bookGenre, "bookRent" : bookRent, "bookReservation" : bookReservation},
		method:"POST",
		success:function(data) {
			opener.location.href="admin_main.do?page=book_A";
			window.close();
		}
	});
}
</script>