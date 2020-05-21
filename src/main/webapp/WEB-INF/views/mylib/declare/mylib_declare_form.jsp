<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"  />

<% request.setCharacterEncoding("UTF-8"); %>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<!DOCTYPE html>
<html>

<head>

	<style>

		
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
    margin-top: -11px;
    color: #e44d3a;
    border: solid;
}
</style>

</head>

<body>
		<form id="form" class="form" action="mylib_declare_request.do" method="post" enctype="multipart/form-data">
	    	<input type="hidden" id="dec_current_info" name="declare_date">
			<input type="hidden" name="do_user" value="${user_id}">
			<input type="hidden" name="declare_status" value="진행중">
	        <ul>
	        	<li style="padding-left:20px;padding-bottom: 15px;">
	        	<label for="category">분류</label><br>
	                <select style="padding-left:20px;" name="declare_category">
						<option value="">선택해주세요</option>
						<option value="게시글">게시글</option> 
						<option value="답글">답글</option>
						<option value="채팅">채팅</option>
						<option value="기타">기타</option>
					</select>
	            </li>
	            <li>
	                <label for="name">대상 아이디</label>
	                <input type="text" id="name" name="be_done_user" tabindex="1"/>
	            </li>
	            <li>
	                <label for="email">이미지 첨부</label>
	                <input type="file" id="email" name="declare_image_data" tabindex="2"/>
	            </li>
	            <li>
	                <label for="message">신고 사유</label>
	                <textarea id="message" name="declare_reason" tabindex="3"></textarea>
	            </li>
	        </ul>
	        <input type="submit" value="신고하기" id="submit" onclick="decPage();"/>
	    </form>
	
	<!-- script -->
	<script type="text/javascript">
		var date=new Date();
		var decCurrent=date.getFullYear() + '/' + (date.getMonth()+1) + '/' + date.getDate();
		document.getElementById('dec_current_info').value=decCurrent;
		
		function decPage() {
			swal('접수가 완료되었습니다');	
			opener.document.location.reload();
			
		}
		
	</script>
	
</body>
</html>