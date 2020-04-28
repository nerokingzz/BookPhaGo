<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
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
	<link rel="stylesheet" href="${contextPath}/resources/css/style.css"> 
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
	<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
	<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
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
			
			if (pageInfo == 'user_A') {
				$("#nav-acc-tab").attr("class", "nav-item nav-link active");
				$("#nav-acc-tab").attr("aria-selected", "true");
				$("#nav-acc").attr("class", "tab-pane fade show active");
				
			} else if (pageInfo == 'book_A') {
				$("#nav-status-tab").attr("class", "nav-item nav-link active");
				$("#nav-status-tab").attr("aria-selected", "true");
				$("#nav-status").attr("class", "tab-pane fade show active");
				
			} else if (pageInfo == 'book_status_A') {
				$("#nav-password-tab").attr("class", "nav-item nav-link active");
				$("#nav-password-tab").attr("aria-selected", "true");
				$("#nav-password").attr("class", "tab-pane fade show active");
				
			} else if (pageInfo == 'com_A') {
				$("#nav-acc-tab2").attr("class", "nav-item nav-link active");
				$("#nav-acc-tab2").attr("aria-selected", "true");
				$("#nav-acc2").attr("class", "tab-pane fade show active");
				
			} else if (pageInfo == 'dec_A') {
				$("#nav-status-tab2").attr("class", "nav-item nav-link active");
				$("#nav-status-tab2").attr("aria-selected", "true");
				$("#nav-status2").attr("class", "tab-pane fade show active");
				
			} else if (pageInfo == 'chat_A') {
				logLoad();
				$("#nav-password-tab2").attr("class", "nav-item nav-link active");
				$("#nav-password-tab2").attr("aria-selected", "true");
				$("#nav-password2").attr("class", "tab-pane fade show active");
				
			} else if (pageInfo == 'rent_A') {
		         $("#nav-acc-tab3").attr("class", "nav-item nav-link active");
		         $("#nav-acc-tab3").attr("aria-selected", "true");
		         $("#nav-acc3").attr("class", "tab-pane fade show active");
		         
		      } else {
				$("#nav-acc-tab").attr("class", "nav-item nav-link active");
				$("#nav-acc-tab").attr("aria-selected", "true");
				$("#nav-acc").attr("class", "tab-pane fade show active");
			}
		})
		
		function user_A() {
			location.href="admin_main.do?page=user_A";
		}
		
		function book_A() {
			location.href="admin_main.do?page=book_A";
		}
		
		function book_status_A() {
			location.href="admin_main.do?page=book_status_A";
		}
		
		function com_A() {
			location.href="admin_main.do?page=com_A";
		}
		
		function dec_A() {
			location.href="admin_main.do?page=dec_A";
		}
		
		function chat_A() {
			location.href="admin_main.do?page=chat_A";
			
		}
		function rent_A() {
		      location.href="admin_main.do?page=rent_A";
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
		initSheet.Cfg = {SearchMode:smClientPaging,ToolTip:1,Page:10,SizeMode:2};
		initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
		initSheet.Cols = [
			{Header:"번호", Type:"int", SaveName:"COMMUNITY_ID", MinWidth:20},
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
				var page="com_A";
				mySheet.DoSearch("com_esta_request_list.do", page);
				//mySheet.DoSearch("transaction_data2.json");
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
</head>



<body onload="LoadPage()">

    <!-- header start -->
	<jsp:include page="../header.jsp"></jsp:include>
    <!-- header end -->
    
    <section class="profile-account-setting">
		<div class="container">
			<div class="account-tabs-setting">
				<div class="row">
               
					<div class="col-lg-3">
						<div class="acc-leftbar">
                        	<div class="nav nav-tabs" id="nav-tab" role="tablist">
                           		<a><b>관리자전용</b></a>
                            		<a class="nav-item nav-link" id="nav-acc-tab" data-toggle="tab" href="#nav-acc" onclick="user_A()" role="tab" aria-controls="nav-acc" aria-selected="false"><i class="la la-cogs"></i>회원관리</a>
                            		<a class="nav-item nav-link" id="nav-status-tab" data-toggle="tab" href="#nav-status" onclick="book_A()" role="tab" aria-controls="nav-status" aria-selected="false"><i class="fa fa-line-chart"></i>도서관리</a>
                           	 		<a class="nav-item nav-link" id="nav-password-tab" data-toggle="tab" href="#nav-password-tab" onclick="book_status_A()" role="tab" aria-controls="nav-password" aria-selected="false"><i class="fa fa-lock"></i>현황관리</a>
                            		<a class="nav-item nav-link" id="nav-acc-tab2" data-toggle="tab" href="#nav-acc" onclick="com_A()" role="tab" aria-controls="nav-acc" aria-selected="false"><i class="la la-cogs"></i>커뮤니티관리</a>
                            		<a class="nav-item nav-link" id="nav-status-tab2" data-toggle="tab" href="#nav-status" onclick="dec_A()" role="tab" aria-controls="nav-status" aria-selected="false"><i class="fa fa-line-chart"></i>신고관리</a>
                            		<a class="nav-item nav-link" id="nav-password-tab2" data-toggle="tab" href="#nav-password-tab" onclick="chat_A()" role="tab" aria-controls="nav-password" aria-selected="false"><i class="fa fa-android"></i>챗봇관리</a>
                            		<a class="nav-item nav-link" id="nav-acc-tab3" data-toggle="tab" href="#nav-acc" onclick="rent_A()" role="tab" aria-controls="nav-acc" aria-selected="false"><i class="la la-cogs"></i>도서대출</a>
                        	</div>
                     	</div><!--acc-leftbar end-->
					</div> <!-- col-lg-3 end -->
                  
					<div class="col-lg-9">
						<div class="tab-content" id="nav-tabContent">
                        	<div class="tab-pane fade" id="nav-acc" role="tabpanel" aria-labelledby="nav-acc-tab">
                           		<div class="acc-setting">
                              		<h3>회원관리</h3>
                           		</div><!--acc-setting end-->
                        	</div>
                        	<div class="tab-pane fade" id="nav-status" role="tabpanel" aria-labelledby="nav-status-tab">
                        		<div class="acc-setting">
                            		<h3>도서관리</h3>
                                	<jsp:include page="../book/adminlibrarylist.jsp"></jsp:include>
                        		</div><!--acc-setting end-->
                        	</div>
                        	<div class="tab-pane fade" id="nav-password" role="tabpanel" aria-labelledby="nav-password-tab">
                             	<div class="acc-setting">
                             		<h3>현황관리</h3>
                           	 	</div><!--acc-setting end-->
                        	</div>
                        	<div class="tab-pane fade" id="nav-acc2" role="tabpanel" aria-labelledby="nav-acc-tab">
                           		<div class="acc-setting">
                              		<h3>커뮤니티관리</h3>
                              	    <div class="main_content" style="width: 100%; height:100%;">
										<div class="ib_product"><script>createIBSheet("mySheet", "100%", "100%");</script></div>
										<div id='pagination' style='text-align:center;width:100%'></div>
						  			</div>
                           		</div><!--acc-setting end-->

                        	</div>
                        	<div class="tab-pane fade" id="nav-status2" role="tabpanel" aria-labelledby="nav-status-tab">
                           		<div class="acc-setting">
                            		<h3>신고관리</h3>
                                	<jsp:include page="../mylib/declare/mylib_declare_request_list.jsp"></jsp:include>
                             	</div><!--acc-setting end-->
                          	</div>
                          	<div class="tab-pane fade" id="nav-password2" role="tabpanel" aria-labelledby="nav-password-tab">
                             	<div class="acc-setting">
                              		<h3>챗봇관리</h3>
                              		<jsp:include page="../chat/getRank.jsp" flush="true"></jsp:include>
                           	 	</div><!--acc-setting end-->
                          	</div>
                          	<div class="tab-pane fade" id="nav-acc3" role="tabpanel" aria-labelledby="nav-acc-tab">
                          		<div class="acc-setting">
                            		<h3>도서대출</h3>
                                	<jsp:include page="../book/adminrentandreturn.jsp"></jsp:include>
                            	</div><!--acc-setting end-->
                          	</div>
						</div>
					</div> <!-- col-lg-9 end -->

				</div> <!-- row end -->
			
			

			</div>
		</div>
	</section>

  	<!-- footer start -->
	<jsp:include page="../footer.jsp"></jsp:include>
	<!-- footer end -->
	
<script src = "resources/chat/js/log.js" ></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/popper.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/flatpickr.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/lib/slick/slick.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/script.js"></script>
<script src = "resources/chat/js/log.js" ></script>
	
  
</body>
</html>