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
		div .accountnone{
			min-height: 150px;
    		padding: 12px;
		}
		
		.ed-opts{
			font-size: 10pt;
			line-height: 100%;
		}
		
		.ed-opts span{
			font-size: 8pt;
		    color: white;
		    background-color: orange;
		    padding: 2px;
		}
		
		div .rereply{
			padding-left : 50px;
		}
		
		.post-bar .row{
			width : 100%;
		}
		
		.usy-name h3{
			font-size : 11pt;
		}
		
		
		h3 .articleTitle{
			font-size : 15pt !important;
		}
		
		.bk-links{
			margin-top: -10px;
		}
		
		.bk-links a{
			font-size: 9pt;
	    	text-decoration: underline solid gray;
		}
		
		.reply-area {
    		padding-left: 0px;
		}
		
		.like-com li{
			margin : 0 3px;
		}

		.reply-area p {
	    	padding-top: 5px;
	    }
	    
	   .rereplyBtn{
	   		width: 70px;
		    background: gray;
		    position: flex;
		    /* right: 15%; */
		    /* bottom: 50%; */
		    font-size: 10pt;
		    color: white;
		    border: 0;
		    padding: 2px 0px;
		    /* margin-left: 50%; */
		    float: right;
}
	   }
	   
	   .row{
		font-size: 10pt;
		
		text-align :center;
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
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>

<script type="text/javascript">


	$(document).ready(function() {
		console.log("대댓글관련");
		console.log('${reReplyList}');
		console.log('${reReplyListSize}');
		
		var reReplyList='${reReplyList}';
		console.log(reReplyList);
		
		console.log(reReplyList[0]);
		console.log(reReplyList[1]);
		console.log(reReplyList[2]);
		
		//console.log('${reReplyList}'[1].BUNDLE_ID);
		
/* 		$(reReplyList).each(function(index , value){
            // 반복  ( 여기서 하고싶으신거 하시면 되지 않을까요? )
            console.log(value);
     }); */
		


	})


	function articleDelete() {
		$.ajax({
			type:"POST",
			url:"article_delete.do",
			data:{article_id : '${articleInfo.get("ARTICLE_ID") }'},
					
			success:function() {
				location.href="com_act_board.do?board_id=${boardInfo.get('BOARD_ID') }&community_id=${comInfo.get('COMMUNITY_ID') }";
			}
		})
		
	}
	
	function articleGood() {
		$.ajax({
			type:"POST",
			url:"article_good.do",
			data:{article_id : '${articleInfo.get("ARTICLE_ID") }'},
					
			success:function() {
				swal("좋아요 +1");
				//location.href="com_act_board.do?board_id=${boardInfo.get('BOARD_ID') }&community_id=${comInfo.get('COMMUNITY_ID') }";
			}
		})
	}
	
	function articleBad() {
		$.ajax({
			type:"POST",
			url:"article_bad.do",
			data:{article_id : '${articleInfo.get("ARTICLE_ID") }'},
					
			success:function() {
				swal("싫어요 +1");
				//location.href="com_act_board.do?board_id=${boardInfo.get('BOARD_ID') }&community_id=${comInfo.get('COMMUNITY_ID') }";
			}
		})
	}
	
	function replySubmit() {
		
		var article_id=$('input[name=article_id]').val();
		var reply_content=$('input[name=reply_content]').val();
		var reply_writer=$('input[name=reply_writer]').val();
		var reply_depth=$('input[name=reply_depth]').val();
		var bundle_order=$('input[name=bundle_order]').val();
		var reply_date=$('input[name=reply_date]').val();
		
		$.ajax({
			type:"POST",
			url:"reply_submit.do",
			data:{"article_id" : article_id, "reply_content" : reply_content, "reply_writer" : reply_writer, "reply_depth" : reply_depth, "bundle_order" : bundle_order, "reply_date" : reply_date},
			success:function() {
				
				swal("등록이 완료되었습니다");
				window.location.reload(true);
			}
		})
	}
	
	var indexList=new Array();
	var bundleIdList=new Array();
	var articleIdList=new Array();
	var replyContentList=new Array();
	var replyWriterList=new Array();
	var replyDepthList=new Array();
	var bundleOrderList=new Array();
	var reReplyDateList=new Array();
	
	function reReplySubmit(i) {
		
		//index 배열
		$("input[name=re_index]").each(function(index, item) {
			indexList.push($(item).val());
		});

		//bundle_id 배열
		$("input[name=re_bundle_id]").each(function(index, item) {
			bundleIdList.push($(item).val());
		});
		
		//article_id 배열
		$("input[name=re_article_id]").each(function(index, item) {
			articleIdList.push($(item).val());
		});

		//reply_content 배열
		$("input[name=re_reply_content]").each(function(index, item) {
			replyContentList.push($(item).val());
		});
		
		//reply_writer 배열
		$("input[name=re_reply_writer]").each(function(index, item) {
			replyWriterList.push($(item).val());
		});

		//reply_depth 배열
		$("input[name=re_reply_depth]").each(function(index, item) {
			replyDepthList.push($(item).val());
		});
		
		//bundle_order 배열
		$("input[name=re_bundle_order]").each(function(index, item) {
			bundleOrderList.push($(item).val());
		});
		//bundle_order 배열
		$("input[name=re_reply_date]").each(function(index, item) {
			reReplyDateList.push($(item).val());
		});
		
		var bundle_id=bundleIdList[i-1];
		var article_id=articleIdList[i-1];
		var reply_content=replyContentList[i-1];
		var reply_writer=replyWriterList[i-1];
		var reply_depth=replyDepthList[i-1];
		var bundle_order=bundleOrderList[i-1];
		var re_reply_date=reReplyDateList[i-1];
		
		swal(reply_content);
		
		
		$.ajax({
			type:"POST",
			url:"re_reply_submit.do",
			data:{"reply_date" : re_reply_date, "article_id" : article_id, "reply_content" : reply_content, "reply_writer" : reply_writer, "reply_depth" : reply_depth, "bundle_order" : bundle_order, "reply_date" : re_reply_date, "bundle_id" : bundle_id},
			success:function() {
				
				swal("등록이 완료되었습니다");
				//window.location.reload(true);
				window.location.href=window.location.href;
			}
		})
		
		
		//댓글달기 버튼 접기
		//$($("div[id=re-re-form_" + i + "]")).fadeOut(0);
		
		
	}
	
/* 	var flag=true;
	
	function openReReply(bundle_id, index) {
		
		console.log("열려고 하는 번들아이디" + bundle_id);
		console.log("열려고 하는 인덱스" + index); //이 인덱스번호에 위치한 곳에 대댓글리스트를 뿌려야됨
		
		var article_id=${articleInfo.get("ARTICLE_ID") };
		
		$.ajax({
			type:"POST",
			url:"re_reply_list.do",
			//contentType: 'application/json; charset=utf-8',
			data:{"article_id" : article_id, "bundle_id" : bundle_id},
			success:function(data) {
				
				console.log("이거");
				console.log($("div[id=re-re-content_" + index + "]").selector);
				
				console.log("이 댓글에 달린 대댓글들");
				
				if (flag == true) {
					
					if (data.length > 0) {
						$($("div[id=re-re-content_" + index + "]")).fadeIn(0);
						
						for (var i=0; i<data.length; i++) {
							console.log(data[i].REPLY_CONTENT);
							console.log(data[i].REPLY_DATE);
							console.log(data[i].REPLY_WRITER);
							
							$($("div[id=re-re-content_" + index + "]")).append("<div class='post_topbar'>");
							$($("div[id=re-re-content_" + index + "]")).append("<div class='usy-dt'>");

							//$($("div[id=re-re-content_" + index + "]")).append("<div class='usy-name'><h3>" + data[i].REPLY_WRITE + "</h3><span><img src='${contextPath}/resources/bootstrap/images/clock.png'>" + data[i].REPLY_DATE + "</span></div>");
							//$($("div[id=re-re-content_" + index + "]")).append("<div class='usy-name'><h3>" + data[i].REPLY_WRITE + "</h3>" + data[i].REPLY_DATE + "</span></div>");
							$($("div[id=re-re-content_" + index + "]")).append("<div class='usy-name'>");
							
							$($("div[id=re-re-content_" + index + "]")).append("<h3>" + data[i].REPLY_CONTENT + "</h3>");
							$($("div[id=re-re-content_" + index + "]")).append("<span><img src='${contextPath}/resources/bootstrap/images/clock.png'>" + data[i].REPLY_DATE + "-" + data[i].REPLY_WRITER + "</span>");
							
							$($("div[id=re-re-content_" + index + "]")).append("</div>");
							
							$($("div[id=re-re-content_" + index + "]")).append("</div>");
							
							$($("div[id=re-re-content_" + index + "]")).append("</div>");
							
							$($("div[id=re-re-content_" + index + "]")).append("<hr>");
							
/						$($("div[id=re-re-content_" + index + "]")).append("<div>" + data[i].REPLY_CONTENT + "</div>");
							$($("div[id=re-re-content_" + index + "]")).append("<div>" + data[i].REPLY_DATE + "</div>");
							$($("div[id=re-re-content_" + index + "]")).append("<div>" + data[i].REPLY_WRITER + "</div>"); 
						}
					} else {
						$($("div[id=re-re-content_" + index + "]")).fadeIn(0);
						$($("div[id=re-re-content_" + index + "]")).append("<div>댓글이 없습니다</div>");
					}
					flag=false;
				}
			}
		})
	} */
/* 	
	function closeReReply(bundle_id, index) {
		var article_id=${articleInfo.get("ARTICLE_ID") };
		
		$($("div[id=re-re-content_" + index + "]")).text("");
		$($("div[id=re-re-content_" + index + "]")).fadeOut(0);
		
		flag=true;
	} */

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
                                            <div class="post_topbar">
                                                <div class="usy-dt">
                                                    <div class="usy-name">
														<h3 style="font-size: 15pt; text-align: left;">${articleInfo.get("ARTICLE_TITLE") }</h3>
														<span><img src="${contextPath}/resources/bootstrap/images/clock.png" alt="">${articleInfo.get("ARTICLE_DATE") }</span>
                                                    </div>
                                                </div>
                                                <div class="ed-opts">
                                                    	<span>작성자</span> ${articleInfo.get("ARTICLE_WRITER") }
                                                </div>
                                            </div>
                                            <div class="epi-sec">
                                            	
                                            	<c:choose>
                                            		<c:when test='${articleInfo.get("ARTICLE_WRITER") ne memNick}'>
		                                            	<ul class="descp">
		                                                    <li><i
																	class="fas fa-thumbs-up"></i><span><a href="#" onclick="articleGood()">좋아요</a></span></li>
		                                                    <li><i class="fas fa-thumbs-down"></i><span><a href="#" onclick="articleBad()">싫어요</a></span></li>
		                                                </ul>
                                            		</c:when>
                                            	</c:choose>
                                            
                                                <c:choose>
                                                	<c:when test='${articleInfo.get("ARTICLE_WRITER") eq memNick}'>
	                                                	<ul class="bk-links">
		                                                    <li><a href="com_article_write.do?community_id=${comInfo.get('COMMUNITY_ID')}&board_id=${boardInfo.get('BOARD_ID') }&article_id=${articleInfo.get('ARTICLE_ID') }" title="">수정</a></li>
															<li><a href="#" onclick="articleDelete()" title="">삭제</a></li>
	                                                	</ul>
                                                	</c:when>
                                                </c:choose>
                                            </div>
                                            <div class="job_descp accountnone">
												${articleInfo.get("ARTICLE_CONTENT") }
                                            </div>
                                            
                                            <c:choose>
                                            	<c:when test="${memChk eq 'o' }">
		                                            <div class="job-status-bar btm-line">
														<ul class="like-com" style="margin-left: 15px;">
															<li>
																<a class="active"><i
																	class="fas fa-thumbs-up"></i>좋아요
																	${articleInfo.get("ARTICLE_GOOD_COUNT") }</a>
															</li>
																	
															<li>
																<a class="active"><i class="fas fa-thumbs-down"></i>싫어요
																	${articleInfo.get("ARTICLE_BAD_COUNT") }</a>
															</li>
															
														</ul>
														<a><i class="fas fa-comment-alt"></i>댓글수 ${replyCount}</a>
		                                            </div>
		                                   </c:when>
                                       </c:choose>
		                                            
		                                    <div class="comment-area">
                                            	<c:forEach var="i" begin="1" end="${replyListSize}" varStatus="loop">
													<c:choose>
														<c:when test="${replyList.get(i-1).get('REPLY_DEPTH') eq '0' }">
															<div class="post_topbar">
			                                                    <div class="usy-dt">
			                                                        <div class="usy-name">
			                                                            <h3>${replyList.get(i-1).get("REPLY_WRITER")}</h3>
			                                                            <span><img src="${contextPath}/resources/bootstrap/images/clock.png" alt="">${replyList.get(i-1).get("REPLY_DATE")}</span>
			                                                            	<div class="reply-area">
                                                    							<p>${replyList.get(i-1).get("REPLY_CONTENT")}</p>
                                                    							
                                                    						</div>
                                                    						
			                                                        </div>
			                                                    </div>
			                                                    
			                                                    <!-- ********************************버튼 -->
			                                                    <button class = "rereplyBtn" id="rereplyBtn_${i-1}" onClick="rereForm('${i-1}')">댓글 달기</button>
			                                                    <!-- ********************************버튼 -->
			                                                    
			                                                    
			                                                    
			                                                    
			                                                    <c:forEach var="j" begin="1" end="${replyListSize}">
			                                                    	
			                                                    	<c:choose>
				                                                    <c:when test="${replyList.get(j-1).get('BUNDLE_ID') eq replyList.get(i-1).get('BUNDLE_ID') && replyList.get(j-1).get('REPLY_DEPTH') eq '1'}">
				                                                    <div class="comment-area reply-rply1">
	                                                     	
				                                                         <div class="post_topbar">
				                                                            <div class="usy-dt rereply">                                                                                                                                                                                                                                                                          
				                                                                <img src="${contextPath}/resources/images/reply.png" alt="">
				                                                                <div class="usy-name">
				                                                                    <h3>${replyList.get(j-1).get('REPLY_WRITER')}</h3>
				                                                                    <span><img src="${contextPath}/resources/bootstrap/images/clock.png" alt="">${replyList.get(j-1).get('REPLY_DATE')}</span>
				                                                                    <div class="reply-area">
				                                                            			<p>${replyList.get(j-1).get('REPLY_CONTENT')}</p>
				                                                        			</div> 
				                                                                </div>
				                                                            </div>
				                                                        </div>

				                                                        
	                                                    			</div>
				                                                    </c:when>
				                                                    </c:choose>
			                                                    </c:forEach>
			                                                    
					                                        <!-- 대댓글 -->
				                                            <div id="re-re-form_${i-1}" style="display : none">
				                                                <div class="row">
				                                                <hr>
				                                                    <div>
				                                                    	
				                                                        <form>
				                                                            <div class="form-group">
				                                                            	<input type="hidden" name="re_index" value="${i}">
				                                                            	<input type="hidden" name="re_article_id" value="${articleInfo.get('ARTICLE_ID') }">
				                                                            	<input type="hidden" name="re_bundle_id" value="${replyList.get(i-1).get('BUNDLE_ID')}">
					                                                            <input type="text" class="form-control" style="margin-left: 85px; width:138%;" name="re_reply_content" placeholder="댓글을 입력해주세요">
				                                                                <input type="hidden" name="re_reply_writer" value="${memNick }">
				                                                                <input type="hidden" name="re_reply_depth" value="1">
				                                                      			<input type="hidden" name="re_bundle_order" value="1">
				                                                      			<input type="hidden" name="re_reply_date" id="re_re_current_info">
				                                                            </div>
				                                                        </form>
				                                                    </div>
				                                                    <div style="margin-left:235px">
				                                                        <button style="color:#ffffff;font-size:10px;background-color:grey;padding:12px 27px;border:0;font-weight:300;margin-top:0px;" onclick="reReplySubmit('${i}')">입력</button>
				                                                    </div>
				                                                </div>
				                                             </div>    
			                                                </div>
														</c:when>
													</c:choose>                                            
                                                                                              	
                                            	</c:forEach>
                                            	</div>
													
												<!-- 댓글 -->
                                               <div class="row">
                                               <hr>
                                                    <div class="col-md-10">
                                                    	
                                                        <form>
                                                            <div class="form-group">
                                                            	<input type="hidden" name="article_id" value="${articleInfo.get('ARTICLE_ID') }">
                                                                <input type="text" class="form-control" style="margin-left: 0px" name="reply_content" placeholder="댓글을 입력해주세요">
                                                                <input type="hidden" name="reply_writer" value="${memNick }">
                                                                <input type="hidden" name="reply_depth" value="0">
                                                      			<input type="hidden" name="bundle_order" value="0">
                                                      			<input type="hidden" name="reply_date" id="re_current_info">
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <button style="color:#ffffff;font-size:16px;background-color:#e44d3a;padding:12px 27px;border:0;font-weight:500;margin-top:0px;" onclick="replySubmit()">입력</button>
                                                    </div>
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
		if (hours<10) {
			hours=0+''+hours;
		}
		if (minutes<10) {
			minutes=0+''+minutes;
		}
	
		//var articleCurrent=date.getFullYear() + '/' + (date.getMonth()+1) + '/' + date.getDate() + ' ' + date.getHours() + ':' + date.getMinutes() + ':'  +  date.getSeconds();
		var reCurrent=date.getFullYear() + '/' + (date.getMonth()+1) + '/' + date.getDate() + ' ' + hours + ':' + minutes;
		document.getElementById('re_current_info').value=reCurrent;
		
		//////////
		
		var datee=new Date();
		var hourss=datee.getHours();
		var minutess=datee.getMinutes();
		if (hourss<10) {
			hourss=0+''+hourss;
		}
		if (minutess<10) {
			minutess=0+''+minutess;
		}
		
		//var articleCurrent=date.getFullYear() + '/' + (date.getMonth()+1) + '/' + date.getDate() + ' ' + date.getHours() + ':' + date.getMinutes() + ':'  +  date.getSeconds();
		var rereCurrent=datee.getFullYear() + '/' + (datee.getMonth()+1) + '/' + datee.getDate() + ' ' + hourss + ':' + minutess;
		
		document.getElementById('re_re_current_info').value=rereCurrent;
	</script>
	
	
	
	
	
	<!-- ********************************버튼 -->
	<script>
		$(document).ready(function(){
			
			//////////////////김민선 추가분 시작//
			
			$('.rereplyBtn').on('click',function(){
				$('.rereplyDiv').css("display","block");
			})
			
			//////////////////김민선 추가분 끝////
		})
		
		
		
		function rereForm(index) {
			//swal(index);
			//$('#re-re-form_'+index).css("display","block");
			$($("div[id=re-re-form_" + index + "]")).fadeIn(0);
		}
	</script>
<!-- ********************************버튼 -->



<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/popper.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/flatpickr.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/lib/slick/slick.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/script.js"></script>

</body>
</html>