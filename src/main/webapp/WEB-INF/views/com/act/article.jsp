<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>커뮤니티 홈</title>
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

<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>

<script type="text/javascript">

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
				alert("좋아요 +1");
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
				alert("싫어요 +1");
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
				
				alert("등록완료");
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
		
		var bundle_id=bundleIdList[i-1];
		var article_id=articleIdList[i-1];
		var reply_content=replyContentList[i-1];
		var reply_writer=replyWriterList[i-1];
		var reply_depth=replyDepthList[i-1];
		var bundle_order=bundleOrderList[i-1];
		
		var date=new Date();
		var reply_date=date.getFullYear() + '/' + (date.getMonth()+1) + '/' + date.getDate() + ' ' + date.getHours() + ':' + date.getMinutes() + ':'  +  date.getSeconds();
		
		$.ajax({
			type:"POST",
			url:"re_reply_submit.do",
			data:{"article_id" : article_id, "reply_content" : reply_content, "reply_writer" : reply_writer, "reply_depth" : reply_depth, "bundle_order" : bundle_order, "reply_date" : reply_date, "bundle_id" : bundle_id},
			success:function() {
				
				alert("등록완료");
				window.location.reload(true);
			}
		})
	}
	
	var flag=true;
	
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
							
/* 							$($("div[id=re-re-content_" + index + "]")).append("<div>" + data[i].REPLY_CONTENT + "</div>");
							$($("div[id=re-re-content_" + index + "]")).append("<div>" + data[i].REPLY_DATE + "</div>");
							$($("div[id=re-re-content_" + index + "]")).append("<div>" + data[i].REPLY_WRITER + "</div>"); */
						}
					} else {
						$($("div[id=re-re-content_" + index + "]")).fadeIn(0);
						$($("div[id=re-re-content_" + index + "]")).append("<div>댓글이 없습니다</div>");
					}
					flag=false;
				}
			}
		})
	}
	
	function closeReReply(bundle_id, index) {
		var article_id=${articleInfo.get("ARTICLE_ID") };
		
		$($("div[id=re-re-content_" + index + "]")).text("");
		$($("div[id=re-re-content_" + index + "]")).fadeOut(0);
		
		flag=true;
	}

</script>

<body>	

	<div class="wrapper">	

		<header>
			<div class="container">
				<div class="header-data">
					<div class="logo">
						<a href="/" title=""><img src="${contextPath}/resources/bootstrap/images/logo.png" alt=""></a>
					</div><!--logo end-->
					<nav>
						<ul>
							<li>
								<a href="/" title="">
									<span><img src="${contextPath}/resources/bootstrap/images/icon1.png" alt=""></span>
									홈
								</a>
							</li>
							<li>
								<a href="book_main.do" title="">
									<span><img src="${contextPath}/resources/bootstrap/images/icon2.png" alt=""></span>
									도서
								
								</a>
								<ul>
									<li><a href="book_main.do?page=search" title="">도서검색</a></li>
									<li><a href="book_main.do?page=apply" title="">도서신청</a></li>
								</ul>
							</li>
							<li>
								<a href="com_main.do" title="">
									<span><img src="${contextPath}/resources/bootstrap/images/icon3.png" alt=""></span>
									커뮤니티
								</a>
							</li>
							<li>
								<a href="myLib_main.do" title="" class="not-box-openm">
									<span><img src="${contextPath}/resources/bootstrap/images/icon6.png" alt=""></span>
									마이라이브러리
								</a>
								<ul>
									<li><a href="myLib_main.do?page=score" title="">도서평가</a></li>
									<li><a href="myLib_main.do?page=favor" title="">취향분석</a></li>
									<li><a href="myLib_main.do?page=declare" title="">신고하기</a></li>
								</ul>
								
							</li>

							<c:choose>
								<c:when test="${user_position eq 'admin'}">
									<li>
										<a href="admin_main.do" title="" class="not-box-open">
											<span><img src="${contextPath}/resources/bootstrap/images/icon7.png" alt=""></span>
											관리자전용
										</a>
										<ul>
											<li><a href="admin_main.do?page=user_A" title="">회원관리</a></li>
											<li><a href="admin_main.do?page=book_A" title="">도서관리</a></li>
											<li><a href="admin_main.do?page=book_status_A" title="">현황관리</a></li>
											<li><a href="admin_main.do?page=com_A" title="">커뮤니티관리</a></li>
											<li><a href="admin_main.do?page=dec_A" title="">신고관리</a></li>
											<li><a href="admin_main.do?page=chat_A" title="">챗봇관리</a></li>
										</ul>
									</li>
								</c:when>
							</c:choose>
						</ul>
					</nav><!--nav end-->
					
					<div class="menu-btn">
						<a href="#" title=""><i class="fa fa-bars"></i></a>
					</div><!--menu-btn end-->
					
					<c:choose>
						<c:when test="${user_position ne null}">
							<div class="user-account">
								<div class="user-info">
									<img src="${contextPath}/resources/bootstrap/images/resources/user.png" alt="">
									<a href="#" title="">Minseon Kim</a>
									<i class="la la-sort-down"></i>
								</div>
								<div class="user-account-settingss">
									<h3>Online Status</h3>
									<ul class="on-off-status">
										<li>
											<div class="fgt-sec">
												<input type="radio" name="cc" id="c5">
												<label for="c5">
													<span></span>
												</label>
												<small>Online</small>
											</div>
										</li>
										<li>
											<div class="fgt-sec">
												<input type="radio" name="cc" id="c6">
												<label for="c6">
													<span></span>
												</label>
												<small>Offline</small>
											</div>
										</li>
									</ul>
									<h3>Custom Status</h3>
									<div class="search_form">
										<form>
											<input type="text" name="search">
											<button type="submit">Ok</button>
										</form>
									</div><!--search_form end-->
									<h3>Setting</h3>
									<ul class="us-links">
										<li><a href="profile-account-setting.html" title="">Account Setting</a></li>
										<li><a href="#" title="">Privacy</a></li>
										<li><a href="#" title="">Faqs</a></li>
										<li><a href="#" title="">Terms & Conditions</a></li>
									</ul>
									<h3 class="tc"><a href="sign-in.html" title="">Logout</a></h3>
								</div><!--user-account-settingss end-->
							</div>
						</c:when>
					</c:choose>
					
				</div><!--header-data end-->
			</div>
		</header><!--header end-->

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
													총 회원수 ${comInfo.get("COMMUNITY_MEMBER_COUNT")} <br>
													<span><a href="">커뮤니티 상세보기</a></span>
											</li>
											<li>
											<c:choose>
												<c:when test="${memChk eq 'x' }">
													<h4><a href="com_act_mem_form.do?community_id=${comInfo.get('COMMUNITY_ID') }">가입하기</a></h4>
												</c:when>
												<c:when test="${memChk eq 'o' }">
													<h4><a href="">나의활동 상세보기</a></h4>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${memAuth eq 'cap'}">
													<h4><a href="">커뮤니티 멤버 확인</a></h4>
													<h4><a href="com_board.do?community_id=${comInfo.get('COMMUNITY_ID') }">게시판관리</a></h4>
												</c:when>
											</c:choose>
											</li>
										</ul>
									</div><!--user-data end-->
									<div class="suggestions full-width">
										<div class="sd-title">
											<h3>게시판목록</h3>
											<div id="board_list"></div>
										</div><!--sd-title end-->

									</div><!--suggestions end-->
								</div><!--main-left-sidebar end-->
							</div>
							<div class="col-lg-9 col-md-8 no-pd">
								<div class="main-ws-sec">
									<div class="post-topbar">
										<h1 style="font-size:50px">${comInfo.get("COMMUNITY_NAME")}</h1>
										${boardInfo.get("BOARD_NAME") }
									</div><!--post-topbar end-->
                                    <div class="posts-section">
                                        <div class="post-bar">
                                            <div class="post_topbar">
                                                <div class="usy-dt">
                                                    <div class="usy-name">
                                                        <h3>${articleInfo.get("ARTICLE_TITLE") }</h3>
                                                        <span><img src="${contextPath}/resources/bootstrap/images/clock.png" alt="">${articleInfo.get("ARTICLE_DATE") }</span>
                                                    </div>
                                                </div>
                                                <div class="ed-opts">
                                                    ${articleInfo.get("ARTICLE_WRITER") }
                                                </div>
                                            </div>
                                            <div class="epi-sec">
                                            	
                                            	<c:choose>
                                            		<c:when test='${articleInfo.get("ARTICLE_WRITER") ne memNick}'>
		                                            	<ul class="descp">
		                                                    <li><img src="${contextPath}/resources/bootstrap/images/icon8.png" alt=""><span><a href="#" onclick="articleGood()">좋아요</a></span></li>
		                                                    <li><img src="${contextPath}/resources/bootstrap/images/icon9.png" alt=""><span><a href="#" onclick="articleBad()">싫어요</a></span></li>
		                                                </ul>
                                            		</c:when>
                                            	</c:choose>
                                            
                                                <c:choose>
                                                	<c:when test='${articleInfo.get("ARTICLE_WRITER") eq memNick}'>
	                                                	<ul class="bk-links">
		                                                    <li><a href="com_article_write.do?community_id=${comInfo.get('COMMUNITY_ID')}&board_id=${boardInfo.get('BOARD_ID') }&article_id=${articleInfo.get('ARTICLE_ID') }" title="">수정하기</a></li>
															<li><a href="#" onclick="articleDelete()" title="">삭제하기</a></li>
	                                                	</ul>
                                                	</c:when>
                                                </c:choose>
                                            </div>
                                            <div class="job_descp accountnone">
												${articleInfo.get("ARTICLE_CONTENT") }
                                            </div>
                                            <div class="job-status-bar btm-line">                                                
                                                <ul class="like-com">
                                                    <li>
                                                        <a class="active"><i class="fas fa-thumbs-up"></i>좋아요 ${articleInfo.get("ARTICLE_GOOD_COUNT") }</a>
                                                        <a class="active"><i class="fas fa-thumbs-down"></i>싫어요 ${articleInfo.get("ARTICLE_BAD_COUNT") }</a>
                                                    </li>
                                                    <li><a class="active"><i class="fas fa-eye"></i>조회수 ${articleInfo.get("ARTICLE_VIEW_COUNT") }</a></li>
                                                </ul>
                                                <a><i class="fas fa-comment-alt"></i>댓글수 ${replyCount}</a>
                                            </div>
                                            
                                            <div class="comment-area">
                                            	<c:forEach var="i" begin="1" end="${replyListSize}" varStatus="loop">
                                            	<div class="post_topbar">
                                                    <div class="usy-dt">
                                                        <div class="usy-name">
                                                            <h3>${replyList.get(i-1).get("REPLY_WRITER")}</h3>
                                                            <span><img src="${contextPath}/resources/bootstrap/images/clock.png" alt="">${replyList.get(i-1).get("REPLY_DATE")}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="reply-area">
                                                    <p>${replyList.get(i-1).get("REPLY_CONTENT")}</p>
                                                    
														<a onclick="openReReply('${replyList.get(i-1).get('BUNDLE_ID')}', ${i-1 })">열기</a>
														<a onclick="closeReReply('${replyList.get(i-1).get('BUNDLE_ID')}', ${i-1 })">닫기</a>
														   
														                                                 
	                                                     <div class="comment-area reply-rply1" id="re-re-content_${loop.current-1}" style="display:none;">
	                                                        <%-- <div class="post_topbar">
	                                                            <div class="usy-dt">                                                                                                                                                                                                                                                                          
	                                                                <img src="${contextPath}/resources/bootstrap/images/resources/bg-img2.png" alt="">
	                                                                <div class="usy-name">
	                                                                    <h3>대댓글작성자</h3>
	                                                                    <span><img src="${contextPath}/resources/bootstrap/images/clock.png" alt="">대댓글작성날짜</span>
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                        <div class="reply-area">
	                                                            <p>대댓글내용</p>
	                                                        </div> --%>
	                                                    </div> 
                                                    
                                                    	<div id="re-re-form">
			                                                <div class="row">
			                                                    <div class="col-md-10">
			                                                    	
			                                                        <form>
			                                                            <div class="form-group">
			                                                            	<input type="hidden" name="re_index" value="${i}">
			                                                            	<input type="hidden" name="re_article_id" value="${articleInfo.get('ARTICLE_ID') }">
			                                                            	<input type="hidden" name="re_bundle_id" value="${replyList.get(i-1).get('BUNDLE_ID')}">
 			                                                                <input type="text" class="form-control" style="margin-left: 0px" name="re_reply_content" placeholder="댓글을 입력해주세요">
			                                                                <input type="hidden" name="re_reply_writer" value="${memNick }">
			                                                                <input type="hidden" name="re_reply_depth" value="1">
			                                                      			<input type="hidden" name="re_bundle_order" value="1">
			                                                            </div>
			                                                        </form>
			                                                    </div>
			                                                    <div class="col-md-2">
			                                                        <button style="color:#ffffff;font-size:16px;background-color:#e44d3a;padding:12px 27px;border:0;font-weight:500;margin-top:0px;" onclick="reReplySubmit('${i}')">입력</button>
			                                                    </div>
			                                                </div>
	                                                        
                                                        </div>
                                                    
                                                </div>
                                            	</c:forEach>
                                            </div>
                                            
                                             <div class="postcomment">
                                                <div class="row">
                                                    <div class="col-md-10">
                                                    	
                                                        <form>
                                                            <div class="form-group">
                                                            	<input type="hidden" name="article_id" value="${articleInfo.get('ARTICLE_ID') }">
                                                                <input type="text" class="form-control" style="margin-left: 0px" name="reply_content" placeholder="댓글을 입력해주세요">
                                                                <input type="hidden" name="reply_writer" value="${memNick }">
                                                                <input type="hidden" name="reply_depth" value="0">
                                                      			<input type="hidden" name="bundle_order" value="0">
                                                      			<input type="hidden" name="reply_date" id="current_info">
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <button style="color:#ffffff;font-size:16px;background-color:#e44d3a;padding:12px 27px;border:0;font-weight:500;margin-top:0px;" onclick="replySubmit()">입력</button>
                                                    </div>
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

		<footer>
			<div class="footy-sec mn no-margin">
				<div class="container">
					<ul>
						<li><a href="help-center.html" title="">대표이사 : 심동현</a></li>
						<li><a href="about.html" title="">과장 : 김민선</a></li>
						<li><a href="#" title="">그냥 : 서종대</a></li>
						<li><a href="#" title="">그냥 : 이동주</a></li>
					</ul>
					<p><img src="${contextPath}/resources/bootstrap/images/copy-icon2.png" alt="">Copyright 2020</p>
					<img class="fl-rgt" src="${contextPath}/resources/bootstrap/images/logo2.png" alt="">
				</div>
			</div>
		</footer><!--footer end-->


		<div class="post-popup pst-pj">
			<div class="post-project">
				<h3>Post a project</h3>
				<div class="post-project-fields">
					<form>
						<div class="row">
							<div class="col-lg-12">
								<input type="text" name="title" placeholder="Title">
							</div>
							<div class="col-lg-12">
								<div class="inp-field">
									<select>
										<option>Category</option>
										<option>Category 1</option>
										<option>Category 2</option>
										<option>Category 3</option>
									</select>
								</div>
							</div>
							<div class="col-lg-12">
								<input type="text" name="skills" placeholder="Skills">
							</div>
							<div class="col-lg-12">
								<div class="price-sec">
									<div class="price-br">
										<input type="text" name="price1" placeholder="Price">
										<i class="la la-dollar"></i>
									</div>
									<span>To</span>
									<div class="price-br">
										<input type="text" name="price1" placeholder="Price">
										<i class="la la-dollar"></i>
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<textarea name="description" placeholder="Description"></textarea>
							</div>
							<div class="col-lg-12">
								<ul>
									<li><button class="active" type="submit" value="post">Post</button></li>
									<li><a href="#" title="">Cancel</a></li>
								</ul>
							</div>
						</div>
					</form>
				</div><!--post-project-fields end-->
				<a href="#" title=""><i class="la la-times-circle-o"></i></a>
			</div><!--post-project end-->
		</div><!--post-project-popup end-->

		<div class="post-popup job_post">
			<div class="post-project">
				<h3>Post a job</h3>
				<div class="post-project-fields">
					<form>
						<div class="row">
							<div class="col-lg-12">
								<input type="text" name="title" placeholder="Title">
							</div>
							<div class="col-lg-12">
								<div class="inp-field">
									<select>
										<option>Category</option>
										<option>Category 1</option>
										<option>Category 2</option>
										<option>Category 3</option>
									</select>
								</div>
							</div>
							<div class="col-lg-12">
								<input type="text" name="skills" placeholder="Skills">
							</div>
							<div class="col-lg-6">
								<div class="price-br">
									<input type="text" name="price1" placeholder="Price">
									<i class="la la-dollar"></i>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="inp-field">
									<select>
										<option>Full Time</option>
										<option>Half time</option>
									</select>
								</div>
							</div>
							<div class="col-lg-12">
								<textarea name="description" placeholder="Description"></textarea>
							</div>
							<div class="col-lg-12">
								<ul>
									<li><button class="active" type="submit" value="post">Post</button></li>
									<li><a href="#" title="">Cancel</a></li>
								</ul>
							</div>
						</div>
					</form>
				</div><!--post-project-fields end-->
				<a href="#" title=""><i class="la la-times-circle-o"></i></a>
			</div><!--post-project end-->
		</div><!--post-project-popup end-->



		<div class="chatbox-list">
			<div class="chatbox">
				<div class="chat-mg">
					<a href="#" title=""><img src="${contextPath}/resources/bootstrap/images/resources/usr-img1.png" alt=""></a>
					<span>2</span>
				</div>
				<div class="conversation-box">
					<div class="con-title mg-3">
						<div class="chat-user-info">
							<img src="${contextPath}/resources/bootstrap/images/resources/us-img1.png" alt="">
							<h3>John Doe <span class="status-info"></span></h3>
						</div>
						<div class="st-icons">
							<a href="#" title=""><i class="la la-cog"></i></a>
							<a href="#" title="" class="close-chat"><i class="la la-minus-square"></i></a>
							<a href="#" title="" class="close-chat"><i class="la la-close"></i></a>
						</div>
					</div>
					<div class="chat-hist mCustomScrollbar" data-mcs-theme="dark">
						<div class="chat-msg">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor.</p>
							<span>Sat, Aug 23, 1:10 PM</span>
						</div>
						<div class="date-nd">
							<span>Sunday, August 24</span>
						</div>
						<div class="chat-msg st2">
							<p>Cras ultricies ligula.</p>
							<span>5 minutes ago</span>
						</div>
						<div class="chat-msg">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor.</p>
							<span>Sat, Aug 23, 1:10 PM</span>
						</div>
					</div><!--chat-list end-->
					<div class="typing-msg">
						<form>
							<textarea placeholder="Type a message here"></textarea>
							<button type="submit"><i class="fa fa-send"></i></button>
						</form>
						<ul class="ft-options">
							<li><a href="#" title=""><i class="la la-smile-o"></i></a></li>
							<li><a href="#" title=""><i class="la la-camera"></i></a></li>
							<li><a href="#" title=""><i class="fa fa-paperclip"></i></a></li>
						</ul>
					</div><!--typing-msg end-->
				</div><!--chat-history end-->
			</div>
			<div class="chatbox">
				<div class="chat-mg">
					<a href="#" title=""><img src="${contextPath}/resources/bootstrap/images/resources/usr-img2.png" alt=""></a>
				</div>
				<div class="conversation-box">
					<div class="con-title mg-3">
						<div class="chat-user-info">
							<img src="${contextPath}/resources/bootstrap/images/resources/us-img1.png" alt="">
							<h3>John Doe <span class="status-info"></span></h3>
						</div>
						<div class="st-icons">
							<a href="#" title=""><i class="la la-cog"></i></a>
							<a href="#" title="" class="close-chat"><i class="la la-minus-square"></i></a>
							<a href="#" title="" class="close-chat"><i class="la la-close"></i></a>
						</div>
					</div>
					<div class="chat-hist mCustomScrollbar" data-mcs-theme="dark">
						<div class="chat-msg">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor.</p>
							<span>Sat, Aug 23, 1:10 PM</span>
						</div>
						<div class="date-nd">
							<span>Sunday, August 24</span>
						</div>
						<div class="chat-msg st2">
							<p>Cras ultricies ligula.</p>
							<span>5 minutes ago</span>
						</div>
						<div class="chat-msg">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor.</p>
							<span>Sat, Aug 23, 1:10 PM</span>
						</div>
					</div><!--chat-list end-->
					<div class="typing-msg">
						<form>
							<textarea placeholder="Type a message here"></textarea>
							<button type="submit"><i class="fa fa-send"></i></button>
						</form>
						<ul class="ft-options">
							<li><a href="#" title=""><i class="la la-smile-o"></i></a></li>
							<li><a href="#" title=""><i class="la la-camera"></i></a></li>
							<li><a href="#" title=""><i class="fa fa-paperclip"></i></a></li>
						</ul>
					</div><!--typing-msg end-->
				</div><!--chat-history end-->
			</div>
			<div class="chatbox">
				<div class="chat-mg bx">
					<a href="#" title=""><img src="${contextPath}/resources/bootstrap/images/chat.png" alt=""></a>
					<span>2</span>
				</div>
				<div class="conversation-box">
					<div class="con-title">
						<h3>Messages</h3>
						<a href="#" title="" class="close-chat"><i class="la la-minus-square"></i></a>
					</div>
					<div class="chat-list">
						<div class="conv-list active">
							<div class="usrr-pic">
								<img src="${contextPath}/resources/bootstrap/images/resources/usy1.png" alt="">
								<span class="active-status activee"></span>
							</div>
							<div class="usy-info">
								<h3>John Doe</h3>
								<span>Lorem ipsum dolor <img src="${contextPath}/resources/bootstrap/images/smley.png" alt=""></span>
							</div>
							<div class="ct-time">
								<span>1:55 PM</span>
							</div>
							<span class="msg-numbers">2</span>
						</div>
						<div class="conv-list">
							<div class="usrr-pic">
								<img src="${contextPath}/resources/bootstrap/images/resources/usy2.png" alt="">
							</div>
							<div class="usy-info">
								<h3>John Doe</h3>
								<span>Lorem ipsum dolor <img src="${contextPath}/resources/bootstrap/images/smley.png" alt=""></span>
							</div>
							<div class="ct-time">
								<span>11:39 PM</span>
							</div>
						</div>
						<div class="conv-list">
							<div class="usrr-pic">
								<img src="${contextPath}/resources/bootstrap/images/resources/usy3.png" alt="">
							</div>
							<div class="usy-info">
								<h3>John Doe</h3>
								<span>Lorem ipsum dolor <img src="${contextPath}/resources/bootstrap/images/smley.png" alt=""></span>
							</div>
							<div class="ct-time">
								<span>0.28 AM</span>
							</div>
						</div>
					</div><!--chat-list end-->
				</div><!--conversation-box end-->
			</div>
		</div><!--chatbox-list end-->

	</div><!--theme-layout end-->
	
	
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
						
						$("#board_list").append("<li><a href='com_act_board.do?board_id="+data[i].BOARD_ID+"&community_id="+data[i].COMMUNITY_ID+"'>"+data[i].BOARD_NAME+"</a></li>");
						
					}

				}
				
			})
		})
	</script>
	<!-- script -->
	<script type="text/javascript">
		var date=new Date();
		var reCurrent=date.getFullYear() + '/' + (date.getMonth()+1) + '/' + date.getDate() + ' ' + date.getHours() + ':' + date.getMinutes() + ':'  +  date.getSeconds();
		document.getElementById('re_current_info').value=reCurrent;
		
		var datee=new Date();
		var reReCurrent=datee.getFullYear() + '/' + (datee.getMonth()+1) + '/' + datee.getDate() + ' ' + datee.getHours() + ':' + datee.getMinutes() + ':'  +  datee.getSeconds();
		document.getElementById('re_re_current_info').value=reReCurrent;
	</script>

<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/popper.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/flatpickr.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/lib/slick/slick.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/script.js"></script>

</body>
</html>