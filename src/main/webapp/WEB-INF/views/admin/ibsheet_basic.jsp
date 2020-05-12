<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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

.form-control {
	line-height: inherit; height: 38px; padding: 0 10 0 10;
}

.seo_selectbox {
	padding-top: 0px;
    padding-right: 0px;
    padding-bottom: 0px;
    padding-left: 0px;
        background-color: white;
        text-align-last: center;
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
			
			 if (pageInfo == 'book_A') {
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
		         
		    } else if (pageInfo == 'return_A') {
				$("#nav-status-tab3").attr("class", "nav-item nav-link active");
				$("#nav-status-tab3").attr("aria-selected", "true");
				$("#nav-status3").attr("class", "tab-pane fade show active");
			} else {
				$("#nav-status-tab").attr("class", "nav-item nav-link active");
				$("#nav-status-tab").attr("aria-selected", "true");
				$("#nav-status").attr("class", "tab-pane fade show active");
			}
		})
		
		
		
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
		
		function return_A() {
			location.href="admin_main.do?page=return_A";
		}
		
	</script>
   

<script language="javascript">

	//시트 높이 계산용
	var pageheightoffset = 200;
	/*Sheet 기본 설정 */
	function LoadPage() {


		var pageInfo='${pageInfo}';

		if (pageInfo === 'com_A') { //커뮤니티관리
			
			mySheet.RemoveAll();
			//아이비시트 초기화
			var initSheet = {};
			initSheet.Cfg = {SearchMode:smClientPaging,ToolTip:1,Page:10,SizeMode:1};
			initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
			initSheet.Cols = [
				{Header:"번호", Type:"int", SaveName:"COMMUNITY_ID", MinWidth:20},
				{Header:"신청날짜", Type:"Text", SaveName:"COMMUNITY_ESTABLISH_DATE", MinWidth:90},
				{Header:"신청인", Type:"Text", SaveName:"COMMUNITY_CAPTAIN", MinWidth:80},
				{Header:"이름", Type:"Text", SaveName:"COMMUNITY_NAME", MinWidth:100},
				{Header:"분류", Type:"Text", SaveName:"COMMUNITY_CATEGORY", MinWidth:70},			
				{Header:"설명", Type:"Text", SaveName:"COMMUNITY_DESCRIPTION", MinWidth:180},
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
			
		} else if (pageInfo === 'dec_A') { //신고관리
			
			
			mySheet_dec.RemoveAll();
			//아이비시트 초기화
			var initSheet = {};
			initSheet.Cfg = {SearchMode:smClientPaging,ToolTip:1,Page:10,SizeMode:1};
			initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
			initSheet.Cols = [
				{Header:"번호", Type:"int", SaveName:"DECLARE_ID", MinWidth:20},
				{Header:"신고날짜", Type:"Text", SaveName:"DECLARE_DATE", MinWidth:90},
				{Header:"신고인", Type:"Text", SaveName:"DO_USER", MinWidth:80},
				{Header:"피신고인", Type:"Text", SaveName:"BE_DONE_USER", MinWidth:100},
				{Header:"분류", Type:"Text", SaveName:"DECLARE_CATEGORY", MinWidth:50},			
				{Header:"신고사유", Type:"Text", SaveName:"DECLARE_REASON", OnClick:decImage, MinWidth:300},
				{Header:"상태", Type:"Combo", SaveName:"DECLARE_STATUS", OnChange:decStsAdminIb, ComboText:"신고자처벌|진행중|피신고자처벌", ComboCode:"do|ing|be_done", MinWidth:120}
				
			];   
			IBS_InitSheet( mySheet_dec , initSheet);
			
			mySheet_dec.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
	        //mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
			//doAction('search');
			
			mySheet_dec.SetEditable(true);
			doAction('search');

			mySheet_dec.SetCountPosition(1);
			mySheet_dec.SetPagingPosition(2);
			
		} else if (pageInfo === 'book_A') { //도서관리
			

			
			mySheet_book.RemoveAll();
			//아이비시트 초기화
			var initSheet = {};
			initSheet.Cfg = {SearchMode:smClientPaging,ToolTip:1,Page:10,SizeMode:1};
			initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
			initSheet.Cols = [
				{Header:"도서명", Type:"Text", SaveName:"BOOKNAME", MinWidth:180,Align:"Center"},
				{Header:"도서번호", Type:"Text", SaveName:"BOOKNUMBER", MinWidth:70,Align:"Center"},
				{Header:"저자", Type:"Text", SaveName:"BOOKWRITER", MinWidth:80,Align:"Center"},
				{Header:"출판사", Type:"Text", SaveName:"BOOKPUBLISHER", MinWidth:70,Align:"Center"},
				{Header:"발행일", Type:"Text", SaveName:"BOOKDATE", MinWidth:70,Align:"Center"},			
				{Header:"장르", Type:"Text", SaveName:"BOOKGENRE", MinWidth:57,Align:"Center"},	
				{Header:"대출여부", Type:"Text", SaveName:"BOOKRENT", MinWidth:50,Align:"Center"},		
				{Header:"ISBN", Type:"Text", SaveName:"ISBN", MinWidth:88,Align:"Center"},		
				{Header:"수정",Type:"Button",SaveName:"BUTTON",DefaultValue:"수정",MinWidth:50,Align:"Center",Cursor:"Default"},
				{Header:"삭제",Type:"Button",SaveName:"BUTTONN",DefaultValue:"삭제",MinWidth:50,Align:"Center",Cursor:"Default"}
			];   
			IBS_InitSheet( mySheet_book , initSheet);
			
			mySheet_book.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
	        //mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
			//doAction('search');
			
			mySheet_book.SetEditable(true);
			doAction('search');

			mySheet_book.SetCountPosition(1);
			mySheet_book.SetPagingPosition(2);
			
		}  else if (pageInfo === 'book_status_A') { //도서관리
	
			
			mySheet_bookstatus.RemoveAll();
			mySheet_applytatus.RemoveAll();
			//아이비시트 초기화
			var initSheet = {};
			initSheet.Cfg = {SearchMode:smClientPaging,ToolTip:1,Page:10,SizeMode:1};
			initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
			initSheet.Cols = [
				{Header:"아이디", Type:"Text", SaveName:"USERID", MinWidth:110,Align:"Center"},
				{Header:"도서명", Type:"Text", SaveName:"BOOKNAME", MinWidth:300,Align:"Center"},
				{Header:"도서번호", Type:"Text", SaveName:"BOOKNUMBER", MinWidth:60,Align:"Center"},
				{Header:"대출일", Type:"Text", SaveName:"RENTDATE", MinWidth:70,Align:"Center"},
				{Header:"반납일", Type:"Text", SaveName:"RETURNDATE", MinWidth:70,Align:"Center"},			
				{Header:"반납날짜", Type:"Text", SaveName:"RRETURNDATE", MinWidth:70,Align:"Center"},	
				{Header:"상태", Type:"Text", SaveName:"STATE", MinWidth:70,Align:"Center"}
			];   
			IBS_InitSheet( mySheet_bookstatus , initSheet);
			
			mySheet_bookstatus.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
	        //mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
			//doAction('search');
			
			mySheet_bookstatus.SetEditable(true);
			//doAction('search');

			mySheet_bookstatus.SetCountPosition(1);
			mySheet_bookstatus.SetPagingPosition(2);
			

			//아이비시트 초기화
			var initSheet = {};
			initSheet.Cfg = {SearchMode:smClientPaging,ToolTip:1,Page:10,SizeMode:1};
			initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
			initSheet.Cols = [
				{Header:"신청번호", Type:"Text", SaveName:"APPLYNUMBER", MinWidth:70,Align:"Center"},
				{Header:"아아디", Type:"Text", SaveName:"USERID", MinWidth:90,Align:"Center"},
				{Header:"도서명", Type:"Text", SaveName:"BOOKNAME", MinWidth:280,Align:"Center"},
				{Header:"신청날짜", Type:"Text", SaveName:"APPLYDATE", MinWidth:70,Align:"Center"},
				{Header:"사유", Type:"Text", SaveName:"APPLYREASON", MinWidth:180,Align:"Center"},			
				{Header:"상태", Type:"Combo", SaveName:"APPLYSTATE", OnChange:chapplystate, ComboText:"신청중|처리중|취소됨", ComboCode:"신청중|처리중|취소됨", MinWidth:60 , Align:"Center"}
			];   

			IBS_InitSheet( mySheet_applytatus , initSheet);
			
			mySheet_applytatus.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
	        //mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
			//doAction('search');
			
			mySheet_applytatus.SetEditable(true);
			doAction('search');

			mySheet_applytatus.SetCountPosition(1);
			mySheet_applytatus.SetPagingPosition(2);	
			
		}
	}

	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		
		var pageInfo='${pageInfo}';
		
		switch(sAction) {
			case "search": //조회
			    //var param = FormQueryStringEnc(document.frm);
			
				if (pageInfo == 'com_A') {
					var page="com_A";
					mySheet.DoSearch("com_esta_request_list.do", page);
				} else if (pageInfo == 'dec_A') {
					var page="dec_A";
					mySheet_dec.DoSearch("mylib_declare_request_list.do", page);
				} else if (pageInfo == 'book_A') {
					var page="book_A";
					mySheet_book.ShowFilterRow();
					mySheet_book.DoSearch("mylib_book_request_list.do", page);
				}  else if (pageInfo == 'book_status_A') {
					var page="book_status_A";
					mySheet_bookstatus.ShowFilterRow();
					mySheet_bookstatus.DoSearch("mylib_bookstatus_request_list.do", page);
					mySheet_applytatus.ShowFilterRow();
					mySheet_applytatus.DoSearch("mylib_booksapplystatus_request_list.do", page);		
				} 
				
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
	
	function chapplystate(evtParam) {
		var row=mySheet_applytatus.GetSelectionRows();
		var applyNumber = mySheet_applytatus.GetCellValue(row, "APPLYNUMBER");
		var applyState = mySheet_applytatus.GetCellValue(row, "APPLYSTATE");

		
		if (confirm("변경 하시겠습니까??") == true){    //확인
			$.ajax({
				url:"endding.do",
				data:{"applyNumber" : applyNumber, "applyState" : applyState},
				method:"POST",
				success:function(data) {
					//location.href="admin_main.do?page=com_A";
			
				}
			}); 
    	    return true;
    	}else{   //취소
    	    return false;
    	}
	}
	
	function comStsAdminIb(evtParam) {
		var row=mySheet.GetSelectionRows();
		var community_id = mySheet.GetCellValue(row, "COMMUNITY_ID");
		var comStatus=mySheet.GetCellValue(row, "COMMUNITY_ESTABLISH_STATUS");
		console.log(row + "번 로우의 커뮤니티아이디는" + community_id + "이고 변경된 상태는" + comStatus);
		var comCap=mySheet.GetCellValue(row, "COMMUNITY_CAPTAIN");
		console.log(row + "번 로우의 커뮤니티아이디는" + community_id + "이고 변경된 상태는" + comStatus + "이고 운영자는" + comCap);
		var capJoinDate=mySheet.GetCellValue(row, "COMMUNITY_ESTABLISH_DATE");
		
		$.ajax({
			url:"com_esta_request_admin.do",
			data:{"community_id" : community_id, "admin_sts" : comStatus, "community_captain" : comCap, "community_establish_date" : capJoinDate},
			method:"POST",
			success:function(data) {
				alert(data);
				//location.href="admin_main.do?page=com_A";
				location.reload();
			}
		});
	}
	
	
	function decStsAdminIb(evtParam) {
		var row=mySheet_dec.GetSelectionRows();
		var declare_id = mySheet_dec.GetCellValue(row, "DECLARE_ID");
		var decStatus=mySheet_dec.GetCellValue(row, "DECLARE_STATUS");
		console.log(row + "번 로우의 신고아이디는" + declare_id + "이고 변경된 상태는" + decStatus);
		var beDoneUser=mySheet_dec.GetCellValue(row, "BE_DONE_USER");
		console.log(row + "번 로우의 신고아이디는" + declare_id + "이고 변경된 상태는" + decStatus + "이고 신고당한사람은" + beDoneUser);
		var doUser=mySheet_dec.GetCellValue(row, "DO_USER");
		
		$.ajax({
			url:"mylib_declare_request_admin.do",
			data:{"declare_id" : declare_id, "admin_sts" : decStatus, "be_done_user" : beDoneUser, "do_user" : doUser},
			method:"POST",
			success:function(data) {
				alert(data);
				//location.href="admin_main.do?page=com_A";
				location.reload();
			}
		});
		
		
	}
	
	function decImage() {
		var roww=mySheet_dec.GetSelectionRows();
		var declare_id = mySheet_dec.GetCellValue(roww, "DECLARE_ID");
		
		var newWin=window.open("dec_image.do?declare_id=" + declare_id, "신고 첨부파일", "width=800, height=800");
	}
	
	function mySheet_book_OnClick(Row, Col, Value, CellX, CellY, CellW, CellH) {
		  //특정 열을 클릭했을 때 다른 페이지로 이동하도록 처리
		  if( mySheet_book.ColSaveName(Col) == "BUTTON"){
			  var val = mySheet_book.GetCellValue(Row,"BOOKNUMBER");
			  var winopen = window.open('modfindlibrary.do?bookNumber='+val,'window_name','width=430,height=500,location=no,status=no,scrollbars=yes');
		  } else if( mySheet_book.ColSaveName(Col) == "BUTTONN" ) {
			  var value = mySheet_book.GetCellValue(Row,"BOOKNUMBER");
			  if (confirm("삭제 하시겠습니까??") == true){    //확인
				  $.ajax({
						url:"booklibdel.do",
						data:{"bookNumber" : value},
						method:"POST",
						success:function(data) {
							alert(data);
							//location.href="admin_main.do?page=com_A";
							location.reload();
						}
					});
		    	    return true;
		    	}else{   //취소
		    	    return false;
		    	}
		  }

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
                            		<a class="nav-item nav-link" id="nav-status-tab" data-toggle="tab" href="#nav-status" onclick="book_A()" role="tab" aria-controls="nav-status" aria-selected="false"><i class="fa fa-line-chart"></i>도서관리</a>
                           	 		<a class="nav-item nav-link" id="nav-password-tab" data-toggle="tab" href="#nav-password-tab" onclick="book_status_A()" role="tab" aria-controls="nav-password" aria-selected="false"><i class="fa fa-lock"></i>현황관리</a>
                            		<a class="nav-item nav-link" id="nav-acc-tab2" data-toggle="tab" href="#nav-acc" onclick="com_A()" role="tab" aria-controls="nav-acc" aria-selected="false"><i class="la la-cogs"></i>커뮤니티관리</a>
                            		<a class="nav-item nav-link" id="nav-status-tab2" data-toggle="tab" href="#nav-status" onclick="dec_A()" role="tab" aria-controls="nav-status" aria-selected="false"><i class="fa fa-line-chart"></i>신고관리</a>
                            		<a class="nav-item nav-link" id="nav-password-tab2" data-toggle="tab" href="#nav-password-tab" onclick="chat_A()" role="tab" aria-controls="nav-password" aria-selected="false"><i class="fa fa-android"></i>챗봇관리</a>
                            		<a class="nav-item nav-link" id="nav-acc-tab3" data-toggle="tab" href="#nav-acc" onclick="rent_A()" role="tab" aria-controls="nav-acc" aria-selected="false"><i class="la la-cogs"></i>도서대출</a>
                        			<a class="nav-item nav-link" id="nav-status-tab3" data-toggle="tab" href="#nav-status" onclick="return_A()" role="tab" aria-controls="nav-status" aria-selected="false"><i class="fa fa-line-chart"></i>도서반납</a>
							</div>
                     	</div><!--acc-leftbar end-->
					</div> <!-- col-lg-3 end -->
                  
					<div class="col-lg-9">
						<div class="tab-content" id="nav-tabContent" style="width: 100%; height:100%;">

                        	<div class="tab-pane fade" id="nav-status" role="tabpanel" aria-labelledby="nav-status-tab">
                        		<div class="acc-setting">
                            		<h3>도서관리</h3>
                                	<jsp:include page="../book/adminlibrarylist.jsp"></jsp:include>
                            		<div class="main_content" style="width: 100%; height:100%;">
										<div class="ib_product"><script>createIBSheet("mySheet_book", "100%", "100%");</script></div>
						  			</div>
                        		</div><!--acc-setting end-->
                        	</div>
                        	<div class="tab-pane fade" id="nav-password" role="tabpanel" aria-labelledby="nav-password-tab">
                             	<div class="acc-setting">
                             		<h3>현황관리</h3>
                             		
                             	<div>
								<div class="login-sec">
								<ul class="sign-control" style="margin-bottom: 0px;">
									<li data-tab="tab-1" class="current tab1"><a href="#" title="">도서대출현황</a></li>				
									<li data-tab="tab-2" class="tab2"><a href="#" title="">도서신청현황</a></li>				
								</ul>			
								<div class="sign_in_sec current" id="tab-1" style=" padding-left: 0px;padding-right: 0px;">
								
								<div class="main_content" style="width: 100%; height:100%;">
										<div class="ib_product"><script>createIBSheet("mySheet_bookstatus", "100%", "100%");</script></div>
						  			</div>
									
								</div><!--sign_in_sec end-->
								<div class="sign_in_sec" id="tab-2" style="padding-left: 0px;padding-right: 0px;">
										
									<div class="dff-tab current" id="tab-3">
									
									<div class="main_content" style="width: 100%; height:100%;">
										<div class="ib_product"><script>createIBSheet("mySheet_applytatus", "100%", "100%");</script></div>
						  			</div>
									
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
                        	<div class="tab-pane fade" style="width: 100%; height:100%;" id="nav-acc2" role="tabpanel" aria-labelledby="nav-acc-tab">
                           		<div class="acc-setting" style="width: 100%; height:100%;">
                              		<h3>커뮤니티관리</h3>
                              	    <div class="main_content" style="width: 100%; height:100%;">
										<div class="ib_product"><script>createIBSheet("mySheet", "100%", "100%");</script></div>
						  			</div>
                           		</div><!--acc-setting end-->

                        	</div>
                        	<div class="tab-pane fade" style="width: 100%; height:100%;" id="nav-status2" role="tabpanel" aria-labelledby="nav-status-tab">
                           		<div class="acc-setting" style="width: 100%; height:100%;">
                              		<h3>신고관리</h3>
                              	    <div class="main_content" style="width: 100%; height:100%;">
										<div class="ib_product"><script>createIBSheet("mySheet_dec", "100%", "100%");</script></div>
						  			</div>
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
                                	<jsp:include page="../book/adminrent.jsp"></jsp:include>
                            	</div><!--acc-setting end-->
                          	</div>
                          	<div class="tab-pane fade" id="nav-status3" role="tabpanel" aria-labelledby="nav-status-tab">
							  	<div class="acc-setting">
							  		<h3>도서반납</h3>
							  		<jsp:include page="../book/adminreturn.jsp"></jsp:include>
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
<script type="text/javascript">
 
 $('.js-table').find('select').on('change', function(){
	 var $row = $(this).closest('tr');
	 var userId = $row.attr('data-user-id');
	 var selectVal = $(this).val();
	 //console.log(userId, selectVal);
	 if (confirm("변경 하시겠습니까??") == true){   
		 updateDB(userId, selectVal);
 	    return true;
 	}else{   //취소
 	    return false;
 	}
 });
	
function updateDB(userid, selectVal) {
	var user_id = {"userid" : userid, "selectVal" : selectVal};
	
	$.ajax({
		url:"end.do",
		data:JSON.stringify(user_id),
		method:"POST",
		contentType: "application/json",
		success:function(data) {
			
			console.log("1111111111111111");
		},error:function(request,status,error){
			console.log("22222222222222");
		}
	});
}

</script>
  
</body>
</html>