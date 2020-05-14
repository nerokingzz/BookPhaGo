<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<title>Insert title here</title>
<style>
.user-fw-status li h4 {
	color: black;
	font-size: 13px;
	font-weight: bold;
	margin-bottom: 0px;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
}

div.main_content{
	border-bottom: 4px solid #e44d3a;
    width: 100%;
    height: 100%;
    margin-bottom: 40px;
    min-height: 430px;
}

div#commInfo {
	border: 1px solid #E38544;
	border-radius: 15px;
	margin: 10px;
	padding: 20px 5px;
}

span.commInfoTag {
	font-size: 9pt;
	font-weight: bold;
	float: left;
	margin-left: 35px;
	line-height: 20px;
}

span.commInfoCon {
	font-size: 10pt;
	float: right;
	margin-right: 35px;
	line-height: 20px;
}

.user-fw-status li h4.commInfoButton {
	background-color: #e44d3a;
	color: white;
	width: 170px;
	height: 30px;
	padding: auto;
	border-radius: 90px;
	margin-left : auto;
	margin-right : auto;
	margin-bottom : 10px
}

.user-fw-status li h4 a {
	color: white;
	line-height: 30px;
	font-size : 12px;
}

main{
	padding: 20px 0;

}
</style>
</head>
<body>
	<ul class="user-fw-status" style = "border-top: 4px solid #e44d3a;">
		<li>
			<h4>커뮤니티 정보</h4>
			<div id="commInfo">
				<span class="commInfoTag">운영자</span><span class="commInfoCon">${comInfo.get("COMMUNITY_CAPTAIN")}&nbsp;님</span><br>
				<span class="commInfoTag">개설날짜</span> <span class="commInfoCon">${comInfo.get("COMMUNITY_ESTABLISH_DATE")}</span>
				<br> <span class="commInfoTag">총 회원수</span><span
					class="commInfoCon"> ${memCnt}&nbsp;명</span> <br>
				<div style="margin-top: 30px;">
					<a
						href="com_detail.do?community_id=${comInfo.get('COMMUNITY_ID') }">커뮤니티
						상세보기</a>
				</div>
			</div>
		</li>
		<li style="padding-left: 10%; padding-right: 10%;"><c:choose>
				<c:when test="${memChk eq 'x' }">
					<h4 class='commInfoButton'>
						<a
							onclick="window.open('com_act_mem_form.do?community_id=${comInfo.get('COMMUNITY_ID') }', '가입 신청', 'width=500, height=600')">가입하기</a>
					</h4>
				</c:when>
				<c:when test="${memChk eq 'o' }">
					<h4 class='commInfoButton'>
						<a onclick="commOut()">탈퇴하기</a>
					</h4>
				</c:when>
			</c:choose> <c:choose>
				<c:when test="${memAuth eq 'cap'}">
					<h4 class='commInfoButton'>
						<a
							href="com_mem_list.do?community_id=${comInfo.get('COMMUNITY_ID') }">커뮤니티
							멤버</a>
					</h4>
					<h4 class='commInfoButton'>
						<a
							href="com_board.do?community_id=${comInfo.get('COMMUNITY_ID') }">게시판
							관리</a>
					</h4>
				</c:when>
			</c:choose></li>
	</ul>
</body>
</html>