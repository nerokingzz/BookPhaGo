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
	<form method="post" action="modifylibrary.do">
		<table align="center">
			<c:choose>
				<c:when test="${requestListSize==0 }">
					<br>
					<br>
					<br>
					<br>
					<br>
					<p align="center">잘못된 값 입력</p>
				</c:when>

				<c:when test="${requestListSize gt 0 }">
					<c:forEach var="i" begin="1" end="${requestListSize }">
						<tr>
							<td width="200">
								<p align="right">도서번호 :
							</td>
							<td width="400"><input type="text" name="bookNumber"
								value="${requestList.get(i-1).get('BOOKNUMBER') }"></td>
						</tr>
						<tr>
							<td width="200">
								<p align="right">장르 :
							</td>
							<td width="400"><input type="text" name="bookGenre"
								value="${requestList.get(i-1).get('BOOKGENRE') }"></td>
						</tr>
						<tr>
							<td width="200">
								<p align="right">대출여부 :
							</td>
							<td width="400"><input type="text" name="bookRent"
								value="${requestList.get(i-1).get('BOOKRENT') }"></td>
						</tr>
						<tr>
							<td width="200">
								<p align="right">예약여부 :
							</td>
							<td width="400"><input type="text" name="bookReservation"
								value="${requestList.get(i-1).get('BOOKRESERVATION') }"></td>
						</tr>
						<tr>
							<td width="200">
								<p align="right">isbn :
							</td>
							<td width="400"><input type="text" name="isbn"
								value="${requestList.get(i-1).get('ISBN') }" disabled></td>
						</tr>
						<tr align="center">
							<td colspan="2" width="400"><input type="submit"
								onclick="return modify_check()" value="수정하기"> <input
								type="reset" value="다시입력"></td>
						</tr>

					</c:forEach>
				</c:when>
			</c:choose>
		</table>
	</form>
</body>
</html>

<script type="text/javascript">
function modify_check(){
	if (confirm("수정 하시겠습니까??") == true){    //확인
	    return true;
	}else{   //취소
	    return false;
	}
}
</script>