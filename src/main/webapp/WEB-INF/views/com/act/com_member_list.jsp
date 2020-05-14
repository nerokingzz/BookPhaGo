<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"  />

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>

<head>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/com/css/minCSS.css">
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
		<link rel="stylesheet" href="${contextPath}/resources/css/style.css"> 
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
	<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
	<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>
	
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
	
	<style>
	table{
		width : 100% !important;
	}
	
	.user-fw-status li h4 {
		color: #686868;
	    font-size: 13px;
	    font-weight: bold;
	    margin-bottom: 0px;
	}
	
	body{
		font-family : 'Noto Sans KR', sans-serif;
	}
	
	
	div#commInfo{
		border: 1px solid #E38544;
   		border-radius: 15px;
    	margin: 10px;
    	padding: 20px 5px;
	}
	
	span.commInfoTag{
		font-size: 9pt;
    	font-weight: bold;
    	float: left;
    	margin-left: 35px;
    	line-height: 20px;
	}
	
	span.commInfoCon{
		font-size: 10pt;
	    float: right;
	    margin-right: 35px;
	    line-height: 20px;
	}
	
	
	.user-fw-status li h4.commInfoButton{
		background-color: #e44d3a;
	    color: white;
	    width: 200px;
	    height: 30px;
	    padding: auto;
	    border-radius: 90px;
	    margin: 10px 0;
	}
	
	.user-fw-status li h4 a{
		color : white;
		line-height: 30px;
	}
	.company-title h3 {
	    color: #000000;
	    font-size: 20px;
	    font-weight: 600;
	    background-color: #fff;
	    padding: 20px 10px 10px;
	}
	</style>
	
</head>

	<!-- ibsheet -->
	<script type="text/javascript">
		//시트 높이 계산용
		var pageheightoffset = 200;
		
		/*Sheet 기본 설정 */
		function LoadPage() {
				
				mySheet_comMem.RemoveAll();
				//아이비시트 초기화
				var initSheet = {};
				initSheet.Cfg = {SearchMode:smClientPaging,ToolTip:1,Page:10,SizeMode:1,AutoFitColWidth: "resize"};
				initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
				initSheet.Cols = [
					{Header:"닉네임", Type:"Text", SaveName:"MEMBER_NICKNAME"},
					{Header:"아이디", Type:"Text", SaveName:"MEMBER_ID"},
					{Header:"가입날짜", Type:"Text", SaveName:"MEMBER_JOIN_DATE"},
					{Header:"등급", Type:"Combo", SaveName:"MEMBER_POSITION", OnChange:positionUpdate, ComboText:"일반|운영", ComboCode:"일반|cap"},
					{Header:"대답1", Type:"Text", SaveName:"MEMBER_ANSWER1"},
					{Header:"대답2", Type:"Text", SaveName:"MEMBER_ANSWER2"}
				];
				
				
				IBS_InitSheet( mySheet_comMem , initSheet);
				
				mySheet_comMem.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
		        //mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
				//doAction('search');
				
				mySheet_comMem.SetEditable(true);
				mySheet_comMem.SetTheme("OR","orange");
				doAction('search');
	
				//mySheet_comMem.SetCountPosition(1);
				//mySheet_comMem.SetPagingPosition(2);
				
			} 
			
		
		
		/*Sheet 각종 처리*/
		function doAction(sAction) {
			
			
			switch(sAction) {
				case "search": //조회
				    //var param = FormQueryStringEnc(document.frm);

						mySheet_comMem.DoSearch("mem_list.do?community_id=${comInfo.get('COMMUNITY_ID')}");
					
					
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
		
		function positionUpdate(evtParam) {
			var row=mySheet_comMem.GetSelectionRows();
			var community_id='${comInfo.get("COMMUNITY_ID")}';
			var member_id = mySheet_comMem.GetCellValue(row, "MEMBER_ID");
			var member_position = mySheet_comMem.GetCellValue(row, "MEMBER_POSITION");

			$.ajax({
				url:"mem_posi_up.do",
				data:{"community_id" : community_id, "member_id" : member_id, "member_position" : member_position},
				method:"POST",
				success:function(data) {
					alert(data);
					//location.href="admin_main.do?page=com_A";
					location.reload();
				}
			});
		}
	
	</script>

<body onload="LoadPage()">

	<!-- header -->
	<jsp:include page="../../header.jsp"></jsp:include>

		<main>
			<div class="main-section">
				<div class="container">
					<div class="main-section-data">
						<div class="row">
							<div class="col-lg-3 col-md-4 pd-left-none no-pd">
								<div class="main-left-sidebar no-margin">
									<div class="user-data full-width">
									<jsp:include page="leftbar.jsp"></jsp:include>
									<!-- 0512 김민선 주석 처리 
										<ul class="user-fw-status">
											<li>
												<h4>커뮤니티 정보</h4>
													운영자 ${comInfo.get("COMMUNITY_CAPTAIN")} <br>
													개설날짜 ${comInfo.get("COMMUNITY_ESTABLISH_DATE")} <br>
													총 회원수 ${memCnt} <br>
													<span><a href="com_detail.do?community_id=${comInfo.get('COMMUNITY_ID') }">커뮤니티 상세보기</a></span>
											</li>
											<li>
											<c:choose>
												<c:when test="${memChk eq 'x' }">
													<h4><a onclick="window.open('com_act_mem_form.do?community_id=${comInfo.get('COMMUNITY_ID') }', '가입 신청', 'width=500, height=600')">가입하기</a></h4>
												</c:when>
												<c:when test="${memChk eq 'o' }">
													<h4><a onclick="commOut()">탈퇴하기</a></h4>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${memAuth eq 'cap'}">
													<h4><a href="com_mem_list.do?community_id=${comInfo.get('COMMUNITY_ID') }">커뮤니티 멤버</a></h4>
													<h4><a href="com_board.do?community_id=${comInfo.get('COMMUNITY_ID') }">게시판 관리</a></h4>
												</c:when>
											</c:choose>
											</li>
										</ul>-->
									</div><!--user-data end-->
									<div class="suggestions full-width">
										<jsp:include page="leftbar_article.jsp"></jsp:include>
									</div><!--suggestions end-->
								</div><!--main-left-sidebar end-->
							</div>
							<div class="col-lg-9 col-md-8 no-pd">
								<div class="main-ws-sec">
									<jsp:include page="posttopbar.jsp"></jsp:include>
									
									<div class="posts-section">

										<div class="companies-list">
											<div class="company-title">
												<h3>커뮤니티 멤버보기</h3>
											</div><!--company-title end-->
											<div class="main_content" style="width: 100%; height:100%;">
												<div class="ib_product"><script>createIBSheet("mySheet_comMem", "100%", "100%");</script></div>
						  					</div>
										
										</div><!--companies-list end-->
									</div><!--posts-section end-->
								</div><!--main-ws-sec end-->
							</div>
						</div>
					</div><!-- main-section-data end-->
				</div> 
			</div>
		</main>

	<!-- footer -->
	<jsp:include page="../../footer.jsp"></jsp:include>
	
	<!-- script -->
	<script type="text/javascript">
		var community_id=${comInfo.get("COMMUNITY_ID")};
		$(document).ready(function() {
			$.ajax({
				url:"board_list.do",
				contentType: 'application/json; charset=utf-8',
				data:{"community_id" : community_id},
				method:"GET",
				success:function(data) {
					console.log(data[0].BOARD_NAME);
					console.log(data[0].COMMUNITY_ID);
					console.log(data[0].BOARD_ID);
					
					for (var i=0; i<data.length; i++) {
						
						$("#board_list").append("<li style=\"list-style:none; padding-top:10px\"><a href='com_act_board.do?board_id="+data[i].BOARD_ID+"&community_id="+data[i].COMMUNITY_ID+"'>"+data[i].BOARD_NAME+"</a></li>");
						
					}

				}
				
			})
		})
		
		function commOut() {
			var result = confirm("정말로 탈퇴하시겠습니까?");
			if (result) {
				
				$.ajax({
					url:"com_out.do",
					method:"post",
					data:{"community_id" : "${comInfo.get('COMMUNITY_ID')}", "member_id" : '${user_id}'},
					success:function() {
						alert("탈퇴가 완료되었습니다.");
						location.reload();
					}
				})
				
			} else {
				alert("잘 생각하셨습니다! 앞으로도 잘 부탁드립니다 :)")
			}
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