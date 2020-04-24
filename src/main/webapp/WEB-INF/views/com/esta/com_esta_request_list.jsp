<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 신청 내역</title>
</head>

	<%
		session=request.getSession(false);
		String user_id=(String)session.getAttribute("user_id");
		String user_position=(String)session.getAttribute("user_position");
	%>

<body>
	
	<c:choose>
	
		<%-- 일반회원용 리스트 --%>
		<c:when test="${user_position eq 'general'}"> <!-- eq : == -->
			<c:choose>
				<c:when test="${comRequestListSize gt 0}">	<!-- gt : > -->  
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>날짜</th>
								<th>이름</th>
								<th>분류</th>
								<th>설명</th>
								<th>목적</th>
								<th>상태</th>
							</tr>
						
							<c:forEach var="i" begin="1" end="${comRequestListSize}">
								<tr>
									<td>${i}</td>
									<td>${comRequestList.get(i-1).get("COMMUNITY_ESTABLISH_DATE")}</td>
									<td>${comRequestList.get(i-1).get("COMMUNITY_NAME")}</td>
									<td>${comRequestList.get(i-1).get("COMMUNITY_CATEGORY")}</td>
									<td>${comRequestList.get(i-1).get("COMMUNITY_DESCRIPTION")}</td>
									<td>${comRequestList.get(i-1).get("COMMUNITY_AIM")}</td>
									<td>${comRequestList.get(i-1).get("COMMUNITY_ESTABLISH_STATUS")}</td>
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
				<c:when test="${comRequestListSize gt 0}">	<!-- gt : > -->  
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>날짜</th>
								<th>이름</th>
								<th>분류</th>
								<th>설명</th>
								<th>목적</th>
								<th>상태</th>
								<th>확인</th>
							</tr>
			
							<c:forEach var="i" begin="1" end="${comRequestListSize}">
								<tr>
									<td>${i}</td>
									<td>${comRequestList.get(i-1).get("COMMUNITY_ESTABLISH_DATE")}</td>
									<td>${comRequestList.get(i-1).get("COMMUNITY_NAME")}</td>
									<td>${comRequestList.get(i-1).get("COMMUNITY_CATEGORY")}</td>
									<td>${comRequestList.get(i-1).get("COMMUNITY_DESCRIPTION")}</td>
									<td>${comRequestList.get(i-1).get("COMMUNITY_AIM")}</td>
									<td>${comRequestList.get(i-1).get("COMMUNITY_ESTABLISH_STATUS")}</td>
									<td>
										<input type="hidden" name="index" value="${i}">
										<input type="hidden" name="community_id" value='${comRequestList.get(i-1).get("COMMUNITY_ID")}'>										
										<input type="button" value="처리" onclick="comStsAdmin('${i}')">
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
	
		//수락, 거절 선택
		$(document).ready(function() {
			
			//index 배열
			$("input[name=index]").each(function(index, item) {
				indexList.push($(item).val());
			});
			alert(indexList);
			
			//community_id 배열
			$("input[name=community_id]").each(function(index, item) {
				idList.push($(item).val());
			});
			alert(idList);
			
		});
		
		function comStsAdmin(i) {
			alert(i);
			alert(idList[i-1]);
			var community_id=idList[i-1];
			window.open("com_esta_admin_form.do?community_id="+community_id, "개설 신청 처리", "width=500, height=500");
		}

	</script>

</body>
</html>