<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 내역 조회</title>
</head>

<body>

	<%
		session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		String user_position=(String)session.getAttribute("user_position");
	%>

<body>
	
	<c:choose>
	
		<%-- 일반회원용 리스트 --%>
		<c:when test="${user_position eq 'general'}"> <!-- eq : == -->
			<c:choose>
				<c:when test="${decRequestListSize gt 0}">	<!-- gt : > -->  
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>날짜</th>
								<th>피신고자</th>
								<th>분류</th>
								<th>이유</th>
								<th>첨부파일</th>
								<th>상태</th>
							</tr>
						
							<c:forEach var="i" begin="1" end="${decRequestListSize}">
								<tr>
									<td>${i}</td>
									<td>${decRequestList.get(i-1).get("DECLARE_DATE")}</td>
									<td>${decRequestList.get(i-1).get("BE_DONE_USER")}</td>
									<td>${decRequestList.get(i-1).get("DECLARE_CATEGORY")}</td>
									<td>${decRequestList.get(i-1).get("DECLARE_REASON")}</td>
									<td><img alt="첨부" width="100" height="100" src="${contextPath }/declareImage.do?declare_id=${decRequestList.get(i-1).get("DECLARE_ID")}"></td>
									<td>${decRequestList.get(i-1).get("DECLARE_STATUS")}</td>
								</tr>
							</c:forEach>
						</thead>
					</table>
				</c:when>
			</c:choose>
		</c:when>
		
		<%-- 관리자용 리스트 --%>
		<c:when test="${user_position eq 'admin'}"> <!-- eq : == -->
			
			<c:choose>
				<c:when test="${decRequestListSize gt 0}">	<!-- gt : > -->  
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>날짜</th>
								<th>신고자</th>
								<th>피신고자</th>
								<th>분류</th>
								<th>이유</th>
								<th>첨부파일</th>
								<th>상태</th>
							</tr>
						
							<c:forEach var="i" begin="1" end="${decRequestListSize}">
								<tr>
									<td>${i}</td>
									<td>${decRequestList.get(i-1).get("DECLARE_DATE")}</td>
									<td>${decRequestList.get(i-1).get("DO_USER")}</td>
									<td>${decRequestList.get(i-1).get("BE_DONE_USER")}</td>
									<td>${decRequestList.get(i-1).get("DECLARE_CATEGORY")}</td>
									<td>${decRequestList.get(i-1).get("DECLARE_REASON")}</td>
									<td><img alt="첨부" width="100" height="100" src="${contextPath }/declareImage.do?declare_id=${decRequestList.get(i-1).get("DECLARE_ID")}"></td>
									<td>${decRequestList.get(i-1).get("DECLARE_STATUS")}</td>
									<td>
										<input type="hidden" name="index" value="${i}">
										<input type="hidden" name="declare_id" value='${decRequestList.get(i-1).get("DECLARE_ID")}'>										
										<input type="button" value="처리" onclick="decStsAdmin('${i}')">
									</td>
								</tr>
							</c:forEach>
						</thead>
					</table>
				</c:when>
			</c:choose>
		</c:when>
	</c:choose>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
		
		var indexList=new Array();
		var idList=new Array();
	
		//결과선택
		$(document).ready(function() {
			
			//index 배열
			$("input[name=index]").each(function(index, item) {
				indexList.push($(item).val());
			});
			alert(indexList);
			
			//declare_id 배열
			$("input[name=declare_id]").each(function(index, item) {
				idList.push($(item).val());
			});
			alert(idList);
			
		});
		
		function decStsAdmin(i) {
			alert(i);
			alert(idList[i-1]);
			var declare_id=idList[i-1];
			window.open("mylib_declare_admin_form.do?declare_id="+declare_id, "신고 처리", "width=500, height=500");
		}

	</script>


</body>
</html>