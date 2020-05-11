<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>도서 첫 페이지</title>
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
	<style>
.seo {
	float: left;
    width: 100%;
    padding-top: 30px;
    padding-right: 75px;
    padding-left: 60px;
    padding-bottom: 30px;
    font-size:14px;
    font-family: "inherit";
}

div.col-md-12 input {
	width:100%;
	height: 40px;
	padding-top: 0px;
    padding-right: 15px;
    padding-bottom: 0px;
    padding-left: 40px;
    border: 1px solid #e5e5e5;
    border-top-color: rgb(229, 229, 229);
    border-top-style: solid;
    border-top-width: 1px;
    border-right-color: rgb(229, 229, 229);
    border-right-style: solid;
    border-right-width: 1px;
    border-bottom-color: rgb(229, 229, 229);
    border-bottom-style: solid;
    border-bottom-width: 1px;
    border-left-color: rgb(229, 229, 229);
    border-left-style: solid;
    border-left-width: 1px;
    border-image-source: initial;
    border-image-slice: initial;
    border-image-width: initial;
    border-image-outset: initial;
    border-image-repeat: initial;
    border-radius: 15px;
}

.seo_button { 
	color: #ffffff; 
	font-size: 16px;
	background-color: #e44d3a;
	border: 0;
    border-top-color: initial;
    border-top-style: initial;
    border-top-width: 0px;
    border-right-color: initial;
    border-right-style: initial;
    border-right-width: 0px;
    border-bottom-color: initial;
    border-bottom-style: initial;
    border-bottom-width: 0px;
    border-left-color: initial;
    border-left-style: initial;
    border-left-width: 0px;
    border-image-source: initial;
    border-image-slice: initial;
    border-image-width: initial;
    border-image-outset: initial;
    border-image-repeat: initial;
    margin-top: 30px;
    border-radius: 15px;
}

</style>

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
		
		if (pageInfo == 'search') {
			alert("도서검색으로 바로 이동");
			$("#nav-acc-tab").attr("class", "nav-item nav-link active");
			$("#nav-acc-tab").attr("aria-selected", "true");
			$("#nav-acc").attr("class", "tab-pane fade show active");
			
		} else if (pageInfo == 'apply') {
			alert("도서신청으로 바로 이동");
			$("#nav-status-tab").attr("class", "nav-item nav-link active");
			$("#nav-status-tab").attr("aria-selected", "true");
			$("#nav-status").attr("class", "tab-pane fade show active");
			
		} else {
			$("#nav-acc-tab").attr("class", "nav-item nav-link active");
			$("#nav-acc-tab").attr("aria-selected", "true");
			$("#nav-acc").attr("class", "tab-pane fade show active");
		}
	})
	
	function search1() {
		location.href="book_main.do?page=search";
	}
	
	function apply() {
		location.href="book_main.do?page=apply";
	}
	
	

</script>

<body>	

	<div class="wrapper">	

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
									홈
								</a>
							</li>
							<li>
								<a href="book_main.do?page=search" title="">
									<span><img src="${contextPath}/resources/bootstrap/images/icon2.png" alt=""></span>
									도서
								
								</a>
								<ul>
									<li><a href="book_main.do?page=search" title="">도서검색</a></li>
									<li><a href="book_main.do?page=apply" title="">도서신청</a></li>
								</ul>
							</li>
							<li>
								<a href="com_main.do" title="">
									<span><img src="${contextPath}/resources/bootstrap/images/icon3.png" alt=""></span>
									커뮤니티
								</a>
							</li>
							<li>
								<a href="myLib_main.do" title="" class="not-box-openm">
									<span><img src="${contextPath}/resources/bootstrap/images/icon6.png" alt=""></span>
									마이라이브러리
								</a>
								<ul>
									<li><a href="myLib_main.do?page=score" title="">도서평가</a></li>
									<li><a href="myLib_main.do?page=favor" title="">취향분석</a></li>
									<li><a href="myLib_main.do?page=declare" title="">신고하기</a></li>
								</ul>
								
							</li>

							<c:choose>
								<c:when test="${user_position eq 'admin'}">
									<li>
										<a href="admin_main.do" title="" class="not-box-open">
											<span><img src="${contextPath}/resources/bootstrap/images/icon7.png" alt=""></span>
											관리자전용
										</a>
										<ul>
											<li><a href="admin_main.do?page=user_A" title="">회원관리</a></li>
											<li><a href="admin_main.do?page=book_A" title="">도서관리</a></li>
											<li><a href="admin_main.do?page=book_status_A" title="">현황관리</a></li>
											<li><a href="admin_main.do?page=com_A" title="">커뮤니티관리</a></li>
											<li><a href="admin_main.do?page=dec_A" title="">신고관리</a></li>
											<li><a href="admin_main.do?page=chat_A" title="">챗봇관리</a></li>
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
						</c:when>
					</c:choose>
					
				</div><!--header-data end-->
			</div>
		</header><!--header end-->


		<section class="profile-account-setting">
			<div class="container">
				<div class="account-tabs-setting">
					<div class="row">
						<div class="col-lg-3">
							<div class="acc-leftbar">
								<div class="nav nav-tabs" id="nav-tab" role="tablist">
									<a><b>도서</b></a>
								     <a class="nav-item nav-link" id="nav-acc-tab" data-toggle="tab" href="#nav-acc" onclick="search1()" role="tab" aria-controls="nav-acc" aria-selected="false"><i class="la la-cogs"></i>도서검색</a>
								    <a class="nav-item nav-link" id="nav-status-tab" data-toggle="tab" href="#nav-status" onclick="apply()" role="tab" aria-controls="nav-status" aria-selected="false"><i class="fa fa-line-chart"></i>도서신청</a>
								     </div>
							</div><!--acc-leftbar end-->
						</div>
						<div class="col-lg-9">
							<div class="tab-content" id="nav-tabContent">
								<div class="tab-pane fade" id="nav-acc" role="tabpanel" aria-labelledby="nav-acc-tab">
									<div class="acc-setting">
										<h3>도서검색</h3>
											<jsp:include page="userlibrarylist.jsp"></jsp:include>
									</div><!--acc-setting end-->
								</div>
								
							  	<div class="tab-pane fade" id="nav-status" role="tabpanel" aria-labelledby="nav-status-tab">
							  		<div class="acc-setting">
							  			<h3>도서신청</h3>
			
							<div>
							<div class="login-sec">
								<ul class="sign-control">
									<li data-tab="tab-1" class="current"><a href="#" title="">도서신청안내</a></li>				
									<li data-tab="tab-2"><a href="#" title="">도서신청</a></li>				
								</ul>			
								<div class="sign_in_sec current" id="tab-1" style="font-size: 14px;">
									
									○ <input  style = "border:none; font-weight:bold; background-color:transparent;" type="text" value="희망도서 신청안내" disabled><br><br>
									＊신청대상 : 회원가입한 모든 사용자<br><br>
									* 신청방법  :  도서신청창에서 검색버튼을 눌러 원하시는 도서를 찾으신후 선택하기를 눌려주시고 사유를 적어주세요.<br><br>
									* 신청권수  :  1인 월 2권<br><br>
									* 소요기간 :  1~2개월 소요  <br><br><br><br>
									
									○ <input  style = "border:none; font-weight:bold; background-color:transparent;" type="text" value="희망도서 신청결과 확인" disabled> <br><br>
									* 홈페이지 내 <마이 라이브러리 -> 현황조회 ->  도서 신청 현황> 에서 확인 가능합니다. <br><br>
									
									* 각 진행상태는 아래와 같습니다. <br><br>
									 - 신청중  : 담당자가 검토중인 상태 <br><br>
									 - 처리중  : 구입하여 정리하고 있는 상태 <br><br>
									 - 취소됨 : 구입에서 제외된 상태(사유) <br><br><br><br>
									
									 ○ <input  style = "border:none; font-weight:bold; background-color:transparent;" type="text" value="희망도서 선정 제외 기준" disabled> <br><br>
									* 도서관내 이미 소장중이거나 중복신청도서<br><br>
									* 고가의 도서 <br><br>
									* 선정적인 도서 <br><br>
									* 문제집 혹은 수험서 또는 만화도서 <br><br>
									* 품절이거나 절판된 도서 <br><br>
								</div><!--sign_in_sec end-->
								<div class="sign_in_sec" id="tab-2">
										
									<div class="dff-tab current" id="tab-3" style="font-size: 14px;">
										
										<c:set var="applycnt" value="${applycnt}"></c:set>
										<c:if test="${applycnt ge 2}">
										<c:out value="이번달 도서 신청횟수를 모두 사용하였습니다."></c:out><br>
										<c:out value="다음달에 다시 이용해주세요."></c:out>
										</c:if>
										<c:if test="${applycnt lt 2}">
										 <div class="seo">
											<form action="book_main.do" method="get" name="myform2">
												<input type="hidden" name="page" value="apply">  
												<div class="row">
				                                <div class="col-md-12 col-sm-12"><br>
				                                   <h6>사용자 ID</h6><br>
				                                   <input type="text" name="user_id" value="${user_id }" readonly><br><br><br>
				                                </div>
				                                <div class="col-md-12 col-sm-12">
				                                	<h6>도서명</h6><br>
				                                	<input style="width:80%;" type="text" name="bookName" id="pInput"><input type="button" style="width:19%; padding-left: 0px; padding-right: 0px; background-color:#e44d3a;font-weight: bold; color: #ffffff;" value="검색" onclick="userapplysearchbook();"><br><br><br>
				                                </div>
				                                <div class="col-md-12 col-sm-12">
				                                    <h6>isbn</h6><br>
				                                    <input type="text" name="isbn" id="pInputt" readonly><br><br><br>
				                                </div>
				                                <div class="col-md-12 col-sm-12">
				                                	<h6>선청날짜</h6><br>
				                                	<input type="text" name="applyDate" id="today" readonly><br><br><br>
				                                </div>
				                                 <div class="col-md-12 col-sm-12">
				                                	<h6>사유</h6><br>
				                                	<input type="text" name="applyReason" id="applyReason"><br><br>
				                                </div>
				                                <div class="col-md-12 col-sm-12">
				                                <input class="seo_button" style="width:118.56px; padding-left: 0px; padding-right:0px; color: white;" type="button" value="신청하기" onclick="going();">	
				                               </div>
				                            </div>
											</form>
										</div> 
										</c:if>
										
										
									</div><!--dff-tab end-->
									<div class="dff-tab" id="tab-4">
										<form>
											<div class="row">
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="text" name="company-name" placeholder="Company Name">
														<i class="la la-building"></i>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="text" name="country" placeholder="Country">
														<i class="la la-globe"></i>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="password" name="password" placeholder="Password">
														<i class="la la-lock"></i>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="password" name="repeat-password" placeholder="Repeat Password">
														<i class="la la-lock"></i>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="checky-sec st2">
														<div class="fgt-sec">
															<input type="checkbox" name="cc" id="c3">
															<label for="c3">
																<span></span>
															</label>
															<small>Yes, I understand and agree to the workwise Terms & Conditions.</small>
														</div><!--fgt-sec end-->
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<button type="submit" value="submit">Get Started</button>
												</div>
											</div>
										</form>
									</div><!--dff-tab end-->
								</div>		
							</div><!--login-sec end-->
						</div>
						
						
							  		</div><!--acc-setting end-->
							  	</div>
							  	
							</div>
						</div>
					</div>
				</div><!--account-tabs-setting end-->
			</div>
		</section>
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

	</div><!--theme-layout end-->

<script>
	var test=$("#nav-password-tab").attr("href");
	console.log(test);
</script>

<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/popper.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/flatpickr.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/lib/slick/slick.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/script.js"></script>
<script src="resources/book/js/date.js"></script>
<script type="text/javascript">
	function userapplysearchbook() {
		var popUrl = "userapplysearch.do";
    	window.open(popUrl,"","width=1200,height=800");
	}
	
	function going() {
		 if($("#pInputt").val()==""){
	         alert("도서명을를 검색하세요.");
	         $("#pInput").focus();
	         return false;
	      }else if ($("#applyReason").val()==""){
	    	  alert("사유를 입력하세요.");
	    	  $("#applyReason").focus();
	    	  return false;
	    	  
	      }else {
	    	  if (confirm("신청 하시겠습니까??") == true){    //확인
	    		  document.myform2.submit();
	      	    return true;
	      	}else{   //취소
	      	    return false;
	      	}
	      }
		}
</script>

</body>
</html>