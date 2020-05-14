<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"  />

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>

<head>
	
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	
	<!-- style by template -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/css/animate.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/css/flatpickr.min.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/css/line-awesome.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/css/line-awesome-font-awesome.min.css">
	<link href="${contextPath}/resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/lib/slick/slick.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/lib/slick/slick-theme.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/css/style.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/css/responsive.css">
	
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
  	
  	<!-- font -->
  	<link href="https://fonts.googleapis.com/css2?family=Bowlby+One+SC&display=swap" rel="stylesheet">
  	
  	<!-- session 로그인 정보 -->
	<%
		session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		String user_position=(String)session.getAttribute("user_position");
	%>
	
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<style>
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
	b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}

article, aside, details, figcaption, figure, footer, header, hgroup,
	menu, nav, section {
	display: block;
}

body {
	line-height: 1;
	background-color : white;
}

ol, ul {
	list-style: none;
}

blockquote, q {
	quotes: none;
}

blockquote:before, blockquote:after, q:before, q:after {
	content: '';
	content: none;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

/* General
		==================================== */
*, *:before, *:after {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}


body, input, textarea {
	font: 1em/1.5 'Noto Sans KR', sans-serif;
}

.container {
	max-width: 25em;
	margin: 2em auto;
	width: 95%;
}

.title {
	font-size: 22pt;
    padding: .2em 1.1em .5em;
    text-align: center;
    color: #323a45;
    border-radius: 5px 5px 0 0;
    text-align: left;
    font-family: 'Noto Sans KR', sans-serif;
    background-color: transparent;
    font-weight: bold;
}

/* Form
		==================================== */
.form ul {
	background: white;
	margin-bottom: 1em;
}

.form li {
	border: 1px solid #ccc;
	border-bottom: 0;
	margin-bottom: 0px;
	position: relative;
}

.form li:first-child {
	border-top: 0;
}

.form li:last-child {
	border-bottom: 1px solid #ccc;
}

label, input, textarea {
	display: block;
	border: 0;
}

input, textarea {
	width: 100%;
	height: 100%;
	padding: 2.25em 1em 1em;
	outline: 0;
}

textarea {
	height: 5em;
	resize: none;
}

label {
	font-size: .8125em; /* 13/16 */
	position: absolute;
	top: 1.23em;
	left: 1.23em;
	color: #5D5D5D;
	opacity: 1;
}

input[type="submit"] {
	background: #e44d3a;
	margin-bottom: 1em;
	color: white;
	border-radius: 3px;
	padding: .75em;
	-webkit-appearance: none;
	-webkit-transition: .333s ease -webkit-transform;
	transition: .333s ease transform;
}

input[type="submit"]:hover {
	-webkit-transform: scale(1.025);
	transform: scale(1.025);
	cursor: pointer;
}

input[type="submit"]:active {
	-webkit-transform: scale(.975);
	transform: scale(.975);
}
li select{
	color: #5d5d5d;
    margin-top: 20px;
    border-radius: 10px;
    width: 70%;
    margin-left: 10%;
    margin-right: 10%;
    margin-right: 1;
    text-align: center;
    float: none;
    height: 30px;
}
span.labelNumber{
	font-size : 30pt;
}
hr{
   width: 40%;
    text-align: left;
    float: left;
    margin-left: 28px;
    margin-top: -20px;
    color: #e44d3a;
    border: solid;
    border-top: 3px solid !important;
}

.col-2 hr, .col-3 hr{
	color : #E38544;
	text-align: center;
    border-top: 1px !important;
    margin-left: 30%;
    margin-right: 30%;
}

.row{
	text-align:center;
}
</style>

</head>

<body>
	<section>
		<h1 style="padding-bottom:2px; padding-top:20px; text-align:left; font-size:25px" class="title">커뮤니티 신청 내역</h1><br><hr><br>
			<c:choose>
				<c:when test="${estaListSize gt 0}">	<!-- gt : > -->  
					<div style="margin-top:-10px;padding-top:0px;padding-bottom: 00px;margin-bottom: -10px;font-size: 16px;font-weight: bold;" class="row">
						<div class="col-2">
							<h6>번호</h6><br><hr>
						</div>
						<div class="col-3">
							<h6>날짜</h6><br><hr>
						</div>
						<div class="col-3">
							<h6>이름</h6><br><hr>
						</div>
						<div class="col-2">
							<h6>분류</h6><br><hr>
						</div>
						<div class="col-2">
							<h6>상태</h6><br><hr>
						</div>
					</div>
					<c:forEach var="i" begin="1" end="${estaListSize}">
					<div style="padding-top:10px; padding-bottom:10px; font-size:15px" class="row">
						<div class="col-2">
							<h6>${i}</h6>
						</div>
						<div class="col-3">
                           	<h6>${estaList.get(i-1).get("COMMUNITY_ESTABLISH_DATE")}</h6>
						</div>
                        <div class="col-3">
	                        <h6>${estaList.get(i-1).get("COMMUNITY_NAME")}</h6>
	                    </div>
	                    <div class="col-2">
	                    	<h6>${estaList.get(i-1).get("COMMUNITY_CATEGORY")}</h6>
	                    </div>
	                    <div class="col-2">
	                        <h6>${estaList.get(i-1).get("COMMUNITY_ESTABLISH_STATUS")}</h6>
	                    </div>
	                </div>
	                </c:forEach>
				</c:when>
				<c:otherwise>
					<div id='noRequest' style='text-align: center;'>신청한 내역이 없습니다.</div>
				</c:otherwise>
			</c:choose>
	</section> 
	
	<!-- js by template -->
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/popper.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/flatpickr.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/lib/slick/slick.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/script.js"></script>
	
</body>
</html>