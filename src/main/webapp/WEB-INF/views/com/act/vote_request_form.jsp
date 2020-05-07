<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표주제신청하기</title>
</head>

<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>

<script type="text/javascript">
	
	function voteReq() {
		var board_id=$('input[name=board_id]').val();
		var request_content=$('input[name=request_content]').val();
		var request_writer=$('input[name=request_writer]').val();
		
		$.ajax({
			type:"POST",
			url:"vote_request.do",
			data:{"board_id" : board_id, "request_content" : request_content, "request_writer" : request_writer},
			success:function() {
				alert("좋은 의견 감사합니다");
				window.close();
			}
		})
	}
</script>

<body>

	<input type="hidden" name="board_id" value="${boardInfo.get('BOARD_ID') }">
	<input type="hidden" name="request_writer" value="${memNick }">
	<input type="text" name="request_content" placeholder="흥미로운 투표 주제를 보내주세요">
	<button style="color:#ffffff;font-size:16px;background-color:#e44d3a;padding:12px 27px;border:0;font-weight:500;margin-top:30px;" onclick="voteReq()">보내기</button>

</body>
</html>