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
	
	
		<style>
	
			.post-bar {
		    border-bottom: 4px solid #e44d3a;
		}
		
		.ed-opts{
			font-size: 13px;
		}
		div[dir="ltr"] {
    		margin-left: auto;
    		margin-right: auto;
		}
	</style>
	
</head>

	<%
		session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		String user_position=(String)session.getAttribute("user_position");
	%>
	

	

<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
<script type="text/javascript">
	function voting() {
		var selectOption = $('input[name="vote_selection"]:checked').val();
		
		$.ajax({
			method:"POST",
			url:"voting.do",
			data:{"vote_id" : '${voteInfo.get("VOTE_ID")}', "vote_selection" : selectOption},
			success:function() {
				location.href="ing_vote_form.do?vote_id=${voteInfo.get('VOTE_ID') }&board_id=${boardInfo.get('BOARD_ID') }&community_id=${comInfo.get('COMMUNITY_ID')}";
				swal('소중한 한표 감사합니다 :)')
			}
		})
	}
</script>

<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>

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
                                        <div class="post-bar">
                                            <div class="post_topbar">
                                                <div class="usy-dt">
                                                    <div class="usy-name">
                                                        <h3 style="text-align: left">${voteInfo.get("VOTE_TITLE") }</h3>
                                                        <span><img src="${contextPath}/resources/bootstrap/images/clock.png" alt="">${voteInfo.get("VOTE_START") } ~ ${voteInfo.get("VOTE_END") } </span>
                                                    </div>
                                                </div>
                                                <div class="ed-opts">
                                                	현재 참여 인원 : ${voteInfo.get("VOTE_PARTICIPATE_COUNT") }
                                                </div>
                                            </div>
                                            <div class="epi-sec">
                                            </div>
                                            <div class="job_descp accountnone">
                                            	<hr>
												<input type="radio" name="vote_selection" value='SELECTION_OPTION1:${voteInfo.get("SELECTION_OPTION1") }'>${voteInfo.get("SELECTION_OPTION1") } <hr>
												<input type="radio" name="vote_selection" value='SELECTION_OPTION2:${voteInfo.get("SELECTION_OPTION2") }'>${voteInfo.get("SELECTION_OPTION2") } <hr>
												<input type="radio" name="vote_selection" value='SELECTION_OPTION3:${voteInfo.get("SELECTION_OPTION3") }'>${voteInfo.get("SELECTION_OPTION3") } <hr>
												<input type="radio" name="vote_selection" value='SELECTION_OPTION4:${voteInfo.get("SELECTION_OPTION4") }'>${voteInfo.get("SELECTION_OPTION4") } <hr>
												<input type="radio" name="vote_selection" value='SELECTION_OPTION5:${voteInfo.get("SELECTION_OPTION5") }'>${voteInfo.get("SELECTION_OPTION5") } <hr>
												
												<button style="color:#ffffff;font-size:16px;background-color:#e44d3a;padding:12px 27px;border:0;font-weight:500;margin-top:30px;" onclick="voting()">투표하기</button>
                                            </div>
                                            
                                        </div>
                                        <!--post-bar end-->
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