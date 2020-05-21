<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>

<script>
$(document).ready(function() {
	$("#bt").on("click", function() {
	if("${member.userPass}" == $("#pass").val()){
		window.location.href = "update1.do";
	}
	else{
		alert("else");
	}
})
})
</script>

<body>
	<form >
		<input type="password" id="pass">
		<input type="button" id="bt">
	</form>
</body>
</html>