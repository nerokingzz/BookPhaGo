<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이라이브러리 첫 페이지</title>
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
	

<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>

<script type="text/javascript">
	$(document).ready(function() {
		var pageInfo='${pageInfo}';
		console.log(pageInfo);
		
		if (pageInfo == 'user_A') {
			alert("회원관리로 바로 이동");
			$("#nav-acc-tab").attr("class", "nav-item nav-link active");
			$("#nav-acc-tab").attr("aria-selected", "true");
			$("#nav-acc").attr("class", "tab-pane fade show active");
			
		} else if (pageInfo == 'book_A') {
			alert("도서관리로 바로 이동");
			$("#nav-status-tab").attr("class", "nav-item nav-link active");
			$("#nav-status-tab").attr("aria-selected", "true");
			$("#nav-status").attr("class", "tab-pane fade show active");
			
		} else if (pageInfo == 'book_status_A') {
			alert("현황관리로 바로이동");
			$("#nav-password-tab").attr("class", "nav-item nav-link active");
			$("#nav-password-tab").attr("aria-selected", "true");
			$("#nav-password").attr("class", "tab-pane fade show active");
			
		} else if (pageInfo == 'com_A') {
			alert("커뮤니티관리로 바로이동");
			$("#nav-acc-tab2").attr("class", "nav-item nav-link active");
			$("#nav-acc-tab2").attr("aria-selected", "true");
			$("#nav-acc2").attr("class", "tab-pane fade show active");
			
		} else if (pageInfo == 'dec_A') {
			alert("신고관리로 바로이동");
			$("#nav-status-tab2").attr("class", "nav-item nav-link active");
			$("#nav-status-tab2").attr("aria-selected", "true");
			$("#nav-status2").attr("class", "tab-pane fade show active");
			
		} else if (pageInfo == 'chat_A') {
			/* 0423 김민선 수정부 alert -> console.log 시작*/
			console.log("챗봇관리로 바로이동");
			/* 0423 김민선 수정부 alert -> console.log 끝*/
			logLoad();
			$("#nav-password-tab2").attr("class", "nav-item nav-link active");
			$("#nav-password-tab2").attr("aria-selected", "true");
			$("#nav-password2").attr("class", "tab-pane fade show active");
			
		} else if (pageInfo == 'rent_A') {
	         alert("도서대출로 바로 이동");
	         $("#nav-acc-tab3").attr("class", "nav-item nav-link active");
	         $("#nav-acc-tab3").attr("aria-selected", "true");
	         $("#nav-acc3").attr("class", "tab-pane fade show active");
	         
	      } else {
			$("#nav-acc-tab").attr("class", "nav-item nav-link active");
			$("#nav-acc-tab").attr("aria-selected", "true");
			$("#nav-acc").attr("class", "tab-pane fade show active");
		}
	})
	
	function user_A() {
		location.href="admin_main.do?page=user_A";
	}
	
	function book_A() {
		location.href="admin_main.do?page=book_A";
	}
	
	function book_status_A() {
		location.href="admin_main.do?page=book_status_A";
	}
	
	function com_A() {
		location.href="admin_main.do?page=com_A";
	}
	
	function dec_A() {
		location.href="admin_main.do?page=dec_A";
	}
	
	function chat_A() {
		location.href="admin_main.do?page=chat_A";
		
	}
	function rent_A() {
	      location.href="admin_main.do?page=rent_A";
	   }
	
	

</script>

<body>	

	<div class="wrapper">	
		<!-- header start -->
			<jsp:include page="../header.jsp"></jsp:include>
		<!-- header end -->
		<section class="profile-account-setting">
			<div class="container">
				<div class="account-tabs-setting">
					<div class="row">
						<div class="col-lg-3">
							<div class="acc-leftbar">
								<div class="nav nav-tabs" id="nav-tab" role="tablist">
									<a><b>관리자전용</b></a>
								    <a class="nav-item nav-link" id="nav-acc-tab" data-toggle="tab" href="#nav-acc" onclick="user_A()" role="tab" aria-controls="nav-acc" aria-selected="false"><i class="la la-cogs"></i>회원관리</a>
								    <a class="nav-item nav-link" id="nav-status-tab" data-toggle="tab" href="#nav-status" onclick="book_A()" role="tab" aria-controls="nav-status" aria-selected="false"><i class="fa fa-line-chart"></i>도서관리</a>
								    <a class="nav-item nav-link" id="nav-password-tab" data-toggle="tab" href="#nav-password-tab" onclick="book_status_A()" role="tab" aria-controls="nav-password" aria-selected="false"><i class="fa fa-lock"></i>현황관리</a>
								    <a class="nav-item nav-link" id="nav-acc-tab2" data-toggle="tab" href="#nav-acc" onclick="com_A()" role="tab" aria-controls="nav-acc" aria-selected="false"><i class="la la-cogs"></i>커뮤니티관리</a>
								    <a class="nav-item nav-link" id="nav-status-tab2" data-toggle="tab" href="#nav-status" onclick="dec_A()" role="tab" aria-controls="nav-status" aria-selected="false"><i class="fa fa-line-chart"></i>신고관리</a>
								    <a class="nav-item nav-link" id="nav-password-tab2" data-toggle="tab" href="#nav-password-tab" onclick="chat_A()" role="tab" aria-controls="nav-password" aria-selected="false"><i class="fa fa-android"></i>챗봇관리</a>
								    <a class="nav-item nav-link" id="nav-acc-tab3" data-toggle="tab" href="#nav-acc" onclick="rent_A()" role="tab" aria-controls="nav-acc" aria-selected="false"><i class="la la-cogs"></i>도서대출</a>
								    
								  </div>
							</div><!--acc-leftbar end-->
						</div>
						<div class="col-lg-9">
							<div class="tab-content" id="nav-tabContent">
								<div class="tab-pane fade" id="nav-acc" role="tabpanel" aria-labelledby="nav-acc-tab">
									<div class="acc-setting">
										<h3>회원관리</h3>
											
									</div><!--acc-setting end-->
								</div>
							  	<div class="tab-pane fade" id="nav-status" role="tabpanel" aria-labelledby="nav-status-tab">
							  		<div class="acc-setting">
							  			<h3>도서관리</h3>
							  			<jsp:include page="../book/adminlibrarylist.jsp"></jsp:include>
							  		</div><!--acc-setting end-->
							  	</div>
							  	<div class="tab-pane fade" id="nav-password" role="tabpanel" aria-labelledby="nav-password-tab">
							  		<div class="acc-setting">
										<h3>현황관리</h3>
									</div><!--acc-setting end-->
							  	</div>
								<div class="tab-pane fade" id="nav-acc2" role="tabpanel" aria-labelledby="nav-acc-tab">
									<div class="acc-setting">
										<h3>커뮤니티관리</h3>
										<jsp:include page="../com/esta/com_esta_request_list.jsp"></jsp:include>
									</div><!--acc-setting end-->
								</div>
							  	<div class="tab-pane fade" id="nav-status2" role="tabpanel" aria-labelledby="nav-status-tab">
							  		<div class="acc-setting">
							  			<h3>신고관리</h3>
							  			<jsp:include page="../mylib/declare/mylib_declare_request_list.jsp"></jsp:include>
							  		</div><!--acc-setting end-->
							  	</div>
							  	<div class="tab-pane fade" id="nav-password2" role="tabpanel" aria-labelledby="nav-password-tab">
							  		<div class="acc-setting">
										<h3>챗봇관리</h3>
										<jsp:include page="../chat/getRank.jsp" flush="true"></jsp:include>
									</div><!--acc-setting end-->
								
							  	</div>
							  	</div>
                          		<div class="tab-pane fade" id="nav-acc3" role="tabpanel" aria-labelledby="nav-acc-tab">
                          			 <div class="acc-setting">
                             			 <h3>도서대출</h3>
                                 <jsp:include page="../book/adminrentandreturn.jsp"></jsp:include>
                           		</div><!--acc-setting end-->
							</div>
						</div>
					</div>
				</div><!--account-tabs-setting end-->
			</div>
		</section>
	<!-- footer start -->
	<jsp:include page="../footer.jsp"></jsp:include>
	<!-- footer end -->
	</div><!--theme-layout end-->

<script>
	var test=$("#nav-password-tab").attr("href");
	console.log(test);
</script>
<script src = "resources/chat/js/log.js" ></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/popper.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/flatpickr.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/lib/slick/slick.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/script.js"></script>


</body>
</html>