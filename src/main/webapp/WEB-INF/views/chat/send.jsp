<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>   
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>

</head>
<body>
<h1>Page 2</h1>
	<button id = "sendMail">메일을 보내봅시다잉</button>
<script>
	$("#sendMail").on('click',function(){
		console.log("i am in send.jsp");
		var MailVO = {
				from : "bookphago@gmail.com",
				to : "strbrycream@gmail.com",
				title : "**님으로 부터 도착한 북파고 기능 요청입니다.",
				contents : "기능 추가해달래용 ㅋㅋ"
		};
		
		$.ajax({
			url: '/sendMail.do',
			contentType : 'application/json; charset=utf-8',
			data : {"MailVO" : MailVO}, 
			type : 'get',
			success : function(result){
				console.log(result);
				
			},
			error : function(result, status, error){
				
				console.log("i am in error" + status);
			}
			
		})
		
	})
	

</script>
</body>
</html>