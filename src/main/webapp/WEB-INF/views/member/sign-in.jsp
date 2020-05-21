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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
	#mainlabel{
	font-size:25px;
	color:#E44D3A;
	}
	#signimg { 
	display: block; 
	margin-left: 60px;
	margin-top:-40px;
	}
</style>

<script type="text/javascript">

$(document).ready(function(){

	$("#login").on("click", function(){
        if($("#userId").val()==""){
        	swal("아이디를 입력해주세요.");
           $("#userId").focus();
           return false;
        }
        
        if(($("#userId").val()).length<4 || ($("#userId").val()).length>13){
        	swal("아이디는 4~12자의 영문, 숫자로만 입력.");
            $("#userId").focus();
            return false;
         }
    
        if($("#userPass").val()==""){
        	swal("비밀번호를 입력해주세요.");
            $("#userPass").focus();
            return false;
         }
             
        $.ajax({
            url : "passChk.do",
            type : "POST",
            dataType : "json",
            async : false,
            data : $("#homeForm").serializeArray(),
            success: function(data){
               
               if(data==0){
            	   swal("로그인 실패. \n아이디와 비밀번호를 확인해주세요.");
                  return false;
              	 } 
               }
        })
        
         $.ajax({
             url : "emailchecknum.do",
             type : "POST",
             dataType : "json",
             async : false,
             data : $("#homeForm").serializeArray(),
             success: function(data){
                
                if(data==0){
                	swal("이메일인증을 진행해 주세요.");
                   return false;
               	 }  
                }
          })        
	});
	
	$("#sign").on("click", function(){
		$.ajax({
	        url : "sendMailsign",
	        async : false,
	        data : $("#regForm").serializeArray(),
	        success: function(data){
	           },
	         error: function(){
	        	 console.log("ajax error");
	         }
	     });
	})

})

function test(){
	var id=$('input[name=userId1]').val();
	console.log(id);
	
	$.ajax({
        url : "idChk.do",
        type : "POST",
        dataType : "json",
        async : false,
        data : $("#regForm").serializeArray(),
        success: function(data){
           
        	if(data == 1){
				//alert("이미 가입된 아이디입니다.");
				swal("이미 가입된 아이디입니다.");
			}else if(data == 0){
				if(($("#userId1").val()).length<3){
					swal("사용불가 \n아이디는 4~12자의 영문, 숫자로만 입력");
				}
				else{
				$("#idChk").attr("value", "Y");
				swal("사용가능한 아이디입니다.");
				}
			}
           }
     })
}

function validate() {

		var re = /^[a-zA-Z0-9]{4,12}$/	//아이디,비밀번호
		var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;	//이메일
		var re3 = /^[a-zA-Z가-힣]{2,10}$/		//이름
		var re5 = /^[A-Za-z0-9_\-]{4}$/;	//나이
		var re6 = /^[가-힣]{2}$/
		
		var userId1 = document.getElementById("userId1");
		var userPass1 = document.getElementById("userPass1");
		var userPasschk = document.getElementById("userPasschk");
		var userName= document.getElementById("userName");
		var userEmail = document.getElementById("userEmail");
		var userGender = document.getElementById("userGender");
		var userAge = document.getElementById("userAge");
		var idChkVal = $("#idChk").val();
		var chk=document.regForm.cc.checked;
		
		
		if (idChkVal == "N") {
			swal("ID중복확인 버튼을 눌러주세요");
			return false;
		}
		if (!check(re, userId1, "아이디는 4~12자의 영문, 숫자로만 입력")) {
			$("#userId1").focus();
			return false;
		}
		if (!check(re, userPass1, "비밀번호는 4~12자의 영문, 숫자로만 입력")) {
			$("#userPass1").focus();
			return false;
		}
		if (regForm.userPass1.value != regForm.userPasschk.value) {
			swal("비밀번호가 일치하지않습니다");
			$("#userPasschk").focus();
			return false;
		}
		if (!check(re3, userName, "이름은 2~10자의 영문,한글만 입력")) {
			$("#userName").focus();
			return false;
		}
		if (!check(re2, userEmail, "적합하지 않은 이메일 형식")) {
			$("#userEmail").focus();
			return false;
		}
/* 		if (!check(re5, userAge, "생년월일은 4자리의 숫자만 입력")) {
			$("#userAge").focus();
			return false;
		} */
		if (regForm.userGender.value == "") {
			swal("성별을 입력해주세요");
			return false;
		}
		if(!chk){
			swal("약관에 동의해 주세요");
            return false;
        } 
		
		swal("회원가입이 완료되었습니다.\n이메일 인증을 진행해주세요");


/* 			$.ajax({
		        url : "sendMailsign1",
		        async : false,
		        data : $("#regForm").serializeArray(),
		        success: function(data){
		       	alert("a");
		           },
		         error: function(){
		        	 console.log("ajax error");
		         }
		     }) */

}
function check(re, what, message) {
		if (re.test(what.value)) {
			return true;
		}
		swal(message);

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
									<br><br><br><br><br>
									<label id="mainlabel">북파고 홈페이지는</label> <br><br><br>
									<a>사용자들에게 도서관 이용과 관련한 정보를 제공하고 북파고 운영에 필요한 정보와 행사, 소식 등 <br>여러가지 서비스를 제공합니다.</a>			
									</div><!--cm-logo end-->	
								<img id="signimg" style="width:250px; height:250px;" src="${contextPath}/resources/images/sign.jpg" alt="">			
							</div><!--cmp-info end-->
						</div>
						<div class="col-lg-6">
							<div class="login-sec">
								<ul class="sign-control">
									<li data-tab="tab-1" class="current"><a href="#" title="">로그인</a></li>				
									<li data-tab="tab-2"><a href="#" title="">회원가입</a></li>				
								</ul>			
								<div class="sign_in_sec current" id="tab-1">
									
									<h3>로그인</h3>
									<form id="homeForm" name='homeForm' method="post" action="login.do">
										<div class="row">
											<div class="col-lg-12 no-pdd">
												<div class="sn-field">
													<input type="text" id="userId" name="userId" placeholder="아이디">
													<i class="la la-user"></i>
												</div><!--sn-field end-->
											</div>
											<div class="col-lg-12 no-pdd">
												<div class="sn-field">
													<input type="password" id="userPass" name="userPass" placeholder="비밀번호">
													<i class="la la-lock"></i>
												</div>
											</div>
											<div class="col-lg-12 no-pdd">
												<div class="checky-sec">
													<div class="fgt-sec">
														<input type="checkbox" name="cc" id="c1">
														<label for="c1">
															<!-- <span></span> -->
														</label>
														<!-- <small>Remember me</small> -->
													</div><!--fgt-sec end-->
														<a href="forgot.do" title=""><u>비밀번호 찾기</u></a>
												</div>
											</div>
											<div class="col-lg-12 no-pdd">
												<button type="submit" value="submit" id="login">로그인</button>
											</div>
										</div>
									</form>
									<div class="login-resources">
										<!-- <h4>Login Via Social Account</h4> -->
										<ul>
											<!-- <li><a href="#" title="" class="fb"><i class="fa fa-facebook"></i>Login Via Facebook</a></li>
											<li><a href="#" title="" class="tw"><i class="fa fa-twitter"></i>Login Via Twitter</a></li> -->
										</ul>
									</div><!--login-resources end-->
								</div><!--sign_in_sec end-->
								<div class="sign_in_sec" id="tab-2">
									<h3>회원가입</h3>
									<div class="dff-tab current" id="tab-3">
										<form action="register.do" method="post" id="regForm" name="regForm"  onsubmit="return validate();">
											<div class="row">
											<div class="col-lg-12 no-pdd">
												<div class="sn-field">
													<input type="text" id="userId1" name="userId1" placeholder="아이디" style="width: 70%;">
													<i class="la la-user" style="margin: 12px 0 0 0;"></i>
													<button class="idChk" type="button" id="idChk" onclick="test();" value="N" style="
														    width: 28%;
														    font-size: 15px;
														    text-align: center;
														    padding: 11px;
														    font-size:13.4px;
														">중복확인</button>
												</div>
											</div>
											<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="password" id="userPass1" name="userPass1" placeholder="비밀번호">
														<i class="la la-lock"></i>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="password" id="userPasschk" name="userPasschk" placeholder="비밀번호 확인">
														<i class="la la-lock"></i>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="text" id="userName"name="userName" placeholder="이름">
														<i class="la la-user"></i>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="text" id="userEmail" name="userEmail" placeholder="이메일">
														<i class="la la-globe"></i>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="text" id="userAge" name="userAge" placeholder="나이    ex)1999">
														<i class="la la-globe"></i>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<select name="userGender">
															<option value="">성별</option>
															<option id="userGender" name="userGender" value="남자">남자</option>
															<option id="userGender" name="userGender" value="여자">여자</option>
														</select>
														<i class="la la-dropbox"></i>
														<span><i class="fa fa-ellipsis-h"></i></span>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<select name="userTaste1">
															<option value="">관심분야1</option>
															<option value="총류">총류</option>
															<option value="철학">철학</option>
															<option value="종교">종교</option>
															<option value="사회과학">사회과학</option>
															<option value="자연과학">자연과학</option>
															<option value="기술과학">기술과학</option>
															<option value="예술">예술</option>
															<option value="언어">언어</option>
															<option value="문학">문학</option>
															<option value="역사">역사</option>
														</select> 
														<i class="la la-dropbox"></i>
														<span><i class="fa fa-ellipsis-h"></i></span>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<select name="userTaste2">
															<option value="">관심분야2</option>
															<option value="총류">총류</option>
															<option value="철학">철학</option>
															<option value="종교">종교</option>
															<option value="사회과학">사회과학</option>
															<option value="자연과학">자연과학</option>
															<option value="기술과학">기술과학</option>
															<option value="예술">예술</option>
															<option value="언어">언어</option>
															<option value="문학">문학</option>
															<option value="역사">역사</option>
														</select> 
														<i class="la la-dropbox"></i>
														<span><i class="fa fa-ellipsis-h"></i></span>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<select name="userTaste3">
															<option value="">관심분야3</option>
															<option value="총류">총류</option>
															<option value="철학">철학</option>
															<option value="종교">종교</option>
															<option value="사회과학">사회과학</option>
															<option value="자연과학">자연과학</option>
															<option value="기술과학">기술과학</option>
															<option value="예술">예술</option>
															<option value="언어">언어</option>
															<option value="문학">문학</option>
															<option value="역사">역사</option>
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
																<span></span>
																개인정보 약관동의
															</label>
															
														</div><!--fgt-sec end-->
													</div>
												</div>
												
													<input type="hidden" name="userposition" value="general">
													<input type="hidden" name="badcnt" value="0">
													<input type="hidden" name="stopstart" value="0000-00-00">
													<input type="hidden" name="stopend" value="0000-00-00">
													<input type="hidden" name="borrowcnt" value="0">
													<input type="hidden" name="applycnt" value="0">
													<input type="hidden" name="reservecnt" value="0">
													<input type="hidden" name="emailcheck" value="0">
												<div class="col-lg-12 no-pdd">
													<button type="submit" id="sign">회원가입</button>
												</div>
											</div>
										</form>
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
															<input type="checkbox" id="cc" name="cc" id="c3">
															<label for="c3">
																<span></span>
															</label>
															<small>개인정보 약관동의</small>
														</div><!--fgt-sec end-->
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<button type="button" id="submit1">Get Started</button>
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
			<%-- <div class="footy-sec">
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
			</div><!--footy-sec end--> --%>
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