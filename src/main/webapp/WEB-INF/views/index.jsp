<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"  />

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>

<head>
	<title><spring:message code="site.title" text="북파고"/></title>
	
	<meta charset="UTF-8">
	<link href="https://fonts.googleapis.com/css2?family=Bowlby+One+SC&display=swap" rel="stylesheet">
	
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
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/indexCalendar.css">
	
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
  	
  	<!-- font -->
  	<link href="https://fonts.googleapis.com/css2?family=Bowlby+One+SC&display=swap" rel="stylesheet">
  	
  	<!-- session 로그인 정보 -->
  	<%
		session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		String user_position=(String)session.getAttribute("user_position");
	%>
</head>

	<style>
		*{margin:0;padding:0;}
	  	ul,li{list-style:none;}
	  	#slide{height:298px;position:relative;overflow:hidden;}
	  	#slide ul{width:400%;height:100%;transition:1s;}
	  	#slide ul:after{content:"";display:block;clear:both;}
	  	#slide li{float:left;width:25%;height:100%;}
	  	#slide li:nth-child(1){background:#faa;}
	  	#slide li:nth-child(2){background:#ffa;}
	  	#slide li:nth-child(3){background:#faF;}
	  	#slide li:nth-child(4){background:#aaf;}
	  	#slide input{display:none;}
	  	#slide label{display:inline-block;vertical-align:middle;width:10px;height:10px;border:2px solid #666;background:#fff;transition:0.3s;border-radius:50%;cursor:pointer;}
	  	#slide .pos{text-align:center;position:absolute;bottom:10px;left:0;width:100%;text-align:center;}
	  	#pos1:checked~ul{margin-left:0%;}
	  	#pos2:checked~ul{margin-left:-100%;}
	  	#pos3:checked~ul{margin-left:-200%;}
	  	#pos4:checked~ul{margin-left:-300%;}
	  	#pos1:checked~.pos>label:nth-child(1){background:#666;}
	  	#pos2:checked~.pos>label:nth-child(2){background:#666;}
	  	#pos3:checked~.pos>label:nth-child(3){background:#666;}
	  	#pos4:checked~.pos>label:nth-child(4){background:#666;}
	</style>
</head>

<body>

	<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
		
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
	    		<c:choose>
	    			<c:when test="${user_position ne null}">
	    			<div class="row">
		    			<div class="col-md-12">
		    				<div class="category-wrap">
		    					<div class="row no-gutters">
		    						<div class="col-md-13">
		    							<div class="top-category text-center no-border-left">
		    								<h3><a id = "index-mid-btn" href="myLib_main.do?page=status"><spring:message code="mid.overdue"  text="현황관리"/></a></h3>
		    							</div>
		    						</div>
		    						<div class="col-md-13">
		    							<div class="top-category text-center no-border-left">
		    								<h3><a id = "index-mid-btn" href="myLib_main.do?page=declare"><spring:message code="mid.overdue"  text="신고하기"/></a></h3>
		    							</div>
		    						</div>
		    						<div class="col-md-13">
		    							<div class="top-category text-center">
		    								<h3><a id = "index-mid-btn" href="com_main.do"><spring:message code="mid.comm"   text="커뮤니티"/></a></h3>
		    							</div>
		    						</div>
		    						<div class="col-md-13">
		    							<div class="top-category text-center">
		    								<h3><a id = "index-mid-btn" href="myLib_main.do?page=score"><spring:message code="mid.rate"  text="도서 평가"/></a></h3>
		    							</div>
		    						</div>
		    					</div>
		    				</div>
		    			</div>
	    			</div>
	    			</c:when>
	    		</c:choose>
	
	    	</div>
	    </section>
		<section class="profile-account-setting2">
		<div class="container">
			<div class="acount-tabs-setting">
				<div class="row">
					<div class="col-lg-13">
						<div style="padding-top:0px;" id="slide">
						  <input type="radio" name="pos" id="pos1" checked>
						  <input type="radio" name="pos" id="pos2">
						  <input type="radio" name="pos" id="pos3">
						  <input type="radio" name="pos" id="pos4">
						  <ul>
						    <li></li>
						    <li></li>
						    <li></li>
						    <li></li>
						  </ul>
						  <p class="pos">
						    <label for="pos1"></label>
						    <label for="pos2"></label>
						    <label for="pos3"></label>
						    <label for="pos4"></label>
						  </p>
						</div>
					</div><!--acc-leftbar end-->
					<div class="col-lg-14">
						<div class="tab-content" id="nav-tabContent">
							<div class="tab-pane fade show active" id="nav-acc"
								role="tabpanel" aria-labelledby="nav-acc-tab">
								<div class="acc-setting" style='text-align: center;border: 4px solid white;min-height: 298px;' >
									<h3 style="padding: 6px 20px;"><spring:message code="mid.cal"  text="캘린더"/></h3>
									<br> 
									
									<div class="calenderArea">
									    <div class="buttonWrapper">
									        <button onclick="showPrev()"> < </button> 
									        <span class="titleDate" id="titleDate"></span> 
									        <button onclick="showNext()"> > </button>
									    </div>
									
									    <div id="calenderWrapper"></div>
									    <br><span id="weRest"><span id = "restSquare">■</span> 매주 월요일 휴관</span>
									</div>

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
									<h3>이 달의 신간 도서</h3>
									<div id = "newBookThisMonth"> <img class='exIndex' style = 'float:none;' src="${contextPath}/resources/bootstrap/images/ex2.png"
										alt="image"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-15">
						<div class="tab-content" id="nav-tabContent">
							<div class="tab-pane fade show active" id="nav-acc"
								role="tabpanel" aria-labelledby="nav-acc-tab">
								<div class="acc-setting2" style='text-align: center;border: 4px solid white;' >
									<h3>오늘의 도서</h3>
									<div id = "randomBookToday"><img class='exIndex' style = 'float:none;' src="${contextPath}/resources/bootstrap/images/ex1.png"
										alt="image"></div>
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

	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	
	<!-- script -->
	<script>
	
		function Calender (){
		
		    // 달력으로 사용할 <table>을 준비하기 
		    var _newTable = function (){ 
		
		            var x = 0, n = 0, tr, cell; 
		
		            var table = document.createElement ( "TABLE" ); 
		            var thead = document.createElement ( "THEAD" ); 
		            var tbody = document.createElement ( "TBODY" ); 
		
		            for ( x = 0; x < 7; x++ ) { 
		                  tr = document.createElement ( "TR" ); 
		
		                  for ( n = 0; n < 7; n++ ){ 
		                        if ( x == 0 ){  cell = document.createElement ( "TH" );  } 
		                        else {  cell = document.createElement ( "TD" );  } 
		
		                        tr.appendChild ( cell ); 
		                  } 
		
		                  if ( x == 0 ){  thead.appendChild ( tr );  } 
		                  else {  tbody.appendChild ( tr );  } 
		            } 
		
		            table.appendChild ( thead ); 
		            table.appendChild ( tbody ); 
		
		            return table; 
		    }(); 
		
		    var _calender = { 
		            Table : _newTable, 
		            Title : { 
		                    Week : [ "일", "월", "화", "수", "목", "금", "토" ] 
		            }, 
		            Date : new Date(), 
		
		            Inner : function (){ 
		                    var d = this.Date; 
		                    var year = d.getFullYear(); 
		                    var month = d.getMonth(); 
		
		                    // 2월 윤달에 대한 설정 
		                    var feb = (  ( (year % 4 == 0) && (year % 100 != 0) ) || (year % 400 == 0)  ) ? 29 : 28; 
		                    var totalDays = [ 31, feb, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]; 
		
		                    // 당월 첫날의 요일과 당월의 총 날짜 
		                    var firstWeek = new Date( year, month, 1 ).getDay(); 
		                    var lastDay = totalDays[ month ]; 
		
		                    // 오늘 날짜인지를 확인하기 위한 작업 
		                    var today = new Date(); 
		                    var day = today.getDate(); 
		                    if( day <= lastDay ){  d.setDate( day );  } 
		
		                    var isToday = ( d.toDateString() == today.toDateString() ); 
		
		                    var text = ""; 
		
		                    // ie 7 이하 버전을 위한 설정 
		                    if ( navigator.userAgent.indexOf( "Trident" ) < 0 && navigator.userAgent.indexOf( "MSIE" ) > 0 ) { 
		                            text = "&nbsp;" ; 
		                    } 
		
		
		                    // <td>에 들어갈 내용들을 배열에 담아놓기 
		                    var array = new Array( 49 ); 
		
		                    var x = 0, n = 0; 
		                    for ( x = 0; x < 49; x++ ){  array[ x ] = text;  } 
		
		                    for ( x = firstWeek; x < firstWeek + lastDay; x++ ){ 
		                            n++; 
		                            array[ x ] = n; 
		                    } 
		
		                    // <tr>, <td> 설정하기 ( innerHTML , class 등등) 
		                    var td = this.Table.getElementsByTagName( "TD" ); 
		                    var cell, row; 
		                    for ( x = 0; x < td.length; x++ ){ 
		                            cell = td[ x ]; 
		                            cell.className = ""; 
		
		                            n = array[ x ]; 
		                            cell.innerHTML = n; 
		
		                            if ( x % 7 == 0 ){  
		                                    cell.className = "sunday"; // 일요일일 경우, class="sunday" 
		
		                                    row = cell.parentNode; 
		                                    row.className = ""; 
		
		                                    text = cell.innerHTML; 
		                                    if ( text == "" || text == "&nbsp;" ){ // 날짜가 없는 빈줄일 경우, class="blankRow" 
		                                        if ( x > 0 ){  row.className = "blankRow";  } 
		                                    } 
		                            } 
		                            if ( x % 7 == 6 ){  
		                                cell.className = "saturday"; // 일요일일 경우, class="sunday" 
		                        	} 
		                            if ( x % 7 == 1 ){  
		                                cell.className = "monday"; // 일요일일 경우, class="sunday" 
		                        	} 
		
		                            // 오늘 날짜일 경우, class="today" 
		                            // 오늘 날짜가 일요일과 겹칠 경우, class="today sunday" 
		                            if ( isToday && n == day ){ 
		                                    if ( cell.className.length > 0 ){  cell.className = "today" + " " + cell.className;  } 
		                                    else {  cell.className = "today";  } 
		                            } 
		                    } 
		            }, 
		
		            Set : function ( parent ){ 
		                    this.Inner(); 
		
		                    // <th> 설정하기 
		                    var table = this.Table; 
		                    var th = table.getElementsByTagName( "TH" ); 
		
		                    var x = 0; 
		                    for ( x = 0; x < th.length; x++ ){ 
		                            if ( x == 0 ){  th[ x ].className = "sundayy";  } 
		                            th[ x ].innerHTML = this.Title.Week[ x ]; 
		                            if ( x == 6 ){  th[ x ].className = "saturdayy";  } 
		                            th[ x ].innerHTML = this.Title.Week[ x ]; 
		                    } 
		
		                   // <table>을 문서에 집어넣기 
		                    parent.appendChild ( table ); 
		            }, 
		
		            // 달력 바꾸기 함수(버튼식) - 전월 혹은 전년도 달력 
		            Previous : function ( text ){ 
		                    this.Date.setDate( 1 ); // ← 달력이 바뀔때, 2개월을 넘어가버리는 오류를 잡기 위함.  
		
		                    text = ( text + "" ).toLowerCase(); 
		                    var d = this.Date; 
		                    var year = d.getFullYear(); 
		                    var month = d.getMonth(); 
		
		                    if ( text == "month" ){ 
		                            month -= 1; 
		                            if ( month < 0 ){ 
		                                year -= 1; 
		                                if ( year > 999 ){  this.Date.setMonth( month );  } 
		                            } 
		                            else {  this.Date.setMonth( month );  } 
		                    } 
		                    else if ( text == "year" ){ 
		                        year -= 1; 
		                        if ( year > 999 ){  this.Date.setFullYear( year );  } 
		                    } 
		
		                    this.Inner(); 
		            }, 
		
		            // 달력 바꾸기 함수(버튼식) - 다음달 혹은 다음년도 달력 
		            Next : function ( text ){ 
		                    this.Date.setDate( 1 ); 
		
		                    text = ( text + "" ).toLowerCase(); 
		                    var d = this.Date; 
		                    var year = d.getFullYear(); 
		                    var month = d.getMonth(); 
		
		                    if ( text == "month" ){ 
		                            month += 1; 
		                            if ( month > 11 ){ 
		                                year += 1; 
		                                if ( year < 10000 ){  this.Date.setMonth( month );  } 
		                            } 
		                            else {  this.Date.setMonth( month );  } 
		                    } 
		                    else if ( text == "year" ){ 
		                        year += 1; 
		                        if ( year < 10000 ){  this.Date.setFullYear( year );  } 
		                    } 
		
		                    this.Inner(); 
		            }, 
		
		    }; 
		
		    return _calender;     
		} 
	
		var cal = new Calender(); 

		cal.Set( calenderWrapper ); 

		var d = cal.Date; 
		var year = d.getFullYear(); 
		var mon = d.getMonth() + 1; 

		titleDate.innerHTML = year + "년 " + mon + "월"; 

		function showPrev(){ 
		    cal.Previous( "month" ); 
		    year = d.getFullYear(); 
		    mon = d.getMonth() + 1; 
		    titleDate.innerHTML = year + "년 " + mon + "월"; 
		} 

		function showNext(){ 
		    cal.Next( "month" ); 
		    year = d.getFullYear(); 
		    mon = d.getMonth() + 1; 
		    titleDate.innerHTML = year + "년 " + mon + "월"; 
		} 
	</script>

	<!-- js by template -->
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/popper.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/flatpickr.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/lib/slick/slick.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/script.js"></script>

</body>
</html>