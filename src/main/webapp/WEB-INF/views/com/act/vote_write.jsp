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
		html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
	b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}

article, aside, details, figcaption, figure, footer, header, hgroup,
	menu, nav, section {
	display: block;
}

body {
	background-color : white;
}

main{
	background-color : #f2f2f2;
}
ol, ul {
	list-style: none;
}

blockquote, q {
	quotes: none;
}

blockquote:before, blockquote:after, q:before, q:after {
	content: '';
	content: none;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

/* General
		==================================== */
*, *:before, *:after {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}


body, input, textarea {
	font: 1em/1.5 'Noto Sans KR', sans-serif;
}


.title {
	font-size: 22pt;
    padding: .2em 1.1em .5em;
    text-align: center;
    color: #323a45;
    border-radius: 5px 5px 0 0;
    text-align: left;
    font-family: 'Noto Sans KR', sans-serif;
    background-color: transparent;
    font-weight: bold;
}

/* Form
		==================================== */
.form ul {
	background: white;
	margin-bottom: 1em;
}

.form li {
	border: 1px solid #ccc;
	border-bottom: 0;
	margin-bottom: 0px;
	position: relative;
}

.form li:first-child {
	border-top: 0;
}

.form li:last-child {
	border-bottom: 1px solid #ccc;
}

label, input, textarea {
	display: block;
	border: 0;
}

input, textarea {
	width: 100%;
    height: 15px;
    padding: 15px;
    outline: 0;
    border: 1px solid lightgray;
    border-radius: 12px;
    margin: 8px 0;
}

textarea {
	height: 5em;
	resize: none;
}

label {
	font-size: .8125em; /* 13/16 */
	position: absolute;
	top: 1.23em;
	left: 1.23em;
	color: #5D5D5D;
	opacity: 1;
}

input[type="submit"] {
	background: #e44d3a;
	margin-bottom: 1em;
	color: white;
	border-radius: 3px;
	padding: .75em;
	-webkit-appearance: none;
	-webkit-transition: .333s ease -webkit-transform;
	transition: .333s ease transform;
	border : none;
	height : 100%;
}

input[type="submit"]:hover {
	-webkit-transform: scale(1.025);
	transform: scale(1.025);
	cursor: pointer;
}

input[type="submit"]:active {
	-webkit-transform: scale(.975);
	transform: scale(.975);
}



input[type="date"]{
	    width: 90%;
    margin-left: auto;
    margin-right: auto;
}


input[type="date"]::-webkit-outer-spin-button,
input[type="date"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

li select{
	color: #5d5d5d;
    margin-top: 20px;
    border-radius: 10px;
    width: 70%;
    margin-left: 10%;
    margin-right: 10%;
    margin-right: 1;
    text-align: center;
    float: none;
    height: 30px;
}
span.labelNumber{
	font-size : 30pt;
}
hr{
	width: 40%;
    text-align: left;
    float: left;
    margin-left: 28px;
    margin-top: -11px;
    color: #e44d3a;
    border: solid;
}
label{
	float: left;
    text-align: left;
    margin-left: 0;
    margin-right: 90%;
    position: initial;
    color: #5D5D5D;
    opacity: 1;
    /*text-decoration:underline solid #e44d3a;*/
    font-weight : bold;
}

td label{
	width : 100%;
	float : none;
}
div.votelis{
	border-bottom: 1px solid lightgray !important;
    display: block;
    width: 100%;
    margin-bottom: 15px;
    padding: 8px;
}
	
	div.post-bar{
		border-bottom : 4px solid #e44d3a;
	}
	</style>
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
												<div class='votelis'>
													<label for="name">투표 주제</label><br>
													<input type="text" name="vote_title" placeholder="투표 주제">
												</div>
												<div class='votelis'>
													<table style="width: 100%;">
														<tr>
															<td style="line-height : 15px"><label for="name">투표 시작일</label><br></td>
															<td style="line-height : 15px"><label for="name">투표 종료일</label><br></td>
														</tr>
														<tr>
															<td><input type="date" name="vote_start"></td>
															<td><input type="date" name="vote_end"></td>
														</tr>
													</table>
												</div>
												<div class='votelis'>
												<label for="name">선택지1</label><br>
												<input type="text" name="selection_option1" placeholder="선택지1">
												</div>
												<div class='votelis'>
													<label for="name">선택지2</label><br>
													<input type="text" name="selection_option2" placeholder="선택지2">
												</div>
												<div class='votelis'>
													<label for="name">선택지3</label><br>
													<input type="text" name="selection_option3" placeholder="선택지3">
												</div>
												<div class='votelis'>
													<label for="name">선택지4</label><br>
													<input type="text" name="selection_option4" placeholder="선택지4">
												</div>
												<div class='votelis'>
													<label for="name">선택지5</label><br>
													<input type="text" name="selection_option5" placeholder="선택지5">
												</div>
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