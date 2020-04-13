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
					<div class="logo">
						<a href="index.html" title=""><img src="${contextPath}/resources/bootstrap/images/logo.png" alt=""></a>
					</div><!--logo end-->
					<div class="search-bar">
						<form>
							<input type="text" name="search" placeholder="Search...">
							<button type="submit"><i class="la la-search"></i></button>
						</form>
					</div><!--search-bar end-->
					<nav>
						<ul>
							<li>
								<a href="index.html" title="">
									<span><img src="${contextPath}/resources/bootstrap/images/icon1.png" alt=""></span>
									Home
								</a>
							</li>
							<li>
								<a href="companies.html" title="">
									<span><img src="${contextPath}/resources/bootstrap/images/icon2.png" alt=""></span>
									Companies
								</a>
								<ul>
									<li><a href="companies.html" title="">Companies</a></li>
									<li><a href="company-profile.html" title="">Company Profile</a></li>
								</ul>
							</li>
							<li>
								<a href="projects.html" title="">
									<span><img src="${contextPath}/resources/bootstrap/images/icon3.png" alt=""></span>
									Projects
								</a>
							</li>
							<li>
								<a href="profiles.html" title="">
									<span><img src="${contextPath}/resources/bootstrap/images/icon4.png" alt=""></span>
									Profiles
								</a>
								<ul>
									<li><a href="user-profile.html" title="">User Profile</a></li>
									<li><a href="my-profile-feed.html" title="">my-profile-feed</a></li>
								</ul>
							</li>
							<li>
								<a href="jobs.html" title="">
									<span><img src="${contextPath}/resources/bootstrap/images/icon5.png" alt=""></span>
									Jobs
								</a>
							</li>
							<li>
								<a href="#" title="" class="not-box-openm">
									<span><img src="${contextPath}/resources/bootstrap/images/icon6.png" alt=""></span>
									Messages
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
							<a href="#" title="">John</a>
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



		<section class="companies-info">
			<div class="container">
				<div class="company-title">
					<h3>All Companies</h3>
				</div><!--company-title end-->
				<div class="companies-list">
					<div class="row">
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="company_profile_info">
								<div class="company-up-info">
									<img src="${contextPath}/resources/bootstrap/images/resources/pf-icon1.png" alt="">
									<h3>John Doe</h3>
									<h4>Graphic Designer</h4>
									<ul>
										<li><a href="#" title="" class="follow">Follow</a></li>
										<li><a href="#" title="" class="message-us"><i class="fa fa-envelope"></i></a></li>
										<li><a href="#" title="" class="hire-us">Hire</a></li>
									</ul>
								</div>
								<a href="user-profile.html" title="" class="view-more-pro">View Profile</a>
							</div><!--company_profile_info end-->
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="company_profile_info">
								<div class="company-up-info">
									<img src="${contextPath}/resources/bootstrap/images/resources/pf-icon2.png" alt="">
									<h3>John Doe</h3>
									<h4>Graphic Designer</h4>
									<ul>
										<li><a href="#" title="" class="follow">Follow</a></li>
										<li><a href="#" title="" class="message-us"><i class="fa fa-envelope"></i></a></li>
										<li><a href="#" title="" class="hire-us">Hire</a></li>
									</ul>
								</div>
								<a href="user-profile.html" title="" class="view-more-pro">View Profile</a>
							</div><!--company_profile_info end-->
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="company_profile_info">
								<div class="company-up-info">
									<img src="${contextPath}/resources/bootstrap/images/resources/pf-icon3.png" alt="">
									<h3>John Doe</h3>
									<h4>Graphic Designer</h4>
									<ul>
										<li><a href="#" title="" class="follow">Follow</a></li>
										<li><a href="#" title="" class="message-us"><i class="fa fa-envelope"></i></a></li>
										<li><a href="#" title="" class="hire-us">Hire</a></li>
									</ul>
								</div>
								<a href="user-profile.html" title="" class="view-more-pro">View Profile</a>
							</div><!--company_profile_info end-->
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="company_profile_info">
								<div class="company-up-info">
									<img src="${contextPath}/resources/bootstrap/images/resources/pf-icon4.png" alt="">
									<h3>John Doe</h3>
									<h4>Graphic Designer</h4>
									<ul>
										<li><a href="#" title="" class="follow">Follow</a></li>
										<li><a href="#" title="" class="message-us"><i class="fa fa-envelope"></i></a></li>
										<li><a href="#" title="" class="hire-us">Hire</a></li>
									</ul>
								</div>
								<a href="user-profile.html" title="" class="view-more-pro">View Profile</a>
							</div><!--company_profile_info end-->
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="company_profile_info">
								<div class="company-up-info">
									<img src="${contextPath}/resources/bootstrap/images/resources/pf-icon5.png" alt="">
									<h3>John Doe</h3>
									<h4>Graphic Designer</h4>
									<ul>
										<li><a href="#" title="" class="follow">Follow</a></li>
										<li><a href="#" title="" class="message-us"><i class="fa fa-envelope"></i></a></li>
										<li><a href="#" title="" class="hire-us">Hire</a></li>
									</ul>
								</div>
								<a href="user-profile.html" title="" class="view-more-pro">View Profile</a>
							</div><!--company_profile_info end-->
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="company_profile_info">
								<div class="company-up-info">
									<img src="${contextPath}/resources/bootstrap/images/resources/pf-icon6.png" alt="">
									<h3>John Doe</h3>
									<h4>Graphic Designer</h4>
									<ul>
										<li><a href="#" title="" class="follow">Follow</a></li>
										<li><a href="#" title="" class="message-us"><i class="fa fa-envelope"></i></a></li>
										<li><a href="#" title="" class="hire-us">Hire</a></li>
									</ul>
								</div>
								<a href="user-profile.html" title="" class="view-more-pro">View Profile</a>
							</div><!--company_profile_info end-->
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="company_profile_info">
								<div class="company-up-info">
									<img src="${contextPath}/resources/bootstrap/images/resources/pf-icon7.png" alt="">
									<h3>John Doe</h3>
									<h4>Graphic Designer</h4>
									<ul>
										<li><a href="#" title="" class="follow">Follow</a></li>
										<li><a href="#" title="" class="message-us"><i class="fa fa-envelope"></i></a></li>
										<li><a href="#" title="" class="hire-us">Hire</a></li>
									</ul>
								</div>
								<a href="user-profile.html" title="" class="view-more-pro">View Profile</a>
							</div><!--company_profile_info end-->
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="company_profile_info">
								<div class="company-up-info">
									<img src="${contextPath}/resources/bootstrap/images/resources/pf-icon8.png" alt="">
									<h3>John Doe</h3>
									<h4>Graphic Designer</h4>
									<ul>
										<li><a href="#" title="" class="follow">Follow</a></li>
										<li><a href="#" title="" class="message-us"><i class="fa fa-envelope"></i></a></li>
										<li><a href="#" title="" class="hire-us">Hire</a></li>
									</ul>
								</div>
								<a href="user-profile.html" title="" class="view-more-pro">View Profile</a>
							</div><!--company_profile_info end-->
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="company_profile_info">
								<div class="company-up-info">
									<img src="${contextPath}/resources/bootstrap/images/resources/pf-icon9.png" alt="">
									<h3>John Doe</h3>
									<h4>Graphic Designer</h4>
									<ul>
										<li><a href="#" title="" class="follow">Follow</a></li>
										<li><a href="#" title="" class="message-us"><i class="fa fa-envelope"></i></a></li>
										<li><a href="#" title="" class="hire-us">Hire</a></li>
									</ul>
								</div>
								<a href="user-profile.html" title="" class="view-more-pro">View Profile</a>
							</div><!--company_profile_info end-->
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="company_profile_info">
								<div class="company-up-info">
									<img src="${contextPath}/resources/bootstrap/images/resources/pf-icon10.png" alt="">
									<h3>John Doe</h3>
									<h4>Graphic Designer</h4>
									<ul>
										<li><a href="#" title="" class="follow">Follow</a></li>
										<li><a href="#" title="" class="message-us"><i class="fa fa-envelope"></i></a></li>
										<li><a href="#" title="" class="hire-us">Hire</a></li>
									</ul>
								</div>
								<a href="user-profile.html" title="" class="view-more-pro">View Profile</a>
							</div><!--company_profile_info end-->
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="company_profile_info">
								<div class="company-up-info">
									<img src="${contextPath}/resources/bootstrap/images/resources/pf-icon11.png" alt="">
									<h3>John Doe</h3>
									<h4>Graphic Designer</h4>
									<ul>
										<li><a href="#" title="" class="follow">Follow</a></li>
										<li><a href="#" title="" class="message-us"><i class="fa fa-envelope"></i></a></li>
										<li><a href="#" title="" class="hire-us">Hire</a></li>
									</ul>
								</div>
								<a href="user-profile.html" title="" class="view-more-pro">View Profile</a>
							</div><!--company_profile_info end-->
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="company_profile_info">
								<div class="company-up-info">
									<img src="${contextPath}/resources/bootstrap/images/resources/pf-icon12.png" alt="">
									<h3>John Doe</h3>
									<h4>Graphic Designer</h4>
									<ul>
										<li><a href="#" title="" class="follow">Follow</a></li>
										<li><a href="#" title="" class="message-us"><i class="fa fa-envelope"></i></a></li>
										<li><a href="#" title="" class="hire-us">Hire</a></li>
									</ul>
								</div>
								<a href="user-profile.html" title="" class="view-more-pro">View Profile</a>
							</div><!--company_profile_info end-->
						</div>
					</div>
				</div><!--companies-list end-->
				<div class="process-comm">
					<div class="spinner">
						<div class="bounce1"></div>
						<div class="bounce2"></div>
						<div class="bounce3"></div>
					</div>
				</div><!--process-comm end-->
			</div>
		</section><!--companies-info end-->
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

	</div><!--theme-layout end-->



<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/popper.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/flatpickr.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/lib/slick/slick.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/script.js"></script>
</body>
</html>