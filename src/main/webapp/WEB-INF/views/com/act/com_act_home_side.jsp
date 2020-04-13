<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	${community_id }

	<h3>커뮤니티 정보</h3>
	운영자 ${comInfo.get("COMMUNITY_CAPTAIN")} <br>
	개설날짜 ${comInfo.get("COMMUNITY_ESTABLISH_DATE")} <br>
	총 회원수 ${comInfo.get("COMMUNITY_MEMBER_COUNT")} <br>
	<a href="com_act_home_main.do?community_id=${comInfo.get("COMMUNITY_ID")}&page=com_detail">커뮤니티 상세보기</a> <br>
	
	<h3>나의 정보</h3>
	닉네임 <br>
	가입날짜  <br>
	<a href="com_act_home_main.do?community_id=${comInfo.get("COMMUNITY_ID")}&page=mem_detail">활동내역 상세보기</a> <br>

	
	<h3>관리자 전용</h3>
	<h3><a href="com_act_home_main.do?community_id=${comInfo.get("COMMUNITY_ID")}&page=add_board">게시판추가하기</a></h3>
	<h3><a href="com_act_home_main.do?community_id=${comInfo.get("COMMUNITY_ID")}&page=mem_list">회원리스트</a></h3>
	

	<h3>게시판리스트</h3>
	<div id="board_list"></div>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
		var community_id=${comInfo.get("COMMUNITY_ID")};
		$(document).ready(function() {
			$.ajax({
				url:"board_list.do",
				contentType: 'application/json; charset=utf-8',
				data:{"community_id" : community_id},
				method:"GET",
				success:function(data) {
					console.log(data[0].BOARD_NAME);
					console.log(data[0].COMMUNITY_ID);
					console.log(data[0].BOARD_ID);
					
					for (var i=0; i<data.length; i++) {
						
						$("#board_list").append("<li><a href='com_act_board.do?page=board&board_id="+data[i].BOARD_ID+"&community_id="+data[i].COMMUNITY_ID+"'>"+data[i].BOARD_NAME+"</a></li>");
						
					}

				}
				
			})
		})
	</script>
	
</body>
</html>