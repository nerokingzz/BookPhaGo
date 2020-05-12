<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"  />

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>

<head>
	<style>
		html, body, div, span, applet, object, iframe,
		h1, h2, h3, h4, h5, h6, p, blockquote, pre,
		a, abbr, acronym, address, big, cite, code,
		del, dfn, em, img, ins, kbd, q, s, samp,
		small, strike, strong, sub, sup, tt, var,
		b, u, i, center,
		dl, dt, dd, ol, ul, li,
		fieldset, form, label, legend,
		table, caption, tbody, tfoot, thead, tr, th, td,
		article, aside, canvas, details, embed, 
		figure, figcaption, footer, header, hgroup, 
		menu, nav, output, ruby, section, summary,
		time, mark, audio, video {
			margin: 0;
			padding: 0;
			border: 0;
			font-size: 100%;
			font: inherit;
			vertical-align: baseline;
		}
		
		article, aside, details, figcaption, figure, 
		footer, header, hgroup, menu, nav, section {
			display: block;
		}
		body {
			line-height: 1;
		}
		ol, ul {
			list-style: none;
		}
		blockquote, q {
			quotes: none;
		}
		blockquote:before, blockquote:after,
		q:before, q:after {
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
		 
		body {
		    background: #eaedf1;
		}
		 
		body, input, textarea {
		    font: 1em/1.5 Arial, Helvetica, sans-serif;
		}
		 
		.container {
		    max-width: 25em;
		    margin: 2em auto;
		    width: 95%;
		     
		}
		 
		.title {
		    font-size: 1.5em; 
		    padding: .5em 0;
		    text-align: center; 
		    background: #323a45;
		    color: white;
		    border-radius: 5px 5px 0 0;
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
		    height: 16em;
		    resize: none; 
		}
		
		label {
		    font-size: .8125em; /* 13/16 */
		    position: absolute; 
		    top: 1.23em;
		    left: 1.23em;
		    color: #f1773b;
		    opacity: 1;
		}
		
		input[type="submit"] {
		    background: #f1773b;
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
	</style>
</head>

<body>
	<section>
		<h1 class="title">개설신청</h1>
	    <form id="form" class="form" action="com_esta_request.do" method="post">
	    	<input type="hidden" name="community_captain" value="${user_id}">
			<input type="hidden" id="esta_current_info" name="community_establish_date">
			<input type="hidden" name="community_member_count" value="0">
			<input type="hidden" name="community_establish_status" value="진행중">
	        <ul>
	        	<li style="padding-left:20px">
	                <select style="color: #f1773b;" name="community_category">
						<option value="">--분류--</option>
						<option value="총류">총류</option> 
						<option value="철학">철학</option>
						<option value="종교">종교</option>
						<option value="사회과학">사회과학</option>
						<option value="자연과학">자연과학</option>
						<option value="기술과학">기술과학</option>
						<option value="예술">예술</option>
						<option value="언어">언어</option>
						<option value="문학">문학</option>
						<option value="역사">역사</option>
					</select>
	            </li>
	            <li>
	                <label for="name">커뮤니티 이름</label>
	                <input type="text" id="name" name="community_name" tabindex="1"/>
	            </li>
	            <li>
	                <label for="name">닉네임</label>
	                <input type="text" id="name" name="member_nickname" tabindex="1"/>
	            </li>
	            <li>
	                <label for="email">커뮤니티 목적</label>
	                <input type="text" id="email" name="community_aim" tabindex="2"/>
	            </li>
	            <li>
	                <label for="message">커뮤니티 설명</label>
	                <textarea id="message" name="community_description" tabindex="3"></textarea>
	            </li>
	        </ul>
	        <input type="submit" value="신청하기" id="submit" onclick="comPage();"/>
	    </form>
	</section>    

	<!-- script -->
	<script type="text/javascript">
		var date=new Date();
		var estaCurrent=date.getFullYear() + '/' + (date.getMonth()+1) + '/' + date.getDate();
		document.getElementById('esta_current_info').value=estaCurrent;
		
		function comPage() {
			opener.document.location.reload();
			self.close();
	
		}
	</script>
	
</body>
</html>