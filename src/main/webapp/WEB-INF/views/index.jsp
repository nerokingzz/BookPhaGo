<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>  
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<% request.setCharacterEncoding("UTF-8"); %>
<!-- chatbot start -->
<jsp:include page="chat/watson.jsp"></jsp:include>
<!-- chatbot end -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><spring:message code="site.title" text="북파고"/></title>
	<link href="https://fonts.googleapis.com/css2?family=Bowlby+One+SC&display=swap" rel="stylesheet">
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
	<script
  		src="https://code.jquery.com/jquery-3.4.1.min.js"
  		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  		crossorigin="anonymous"></script>

</head>

	<%
		session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		String user_position=(String)session.getAttribute("user_position");
	%>

<script type="text/javascript">
	alert("${user_position}");
</script>

<body>
		


		<header>
			<div class="container">
				<div class="header-data">
					<div class="logo">
						<a href="/" title=""><img src="${contextPath}/resources/bootstrap/images/logo.png" alt=""></a>
					</div><!--logo end-->
					<nav>
						<ul>
							<li>
								<a href="/" title="">
									<span><img src="${contextPath}/resources/bootstrap/images/icon1.png" alt=""></span>
									<spring:message code="top.home" text="홈"/>
								</a>
							</li>
							<li>
								<a href="book_main.do?page=search" title="">
									<span><img src="${contextPath}/resources/bootstrap/images/icon2.png" alt=""></span>
									<spring:message code="top.book" text="도서"/>
								
								</a>
								<ul>
									<li><a href="book_main.do?page=search" title=""><spring:message code="top.book.search" text="도서검색"/></a></li>
									<li><a href="book_main.do?page=apply" title=""><spring:message code="top.book.request" text="도서신청"/></a></li>
								</ul>
							</li>
							<li>
								<a href="com_main.do" title="">
									<span><img src="${contextPath}/resources/bootstrap/images/icon3.png" alt=""></span>
									<spring:message code="top.comm"/>
								</a>
							</li>
							<li>
								<a href="myLib_main.do" title="" class="not-box-openm">
									<span><img src="${contextPath}/resources/bootstrap/images/icon6.png" alt=""></span>
									<spring:message code="top.mylib"/>
								</a>
								<ul>
									<li><a href="myLib_main.do?page=score" title=""><spring:message code="top.mylib.rate" text="도서평가"/></a></li>
									<li><a href="myLib_main.do?page=favor" title=""><spring:message code="top.mylib.taste" text="취향분석"/></a></li>
									<li><a href="myLib_main.do?page=declare" title=""><spring:message code="top.mylib.report" text="신고하기"/></a></li>
								</ul>
								
							</li>

							<c:choose>
								<c:when test="${user_position eq 'admin'}">
									<li>
										<a href="admin_main.do" title="" class="not-box-open">
											<span><img src="${contextPath}/resources/bootstrap/images/icon7.png" alt=""></span>
											<spring:message code="top.admin" text="관리자전용"/>
										</a>
										<ul>
											<li><a href="admin_main.do?page=user_A" title=""><spring:message code="top.admin.member" text="회원관리"/></a></li>
											<li><a href="admin_main.do?page=book_A" title=""><spring:message code="top.admin.book" text="도서관리"/></a></li>
											<li><a href="admin_main.do?page=book_status_A" title=""><spring:message code="top.admin.current" text="현황관리"/></a></li>
											<li><a href="admin_main.do?page=com_A" title=""><spring:message code="top.admin.comm" text="커뮤니티관리"/></a></li>
											<li><a href="admin_main.do?page=dec_A" title=""><spring:message code="top.admin.report" text="신고관리"/></a></li>
											<li><a href="admin_main.do?page=chat_A" title=""><spring:message code="top.admin.chatbot" text="챗봇관리"/></a></li>
										</ul>
									</li>
								</c:when>
							</c:choose>
						</ul>
					</nav><!--nav end-->
				
				<div class="menu-btn">
						<a href="#" title=""><i class="fa fa-bars"></i></a>
					</div><!--menu-btn end-->
					
					<c:choose>
						<c:when test="${user_position ne null}">
							<div class="user-account">
								<div class="user-info">
									<a href="" title=""><spring:message code="top.right.modify" text="정보 수정"/></a>
									<p style="text-indent:1.2em;line-height:1;" />
									<a href="logout.do" title=""><spring:message code="top.right.logout" text="로그아웃"/></a>
								</div>
							</div>
						</c:when>
						<c:when test="${user_position eq null}">
							<div class="user-account">
								<div class="user-info">
									<a href="sign.do" title=""><spring:message code="top.right.sign" text="로그인/회원가입"/></a>
								</div>
							</div>
						
						</c:when>
					</c:choose>
					
				</div><!--header-data end-->
			</div>
		</header><!--header end-->
		
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
								<div class="tabmenu">
								<ul>
									<li id="tab1" class="btnCon"><input type="radio" checked
										name="tabmenu" id="tabmenu1"> <label for="tabmenu1"><spring:message code="mid.notice"  text="공지사항"/></label>
										<div class="tabCon">Lorem Ipsum is simply dummy text of
											the printing and typesetting industry. Lorem Ipsum has been
											the industry's standard dummy text ever since the 1500s, when
											</div></li>
									<li id="tab2" class="btnCon"><input type="radio"
										name="tabmenu" id="tabmenu2"> <label for="tabmenu2"><spring:message code="mid.qna"  text="자주묻는 질문"/></label>
										<div class="tabCon">It is a long established fact that a
											reader will be distracted by the readable content of a page
											when looking at its layout. The point of using Lorem Ipsum is
											</div></li>
									<li id="tab3" class="btnCon"><input type="radio"
										name="tabmenu" id="tabmenu3"> <label for="tabmenu3"><spring:message code="mid.guide"  text="이용 안내"/></label>
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
						<li><a href="#" title="">CEO : 서종대</a></li>
						<li><a href="#" title="">그냥 : 이동주</a></li>
						<li>
							<div>
								<select name="locale">
									<option value="">GLOBAL</option>
									<option value="ko">한국어</option>
									<option value="en">English</option>
									<option value="cn">中文</option>
									<option value="jp">日本語</option>
								</select>
							</div>
						</li>
				</ul>
					<p><img src="${contextPath}/resources/bootstrap/images/copy-icon2.png" alt="">Copyright 2020</p>
					<img class="fl-rgt" src="${contextPath}/resources/bootstrap/images/logo2.png" alt="">
				</div>
			</div>
			

				<script>
					$('select[name=locale]')
							.change(
									function() {
										var lang = $(this).val();
										if (lang == "") {
										} else {
											location.href = "${contextPath}/locale.do?locale="
													+ lang;
										}
									});
				</script>

		</footer><!--footer end-->



<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/popper.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/flatpickr.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/lib/slick/slick.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/script.js"></script>
</body>
</html>