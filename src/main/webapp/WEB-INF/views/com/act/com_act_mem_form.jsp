<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"  />

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>

<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
	overflow: hidden;
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
	padding: 1.25em 1em 1em;
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
    margin-top: -11px;
    color: #e44d3a;
    border: solid;
}
</style>
</head>

<body>
	<section>
		<h1 class="title">가입신청</h1>
		<hr>
	    <form id="form" class="form" action="com_act_mem.do" method="post">
	    	<input type="hidden" name="member_id" value="${user_id}">
			<input type="hidden" name="community_id" value="${comInfo.get('COMMUNITY_ID') }">
			<input type="hidden" name="member_join_date" id="mem_current_info">
			<input type="hidden" name="member_position" value="일반">
			<input type="hidden" name="member_visit_count" value="0">
			<input type="hidden" name="member_article_count" value="0">
			<input type="hidden" name="member_reply_count" value="0">
	        <ul>
	   
	            <li>
	                <label for="name">닉네임</label><br>
	                <input style="padding-top:-40px" type="text" id="member_nickname" name="member_nickname" tabindex="1"/>
	            </li>
	            <li>
	                <input type="button" style="padding-top:-10px" value="중복확인" onclick="mem_nick_chk()">
	            </li>
	            <li>
	                <label for="email">가장 인상깊게 읽은 책</label><br>
	                <input type="text" id="email" name="member_answer1" tabindex="2"/>
	            </li>
	            <li>
	                <label for="message">한마디</label><br>
	                <textarea id="message" name="member_answer2" tabindex="3"></textarea>
	            </li>
	        </ul>
	        <input type="submit" value="가입하기" id="submit" onclick="memPage();"/>
	    </form>
	</section>    

	<!-- script -->
	<script type="text/javascript">
		function mem_nick_chk() {
			$(document).ready(function() {
				var member_nickname=$("#member_nickname").val();
				var community_id=${comInfo.get("COMMUNITY_ID")};
				
				$.ajax({
					url:"com_mem_nick_chk.do",
					data:{"member_nickname" : member_nickname, "community_id" : community_id},
					method:"POST",
					success:function(data) {
						if (data === 'o') {
							swal("사용 가능한 닉네임입니다.");
						} else {
							swal("사용 불가능한 닉네임입니다.");
						}
					}
				}) 
					
			})
		}
		
		function memPage() {
			swal('가입이 완료되었습니다');
			opener.document.location.reload();
			self.close();
	
		}
	</script>
	
	<!-- script -->
	<script type="text/javascript">
		var date=new Date();
		var memCurrent=date.getFullYear() + '/' + (date.getMonth()+1) + '/' + date.getDate();
		document.getElementById('mem_current_info').value=memCurrent;
	</script>
	
</body>
</html>