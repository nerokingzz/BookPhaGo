<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>커뮤니티 게시판관리</title>
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
		function addBoard() {
			window.open("com_add_board.do?community_id=${comInfo.get('COMMUNITY_ID')}", "게시판추가", "width=500, height=500");
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
											<i class="la la-ellipsis-v"></i>
										</div><!--sd-title end-->

									</div><!--suggestions end-->
								</div><!--main-left-sidebar end-->
							</div>
							<div class="col-lg-9 col-md-8 no-pd">
								<div class="main-ws-sec">
									<div class="post-topbar">
										<h1 style="font-size:50px">${comInfo.get("COMMUNITY_NAME")}</h1>
										${comInfo.get("COMMUNITY_DESCRIPTION") }
										<div class="search_form">
											<form>
												<input type="text" name="search" placeholder="커뮤니티 내 검색">
												<button type="submit">검색</button>
											</form>
										</div><!--search_form end-->										
									</div><!--post-topbar end-->
									<div class="posts-section">
										<div class="post-bar">
											<div class="post_topbar">
												<div class="usy-dt">
													<div class="usy-name">
														<input type="button" value="게시판추가" onclick="addBoard()">
														<div class="dff-tab current" id="tab-3">
														<c:choose>
															<c:when test="${boardListSize gt 0}">	<!-- gt : > -->  
																<table>
																	<thead>
																		<tr>
																			<th>번호</th>
																			<th>이름</th>
																			<th>게시글수</th>
																			<th>분류</th>
																			<th>상태</th>
																			<th>확인</th>
																			<th>변경</th>
																		</tr>
																	
																		<c:forEach var="i" begin="1" end="${boardListSize}">
																			<tr>
																				<td>${i}</td>
																				<td>${boardList.get(i-1).get("BOARD_NAME")}</td>
																				<td>${boardList.get(i-1).get("BOARD_ARTICLE_COUNT")}</td>
																				<td>${boardList.get(i-1).get("BOARD_CATEGORY")}</td>
																				<td>${boardList.get(i-1).get("BOARD_STATUS")}</td>
																				<td>
																					<input type="hidden" name="index" value="${i}">
																					<input type="hidden" name="board_id" value='${boardList.get(i-1).get("BOARD_ID")}'>	
																														
																					활성화<input type="radio" id="board_o" name="board_status_change" value="o">
																					비활성화<input type="radio" id="board_x" name="board_status_change" value="x">
																				</td>
																				<td>
																					<input type="button" value="처리" onclick="boardStsAdmin('${i}')">
																				</td>
																			</tr>
																		</c:forEach>
																	</thead>
																</table>
															</c:when>
														</c:choose>

														</div><!--dff-tab end-->
													</div>
												</div>
											</div>
										</div><!--posts-section end-->
									</div><!--main-ws-sec end-->
								</div>

							</div>
						</div><!-- main-section-data end-->
					</div> 
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
	
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
		
		var indexList=new Array();
		var idList=new Array();
		
		//활성, 비활성 선택
		$(document).ready(function() {
			
			//index 배열
			$("input[name=index]").each(function(index, item) {
				indexList.push($(item).val());
			});
			alert(indexList);
			
			//community_id 배열
			$("input[name=board_id]").each(function(index, item) {
				idList.push($(item).val());
			});
			alert(idList);
			
			
		});
		
		function boardStsAdmin(i) {
			alert(i);
			alert(idList[i-1]);
			var community_id=${comInfo.get('COMMUNITY_ID') };
			var board_id=idList[i-1];
			var board_status=$("input[name=board_status_change]:checked").val();
			
			$(document).ready(function() {
				$.ajax({
					url:"board_admin.do",
					contentType: 'application/json; charset=utf-8',
					data:{"community_id" : community_id, "board_id" : board_id, "board_status" : board_status},
					method:"GET",
					success:function(data) {
						location.href="com_board.do?community_id="+community_id;
					}
					
				})
			})
			
		}

	</script>

<script src="resources/com/js/utils.js"></script>


<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/popper.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/flatpickr.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/lib/slick/slick.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/script.js"></script>

</body>
</html>