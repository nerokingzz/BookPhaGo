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
<p align="center">���� ����</p>
<br>
<form action="userreservation.do" method="get">
	<c:choose>
		<c:when test="${requestListSize gt 0 }">
			<c:forEach var="i" begin="1" end="${requestListSize }">
				<input type="hidden" name="bookNumber" value="${requestList.get(i-1).get('BOOKNUMBER') }">
				<p align="center"><td width="400"><input type="text" style = "text-align:center;" name="bookNumber" value="${requestList.get(i-1).get('BOOKNAME') }" disabled>�� �����Ͻðڽ��ϱ�?</td></p>
			</c:forEach>
		</c:when>
	
	</c:choose>
	<br><br><br>
	<p align="center"><td><input type="submit" onclick="CloseWindow();" value="Ȯ��"> <input type="button" onclick="CloseWindow();" value="�ݱ�"></td></p>
</form>
</body>
</html>

<script type="text/javascript">
function CloseWindow() {
	window.close();
}
</script>