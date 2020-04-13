<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>WorkWise Html Template</title>
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


<body>
	

	<div class="wrapper">
		


		<header>
			<div class="container">
				<div class="header-data">
					<div class="logo pd-btm">
						<a href="index.html" title=""><img src="${contextPath}/resources/bootstrap/images/logo.png" alt=""></a>
					</div><!--logo end-->
					<div class="forum-bar">
						<h2>Forum</h2>
						<ul>
							<li><a href="#" title="">Tags</a></li>
							<li><a href="#" title="">Users</a></li>
							<li><a href="#" title="" class="ask-question">Ask a question</a></li>
						</ul>
					</div><!--search-bar end-->
					<div class="login_register">
						<ul>
							<li><a href="sign-in.html" title="">Login</a></li>
							<li><a href="sign-in.html" title="">Register</a></li>
						</ul>
					</div><!--login_register end-->
				</div><!--header-data end-->
			</div>
		</header>	

		<!-- 		
		<section class="forum-sec">
			<div class="container">
				<div class="forum-links">
					<ul>
						<li class="active"><a href="#" title="">Latest</a></li>
						<li><a href="#" title="">Unanswered</a></li>
						<li><a href="#" title="">Treading</a></li>
						<li><a href="#" title="">Popular This Week</a></li>
						<li><a href="#" title="">Popular of Month</a></li>
					</ul>
				</div>
				<div class="forum-links-btn">
					<a href="#" title=""><i class="fa fa-bars"></i></a>
				</div>
			</div>
		</section>
		 -->
		

		<section class="forum-page">
			<div class="container">
				<div class="forum-questions-sec">
					<div class="row">
											<div class="col-lg-4">
							<div class="widget widget-user">
								<h3 class="title-wd">관리자 페이지</h3>
								<ul>
									<li>
										<div class="usr-msg-details">
											<div class="usr-mg-info">
												<h3>회원 관리</h3>
											</div><!--usr-mg-info end-->
										</div>
									</li>
									<li>
										<div class="usr-msg-details">
											<div class="usr-mg-info">
												<h3>현황 조회</h3>
											</div><!--usr-mg-info end-->
										</div>
									</li>
									<li>
										<div class="usr-msg-details">
											<div class="usr-mg-info">
												<h3>도서 관리</h3>
											</div><!--usr-mg-info end-->
										</div>
									</li>
									<li>
										<div class="usr-msg-details">
											<div class="usr-mg-info">
												<h3>커뮤니티 관리</h3>
											</div><!--usr-mg-info end-->
										</div>
									</li>
									<li>
										<div class="usr-msg-details">
											<div class="usr-mg-info">
												<h3>신고 관리</h3>
											</div><!--usr-mg-info end-->
										</div>
									</li>
									<li>
										<div class="usr-msg-details">
											<div class="usr-mg-info">
												<h3>챗봇 관리</h3>
											</div><!--usr-mg-info end-->
										</div>
									</li>
									<li>
										<div class="usr-msg-details">
											<div class="usr-mg-info">
												<h3>권한 관리</h3>
											</div><!--usr-mg-info end-->
										</div>
									</li>
									<li>
										<div class="usr-msg-details">
											<div class="usr-mg-info">
												<h3>코드 관리</h3>
											</div><!--usr-mg-info end-->
										</div>
									</li>
									
								</ul>
							</div><!--widget-user end-->
						</div>
						<div class="col-lg-8">
							<div class="forum-questions">
							
								<div class="usr-question">
									<div class="usr_img">
										<img src="${contextPath}/resources/bootstrap/images/resources/usrr-img1.png" alt="">
									</div>
									<div class="usr_quest">
										<h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h3>
										<ul class="react-links">
											<li><a href="#" title=""><i class="fas fa-heart"></i> Vote 150</a></li>
											<li><a href="#" title=""><i class="fas fa-comment-alt"></i> Comments  15</a></li>
											<li><a href="#" title=""><i class="fas fa-eye"></i> Views  50</a></li>
										</ul>
										<ul class="quest-tags">
											<li><a href="#" title="">Work</a></li>
											<li><a href="#" title="">Php</a></li>
											<li><a href="#" title="">Design</a></li>
										</ul>
									</div>
									<span class="quest-posted-time"><i class="fa fa-clock-o"></i>3 min ago</span>
								</div>
								<!-- 
								<div class="usr-question">
									<div class="usr_img">
										<img src="${contextPath}/resources/bootstrap/images/resources/m-img2.png" alt="">
									</div>
									<div class="usr_quest">
										<h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h3>
										<ul class="react-links">
											<li><a href="#" title=""><i class="fas fa-heart"></i> Vote 150</a></li>
											<li><a href="#" title=""><i class="fas fa-comment-alt"></i> Comments  15</a></li>
											<li><a href="#" title=""><i class="fas fa-eye"></i> Views  50</a></li>
										</ul>
										<ul class="quest-tags">
											<li><a href="#" title="">Work</a></li>
											<li><a href="#" title="">Php</a></li>
											<li><a href="#" title="">Design</a></li>
										</ul>
									</div>
									<span class="quest-posted-time"><i class="fa fa-clock-o"></i>3 min ago</span>
								</div>
								<div class="usr-question">
									<div class="usr_img">
										<img src="${contextPath}/resources/bootstrap/images/resources/m-img3.png" alt="">
									</div>
									<div class="usr_quest">
										<h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h3>
										<ul class="react-links">
											<li><a href="#" title=""><i class="fas fa-heart"></i> Vote 150</a></li>
											<li><a href="#" title=""><i class="fas fa-comment-alt"></i> Comments  15</a></li>
											<li><a href="#" title=""><i class="fas fa-eye"></i> Views  50</a></li>
										</ul>
										<ul class="quest-tags">
											<li><a href="#" title="">Work</a></li>
											<li><a href="#" title="">Php</a></li>
											<li><a href="#" title="">Design</a></li>
										</ul>
									</div>
									<span class="quest-posted-time"><i class="fa fa-clock-o"></i>3 min ago</span>
								</div>
								<div class="usr-question">
									<div class="usr_img">
										<img src="${contextPath}/resources/bootstrap/images/resources/m-img4.png" alt="">
									</div>
									<div class="usr_quest">
										<h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h3>
										<ul class="react-links">
											<li><a href="#" title=""><i class="fas fa-heart"></i> Vote 150</a></li>
											<li><a href="#" title=""><i class="fas fa-comment-alt"></i> Comments  15</a></li>
											<li><a href="#" title=""><i class="fas fa-eye"></i> Views  50</a></li>
										</ul>
										<ul class="quest-tags">
											<li><a href="#" title="">Work</a></li>
											<li><a href="#" title="">Php</a></li>
											<li><a href="#" title="">Design</a></li>
										</ul>
									</div>
									<span class="quest-posted-time"><i class="fa fa-clock-o"></i>3 min ago</span>
								</div>
								<div class="usr-question">
									<div class="usr_img">
										<img src="${contextPath}/resources/bootstrap/images/resources/m-img5.png" alt="">
									</div>
									<div class="usr_quest">
										<h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h3>
										<ul class="react-links">
											<li><a href="#" title=""><i class="fas fa-heart"></i> Vote 150</a></li>
											<li><a href="#" title=""><i class="fas fa-comment-alt"></i> Comments  15</a></li>
											<li><a href="#" title=""><i class="fas fa-eye"></i> Views  50</a></li>
										</ul>
										<ul class="quest-tags">
											<li><a href="#" title="">Work</a></li>
											<li><a href="#" title="">Php</a></li>
											<li><a href="#" title="">Design</a></li>
										</ul>
									</div>
									<span class="quest-posted-time"><i class="fa fa-clock-o"></i>3 min ago</span>
								</div>
								<div class="usr-question">
									<div class="usr_img">
										<img src="${contextPath}/resources/bootstrap/images/resources/m-img6.png" alt="">
									</div>
									<div class="usr_quest">
										<h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h3>
										<ul class="react-links">
											<li><a href="#" title=""><i class="fas fa-heart"></i> Vote 150</a></li>
											<li><a href="#" title=""><i class="fas fa-comment-alt"></i> Comments  15</a></li>
											<li><a href="#" title=""><i class="fas fa-eye"></i> Views  50</a></li>
										</ul>
										<ul class="quest-tags">
											<li><a href="#" title="">Work</a></li>
											<li><a href="#" title="">Php</a></li>
											<li><a href="#" title="">Design</a></li>
										</ul>
									</div>
									<span class="quest-posted-time"><i class="fa fa-clock-o"></i>3 min ago</span>
								</div>
								<div class="usr-question">
									<div class="usr_img">
										<img src="${contextPath}/resources/bootstrap/images/resources/m-img7.png" alt="">
									</div>
									<div class="usr_quest">
										<h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h3>
										<ul class="react-links">
											<li><a href="#" title=""><i class="fas fa-heart"></i> Vote 150</a></li>
											<li><a href="#" title=""><i class="fas fa-comment-alt"></i> Comments  15</a></li>
											<li><a href="#" title=""><i class="fas fa-eye"></i> Views  50</a></li>
										</ul>
										<ul class="quest-tags">
											<li><a href="#" title="">Work</a></li>
											<li><a href="#" title="">Php</a></li>
											<li><a href="#" title="">Design</a></li>
										</ul>
									</div>
									<span class="quest-posted-time"><i class="fa fa-clock-o"></i>3 min ago</span>
								</div>
							</div>
							-->
							<nav aria-label="Page navigation example" class="full-pagi">
							<ul class="pagination">
								<li class="page-item"><a class="page-link pvr" href="#">Previous</a></li>
								<li class="page-item"><a class="page-link active" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item"><a class="page-link" href="#">6</a></li>
								<li class="page-item"><a class="page-link pvr" href="#">Next</a></li>
							</ul>
							</nav>
						</div>

					</div>
				</div><!--forum-questions-sec end-->
			</div>
		</section><!--forum-page end-->

		<footer>
			<div class="footy-sec mn no-margin">
				<div class="container">
					<ul>
						<li><a href="help-center.html" title="">Help Center</a></li>
						<li><a href="about.html" title="">About</a></li>
						<li><a href="#" title="">Privacy Policy</a></li>
						<li><a href="#" title="">Community Guidelines</a></li>
						<li><a href="#" title="">Cookies Policy</a></li>
						<li><a href="#" title="">Career</a></li>
						<li><a href="forum.html" title="">Forum</a></li>
						<li><a href="#" title="">Language</a></li>
						<li><a href="#" title="">Copyright Policy</a></li>
					</ul>
					<p><img src="${contextPath}/resources/bootstrap/images/copy-icon2.png" alt="">Copyright 2019</p>
					<img class="fl-rgt" src="${contextPath}/resources/bootstrap/images/logo2.png" alt="">
				</div>
			</div>
		</footer>


		<div class="overview-box" id="question-box">
			<div class="overview-edit">
				<h3>Ask a Question</h3>
				<form>
					<input type="text" name="question" placeholder="Type Question Here">
					<input type="text" name="tags" placeholder="Tags">
					<textarea placeholder="Description"></textarea>
					<button type="submit" class="save">Submit</button>
					<button type="submit" class="cancel">Cancel</button>
				</form>
				<a href="#" title="" class="close-box"><i class="la la-close"></i></a>
			</div><!--overview-edit end-->
		</div><!--overview-box end-->

	</div><!--theme-layout end-->



<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/popper.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/flatpickr.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/lib/slick/slick.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/script.js"></script>


</body>
</html>