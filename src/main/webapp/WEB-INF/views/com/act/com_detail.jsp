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
  	
  	<!-- session 로그인 정보 -->
	<%
		session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		String user_position=(String)session.getAttribute("user_position");
	%>
	
</head>
	
<body>

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
										</ul>
									</div><!--user-data end-->
									<div class="suggestions full-width">
										<div class="sd-title">
											<h3 style="text-align:center; padding-bottom:10px">게시판목록</h3>
											<div id="board_list"></div>
										</div><!--sd-title end-->

									</div><!--suggestions end-->
								</div><!--main-left-sidebar end-->
							</div>
							<div class="col-lg-9 col-md-8 no-pd">
								<div class="main-ws-sec">
									<div class="post-topbar">
										<a href="com_act_home.do?community_id=${comInfo.get('COMMUNITY_ID') }"><h1 style="font-size:50px">${comInfo.get("COMMUNITY_NAME")}</h1></a>
										${comInfo.get("COMMUNITY_DESCRIPTION") }
									</div><!--post-topbar end-->
									
									<div class="posts-section">
										<div class="company-title">
											<h3>커뮤니티 상세보기</h3>
										</div><!--company-title end-->
										<div class="companies-list">
											<div class="row">
												<div class="col-lg-4 col-md-4 col-sm-4 col-4">
													<div class="company_profile_info" style="margin-top:-10px;">
														<div style="padding-top:20px"><h2>이름</h2></div><hr>
														<div><h2>운영자</h2></div><hr>
														<div><h2>분류</h2></div><hr>
														<div><h2>설립일</h2></div><hr>
														<div><h2>목적</h2></div><hr>
														<div><h2>설명</h2></div><hr>
														<div style="padding-bottom:20px"><h2>회원수</h2></div>
													</div><!--company_profile_info end-->
												</div>
												<div class="col-lg-8 col-md-8 col-sm-8 col-8">
													<div class="company_profile_info" style="margin-top:-10px;">
														<div style="padding-top:20px"><h2>${comInfo.get("COMMUNITY_NAME")}</h2></div><hr>
														<div><h2>${comInfo.get("COMMUNITY_CAPTAIN")}</h2></div><hr>
														<div><h2>${comInfo.get("COMMUNITY_CATEGORY")}</h2></div><hr>
														<div><h2>${comInfo.get("COMMUNITY_ESTABLISH_DATE")}</h2></div><hr>
														<div><h2>${comInfo.get("COMMUNITY_AIM")}</h2></div><hr>
														<div><h2>${comInfo.get("COMMUNITY_DESCRIPTION")} 설명</h2></div><hr>
														<div style="padding-bottom:20px"><h2>${memCnt }</h2></div>
													</div><!--company_profile_info end-->
												</div>
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