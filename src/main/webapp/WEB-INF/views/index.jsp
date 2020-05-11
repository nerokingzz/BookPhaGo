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
  	<style type="text/css">
.calenderArea { 
        padding: 15px;
        font-size: 12px; line-height: 12px; 
        font-family: "Lucida Sans Unicode", "Lucida Grande", 'New Gulim', '새굴림', Gulim, sans-serif; 
} 
.calenderArea .buttonWrapper { margin-bottom: 5px; text-align: center; vertical-align: middle; } 

.calenderArea .titleDate { display: inline-block; width: 78px; text-align: left; vertical-align: bottom; } 

.calenderArea button { 
        width: 22px; padding: 0; 
        border: 2px outset #dfdfdf; border-radius: 3px; background-color: #ececec; 
        font: inherit; font-size: 8px; vertical-align: middle; 
} 
.calenderArea button:active { border-style: inset; } 

.calenderArea table { 
        border-width: 0; border-collapse: collapse; 
        font-size: 12px; font-family: 'New Gulim', '새굴림', Gulim, Arial, sans-serif; 
} 
.calenderArea th, 
.calenderArea td { width: 35px; padding: 10px 0; border: 1px solid gray; text-align: center; vertical-align: middle; } 

.calenderArea .blankRow td { border-width: 0; height: 1px; font-size: 1px; line-height: 1px; } 

.calenderArea .sundayy { color: red; } 오늘 날짜가 일요일과 겹칠 경우를 대비하여  !important */ 
/*.calenderArea .sunday { color: red !important; } 오늘 날짜가 일요일과 겹칠 경우를 대비하여  !important */ 
.calenderArea .today { background-color: lavender; } 
/*.calenderArea .saturday { color: blue !important; } 오늘 날짜가 일요일과 겹칠 경우를 대비하여  !important */ 
.calenderArea .saturdayy { color: blue; } /*오늘 날짜가 일요일과 겹칠 경우를 대비하여  !important */ 
.calenderArea .monday { color: red !important;}/* 오늘 날짜가 일요일과 겹칠 경우를 대비하여  !important */ 
</style>
<script type="text/javascript">
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

</script>

</head>

	<%
		session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		String user_position=(String)session.getAttribute("user_position");
	%>



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
							
							<c:choose>
								<c:when test="${user_position ne null}">
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
								</c:when>
							</c:choose>
							
							
							


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
									<br> 
									
									<div class="calenderArea" style="    padding-top: 60px;padding-right: 60px;padding-bottom: 60px;padding-left: 60px;">
									    <div class="buttonWrapper">
									        <button onclick="showPrev()"> < </button> 
									        <span class="titleDate" id="titleDate"></span> 
									        <button onclick="showNext()"> > </button>
									    </div>
									
									    <div id="calenderWrapper"></div>
									    <br>매주 월요일 휴관
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
<script type="text/javascript">
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
</body>
</html>