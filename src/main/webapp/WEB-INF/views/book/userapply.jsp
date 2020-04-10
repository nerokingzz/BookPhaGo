<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p align="center"><h3>도서 신청 </h3>

<form method="post" name="form">
    <input type="submit" value="신청안내" onclick="javascript: form.action='userapplyinfo';"/>
    <input type="submit" value="도서신청" onclick="javascript: form.action='userapply';"/>
</form><br>

<div>
<form action="userapplybook.do" method="get">
	<table>
		<tr>
			<td>사용자 ID :
			<td><input type="text" name="user_id" value="${user_id }"></td>
		</tr>
		<tr>
			<td>도서명 :
			<td><input type="text" name="bookName" id="pInput" readonly>
			<input type="button" value="검색" onclick="userapplysearchbook();"></td>
			
		</tr>
		<tr>
			<td>isbn :
			<td><input type="text" name="isbn" id="pInputt" readonly></td>
		</tr>
		<tr>
			<td>선청날짜 :
			<td><input type="text" name="applyDate" id="current_info" readonly></td>
		</tr>
		<tr>
			<td>사유 :
			<td><input type="text" name="applyReason"></td>
		</tr>
		<tr>
			<td style="text-align: center;"><button type="submit" onclick="return check()" >신청하기</button></td>
		</tr>
	</table>
</form>
</div>

<script src="resources/book/js/date.js"></script>
</body>
</html>

<script type="text/javascript">
	function userapplysearchbook() {
		var popUrl = "userapplysearch.do";
    	window.open(popUrl,"","width=1200,height=400");
	}
	
	function check(){
    	if (confirm("신청 하시겠습니까??") == true){    //확인
    	    return true;
    	}else{   //취소
    	    return false;
    	}
    }
</script>