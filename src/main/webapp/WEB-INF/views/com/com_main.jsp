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

	<style>
		*{margin:0;padding:0;}
	  	ul,li{list-style:none;}
	  	#slide{height:300px;position:relative;overflow:hidden;}
	  	#slide ul{width:400%;height:100%;transition:1s;}
	  	#slide ul:after{content:"";display:block;clear:both;}
	  	#slide li{float:left;width:25%;height:100%;}
	  	#slide li:nth-child(1){background:url(/resources/images/com_banner1.jpg) no-repeat;}
	  	#slide li:nth-child(2){background:url(/resources/images/com_banner2.jpg) no-repeat;}
	  	#slide li:nth-child(3){background:url(/resources/images/com_banner3.jpg) no-repeat;}
	  	#slide input{display:none;}
	  	#slide label{display:inline-block;vertical-align:middle;width:10px;height:10px;border:2px solid #666;background:#fff;transition:0.3s;border-radius:50%;cursor:pointer;}
	  	#slide .pos{text-align:center;position:absolute;bottom:10px;left:0;width:100%;text-align:center;}
	  	#pos1:checked~ul{margin-left:0%;}
	  	#pos2:checked~ul{margin-left:-100%;}
	  	#pos3:checked~ul{margin-left:-200%;}
	  	#pos1:checked~.pos>label:nth-child(1){background:#666;}
	  	#pos2:checked~.pos>label:nth-child(2){background:#666;}
	  	#pos3:checked~.pos>label:nth-child(3){background:#666;}
	</style>

</head>

<body>

	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>

	<div class="main-section">
		<div class="container">
			<div class="main-section-data">
			
				<div style="padding-top:40px;" id="slide">
				  <input type="radio" name="pos" id="pos1" checked>
				  <input type="radio" name="pos" id="pos2">
				  <input type="radio" name="pos" id="pos3">
				  <ul>
				    <li></li>
				    <li></li>
				    <li></li>
				  </ul>
				  <p class="pos">
				    <label for="pos1"></label>
				    <label for="pos2"></label>
				    <label for="pos3"></label>
				  </p>
				</div>
			
				<div class="row">
					<div class="col-lg-9" style="padding-top: 20px">
						<div class="search-sec">
							<div class="container">
								<div class="search-box">
									<form action="community_search.do" method="get">
										<input required type="text" name="search_keyword" placeholder="커뮤니티 검색">
										<button type="submit">검색</button>
									</form>
								</div>
								<!--search-box end-->
							</div>
						</div>
						<!--search-sec end-->
					</div>
					<div class="col-lg-3" style="padding-top: 35px">
						<h3>
							<a onclick="window.open('com_esta_form.do', '개설 신청', 'width=400, height=550')">커뮤니티 개설 신청</a>
						</h3>
						<hr>
						<h3>
							<a onclick="window.open('com_esta_request_list_user.do?user_id=${user_id }', '신청 내역', 'width=600, height=400')">커뮤니티 신청 내역</a>
						</h3>
					</div>
				</div>
			</div>
		</div>
	</div>

	<main>
		<div class="main-section">
			<div class="container">
				<div class="main-section-data">
					<div class="row">
						<div class="col-lg-9">
							<div class="main-section-data">
								<div style="padding-top:-100px; padding-top:-100px" class="filter-secs">
									<section class="banner">
										<div class="bannerimage">
											<img src="${contextPath}/resources/bootstrap/images/about.png" alt="image">
										</div>
										<div class="bennertext">
											<div class="innertitle">
												<h2 style="text-align:center; font-size:30px; font-family:'Nanum Gothic', sans-serif;">커뮤니티 활동을 즐겨보세요!</h2>
            								</div>
								           </div>
									</section>
									<div class="company-title">
										<h3>추천 커뮤니티</h3>
									</div><!--company-title end-->
									<div class="companies-list">
										<div class="row">
											<c:forEach var="i" begin="1" end="${comRandomListSize }">
											<div class="col-lg-3 col-md-3 col-sm-3 col-3">
												<div class="company_profile_info">
													<div class="company-up-info" style="padding-top:20px">
														<img src="${contextPath}/resources/images/comm_icon.png" alt="">
														<h3>${comRandomList.get(i-1).get("COMMUNITY_NAME") }</h3>
														<h4>${comRandomList.get(i-1).get("COMMUNITY_CATEGORY") }</h4>
														<h4>${comRandomList.get(i-1).get("COMMUNITY_AIM") }</h4>
													</div>
													<a href="com_act_home.do?community_id=${comRandomList.get(i-1).get('COMMUNITY_ID')}"><h3>방문하기</h3></a>
												</div><!--company_profile_info end-->
											</div>
											</c:forEach>
										</div>
									</div>
							

			  					</div>
							</div><!-- main-section-data end-->
						</div>
						<div class="col-lg-3">
							<div class="right-sidebar">
								<!--widget-about end-->
								<div class="widget widget-jobs">
									<div class="sd-title">
										<h3>나의 커뮤니티</h3>
									</div>
									<div class="jobs-list">
										<div class="job-info">
											<c:forEach var="i" begin="1" end="${myComListsSize }">
												<div class="job-details">
													<a href="com_act_home.do?community_id=${myComLists.get(i-1).getCommunity_id()}"><h3>${myComLists.get(i-1).getCommunity_name()}</h3></a>
												</div>
											</c:forEach>												
										</div>
									</div>
									<!--jobs-list end-->
								</div>
								<!--widget-jobs end-->
								<div class="widget widget-jobs">
									<a onclick="window.open('com_esta_form.do', '개설 신청', 'width=400, height=550')"><img src="${contextPath }/resources/images/comm_banner.jpg"></a>
								</div>
								<!--widget-jobs end-->
							</div>
							<!--right-sidebar end-->
						</div>
					</div>
				</div>
				<!-- main-section-data end-->
			</div>
		</div>
	</main>

	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>

	<!-- js by template -->
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/popper.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/flatpickr.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/lib/slick/slick.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/script.js"></script>
	
</body>
</html>