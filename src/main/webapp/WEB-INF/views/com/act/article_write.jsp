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
		div#cke_p_content{
			width : 90%;
		}
		
		input[type='submit']{
			width: 20%;
		    font-weight: bold;
		    border: none;
		    background: #e44d3a;
		    color: white;
		}
	
	</style>
</head>

	<%
		session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		String user_position=(String)session.getAttribute("user_position");
	%>
	
<script type="text/javascript">
	
	function articleSubmit(fun) {
		var fun=fun;
		
		if (fun == 'insert') {
			article_id=0;
		} else {
			article_id=$('input[name=article_id]').val();
		}
		
		var board_id=$('input[name=board_id]').val();
		var article_title=$('input[name=article_title]').val();
		var article_date=$('input[name=article_date]').val();
		var article_content=CKEDITOR.instances.p_content.getData();
		var article_view_count=$('input[name=article_view_count]').val();
		var article_good_count=$('input[name=article_view_count]').val();
		var article_bad_count=$('input[name=article_bad_count]').val();
		var article_reply_count=$('input[name=article_reply_count]').val();
		var article_writer=$('input[name=article_writer]').val();
		var article_file=$('input[name=article_file]').val(); // C:\fakepath\파일이름.png 이런식으로 값을 가져옴
		
		alert(fun);
		alert(article_content);
		
		$.ajax({
			type:"POST",
			url:"article_submit.do",
			data:{"fun" : fun, "article_id" : article_id, "board_id" : board_id, "article_title" : article_title, "article_date" : article_date, "article_content" : article_content, "article_view_count" : article_view_count, "article_good_count" : article_good_count, "article_bad_count" : article_bad_count, "article_reply_count" : article_reply_count, "article_writer" : article_writer},
			success:function() {
				location.href="com_act_board.do?board_id=" + board_id + "&community_id=${comInfo.get('COMMUNITY_ID') }";
			}
		})
		
		
		
		 
	}
</script>

<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>

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
											<div class="row justify-content-md-center">
												<div class="col-sm-9" style="width: 90%;">
													<div class="input-group mb-3">
														<div class="input-group-prepend">
															<label class="input-group-text">제목</label>
														</div>
														<input type="text" class="form-control"
															name="article_title"
															value="${articleInfo.get('ARTICLE_TITLE')}"> <br>
														<input type="hidden" name="article_writer"
															value="${memNick }">
													</div>
												</div>
											</div>
										      
											<div class="row justify-content-md-center">
												<textarea class="form-control" id="p_content">
													${articleInfo.get("ARTICLE_CONTENT") }
												</textarea>
										      		<script type="text/javascript">
										      			CKEDITOR.replace('p_content', {height: 500});
										      		</script>
										    </div>
										    
										    <hr>
										      
											<div class="row justify-content-md-center">
												<input type="hidden" name="article_id" value="${articleInfo.get('ARTICLE_ID') }">
												<input type="hidden" name="board_id" value="${boardInfo.get('BOARD_ID') }">
												<input type="hidden" name="article_date" id="article_current_info">
												<input type="hidden" name="article_view_count" value="0">
												<input type="hidden" name="article_good_count" value="0">
												<input type="hidden" name="article_bad_count" value="0">
												<input type="hidden" name="article_reply_count" value="0">
												
												<c:choose>
													<c:when test="${articleInfo.get('ARTICLE_ID') eq null }">
														<input type="submit" class="btn btn-outline-secondary" onclick="articleSubmit('insert')" style="width: 20%; font-weight: bold" value="등록">
													</c:when>
													<c:otherwise>
														<input type="submit" class="btn btn-outline-secondary" onclick="articleSubmit('update')" style="width: 20%; font-weight: bold" value="수정">
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
	
	<!-- script -->
	<script type="text/javascript">
		var date=new Date();
		var hours=date.getHours();
		var minutes=date.getMinutes();
		var seconds=date.getSeconds();
		if (hours<10) {
			hours=0+''+hours;
			alert(hours);
		}
		if (minutes<10) {
			minutes=0+''+minutes;
			alert(minutes);
		}
		if (seconds<10) {
			seconds=0+''+seconds;
			alert(seconds);
		}
		//var articleCurrent=date.getFullYear() + '/' + (date.getMonth()+1) + '/' + date.getDate() + ' ' + date.getHours() + ':' + date.getMinutes() + ':'  +  date.getSeconds();
		var articleCurrent=date.getFullYear() + '/' + (date.getMonth()+1) + '/' + date.getDate() + ' ' + hours + ':' + minutes + ':'  +  seconds;
		document.getElementById('article_current_info').value=articleCurrent;
	</script>

<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/popper.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/flatpickr.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/lib/slick/slick.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/script.js"></script>

</body>
</html>