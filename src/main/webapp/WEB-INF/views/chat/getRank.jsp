<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
div {
	width: 100%;
	height: 500px;
}

.wrap-loading { /*화면 전체를 어둡게 합니다.*/
	position: fixed;
}

.wrap-loading div { /*로딩 이미지*/
	position: fixed;
}

.display-none { /*감추기*/
	display: none;
}
</style>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>

<body>
<h3>intent와 entity 랭크를 가져와보자.</h3><br>
<button id = "getThat">레쓰기릿</button><br>

<div id = "resultDiv">
	<div class="wrap-loading display-none">
    	<div><img src="${contextPath}/resources/chat/loader.gif" /></div>
</div>
</div>
<script>
	$("#getThat").on('click',function(){
		console.log("I am clicked ><");
		
		$.ajax({
			url: '/ranks.do',
			async: true,
			type : 'post',
			success : function(result){
				console.log(result[0]);
				//console.log(result[1]);
				var container = $('#resultDiv');
				var intentRank = 1;
				container.append("~~~~~~~~~~~~intent 순위~~~~~~~~~~~<br>");
				for(key in result[0]){
					var str = "";
					str += intentRank + "등  ";
					str += key + ": ";
					str += result[0][key] + "<br>";
					container.append(str);
					intentRank++;
				}
				
				container.append("<br>");
				container.append("~~~~~~~~~~~~entity 순위~~~~~~~~~~~<br>");
				var entityRank = 1;
				for(key in result[1]){
					var str = "";
					str += entityRank + "등  ";
					str += key + ": ";
					str += result[1][key] + "<br>";
					container.append(str);
					entityRank++;
				}
			},
			beforeSend:function(){
				$('.wrap-loading').removeClass('display-none');
			},
			complete:function(){
				$('.wrap-loading').addClass('display-none');
			},
			//에러 처리 필요함.
			error : function(result, status){
				console.log("error occured!");
			}
		})
	})

</script>

</body>
</html>