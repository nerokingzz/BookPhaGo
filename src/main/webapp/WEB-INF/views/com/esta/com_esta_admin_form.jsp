<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

	<h3>개설 신청 처리</h3>
	<input type="hidden" name="community_id" value='<%=request.getParameter("community_id") %>'>
	<input type="radio" name="admin_sts" value="agree">수락
	<input type="radio" name="admin_sts" value="dgree">거절
	<input type="text" name="admin_msg">
	<input type="button" value="완료" onclick="stsUpdate()">
	
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>	
	
	<script type="text/javascript">
		
		//수락, 거절 변경 update
		function stsUpdate() {
			var community_id=$("input:hidden[name=community_id]").val();
			var admin_sts=$("input:radio[name=admin_sts]:checked").val();
			var admin_msg=$("input:text[name=admin_msg]").val();
			alert(admin_sts);
			
			$.ajax({
				url:"com_esta_request_admin.do",
				data:{"community_id" : community_id, "admin_sts" : admin_sts, "admin_msg" : admin_msg},
				method:"POST",
				success:function(data) {
					alert(data);
					opener.location.href="com_esta_request_list.do";
					window.close();
				}
			});
		}
		
	</script>

</body>
</html>