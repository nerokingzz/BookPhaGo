<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
*{
  margin:0; padding:0;
  font-size:15px; 
  line-height:1.3;
}
ul{list-style:none;}

.tabmenu{ 
  max-width:1000px; 
  margin: 0 auto; 
  position:relative; 
}
.tabmenu ul li{
  display:  inline-block;
  width:50%; 
  float:left;  
  text-align:center; 
  background :#f9f9f9;
}
.tabmenu ul li a{
  display:block;
  line-height:40px;
  height:40px;
  text-decoration:none; 
  color: #000;
}
.tabCon{
  display:none; 
  text-align:left; 
  padding: 20px;
  position:absolute; 
  left:0; top:40px; height:800px; 
  box-sizing: border-box; 
  border : 5px solid #f9f9f9;
}
.btnCon:target  {
  background : #ccc;
}
.btnCon:target .tabCon{
  display: block;
}	
	</style>
</head>
<body>


<section class="profile-account-setting2">
		<div class="container">
			<div class="acount-tabs-setting">
				<div >
					<div>
							<div class="tabmenu">
						  <ul>
						    <li id="tab1" class="btnCon"><a class="btn first" href="#tab1">menu1</a>
						      <div class="tabCon" >
						      	○ <input  style = "text-align:center; display:inline;" type="text" value="희망도서 신청안내" disabled><br><br>
								＊신청대상 : 회원가입한 모든 사용자<br><br>
								
								* 신청방법  :  희망하시는 도서가 소장된 자료인지 확인하시고 도서가 없는 경우 홈페이지내 희망도서 신청화면에서 도서정보를 정확하게 기재해주시기 바랍니다.<br><br>
								
								* 신청권수  :  1인 월 2권<br><br>
								
								* 소요기간 :  1~2개월 소요  <br><br>
								
								○ <input  style = "text-align:center; display:inline" type="text" value="희망도서 신청결과 확인" disabled> <br><br>
								* 홈페이지 내 <마이 라이브러리 -> 현황조회 ->  도서 신청 현황> 에서 확인 가능합니다. <br><br>
								
								* 각 진행상태는 아래와 같습니다. <br><br>
								 - 신청중  : 담당자가 검토중인 상태 <br><br>
								 - 처리중  : 구입하여 정리하고 있는 상태 <br><br>
								 - 취소됨 : 구입에서 제외된 상태(사유) <br><br>
								 
								 ○ <input  style = "text-align:center; display:inline" type="text" value="희망도서 선정 제외 기준" disabled> <br><br>
								* 도서관내 이미 소장중이거나 중복신청도서<br><br>
								
								* 고가의 도서 <br><br>
								
								* 선정적인 도서 <br><br>
								
								* 문제집 혹은 수험서 또는 만화도서 <br><br>
								
								* 품절이거나 절판된 도서 <br><br>
						      </div>
						    </li>
						    <li id="tab2" class="btnCon"><a class="btn" href="#tab2">menu2</a>
						      <div class="tabCon" >It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</div>
						      
						    </li> 
						  </ul>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</section>












<!-- <form method="post" name="form">
    <input type="submit" value="신청안내" onclick="javascript: form.action='userapplyinfo';"/>
    <input type="submit" value="도서신청" onclick="javascript: form.action='userapply';"/>
</form><br>
○ <input  style = "text-align:center;" type="text" value="희망도서 신청안내" disabled><br><br>
＊신청대상 : 회원가입한 모든 사용자<br><br>

* 신청방법  :  희망하시는 도서가 소장된 자료인지 확인하시고 도서가 없는 경우 홈페이지내 희망도서 신청화면에서 도서정보를 정확하게 기재해주시기 바랍니다.<br><br>

* 신청권수  :  1인 월 2권<br><br>

* 소요기간 :  1~2개월 소요  <br><br>

○ <input  style = "text-align:center;" type="text" value="희망도서 신청결과 확인" disabled> <br><br>
* 홈페이지 내 <마이 라이브러리 -> 현황조회 ->  도서 신청 현황> 에서 확인 가능합니다. <br><br>

* 각 진행상태는 아래와 같습니다. <br><br>
 - 신청중  : 담당자가 검토중인 상태 <br><br>
 - 처리중  : 구입하여 정리하고 있는 상태 <br><br>
 - 취소됨 : 구입에서 제외된 상태(사유) <br><br>
 
 ○ <input  style = "text-align:center;" type="text" value="희망도서 선정 제외 기준" disabled> <br><br>
* 도서관내 이미 소장중이거나 중복신청도서<br><br>

* 고가의 도서 <br><br>

* 선정적인 도서 <br><br>

* 문제집 혹은 수험서 또는 만화도서 <br><br>

* 품절이거나 절판된 도서 <br><br> -->
</body>
</html>