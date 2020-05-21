<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"  />

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>

<head>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  	
  	<!-- font -->
  	<link href="https://fonts.googleapis.com/css2?family=Bowlby+One+SC&display=swap" rel="stylesheet">
  	
  	<!-- session 로그인 정보 -->
	<%
		session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		String user_position=(String)session.getAttribute("user_position");
	%>
	
	<style>
	
	body{
		font-family : 'Noto Sans KR', sans-serif;
	}
	
	
	.row{
		font-size: 10pt;
		
		text-align :center;
	}
	
	.freelancerbiding {
    	background-color: #fff;
   		padding-top: 20px;
    	padding-bottom: 0px;
    	border-bottom: 4px solid #e44d3a;
    	min-height: 380px;
    }
    
    h6.articleNo{
		color: #e44d3a;
    	font-size: 8pt;
	}
	
	span.new {
	font-size: 7pt;
	color: white;
	background-color: #e44d3a;
	border-radius: 8px;
	padding: 1px 3px;
	margin-left: 7px;
}
	</style>
	

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
										<jsp:include page="leftbar.jsp"></jsp:include>
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
									<div class="col-12" style="padding-left: 0; padding-right: 0;">
									
										<c:choose>
											<c:when test="${newArticleListSize > 0 }">
											<div class="freelancerbiding" >

											<div class="row" style="text-align: center; border-left: none;border-right: none;background: #EAEAEA;    line-height: 33px;">
												<div class="col-md-1 col-sm-1">
													<h6>글번호</h6>
												</div>
												<div class="col-md-7 col-sm-7">
													<h6>글제목</h6>
												</div>
												<div class="col-md-2 col-sm-2">
													<h6>작성자</h6>
												</div>
												<div class="col-md-2 col-sm-2">
													<h6>날짜</h6>
												</div>
												
											</div>
											<c:forEach var="i" begin="1" end="${newArticleListSize}">
												<c:if test="${i != 1 }">
													<hr>
												</c:if>
												<c:if test="${i == 1 }">
													<div class="blank" style="height: 20px;"></div>
												</c:if>
												<div class="row">
													<div class="col-md-1 col-sm-1">
														<h6 class = "articleNo">${newArticleList.get(i-1).getArticle_id()}</h6>
													</div>
													<div class="col-md-7 col-sm-7">
														<h6>
															<span class = "new">new</span>
															<%-- <a
																href="com_article.do?article_id=${newArticleList.get(i-1).getArticle_id()}&board_id=${boardInfo.get('BOARD_ID') }&community_id=${comInfo.get('COMMUNITY_ID')}">${newArticleList.get(i-1).getArticle_title()}</a> --%>
																${newArticleList.get(i-1).getArticle_title()}
														</h6>
														
													</div>
													<div class="col-md-2 col-sm-2">
														<h6>${newArticleList.get(i-1).getArticle_writer()}</h6>
													</div>
													<div class="col-md-2 col-sm-2">
							                                	<h6 id="article_date_${newArticleList.get(i-1).getArticle_id()}"></h6>
							                                	<script type="text/javascript">
							                                		console.log('${newArticleList.get(i-1).getArticle_date()}');
							                                		var date=new Date();
							                                		var current=date.getMonth()+1 + '' + date.getDate(); //514
							                                		console.log(current);
							                                		var article='${newArticleList.get(i-1).getArticle_date()}';
							                                		console.log(article[5]);
							                                		console.log(article[7]);
							                                		console.log(article[8]);
							                                		var articleDate=article[5]+''+article[7]+''+article[8];
							                                		console.log(articleDate);
							                                		var index="${newArticleList.get(i-1).getArticle_id()}";
							                                		console.log("dfdf" + index);
							                                		
							                                		var date;
							                                		if (articleDate<current) {
							                                			date=article.slice(0,9);
							                                		} else {
							                                			date=article.slice(10,15);
							                                		}
							                                		document.getElementById("article_date_"+index).innerHTML=date;
							                                		//$("#article_date_" + index).innerHTML(date);
							                                	</script>
							                                
							                                	
							                                </div>
													
												</div>
												<c:if test="${i == newArticleListSize}">
													<hr>
												</c:if>
											</c:forEach>
										</div>
											</c:when>
											<c:otherwise>
												<div class="freelancerbiding" >
													<h6>활발한 커뮤니티 활동을 해주세요 :)</h6>
												</div>
											</c:otherwise>
										</c:choose>
									
									
									
									
										
									</div>
								</div><!--posts-section end-->
								</div><!--main-ws-sec end-->
							</div>

						</div>
					</div><!-- main-section-data end-->
				</div> 
			</div>
		</main>

	<c:choose>
		<c:when test="${memChk eq 'o' }">
			<div class="chatbox-list">
				<div class="chatbox">
					<div class="chat-mg bx">
						<a href="#" title=""><img src="${contextPath}/resources/bootstrap/images/chat.png" alt=""></a>
					</div>
					<div class="conversation-box">
						<div class="con-title">
							<h3>채팅</h3>
							<a href="#" title="" class="close-chat"><i class="la la-minus-square"></i></a>
						</div>
						<jsp:include page="/chat-ws.jsp"></jsp:include>
		
					</div><!--conversation-box end-->
				</div>
			</div><!--chatbox-list end-->
		</c:when>
	</c:choose>



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
						swal("탈퇴가 완료되었습니다.");
						location.reload();
					}
				})
				
			} else {
				swal("잘 생각하셨습니다! 앞으로도 잘 부탁드립니다 :)")
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