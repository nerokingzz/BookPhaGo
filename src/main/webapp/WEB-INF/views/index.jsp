<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"  />

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>

<head>
	<title><spring:message code="site.title" text="북파고"/></title>
	
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
	
	<style>
		*{margin:0;padding:0;}
	  	ul,li{list-style:none;}
	  	#slide{height:300px;position:relative;overflow:hidden;}
	  	#slide ul{width:400%;height:100%;transition:1s;}
	  	#slide ul:after{content:"";display:block;clear:both;}
	  	#slide li{float:left;width:25%;height:100%;}
	  	#slide li:nth-child(1){background:#faa;}
	  	#slide li:nth-child(2){background:#ffa;}
	  	#slide li:nth-child(3){background:#faF;}
	  	#slide li:nth-child(4){background:#aaf;}
	  	#slide input{display:none;}
	  	#slide label{display:inline-block;vertical-align:middle;width:10px;height:10px;border:2px solid #666;background:#fff;transition:0.3s;border-radius:50%;cursor:pointer;}
	  	#slide .pos{text-align:center;position:absolute;bottom:10px;left:0;width:100%;text-align:center;}
	  	#pos1:checked~ul{margin-left:0%;}
	  	#pos2:checked~ul{margin-left:-100%;}
	  	#pos3:checked~ul{margin-left:-200%;}
	  	#pos4:checked~ul{margin-left:-300%;}
	  	#pos1:checked~.pos>label:nth-child(1){background:#666;}
	  	#pos2:checked~.pos>label:nth-child(2){background:#666;}
	  	#pos3:checked~.pos>label:nth-child(3){background:#666;}
	  	#pos4:checked~.pos>label:nth-child(4){background:#666;}
	</style>
</head>

<body>

	<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
	
		<section class="banner">
			<div class="bannerimage">
			<img src="${contextPath}/resources/bootstrap/images/about.png" alt="image">
		</div>
			<div class="bennertext">
			<div class="innertitle">
			<h2>Bookphago</h2>
			<p><spring:message code="mid.banner"  text="당신만을 위한 똑똑한 책 어플리케이션을 만나보세요!"/></p><br>
				<div class="search-bar">
						<form>
							<input type="text" name="search" placeholder="Search...">
							<button type="submit"><i class="la la-search"></i></button>
						</form>
					</div><!--search-bar end-->              
               </div>
            </div>
		</section>	
		 <section class="ftco-section ftco-no-pt ftco-no-pb">
    	<div class="container">
    		<div class="row">
    			<div class="col-md-12">
    				<div class="category-wrap">
    					<div class="row no-gutters">
    						<div class="col-md-13">
    							<div class="top-category text-center no-border-left">
    								<h3><a id = "index-mid-btn" href="#"><spring:message code="mid.borrow"  text="대출 현황"/></a></h3>
    							</div>
    						</div>
    						<div class="col-md-13">
    							<div class="top-category text-center no-border-left">
    								<h3><a id = "index-mid-btn" href="#"><spring:message code="mid.overdue"  text="연체 현황"/></a></h3>
    							</div>
    						</div>
    						<div class="col-md-13">
    							<div class="top-category text-center">
    								<h3><a id = "index-mid-btn" href="#"><spring:message code="mid.comm"   text="커뮤니티"/></a></h3>
    							</div>
    						</div>
    						<div class="col-md-13">
    							<div class="top-category text-center">
    								<h3><a id = "index-mid-btn" href="#"><spring:message code="mid.rate"  text="도서 평가"/></a></h3>
    							</div>
    						</div>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>
		<section class="profile-account-setting2">
		<div class="container">
			<div class="acount-tabs-setting">
				<div class="row">
					<div class="col-lg-13">
						<div style="padding-top:40px;" id="slide">
						  <input type="radio" name="pos" id="pos1" checked>
						  <input type="radio" name="pos" id="pos2">
						  <input type="radio" name="pos" id="pos3">
						  <input type="radio" name="pos" id="pos4">
						  <ul>
						    <li></li>
						    <li></li>
						    <li></li>
						    <li></li>
						  </ul>
						  <p class="pos">
						    <label for="pos1"></label>
						    <label for="pos2"></label>
						    <label for="pos3"></label>
						    <label for="pos4"></label>
						  </p>
						</div>
					</div>
						<!--acc-leftbar end-->
					<div class="col-lg-14">
						<div class="tab-content" id="nav-tabContent">
							<div class="tab-pane fade show active" id="nav-acc"
								role="tabpanel" aria-labelledby="nav-acc-tab">
								<div class="acc-setting" style='text-align: center;border: 4px solid white;' >
									<h3><spring:message code="mid.cal"  text="캘린더"/></h3>
									<br> <img style = 'float:none;' src="${contextPath}/resources/bootstrap/images/calendar.png"
										alt="image">
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	
	<section class="profile-account-setting3">
		<div class="container">
			<div class="acount-tabs-setting">
				<div class="row">
					<div class="col-lg-15">
						<div class="tab-content" id="nav-tabContent">
							<div class="tab-pane fade show active" id="nav-acc"
								role="tabpanel" aria-labelledby="nav-acc-tab">
								<div class="acc-setting2" style='text-align: center;border: 4px solid white;' >
									<h3>사서의 추천 도서</h3>
									<br> <img class='exIndex' style = 'float:none;' src="${contextPath}/resources/bootstrap/images/ex2.png"
										alt="image">
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-15">
						<div class="tab-content" id="nav-tabContent">
							<div class="tab-pane fade show active" id="nav-acc"
								role="tabpanel" aria-labelledby="nav-acc-tab">
								<div class="acc-setting2" style='text-align: center;border: 4px solid white;' >
									<h3>사서의 추천 도서</h3>
									<br> <img class='exIndex' style = 'float:none;' src="${contextPath}/resources/bootstrap/images/ex1.png"
										alt="image">
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-15">
						<div class="tab-content" id="nav-tabContent">
							<div class="tab-pane fade show active" id="nav-acc"
								role="tabpanel" aria-labelledby="nav-acc-tab">
								<div class="acc-setting2" style='text-align: center;border: 4px solid white;' >
									<h3>이 달의 독서왕</h3>
									<br> <img class='exIndex' style = 'float:none;' src="${contextPath}/resources/bootstrap/images/ex3.png"
										alt="image">
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-15">
						<div class="tab-content" id="nav-tabContent">
							<div class="tab-pane fade show active" id="nav-acc"
								role="tabpanel" aria-labelledby="nav-acc-tab">
								<div class="acc-setting2" style='text-align: center;border: 4px solid white;' >
									<h3>이 달의 우수 커뮤니티</h3>
									<br> <img class='exIndex' style = 'float:none;' src="${contextPath}/resources/bootstrap/images/ex4.png"
										alt="image">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	
	<!-- script -->
	<script>
		$('select[name=locale]').change(function() {
			var lang = $(this).val();
			if (lang == "") {
				
			} else {
				location.href = "${contextPath}/locale.do?locale=" + lang;
			}
		});
	</script>

	<!-- js by template -->
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/popper.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/flatpickr.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/lib/slick/slick.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/script.js"></script>
	
</body>
</html>