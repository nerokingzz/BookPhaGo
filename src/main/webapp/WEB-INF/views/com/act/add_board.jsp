<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"  />

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>

<head>

	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>

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
	width: 50%;
    text-align: left;
    float: left;
    margin-left: 35px;
    margin-top: -11px;
    color: #e44d3a;
    border: solid;
}
	</style>
</head>

<body>
	<section>
		<h1 class="title">게시판 추가</h1>
		<hr>
	    <form id="form" class="form" action="add_board.do" method="post">
	    	<input type="hidden" name="community_id" value="${comInfo.get('COMMUNITY_ID')}">
			<input type="hidden" name="board_article_count" value="0">
			<input type="hidden" name="board_status" value="x">
	        <ul>
	        	<li style="padding-left:20px;padding-bottom: 15px;">
	        	<label for="category">분류</label><br>
	                <select required style="padding-left:20px;" name="board_category">
						<option value="">선택해주세요</option>
						<option value="BD000">일반</option> 
						<option value="BD001">투표</option>
					</select>
	            </li>
	            <li>
	                <label for="name">게시판 이름</label>
	                <input required type="text" id="name" name="board_name" tabindex="1"/>
	            </li>
	        </ul>
	        <input type="submit" value="추가하기" id="submit" onclick="comPage();"/>
	    </form>
	</section>
	
	<script type="text/javascript">
		function comPage() {
			opener.document.location.reload();
			self.close();
		}
		
		$(document).ready(function(){
		    $("[name=board_name]").attr("required", true);
		})
	</script>
	
</body>
</html>