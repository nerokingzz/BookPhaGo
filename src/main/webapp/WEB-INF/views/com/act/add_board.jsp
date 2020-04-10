<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>게시판 추가하기</h3>
	<form action="com_add_board.do" method="post">
		게시판 이름<input type="text" name="board_name"> <br>
		커뮤니티 아이디<input type="text" name="community_id" value='${comInfo.get("COMMUNITY_ID")}'> <br> <!-- hidden으로 변경 -->
		게시글수<input type="text" name="board_article_count" value="0"> <br> <!-- hidden으로 변경 -->
		<select name="board_category">
			<option value="BD">--분류--</option>
			<option value="BD000">일반</option> 
			<option value="BD001">투표</option>
		</select> <br>
		
		<input type="submit" value="추가하기">
		<input type="reset" value="다시작성">
	</form>
	

</body>
</html>