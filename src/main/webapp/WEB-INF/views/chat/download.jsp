<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<a href="#" id = "downloadCsv">CSV파일 다운로드 하기</a>
	<br>
	<div id ="downResult">
	</div>
 
 <!--
	<label for="c_attachFile1">첨부파일</label>

	<c:forEach var="fileview" items="${fileview}">
		<a href="${path}/fileDownload4?fileName=${fileview.fileName}&downName=${fileview.realName }">${fileview.fileName}</a>
                    ${fileview.size2String()}
   </c:forEach>
   -->
</body>
<script>
	

	$('#downloadCsv').on('click', function(e) {
		e.preventDefault();
		$.ajax({
			url : '${contextPath}/chat/down.do',
			type : 'get',
			success : function(result) {
				$('#downResult').append("다운로드가 완료되었습니다.");
			},
			//에러 처리 필요함.
			error : function(result, status) {
				$('#downResult').append("오류가 발생했습니다." + status);
			}
		})

	})
</script>
</html>