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
	<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
	
  	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
  	<!-- session 로그인 정보 -->
	<%
		session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		String user_position=(String)session.getAttribute("user_position");
	%>
	
<style>
a, a:link {
    text-decoration: none;
    color: white;
}

.banner {
	width: 100%;
	height: 100%;
	padding-top: 35px;
	background:linear-gradient(135deg, #5b247a 0%,#1bcedf 100%);
}

.favTitle1 {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 30px;
	color: #ffffff;
	text-align: center;
	font-weight: bold;
	margin: 0 10%;
}


.favTitle2 {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 50px;
	color: #ffffff;
	text-align: center;
	font-weight: bold;
	margin: 0 10% 50px;
}

.row {
	font-family: 'Noto Sans KR', sans-serif !important;
}

.row img {
	box-shadow: none;
	border-radius: 50%;
    margin: 0 auto;
    float: none;
}

.favDesc {
	text-align: center;
	color: white;
	margin-top: 30px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 300;
	text-transform: lowercase;
	padding-bottom: 42px;
	line-height: 25px;
	font-size: 18px !important;
}

.favName {
	text-align: center;
    font-size: 30px;
    color: #ffffff;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 300;
    font-size: 11pt;
    margin-top: 8px;
}

.favImgs{
    width: auto;
    min-height: 150px;
    display: block;
    background: transparent;
    text-align: center;
}


.bookContentMsg{
	background-color : #EAEAEA;
	color :black;
	font-size : 11pt;
	padding : 15px;
	line-height: 20px;
	font-family: 'Nanum Myeongjo', serif;
}


.bookContentSpan{
	padding-top: 10px;
    position: relative;
    left: 10%;
    top: 40%;
    box-shadow: 5px 5px;
    /* max-width: 500px; */
}
</style>
</head>	
	
	<script type="text/javascript">
		
		$(document).ready(function() {
			
			$('#book-name_0').hover(function(){
		        $('#book-contents_0').css('display','');
		    }, function() {
		    	$('#book-contents_0').css('display','none');
		    });
			$('#book-name_1').hover(function(){
		        $('#book-contents_1').css('display','');
		    }, function() {
		    	$('#book-contents_1').css('display','none');
		    });
			$('#book-name_2').hover(function(){
		        $('#book-contents_2').css('display','');
		    }, function() {
		    	$('#book-contents_2').css('display','none');
		    });
			$('#book-name_3').hover(function(){
		        $('#book-contents_3').css('display','');
		    }, function() {
		    	$('#book-contents_3').css('display','none');
		    });
			$('#book-name_4').hover(function(){
		        $('#book-contents_4').css('display','');
		    }, function() {
		    	$('#book-contents_4').css('display','none');
		    });
			

		});
	
		function recomRefresh() {
			var favorite='${favorite}';
			
			$.ajax({
				url:"favor_refresh.do",
				method:"POST",
				data:{"favorite" : favorite},
				success:function(data) {
					console.log(data);
					
					for(var i=0; i<data.length; i++) {
						document.getElementById("book-number_" + i).innerHTML=data[i].BOOKNUMBER;
						document.getElementById("book-name_" + i).innerHTML=data[i].BOOKNAME;
						document.getElementById("book-writer_" + i).innerHTML=data[i].BOOKWRITER;
						document.getElementById("book-publisher_" + i).innerHTML=data[i].BOOKPUBLISHER;
						document.getElementById("book-contents_" + i).innerHTML="<div class='bookContentMsg'>" + data[i].BOOKCONTENTS + "</>";
						
					}
					
				}
			})
		}
	</script>

<body>


<div class="acc-setting" style="width:100%; height:100%;">
	<div class="banner-wrapper" style="width:100%; height:100%;padding-bottom: 30px;">
	    <div class="banner" id = ''>
	      <div class="banner-content" style="width: 100%;height: 100%;">
	        <h1 class="favTitle1">당신의 취향은<br></h1>
	       	<h1 class="favTitle2">'${favorite}'입니다!</h1>
	        <c:choose>
	        	<c:when test="${favorite eq '총류' }">
	        	<div style="margin-top:30px; width: 100%;height: 100%;">
		        	<div class="row" style="width: 100%;height: 100%;">
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B000_A1.jpg"></div><p class = "favName">브리테니커백과사전</p></div>
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B000_A2.jpg"></div><p class = "favName">남궁성</p></div>
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B000_A3.jpg"></div><p class = "favName">영어사전</p></div>
		        	</div>
		        	<h2 class = "favDesc">어머낫 보기 드문 독서 취향을 가지셨군요! <br> 남들이 잘 찾지 않는 책들을 찾아주셔서 감사합니다! <br> 정보의 바다에서 어푸어푸 헤엄쳐주세요!</h2>
	        	</div>         		
	        	</c:when>
	        	<c:when test="${favorite eq '철학' }">
	        	<div style="margin-top:30px; width: 100%;height: 100%;">
		        	<div class="row" style="width: 100%;height: 100%;">
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B001_A1.jpg"></div><p class = "favName">스피노자</p></div>
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B001_A2.jpg"></div><p class = "favName">플라톤</p></div>
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B001_A3.jpg"></div><p class = "favName">공자</p></div>
		        	</div>
		        	<h2  class = "favDesc">산은 산이요, 물은 물이로다~ <br> 인간은 무엇을 위해 이 세상에 태어난것인지 깨달으셨나요? <br> 맞습니다, 그 대답은 바로 책 속에 존재하는것이지요!</h2>
	        	</div>	      		
	        	</c:when>
	        	<c:when test="${favorite eq '종교' }">
	        	<div style="margin-top:30px; width: 100%;height: 100%;">
		        	<div class="row" style="width: 100%;height: 100%;">
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B002_A1.jpg"></div><p class = "favName">기독교</p></div>
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B002_A2.jpg"></div><p class = "favName">힌두교</p></div>
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B002_A3.jpg"></div><p class = "favName">유대교</p></div>
		        	</div>
		        	<h2 class = "favDesc">인간이 서로 애정을 주고 받는 곳에 신은 가까이 있다. <br> 무신론자도 밤에는 신을 찾는답니다! <br> 그 누구도 종교의 자유를 무시하지 말라! (신천지 제외)</h2>
	        	</div>
	        	</c:when>
	        	<c:when test="${favorite eq '사회과학' }">
	        	<div style="margin-top:30px; width: 100%;height: 100%;">
		        	<div class="row" style="width: 100%;height: 100%;">
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B003_A1.jpg"></div><p class = "favName">앨빈 토플러</p></div>
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B003_A2.jpg"></div><p class = "favName">애덤 스미스</p></div>
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B003_A3.jpg"></div><p class = "favName">카를 마르크스</p></div>
		        	</div>
		        	<h2 class = "favDesc">혹시 당신은 문과생? 선택과목은 무엇으로 정하셨나요? <br> 세상을 움직이는 자들은 문과생들이랍니다! <br> 우리 모두 이 세상을 바꿔봅시다!</h2>
	        	</div>	
	        	</c:when>
	        	<c:when test="${favorite eq '자연과학' }">
	        	<div style="margin-top:30px; width: 100%;height: 100%;">
		        	<div class="row" style="width: 100%;height: 100%;">
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B004_A1.jpg"></div><p class = "favName">찰스 다윈</p></div>
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B004_A2.jpg"></div><p class = "favName">알베르트 아인슈타인</p></div>
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B004_A3.jpg"></div><p class = "favName">아이작 뉴턴</p></div>
		        	</div>
		        	<h2 class = "favDesc">뼛속까지 이과생인 당신! 최애 과목은 물리? 화학? 생물? 지구과학? <br> 이 세상의 모든 현상은 다 자연과학이죠! <br> 세상의 원리를 찾아서!</h2>
	        	</div>	
	        	</c:when>
	        	<c:when test="${favorite eq '기술과학' }">
	        	<div style="margin-top:30px; width: 100%;height: 100%;">
		        	<div class="row" style="width: 100%;height: 100%;">
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B005_A1.jpg"></div><p class = "favName">이국종</p></div>
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B005_A2.jpg"></div><p class = "favName">기계공학자</p></div>
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B005_A3.jpg"></div><p class = "favName">김원기</p></div>
		        	</div>
		        	<h2 class = "favDesc">사람이 살아가는 데 편리함을 주는 기술과학! <br> 이 세상에서 없어서는 안되는 분야랍니다! <br> 앞으로도 세상의 발전을 위해 힘써주실거죠?</h2>
	        	</div>	
	        	</c:when>
	        	<c:when test="${favorite eq '예술' }">
	        	<div style="margin-top:30px; width: 100%;height: 100%;">
		        	<div class="row" style="width: 100%;height: 100%;">
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B006_A1.jpg"></div><p class = "favName">빈센트 반 고흐</p></div>
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B006_A2.jpg"></div><p class = "favName">봉준호</p></div>
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B006_A3.jpg"></div><p class = "favName">모차르트</p></div>
		        	</div>
		        	<h2 class = "favDesc">고흐가 자신의 귀를 자른 이유가 공감되시나요? <br> 학창시절 교과서에 낙서 좀 해보신 분들? <br> 여러분들도 제 2의 봉준호가 될 수 있습니다!</h2>
	        	</div>
	        	</c:when>
	        	<c:when test="${favorite eq '언어' }">
	        	<div style="margin-top:30px; width: 100%;height: 100%;">
		        	<div class="row" style="width: 100%;height: 100%;">
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B007_A1.jpg"></div><p class = "favName">노엄 촘스키</p></div>
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B007_A2.jpg"></div><p class = "favName">세종대왕</p></div>
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B007_A3.jpg"></div><p class = "favName">야XX</p></div>
		        	</div>
		        	<h2 class = "favDesc">사람들 간의 관계를 좌우하는데 언어만큼 중요한건 없지요. <br> 어떻게 말하느냐에 따라 적군이 될 수도, 아군이 될 수도 있다는 거 알고계시죠? <br> '너도? 야,나두!'</h2>
	        	</div>
	        	</c:when>
	        	<c:when test="${favorite eq '문학' }">
	        	<div style="margin-top:30px; width: 100%;height: 100%;">
		        	<div class="row" style="width: 100%;height: 100%;">
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B008_A1.jpg"></div><p class = "favName">박완서</p></div>
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B008_A2.jpg"></div><p class = "favName">조앤K롤링</p></div>
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B008_A3.jpg"></div><p class = "favName">박경리</p></div>
		        	</div>
		        	<h2 class = "favDesc">비오는 날 창가에 앉아 책 읽는 걸 좋아하시나요? <br> 여유로운 한때를 보내는 데에는 문학만큼 더 좋은 것도 없죠! <br> 당신도 문학도가 될 수 있습니다!</h2>
	        	</div>	
	        	</c:when>
	        	<c:when test="${favorite eq '역사' }">
 	        	<div style="margin-top:30px; width: 100%;height: 100%;">
		        	<div class="row" style="width: 100%;height: 100%;">
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B009_A1.jpg"></div><p class = "favName">유관순</p></div>
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B009_A2.jpg"></div><p class = "favName">안중근</p></div>
		        		<div class='col-sm-4 col-md-4' style="width: 100%;height: 100%;"><div class="favImgs"><img style=" border-radius: 50%; " src="/resources/images/B009_A3.jpg"></div><p class = "favName">김구</p></div>
		        	</div>
		        	<h2 class = "favDesc">역사를 잃은 민족에게는 미래가 없다. <br> 역사는 더이상 부수적인 과목이 아닙니다. <br> 국민이라면 당연히, 무조건 알아야하는 기본상식이죠!</h2>
	        	</div>	
	        	</c:when>
	        </c:choose>
	      </div>
	    </div>
	    
		<h1 style="font-family: 'Black Han Sans', sans-serif; font-size:50px; text-align:center; margin-top:50px;">이런 책을 좋아하실 것 같아요!</h1>
		<div style="float:right; padding-right:50px;"><i style="font-size:20px;" class="fas fa-sync-alt" onclick="recomRefresh()"></i></div>
		<div style="padding-top:30px; margin-left:20px; margin-right:20px; margin-bottom:30px">
			<div class="row">
				<div class="col-md-2 col-sm-2">
					<h6 style="font-family: 'Noto Sans KR', sans-serif;">번호</h6>
				</div>
				<div class="col-md-4 col-sm-4">
					<h6 style="font-family: 'Noto Sans KR', sans-serif;">제목</h6>
				</div>
				<div class="col-md-3 col-sm-3">
					<h6 style="font-family: 'Noto Sans KR', sans-serif;">작가</h6>
				</div>
				<div class="col-md-2 col-sm-2">
					<h6 style="font-family: 'Noto Sans KR', sans-serif;">출판사</h6>
				</div>
			</div>
						                            
			<c:forEach var="i" begin="1" end="${recomListSize}" varStatus="loop">
				<hr>
				<div class="row">
					<div class="col-md-2 col-sm-2">
						<h6 id="book-number_${loop.current-1}" style="font-family: 'Noto Sans KR', sans-serif; font-size:15px;">${recomList.get(i-1).get("BOOKNUMBER")}</h6>
					</div>
					<div class="col-md-4 col-sm-4">
						<h6 id="book-name_${loop.current-1}" style="font-family: 'Noto Sans KR', sans-serif; font-size:15px;">${recomList.get(i-1).get("BOOKNAME")} <i class="fas fa-sort-down"></i></h6>
					</div>
					<div class="col-md-3 col-sm-3">
						<h6 id="book-writer_${loop.current-1}" style="font-family: 'Noto Sans KR', sans-serif; font-size:15px;">${recomList.get(i-1).get("BOOKWRITER")}</h6>
					</div>
					<div class="col-md-2 col-sm-2">
						<h6 id="book-publisher_${loop.current-1}" style="font-family: 'Noto Sans KR', sans-serif; font-size:15px;">${recomList.get(i-1).get("BOOKPUBLISHER")}</h6>
					</div>
					<span class="bookContentSpan" id="book-contents_${loop.current-1 }" style="padding-top:10px; display:none;"><div class="bookContentMsg">${recomList.get(i-1).get("BOOKCONTENTS")}</div></span>
				</div>
			</c:forEach>
		</div>
	</div>
	

	
</div><!--acc-setting end-->




<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/popper.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/flatpickr.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/lib/slick/slick.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/script.js"></script>

</body>
</html>
