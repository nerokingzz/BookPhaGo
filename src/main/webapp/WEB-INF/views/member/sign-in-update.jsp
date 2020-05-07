<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%@ include file="../chat/watson.jsp" %>
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

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
    // 취소
    $("#cancle").on("click", function(){
       
       location.href = "sign.do";
                 
    })
})

function validate() {

	var re = /^[a-zA-Z0-9]{4,12}$/	//아이디,비밀번호
	var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;	//이메일
	var re3 = /^[a-zA-Z가-힣]{2,10}$/		//이름
	var re5 = /^[A-Za-z0-9_\-]{4}$/;	//나이
	var re6 = /^[가-힣]{2}$/
	
	var userId1 = document.getElementById("userId1");
	var userPass1 = document.getElementById("userPass");
	var userPasschk = document.getElementById("userPasschk");
	var userName= document.getElementById("userName");
	var userEmail = document.getElementById("userEmail");
	var userGender = document.getElementById("userGender");
		
	if (!check(re, userPass, "비밀번호는 4~12자의 영문, 숫자로만 입력")) {
		return false;
	}
	if (!check(re3, userName, "이름은 2~10자의 영문,한글만 입력")) {
		return false;
	}
	if (!check(re2, userEmail, "적합하지 않은 이메일 형식")) {
		return false;
	}
	if (!check(re5, userAge, "생년월일은 4자리의 숫자만 입력")) {
		return false;
	}
	if (regForm.userGender.value == "") {
		alert("성별 미입력");
		return false;
	}
	if (regForm.userPass.value != regForm.userPasschk.value) {
		alert("비밀번호가 일치하지않음");
		return false;
	}
		alert("정보수정이 완료되었습니다");
	}
	function check(re, what, message) {
		if (re.test(what.value)) {
			return true;
		}
		alert(message);

		//return false;
	}
</script>

<body class="sign-in">

	<div class="wrapper">		

		<div class="sign-in-page">
			<div class="signin-popup">
				<div class="signin-pop">
					<div class="row">
						<div class="col-lg-6">
							<div class="cmp-info">
								<div class="cm-logo">
									<img src="${contextPath}/resources/bootstrap/images/cm-logo.png" alt="">
									<p>Workwise,  is a global freelancing platform and social networking where businesses and independent professionals connect and collaborate remotely</p>
								</div><!--cm-logo end-->	
								<img src="${contextPath}/resources/bootstrap/images/cm-main-img.png" alt="">			
							</div><!--cmp-info end-->
						</div>
						<div class="col-lg-6">
							<div class="login-sec">
								<ul class="sign-control">
									<!-- <li data-tab="tab-1" ><a href="#" title="">Sign in</a></li>				
									<li data-tab="tab-2" class="current"><a href="#" title="">modify</a></li>			 -->
								</ul>			
								<%-- <div class="sign_in_sec current" id="tab-1">
									
									<h3>Sign in</h3>
									<form id="homeForm" name='homeForm' method="post" action="login1.do">
										<div class="row">
											<div class="col-lg-12 no-pdd">
												<div class="sn-field">
													<input type="text" id="userId" name="userId" placeholder="Id">
													<i class="la la-user"></i>
												</div><!--sn-field end-->
											</div>
											<div class="col-lg-12 no-pdd">
												<div class="sn-field">
													<input type="password" id="userPass" name="userPass" placeholder="Password">
													<i class="la la-lock"></i>
												</div>
											</div>
											<div class="col-lg-12 no-pdd">
												<div class="checky-sec">
													<div class="fgt-sec">
														<input type="checkbox" name="cc" id="c1">
														<label for="c1">
															<span></span>
														</label>
														<small>Remember me</small>
													</div><!--fgt-sec end-->
													<a href="#" title="">Forgot Password?</a>
												</div>
											</div>
											<div class="col-lg-12 no-pdd">
												<button type="submit" value="submit" id="login">Sign in</button>
											</div>
											<div>
												<c:if test="${msg == false}">
													<p>로그인 후에 작성하실 수 있습니다.</p>
												</c:if>
											</div>
										</div>
									</form>
									<div class="login-resources">
										<h4>Login Via Social Account</h4>
										<ul>
											<li><a href="#" title="" class="fb"><i class="fa fa-facebook"></i>Login Via Facebook</a></li>
											<li><a href="#" title="" class="tw"><i class="fa fa-twitter"></i>Login Via Twitter</a></li>
										</ul>
									</div><!--login-resources end-->
								</div><!--sign_in_sec end--> --%>
								<div class="sign_in_sec current" id="tab-2">
									<h3>Modify</h3>
									<div class="dff-tab current" id="tab-2">
										<form action="memberUpdate.do" method="post" id="regForm" name="regForm"  onsubmit="return validate();">
											<div class="row">
											<div class="col-lg-12 no-pdd">
												<div class="sn-field">
													<input type="text" id="userId" name="userId" placeholder="Id" value="${member.userId}" readonly="readonly">
													<i class="la la-user"></i>
													
												</div>
											</div>
											<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="password" id="userPass" name="userPass" placeholder="Password" value="${user_pass}">
														<i class="la la-lock"></i>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="password" id="userPasschk" name="userPasschk" placeholder="Repeat Password">
														<i class="la la-lock"></i>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="text" id="userName"name="userName" placeholder="Name" value="${member.userName}">
														<i class="la la-user"></i>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="text" id="userEmail" name="userEmail" placeholder="Email" value="${member.userEmail}">
														<i class="la la-globe"></i>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="text" id="userAge" name="userAge" placeholder="Age" value="${member.userAge}">
														<i class="la la-globe"></i>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<c:choose>
															<c:when test="${member.userGender=='남자'}">
																<select name="userGender">
																	<option value="">성별</option>
																	<option id="userGender" name="userGender" value="남자" selected="selected">남자</option>
																	<option id="userGender" name="userGender" value="여자">여자</option>
																</select>
															</c:when>
															<c:otherwise>
																<select name="userGender">
																	<option value="">성별</option>
																	<option id="userGender" name="userGender" value="남자">남자</option>
																	<option id="userGender" name="userGender" value="여자" selected="selected">여자</option>
																</select>
															</c:otherwise>
														</c:choose>
														<i class="la la-dropbox"></i>
														<span><i class="fa fa-ellipsis-h"></i></span>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<select name="userTaste1">
															<option value="">관심분야1</option>
															<option value="BO000">총류</option>
															<option value="BO001">철학</option>
															<option value="BO002">종교</option>
															<option value="BO003">사회과학</option>
															<option value="BO004">자연과학</option>
															<option value="BO005">기술과학</option>
															<option value="BO006">예술</option>
															<option value="BO007">언어</option>
															<option value="BO008">문학</option>
															<option value="BO009">역사</option>
														</select> 
														<i class="la la-dropbox"></i>
														<span><i class="fa fa-ellipsis-h"></i></span>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<select name="userTaste2">
															<option value="">관심분야1</option>
															<option value="BO000">총류</option>
															<option value="BO001">철학</option>
															<option value="BO002">종교</option>
															<option value="BO003">사회과학</option>
															<option value="BO004">자연과학</option>
															<option value="BO005">기술과학</option>
															<option value="BO006">예술</option>
															<option value="BO007">언어</option>
															<option value="BO008">문학</option>
															<option value="BO009">역사</option>
														</select> 
														<i class="la la-dropbox"></i>
														<span><i class="fa fa-ellipsis-h"></i></span>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<select name="userTaste3">
															<option value="">관심분야1</option>
															<option value="BO000">총류</option>
															<option value="BO001">철학</option>
															<option value="BO002">종교</option>
															<option value="BO003">사회과학</option>
															<option value="BO004">자연과학</option>
															<option value="BO005">기술과학</option>
															<option value="BO006">예술</option>
															<option value="BO007">언어</option>
															<option value="BO008">문학</option>
															<option value="BO009">역사</option>
														</select> 
														<i class="la la-dropbox"></i>
														<span><i class="fa fa-ellipsis-h"></i></span>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="checky-sec st2">
														<div class="fgt-sec">
															<input type="checkbox" name="cc" id="c2">
															<label for="c2">
															<!-- 	<span></span> -->
															</label>
															<!-- <small>Yes, I understand and agree to the workwise Terms & Conditions.</small> -->
														</div><!--fgt-sec end-->
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<button type="submit" id="submit">확인</button>
													<button type="button" id="cancle">취소</button>
												</div>
											</div>
										</form>
									</div><!--dff-tab end-->
									<div class="dff-tab" id="tab-3">
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
													<!-- <button type="button" id="submit">Get Started</button> -->
												</div>
											</div>
										</form>
									</div><!--dff-tab end-->
								</div>		
							</div><!--login-sec end-->
						</div>
					</div>		
				</div><!--signin-pop end-->
			</div><!--signin-popup end-->
			<div class="footy-sec">
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
					<p><img src="${contextPath}/resources/bootstrap/images/copy-icon.png" alt="">Copyright 2019</p>
				</div>
			</div><!--footy-sec end-->
		</div><!--sign-in-page end-->


	</div><!--theme-layout end-->



<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/popper.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/flatpickr.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/lib/slick/slick.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/script.js"></script>
</body>
</html>