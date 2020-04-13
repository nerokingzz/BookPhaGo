<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>인덱스 연습하기</title>
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
		


		<header>
			<div class="container">
				<div class="header-data">
					<div class="logo">
						<a href="index.html" title=""><img src="${contextPath}/resources/bootstrap/images/logo.png" alt=""></a>
					</div><!--logo end-->
					<nav>
						<ul>
							<li>
								<a href="index.html" title="">
									<span><img src="${contextPath}/resources/bootstrap/images/icon1.png" alt=""></span>
									홈
								</a>
							</li>
							<li>
								<a href="companies.html" title="">
									<span><img src="${contextPath}/resources/bootstrap/images/icon2.png" alt=""></span>
									도서
								</a>
								<ul>
									<li><a href="companies.html" title="">Companies</a></li>
									<li><a href="company-profile.html" title="">Company Profile</a></li>
								</ul>
							</li>
							<li>
								<a href="projects.html" title="">
									<span><img src="${contextPath}/resources/bootstrap/images/icon3.png" alt=""></span>
									커뮤니티
								</a>
							</li>
							<li>
								<a href="#" title="" class="not-box-openm">
									<span><img src="${contextPath}/resources/bootstrap/images/icon6.png" alt=""></span>
									마이 라이브러리
								</a>
								<div class="notification-box msg" id="message">
									<div class="nt-title">
										<h4>Setting</h4>
										<a href="#" title="">Clear all</a>
									</div>
									<div class="nott-list">
										<div class="notfication-details">
							  				<div class="noty-user-img">
							  					<img src="${contextPath}/resources/bootstrap/images/resources/ny-img1.png" alt="">
							  				</div>
							  				<div class="notification-info">
							  					<h3><a href="messages.html" title="">Jassica William</a> </h3>
							  					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do.</p>
							  					<span>2 min ago</span>
							  				</div><!--notification-info -->
						  				</div>
						  				<div class="notfication-details">
							  				<div class="noty-user-img">
							  					<img src="${contextPath}/resources/bootstrap/images/resources/ny-img2.png" alt="">
							  				</div>
							  				<div class="notification-info">
							  					<h3><a href="messages.html" title="">Jassica William</a></h3>
							  					<p>Lorem ipsum dolor sit amet.</p>
							  					<span>2 min ago</span>
							  				</div><!--notification-info -->
						  				</div>
						  				<div class="notfication-details">
							  				<div class="noty-user-img">
							  					<img src="${contextPath}/resources/bootstrap/images/resources/ny-img3.png" alt="">
							  				</div>
							  				<div class="notification-info">
							  					<h3><a href="messages.html" title="">Jassica William</a></h3>
							  					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempo incididunt ut labore et dolore magna aliqua.</p>
							  					<span>2 min ago</span>
							  				</div><!--notification-info -->
						  				</div>
						  				<div class="view-all-nots">
						  					<a href="messages.html" title="">View All Messsages</a>
						  				</div>
									</div><!--nott-list end-->
								</div><!--notification-box end-->
							</li>
							<li>
								<a href="#" title="" class="not-box-open">
									<span><img src="${contextPath}/resources/bootstrap/images/icon7.png" alt=""></span>
									Notification
								</a>
								<div class="notification-box noti" id="notification">
									<div class="nt-title">
										<h4>Setting</h4>
										<a href="#" title="">Clear all</a>
									</div>
									<div class="nott-list">
										<div class="notfication-details">
							  				<div class="noty-user-img">
							  					<img src="${contextPath}/resources/bootstrap/images/resources/ny-img1.png" alt="">
							  				</div>
							  				<div class="notification-info">
							  					<h3><a href="#" title="">Jassica William</a> Comment on your project.</h3>
							  					<span>2 min ago</span>
							  				</div><!--notification-info -->
						  				</div>
						  				<div class="notfication-details">
							  				<div class="noty-user-img">
							  					<img src="${contextPath}/resources/bootstrap/images/resources/ny-img2.png" alt="">
							  				</div>
							  				<div class="notification-info">
							  					<h3><a href="#" title="">Jassica William</a> Comment on your project.</h3>
							  					<span>2 min ago</span>
							  				</div><!--notification-info -->
						  				</div>
						  				<div class="notfication-details">
							  				<div class="noty-user-img">
							  					<img src="${contextPath}/resources/bootstrap/images/resources/ny-img3.png" alt="">
							  				</div>
							  				<div class="notification-info">
							  					<h3><a href="#" title="">Jassica William</a> Comment on your project.</h3>
							  					<span>2 min ago</span>
							  				</div><!--notification-info -->
						  				</div>
						  				<div class="notfication-details">
							  				<div class="noty-user-img">
							  					<img src="${contextPath}/resources/bootstrap/images/resources/ny-img2.png" alt="">
							  				</div>
							  				<div class="notification-info">
							  					<h3><a href="#" title="">Jassica William</a> Comment on your project.</h3>
							  					<span>2 min ago</span>
							  				</div><!--notification-info -->
						  				</div>
						  				<div class="view-all-nots">
						  					<a href="#" title="">View All Notification</a>
						  				</div>
									</div><!--nott-list end-->
								</div><!--notification-box end-->
							</li>
						</ul>
					</nav><!--nav end-->
					<div class="menu-btn">
						<a href="#" title=""><i class="fa fa-bars"></i></a>
					</div><!--menu-btn end-->
					<div class="user-account">
						<div class="user-info">
							<img src="${contextPath}/resources/bootstrap/images/resources/user.png" alt="">
							<a href="#" title="">Minseon Kim</a>
							<i class="la la-sort-down"></i>
						</div>
						<div class="user-account-settingss">
							<h3>Online Status</h3>
							<ul class="on-off-status">
								<li>
									<div class="fgt-sec">
										<input type="radio" name="cc" id="c5">
										<label for="c5">
											<span></span>
										</label>
										<small>Online</small>
									</div>
								</li>
								<li>
									<div class="fgt-sec">
										<input type="radio" name="cc" id="c6">
										<label for="c6">
											<span></span>
										</label>
										<small>Offline</small>
									</div>
								</li>
							</ul>
							<h3>Custom Status</h3>
							<div class="search_form">
								<form>
									<input type="text" name="search">
									<button type="submit">Ok</button>
								</form>
							</div><!--search_form end-->
							<h3>Setting</h3>
							<ul class="us-links">
								<li><a href="profile-account-setting.html" title="">Account Setting</a></li>
								<li><a href="#" title="">Privacy</a></li>
								<li><a href="#" title="">Faqs</a></li>
								<li><a href="#" title="">Terms & Conditions</a></li>
							</ul>
							<h3 class="tc"><a href="sign-in.html" title="">Logout</a></h3>
						</div><!--user-account-settingss end-->
					</div>
				</div><!--header-data end-->
			</div>
		</header><!--header end-->
		<section class="banner">
			<div class="bannerimage">
			<img src="${contextPath}/resources/bootstrap/images/about.png" alt="image">
		</div>
			<div class="bennertext">
			<div class="innertitle">
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
    								<h3><a id = "index-mid-btn" href="#">대출 현황</a></h3>
    							</div>
    						</div>
    						<div class="col-md-13">
    							<div class="top-category text-center no-border-left">
    								<h3><a id = "index-mid-btn" href="#">연체 현황</a></h3>
    							</div>
    						</div>
    						<div class="col-md-13">
    							<div class="top-category text-center">
    								<h3><a id = "index-mid-btn" href="#">커뮤니티</a></h3>
    							</div>
    						</div>
    						<div class="col-md-13">
    							<div class="top-category text-center">
    								<h3><a id = "index-mid-btn" href="#">도서 평가</a></h3>
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
								<div class="tabmenu">
								<ul>
									<li id="tab1" class="btnCon"><input type="radio" checked
										name="tabmenu" id="tabmenu1"> <label for="tabmenu1">공지사항</label>
										<div class="tabCon">Lorem Ipsum is simply dummy text of
											the printing and typesetting industry. Lorem Ipsum has been
											the industry's standard dummy text ever since the 1500s, when
											</div></li>
									<li id="tab2" class="btnCon"><input type="radio"
										name="tabmenu" id="tabmenu2"> <label for="tabmenu2">자주묻는 질문</label>
										<div class="tabCon">It is a long established fact that a
											reader will be distracted by the readable content of a page
											when looking at its layout. The point of using Lorem Ipsum is
											</div></li>
									<li id="tab3" class="btnCon"><input type="radio"
										name="tabmenu" id="tabmenu3"> <label for="tabmenu3">이용안내</label>
										<div class="tabCon">There are many variations of
											passages of Lorem Ipsum available, but the majority have
											suffered alteration in some form, by injected humour, or
										</div>
									</li>
								</ul>
							</div>
						</div>
						<!--acc-leftbar end-->
					<div class="col-lg-14">

						<div class="tab-content" id="nav-tabContent">
							<div class="tab-pane fade show active" id="nav-acc"
								role="tabpanel" aria-labelledby="nav-acc-tab">
								<div class="acc-setting" style='text-align: center;border: 4px solid white;' >
									<h3>캘린더</h3>
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
	
		
		<!--  
		<section class="services">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-sm-12">
						<div class="blog">
							<img src="${contextPath}/resources/bootstrap/images/blog.png" alt="image">
							<h2>Our Blog</h2>
							<a href="#">View Blog</a>
						</div>
					</div>
					<div class="col-md-4 col-sm-12">
						<div class="blog">
							<img src="${contextPath}/resources/bootstrap/images/career.png" alt="image">
							<h2>Career Opportunites</h2>
							<a href="#">Join Our Team</a>
						</div>
					</div>
					<div class="col-md-4 col-sm-12">
						<div class="blog">
							<img src="${contextPath}/resources/bootstrap/images/forum.png" alt="image">
							<h2>Help Forum</h2>
							<a href="#">Visit Help Forum</a>
						</div>
					</div>
				</div>
			</div>
		</section> -->
		<footer>
			<div class="footy-sec mn no-margin">
				<div class="container">
					<ul>
						<li><a href="help-center.html" title="">대표이사 : 심동현</a></li>
						<li><a href="about.html" title="">과장 : 김민선</a></li>
						<li><a href="#" title="">그냥 : 서종대</a></li>
						<li><a href="#" title="">그냥 : 이동주</a></li>
					</ul>
					<p><img src="${contextPath}/resources/bootstrap/images/copy-icon2.png" alt="">Copyright 2020</p>
					<img class="fl-rgt" src="${contextPath}/resources/bootstrap/images/logo2.png" alt="">
				</div>
			</div>
		</footer><!--footer end-->



<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/popper.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/flatpickr.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/lib/slick/slick.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/script.js"></script>
</body>
</html>