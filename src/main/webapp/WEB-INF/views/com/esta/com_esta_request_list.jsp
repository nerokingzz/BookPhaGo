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
		session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		String user_position=(String)session.getAttribute("user_position");
	%>

<body>
	
	<c:choose>
	
		<%-- 일반회원용 리스트 --%>
		<c:when test="${user_position eq 'general'}"> <!-- eq : == -->
			<h3>${user_id}님의 커뮤니티 신청 내역</h3>
			<c:choose>
				<c:when test="${requestListSize gt 0}">	<!-- gt : > -->  
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
						
							<c:forEach var="i" begin="1" end="${requestListSize}">
								<tr>
									<td>${i}</td>
									<td>${requestList.get(i-1).get("COMMUNITY_ESTABLISH_DATE")}</td>
									<td>${requestList.get(i-1).get("COMMUNITY_NAME")}</td>
									<td>${requestList.get(i-1).get("COMMUNITY_CATEGORY")}</td>
									<td>${requestList.get(i-1).get("COMMUNITY_DESCRIPTION")}</td>
									<td>${requestList.get(i-1).get("COMMUNITY_AIM")}</td>
									<td>${requestList.get(i-1).get("COMMUNITY_ESTABLISH_STATUS")}</td>
								</tr>
							</c:forEach>
						</thead>
					</table>
				</c:when>
			</c:choose>
		</c:when>
		
		<%-- 관리자용 리스트 --%>
		<c:when test="${user_position eq 'admin'}"> <!-- eq : == -->
			<h3>커뮤니티 신청 내역</h3>
			
			<c:choose>
				<c:when test="${requestListSize gt 0}">	<!-- gt : > -->  
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
						
							<c:forEach var="i" begin="1" end="${requestListSize}">
								<tr>
									<td>${i}</td>
									<td>${requestList.get(i-1).get("COMMUNITY_ESTABLISH_DATE")}</td>
									<td>${requestList.get(i-1).get("COMMUNITY_NAME")}</td>
									<td>${requestList.get(i-1).get("COMMUNITY_CATEGORY")}</td>
									<td>${requestList.get(i-1).get("COMMUNITY_DESCRIPTION")}</td>
									<td>${requestList.get(i-1).get("COMMUNITY_AIM")}</td>
									<td>${requestList.get(i-1).get("COMMUNITY_ESTABLISH_STATUS")}</td>
									<td>
										<form action="com_esta_request_admin.do" method="post">
											<input type="radio" name="admin_sts" value="agree" checked>수락
											<input type="radio" name="admin_sts" value="dgree">거절
											<input type="text" name="admin_msg">
											<input type="button" value="완료" onclick="">
										</form>
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
		
		//tnfkr/
		$(document).ready(function() {
			$("input:radio[name=admin_sts]").click(function () {
				if ($("input[name=admin_sts]:checked").val() == "agree") {
					$("input:text[name=admin_msg]").attr("disabled", true);
				} else if ($("input[name=admin_sts]:checked").val() == "dgree") {
					$("input:text[name=admin_msg]").attr("disabled", false);
				}
			});
		});
		
		
	</script>

</body>
</html>