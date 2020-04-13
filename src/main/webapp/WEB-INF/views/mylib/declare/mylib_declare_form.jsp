<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 양식 작성</title>
</head>

	<%
		session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
	%>

<body>

	<form action="mylib_declare_request.do" method="post" enctype="multipart/form-data">
		신고날짜<input type="text" id="current_info" name="declare_date"> <br> <!-- hidden으로 변경 -->
		신고자아이디<input type="text" name="do_user" value="${user_id}"> <br>
		<select name="declare_category">
			<option value="DC">--분류--</option>
			<option value="DC000">게시글</option> 
			<option value="BO001">답글</option>
			<option value="BO002">채팅</option>
			<option value="BO003">기타</option>
		</select> <br>
		신고대상아이디<input type="text" name="be_done_user">
		신고이유<input type="text" name="declare_reason">
		신고상태<input type="text" name="declare_status" value="진행중"> <br> <!-- hidden으로 변경 -->
		
		첨부파일 <br> <input type="file" name="declare_image_data">
		<br>
		
		<input type="submit" value="신고하기">
		<input type="reset" value="다시작성">
	</form>
	
	<script src="resources/mylib/js/utils.js"></script>

</body>
</html>