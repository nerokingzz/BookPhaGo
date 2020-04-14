<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>신고 처리</h3>
	<input type="hidden" name="declare_id" value='<%=request.getParameter("declare_id") %>'>
	<input type="radio" name="admin_sts" value="do_user_penalty">신고자처벌
	<input type="radio" name="admin_sts" value="done_user_penalty">피신고자처벌
	<input type="text" name="admin_msg">
	<input type="button" value="완료" onclick="stsUpdate()">
	
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>	
	
	<script type="text/javascript">
		
		//상태 변경 update
		function stsUpdate() {
			var declare_id=$("input:hidden[name=declare_id]").val();
			var admin_sts=$("input:radio[name=admin_sts]:checked").val();
			var admin_msg=$("input:text[name=admin_msg]").val();
			alert(admin_sts);
			
			$.ajax({
				url:"mylib_declare_request_admin.do",
				data:{"declare_id" : declare_id, "admin_sts" : admin_sts, "admin_msg" : admin_msg},
				method:"POST",
				success:function(data) {
					alert(data);
					opener.location.href="admin_main.do?page=dec_A";
					window.close();
				}
			});
		}
		
	</script>

</body>
</html>