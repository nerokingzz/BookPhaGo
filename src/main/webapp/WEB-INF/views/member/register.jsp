<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
		<!-- 부가적인 테마 -->
		<!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">-->
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	
	 	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<title>회원가입</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				location.href = "home.do";
			})
			
			$("#submit").on("click", function(){
				if($("#userId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				
				if($("#userPass").val() != $("#userPasschk").val()){
			        alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
			        $("#userPass").focus();
			        return false; 
			    }
				
				if($("#userName").val()==""){
					alert("이름을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				var idChkVal = $("#idChk").val();
				if(idChkVal == "N"){
					alert("ID중복확인 버튼을 눌러주세요.");
				}else if(idChkVal == "Y"){
					$("#regForm").submit();
				}
			});
		})
		
		function fn_idChk(){
			$.ajax({
				url : "idChk.do",
				type : "post",
				dataType : "json",
				data : {"userId" : $("#userId").val()},
				success : function(data){
					if(data == 1){
							//alert("이미 가입된 아이디입니다.");
							swal("Hello world!");
					}else if(data == 0){
						if(($("#userId").val()).length>3){
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
						}
						else{
							alert("4글자 이상 입력");
						}
					}
				}
			})
		}
		
	function validate() {
		var re = /^[a-zA-Z0-9]{4,12}$/	//아이디,비밀번호
		var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;	//이메일
		var re3 = /^[a-zA-Z가-힣]{2,10}$/		//이름
		var re5 = /^[0-9]{1,3}$/	//나이
		
		var userId = document.getElementById("userId");
		var userPass = document.getElementById("userPass");
		var userName= document.getElementById("userName");
		var userEmail = document.getElementById("userEmail");
		
		 if(!check(re,userId,"아이디는 4~12자의 영문, 숫자로만 입력")) {
	           return false;
	       }
		  if(!check(re,userPass,"비밀번호는 4~12자의 영문, 숫자로만 입력")) {	 
	           return false;
	       }
		  if(!check(re3,userName,"이름은 2~10자의 영문,한글만 입력")) {	 
	           return false;
	       }
		  if(!check(re2, userEmail, "적합하지 않은 이메일 형식입니다.")) {
	           return false;
	       }
		  if(!check(re5,userAge,"나이는 1~3자의 숫자만 입력")) {	 
	           return false;
	       }

	      alert("회원가입이 완료되었습니다.");
	}
	 function check(re, what, message) {
	       if(re.test(what.value)) {
	           return true;
	       }
	       alert(message);

	       //return false;
	   }
	</script>
	<body>
		<section id="container">
			<form action="register.do" method="post" id="regForm" name="regForm"  onsubmit="return validate();">
				<div class="form-group has-feedback">
					<label class="control-label" for="userId">아이디</label>
					<input class="form-control" type="text" id="userId" name="userId" placeholder="4~12자의 영문,숫자"/>
					<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N" >중복확인</button>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userPass">비밀번호</label>
					<input class="form-control" type="password" id="userPass" name="userPass" placeholder="4~12자의 영문,숫자"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userPasschk">비밀번호확인</label>
					<input class="form-control" type="password" id="userPasschk" name="userPasschk" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">이름</label>
					<input class="form-control" type="text" id="userName" name="userName" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userEmail">이메일</label>
					<input class="form-control" type="email" id="userEmail" name="userEmail" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userAge">나이</label>
					<input class="form-control" type="text" id="userAge" name="userAge" />
				</div>		
				<div class="form-group has-feedback">
					<label class="control-label" for="userGender">성별 </label>
	       		    <input class="form-control" type="radio" id="userGender" name="userGender" value="남자" checked />
					<label class="control-label" for="userGender">남자</label>
	       		    <input class="form-control" type="radio" id="userGender" name="userGender" value="여자" />
	       		    <label class="control-label" for="userGender">여자</label>
				</div>
		<label class="control-label">관심분야 </label>
			<select name="userTaste1">
				<option value="BO">관심분야1</option>
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
			
			<select name="userTaste2">
				<option value="BO">관심분야2</option>
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
			<select name="userTaste3">
				<option value="BO">관심분야3</option>
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
		</form>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="button" id="submit" >회원가입</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
		</section>
		
	</body>
	
</html>