<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>신고 양식 작성</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
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
</head>

	<%
		session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		String user_position=(String)session.getAttribute("user_position");
	%>

<body>
	<div class="dff-tab current" id="tab-3">
		<form action="mylib_declare_request.do" method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="col-lg-12 no-pdd">
					<div class="sn-field">
						<input style="width:100%;padding:0 15px 0 40px;color:#b2b2b2;font-size:14px;border:1px solid #e5e5e5;" type="text" name="be_done_user" placeholder="상대 아이디">
					</div>
				</div>
				<div class="col-lg-12 no-pdd">
					<div class="sn-field">
						<select style="width: 100%;padding: 0 15px 0 40px;color: #b2b2b2;font-size: 14px;border: 1px solid #e5e5e5;" name="declare_category">
							<option value="DC">분류</option>
							<option value="DC000">게시글</option> 
							<option value="BO001">답글</option>
							<option value="BO002">채팅</option>
							<option value="BO003">기타</option>
						</select>
					</div>
				</div>
				<div class="col-lg-12 no-pdd">
					<div class="sn-field">
						<input type="text" style="width:100%;padding:0 15px 0 40px;color:#b2b2b2;font-size:14px;border:1px solid #e5e5e5;" name="declare_reason" placeholder="신고 이유">
					</div>
				</div>
				<div class="col-lg-12 no-pdd">
					<div class="sn-field">
						<input style="width:100%;padding:0 15px 0 40px;color:#b2b2b2;font-size:14px;border:1px solid #e5e5e5;" type="file" name="declare_image_data">
					</div>
				</div>
				<div class="col-lg-12 no-pdd">
					<div class="sn-field">
						<input type="hidden" id="current_info" name="declare_date">
						<input type="hidden" name="do_user" value="${user_id}">
						<input type="hidden" name="declare_status" value="진행중">
						<input type="submit" value="신고하기">
						<input type="reset" value="다시작성">
					</div>
				</div>
			</div>
		</form>
	</div><!--dff-tab end-->
	
	<script src="resources/mylib/js/utils.js"></script>
	
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/popper.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/flatpickr.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/lib/slick/slick.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/script.js"></script>

</body>
</html>