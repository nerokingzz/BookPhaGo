<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
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
</head>

	<%
		session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		String user_position=(String)session.getAttribute("user_position");
	%>
	
<script type="text/javascript">

	function voteSubmit(fun) {
		
		var fun=fun;
		
		if (fun == 'insert') {
			vote_id=0;
		} else {
			vote_id=$('input[name=vote_id]').val();
		}
		
		var board_id=$('input[name=board_id]').val();
		var vote_title=$('input[name=vote_title]').val();
		var selection_option1=$('input[name=selection_option1]').val();
		var selection_option2=$('input[name=selection_option2]').val();
		var selection_option3=$('input[name=selection_option3]').val();
		var selection_option4=$('input[name=selection_option4]').val();
		var selection_option5=$('input[name=selection_option5]').val();
		var vote_start=$('input[name=vote_start]').val();
		var vote_end=$('input[name=vote_end]').val();
		var vote_status=$('input[name=vote_status]').val();
		var vote_participate_count=$('input[name=vote_participate_count]').val();
		
		$.ajax({
			type:"POST",
			url:"vote_submit.do",
			data:{"fun" : fun, "vote_id" : vote_id, "board_id" : board_id, "vote_title" : vote_title, "selection_option1" : selection_option1, "selection_option2" : selection_option2, "selection_option3" : selection_option3, "selection_option4" : selection_option4, "selection_option5" : selection_option5, "vote_start" : vote_start, "vote_end" : vote_end, "vote_status" : vote_status, "vote_participate_count" : vote_participate_count},
			success:function() {
				location.href="com_act_board.do?board_id=" + board_id + "&community_id=${comInfo.get('COMMUNITY_ID') }";
			}
		})
		
		 
	}
</script>

<body>	

	<div class="wrapper">	
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
										${boardInfo.get("BOARD_NAME") }
									</div><!--post-topbar end-->
                                    <div class="posts-section">
                                    	<div class="post-bar">
											<div class="row justify-content-md-center">
												<input type="text" name="vote_title" placeholder="투표 주제">
												<input type="date" name="vote_start">
												<input type="date" name="vote_end">
												
												<input type="text" name="selection_option1" placeholder="선택지1">
												<input type="text" name="selection_option2" placeholder="선택지2">
												<input type="text" name="selection_option3" placeholder="선택지3">
												<input type="text" name="selection_option4" placeholder="선택지4">
												<input type="text" name="selection_option5" placeholder="선택지5">
												
												<input type="hidden" name="vote_status" value="ing">					
												<input type="hidden" name="vote_id" value="${voteInfo.get('VOTE_ID') }">
												<input type="hidden" name="board_id" value="${boardInfo.get('BOARD_ID') }">
												<input type="hidden" name="vote_participate_count" value="0">
												
												<c:choose>
													<c:when test="${voteInfo.get('VOTE_ID') eq null }">
														<input type="submit" class="btn btn-outline-secondary" onclick="voteSubmit('insert')" style="width: 20%; font-weight: bold" value="등록">
													</c:when>
													<c:otherwise>
														<input type="submit" class="btn btn-outline-secondary" onclick="voteSubmit('update')" style="width: 20%; font-weight: bold" value="수정">
													</c:otherwise>
												</c:choose>
											</div>
										</div>
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

	</div><!--theme-layout end-->
	
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
	
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
	</script>

<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/popper.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/flatpickr.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/lib/slick/slick.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/script.js"></script>

</body>
</html>