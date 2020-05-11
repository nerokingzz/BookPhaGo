<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이라이브러리 첫 페이지</title>
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
table.type11 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    margin: 20px 10px;
}
table.type11 th {
    font-size: 14px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background-color: #e44d3a;
}
table.type11 td {
    font-size: 14px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #eee;
}
table.type05 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin: 20px 10px;
}
table.type05 th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #efefef;
}
table.type05 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
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
		
		if (pageInfo == 'score') {
			alert("도서평가로 바로 이동");
			$("#nav-acc-tab").attr("class", "nav-item nav-link active");
			$("#nav-acc-tab").attr("aria-selected", "true");
			$("#nav-acc").attr("class", "tab-pane fade show active");
			
		} else if (pageInfo == 'favor') {
			alert("취향분석으로 바로 이동");
			$("#nav-status-tab").attr("class", "nav-item nav-link active");
			$("#nav-status-tab").attr("aria-selected", "true");
			$("#nav-status").attr("class", "tab-pane fade show active");
			
		} else if (pageInfo == 'declare') {
			alert("신고하기로 바로이동");
			$("#nav-password-tab").attr("class", "nav-item nav-link active");
			$("#nav-password-tab").attr("aria-selected", "true");
			$("#nav-password").attr("class", "tab-pane fade show active");
			
		} else if (pageInfo == 'status') {
			alert("현황관리로 바로이동");
			$("#nav-acc-tab2").attr("class", "nav-item nav-link active");
			$("#nav-acc-tab2").attr("aria-selected", "true");
			$("#nav-acc2").attr("class", "tab-pane fade show active");
			
		} else {
			$("#nav-acc-tab").attr("class", "nav-item nav-link active");
			$("#nav-acc-tab").attr("aria-selected", "true");
			$("#nav-acc").attr("class", "tab-pane fade show active");
		}
	})
	
	function score() {
		location.href="myLib_main.do?page=score";
	}
	
	function favor() {
		location.href="myLib_main.do?page=favor";
	}
	
	function declare() {
		location.href="myLib_main.do?page=declare";
	}
	
	function status() {
		location.href="myLib_main.do?page=status";
	}

</script>

<script language="javascript">
	//시트 높이 계산용
	var pageheightoffset = 200;
	
	/*Sheet 기본 설정 */
	function LoadPage() {
		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smClientPaging,ToolTip:1,Page:10,SizeMode:1};
		initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
		initSheet.Cols = [
			{Header:"繁번호", Type:"int", SaveName:"COMMUNITY_ID", MinWidth:20},
			{Header:"신청날짜", Type:"Text", SaveName:"COMMUNITY_ESTABLISH_DATE", MinWidth:90},
			{Header:"신청인", Type:"Text", SaveName:"COMMUNITY_CAPTAIN", MinWidth:80},
			{Header:"이름", Type:"Text", SaveName:"COMMUNITY_NAME", MinWidth:100},
			{Header:"분류", Type:"Text", SaveName:"COMMUNITY_CATEGORY", MinWidth:50},			
			{Header:"설명", Type:"Text", SaveName:"COMMUNITY_DESCRIPTION", MinWidth:200},
			{Header:"목적", Type:"Text", SaveName:"COMMUNITY_AIM", MinWidth:150},
			{Header:"상태", Type:"Combo", SaveName:"COMMUNITY_ESTABLISH_STATUS", OnChange:comStsAdminIb, ComboText:"거절|진행중|수락", ComboCode:"dgree|ing|agree", MinWidth:70}
			
		];   
		IBS_InitSheet( mySheet , initSheet);
		
		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
        //mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
		//doAction('search');
		
		mySheet.SetEditable(true);
		doAction('search');

		mySheet.SetCountPosition(1);
		mySheet.SetPagingPosition(2);

	}

	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		
		switch(sAction) {
			case "search": //조회
			    //var param = FormQueryStringEnc(document.frm);
			
				mySheet.DoSearch("book_history.do");
				break;
			case "reload": //초기화
				mySheet.RemoveAll();
				break;
			case "save": // 저장
				//var tempStr = mySheet.GetSaveString();
				//alert("서버로 전달되는 문자열 확인 :"+tempStr);
				var retData = mySheet.GetSaveData("com_esta_request_admin.do");
				//mySheet.DoSave("com_esta_request_admin.do");
				break;			
			case "insert": //신규행 추가
				var row = mySheet.DataInsert();
				break;
		}
	}
	
	// 조회완료 후 처리할 작업
	function mySheet_OnSearchEnd() {
		
      
	}
	
	// 저장완료 후 처리할 작업
	// code: 0(저장성공), -1(저장실패)
	function mySheet_OnSaveEnd(code,msg){
		if(msg != ""){
			alert(msg);	
			//번호 다시 매기기
            //mySheet.ReNumberSeq();
		}	
	}	
	
	function comStsAdminIb(evtParam) {
		var row=mySheet.GetSelectionRows();
		var community_id = mySheet.GetCellValue(row, "COMMUNITY_ID");
		console.log(row + "번 로우의 커뮤니티아이디는" + community_id);
		var comStatus=mySheet.GetCellValue(row, "COMMUNITY_ESTABLISH_STATUS");
		console.log(row + "번 로우의 커뮤니티아이디는" + community_id + "이고 변경된 상태는" + comStatus);
		
		$.ajax({
			url:"com_esta_request_admin.do",
			data:{"community_id" : community_id, "admin_sts" : comStatus},
			method:"POST",
			success:function(data) {
				alert(data);
				//location.href="admin_main.do?page=com_A";
				location.reload();
			}
		});
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
								<a href="book_main.do" title="">
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
									<a href="" title="">정보수정</a> <br>
									<a href="" title="">로그아웃</a>
								</div>
							</div>
						</c:when>
						<c:when test="${user_position eq null}">
							<div class="user-account">
								<div class="user-info">
									<a href="sign.do" title="">로그인/회원가입</a>
								</div>
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
									<a><b>마이라이브러리</b></a>
								    <a class="nav-item nav-link" id="nav-acc-tab" data-toggle="tab" href="#nav-acc" onclick="score()" role="tab" aria-controls="nav-acc" aria-selected="false"><i class="la la-cogs"></i>도서평가</a>
								    <a class="nav-item nav-link" id="nav-status-tab" data-toggle="tab" href="#nav-status" onclick="favor()" role="tab" aria-controls="nav-status" aria-selected="false"><i class="fa fa-line-chart"></i>취향분석</a>
								    <a class="nav-item nav-link" id="nav-password-tab" data-toggle="tab" href="#nav-password-tab" onclick="declare()" role="tab" aria-controls="nav-password" aria-selected="false"><i class="fa fa-lock"></i>신고하기</a>
									<a class="nav-item nav-link" id="nav-acc-tab2" data-toggle="tab" href="#nav-acc" onclick="status()" role="tab" aria-controls="nav-acc" aria-selected="false"><i class="la la-cogs"></i>현황관리</a>
								</div>
							</div><!--acc-leftbar end-->
						</div>
						<div class="col-lg-9">
							<div class="tab-content" id="nav-tabContent">
								<div class="tab-pane fade" id="nav-acc" role="tabpanel" aria-labelledby="nav-acc-tab">
									<div class="acc-setting">
										<h3>도서평가</h3>
											
									</div><!--acc-setting end-->
								</div>
							  	<div class="tab-pane fade" id="nav-status" role="tabpanel" aria-labelledby="nav-status-tab">
							  		<div class="acc-setting">
							  			<h3>취향분석</h3>
							  		</div><!--acc-setting end-->
							  	</div>
							  	<div class="tab-pane fade" id="nav-password" role="tabpanel" aria-labelledby="nav-password-tab">
							  		<div class="acc-setting">
										<h3>신고하기</h3>
										<jsp:include page="declare/mylib_declare_form.jsp"></jsp:include>
									</div><!--acc-setting end-->
							  	</div>
							  	
							  	<!--  -->
							  	
							  	<div class="tab-pane fade" id="nav-acc2" role="tabpanel" aria-labelledby="nav-acc-tab">
									<div class="acc-setting">
										<h3>현황관리</h3>
										
										<div>
								<div class="login-sec">
								<ul class="sign-control" style="margin-bottom: 0px;">
									<li data-tab="tab-1" class="current"><a href="#" title="">도서대출현황</a></li>				
									<li data-tab="tab-2"><a href="#" title="">도서신청현황</a></li>				
								</ul>			
								<div class="sign_in_sec current" id="tab-1" style="margin-top: 50px;">
									
								<table class="type11">
								    <thead>
								    <tr>
								        <th width="20%">도서명</th>
								        <th width="9%">도서번호</th>
								        <th width="13%">대출일</th>
								        <th width="13%">반납일</th>
								        <th width="13%">대출상태</th>
								        <th width="13%">반납날짜</th>
								        <th width="7%">연장</th>
								    </tr>
								    </thead>
								    <tbody>
								    <c:choose>
											<c:when test="${booklistSize gt 0 }">
												<c:forEach var="i"  begin="1" end="${booklistSize }">
								    <tr>
								        <td width="20%">${booklist.get(i-1).get("BOOKNAME") }</td>
								        <td>${booklist.get(i-1).get("BOOKNUMBER") }</td>
								        <td>${booklist.get(i-1).get('RENTDATE') }</td>
								        <td>${booklist.get(i-1).get("RETURNDATE") }</td>
								        <td>${booklist.get(i-1).get("STATE") }</td>
								        <td>${booklist.get(i-1).get("RRETURNDATE") }</td>
								        <td>
								        	<c:set var="RENTDATE" value="${booklist.get(i-1).get('RENTDATE') }" />
											<fmt:parseDate value="${RENTDATE}" var="strPlanDate" pattern="yyyy-MM-dd"/>
											<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
											<c:set var="RETURNDATE" value="${booklist.get(i-1).get('RETURNDATE') }" />
											<fmt:parseDate value="${RETURNDATE}" var="endPlanDate" pattern="yyyy-MM-dd"/>
											<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
											<c:set var="DATE" value="${endDate - strDate }" />
															
											<jsp:useBean id="today" class="java.util.Date" />
											<fmt:formatDate var="now" value="${today}" pattern="yyyy-MM-dd" />
											<fmt:parseDate var="now1" value="${now}" pattern="yyyy-MM-dd"/>
											<fmt:parseNumber value="${now1.time / (1000*60*60*24)}" integerOnly="true" var="now2"></fmt:parseNumber>
											<c:set var="RETURNDATE1" value="${booklist.get(i-1).get('RETURNDATE') }" />
											<fmt:parseDate var="str" value="${RETURNDATE1}" pattern="yyyy-MM-dd" />
											<fmt:parseNumber value="${str.time / (1000*60*60*24)}" integerOnly="true" var="str2"></fmt:parseNumber>
											<c:set var="DATE1" value="${str2 - now2 }" />
											<c:set var="STATE" value="${booklist.get(i-1).get('STATE') }" />
											<c:if test="${DATE eq '7' && DATE1 gt 0 && STATE eq '대출중' }">
											<input type="button" class="state" id="${booklist.get(i-1).get('BOOKNUMBER') }" value="연장하기" onClick="">
											</c:if>
										</td>
								        </tr>
								    </c:forEach>
									</c:when>
									</c:choose>
								    
								    
								    </tbody>
								</table>
								
								<nav aria-label="Page navigation example" class="full-pagi">
															<ul class="pagination" style="width: auto; float: right;">
																<c:if test="${paging.startPage != 1 }">
																	<li class="page-item"><a a class="page-link pvr" href="/myLib_main.do?page=status&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">Previous</a></li>
																</c:if>	
																
																<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
																	<c:choose>
																		<c:when test="${p == paging.nowPage }">
																			<li class="page-item"><a class="page-link active">${p }</a></li>
																		</c:when>
																		<c:when test="${p != paging.nowPage }">
																			<li class="page-item"><a class="page-link" href="/myLib_main.do?page=status&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
																		</c:when>
																	</c:choose>
																</c:forEach>
																
																<c:if test="${paging.endPage != paging.lastPage}">
																	<li class="page-item"><a class="page-link pvr" href="/myLib_main.do?page=status&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">Next</a></li>
																</c:if>
															</ul>
														</nav>
														
								</div><!--sign_in_sec end-->
								<div class="sign_in_sec" id="tab-2">
										
									<div class="dff-tab current" id="tab-3" style="font-size: 14px; margin-top: 50px;">
									
									⚂ <%out.println(user_id); %> 님이 신청하신 도서는 다음과 같습니다.
									
									<c:choose>
											<c:when test="${booklistSize1 gt 0 }">
												<c:forEach var="i"  begin="1" end="${booklistSize1 }">
								    
										
										<table class="type05">
										    <tr>
										        <th scope="row">도서명</th>
										        <td>${booklist1.get(i-1).get("BOOKNAME") }</td>
										    </tr>
										    <tr>
										        <th scope="row">신청날짜</th>
										        <td>${booklist1.get(i-1).get("APPLYDATE") }</td>
										    </tr>
										    <tr>
										        <th scope="row">사유</th>
										        <td>${booklist1.get(i-1).get("APPLYREASON") }</td>
										    </tr>
										    <tr>
										        <th scope="row">상태</th>
										        <td>${booklist1.get(i-1).get("APPLYSTATE") }</td>
										    </tr>
										</table>
										 
										</c:forEach>
										</c:when>
										</c:choose><br><br>
										
										 - 신청중  : 담당자가 검토중인 상태<br><br>
										 - 처리중  : 구입하여 정리하고 있는 상태<br><br>
										 - 취소됨 : 구입에서 제외된 상태<br><br>
										
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
							  	
							  	<!--  -->
							  	
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
	
	$(document).on('click', '.state', function(){
	    var id_check = $(this).attr("id");
	    var popUrl = "bookextend.do?bookNumber="+id_check;
		window.open(popUrl,"","width=400,height=400");
	});
</script>

<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/popper.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/flatpickr.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/lib/slick/slick.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/script.js"></script>


</body>
</html>