<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>

<!-- 챗봇 -->
<jsp:include page="chat/watson.jsp"></jsp:include>

<header>
	<div class="container">
		<div class="header-data">			
			<nav>
				<ul style="height:50px; margin-bottom:15px">
					<li style="height:50px;">
						<a href="/" title=""><img src="${contextPath}/resources/bootstrap/images/logo.png" alt=""></a>
					</li>
					<li style="height:50px">
						<a href="/" title="">
							<span><i class="fas fa-home"></i></span>
							<spring:message code="top.home" text="홈"/>
						</a>
					</li>
					<li style="height:50px">
						<a href="book_main.do?page=search" title="">
							<span><i class="fas fa-book"></i></span>
							<spring:message code="top.book" text="도서"/>
						</a>
						<ul>
							<li><a href="book_main.do?page=search" title=""><spring:message code="top.book.search" text="도서검색"/></a></li>
							<li><a href="book_main.do?page=apply" title=""><spring:message code="top.book.request" text="도서신청"/></a></li>
						</ul>
					</li>
							
					<c:choose>
						<c:when test="${user_position ne null}">
							<li style="height:50px">
								<a href="com_main.do" title="">
									<span><i class="fas fa-user-friends"></i></span>
									<spring:message code="top.comm" text="커뮤니티"/>
								</a>
							</li>
							<li style="height:50px">
								<a href="myLib_main.do" title="" class="not-box-openm">
									<span><i class="fab fa-gratipay"></i></span>
									<spring:message code="top.mylib" text="마이라이브러리"/>
								</a>
								<ul>
									<li><a href="myLib_main.do?page=score" title=""><spring:message code="top.mylib.rate" text="도서평가"/></a></li>
									<li><a href="myLib_main.do?page=favor" title=""><spring:message code="top.mylib.taste" text="취향분석"/></a></li>
									<li><a href="myLib_main.do?page=declare" title=""><spring:message code="top.mylib.report" text="신고하기"/></a></li>
									<li><a href="myLib_main.do?page=status" title=""><spring:message code="top.mylib.status" text="현황조회"/></a></li>
								</ul>
							</li>								
						</c:when>
					</c:choose>
					
					<c:choose>
						<c:when test="${user_position eq 'admin'}">
							<li style="height:50px">
								<a href="admin_main.do" title="" class="not-box-open">
									<span><i class="fas fa-user-cog"></i></span>
									<spring:message code="top.admin" text="관리자전용"/>
								</a>
								<ul>
									<li><a href="admin_main.do?page=book_A" title=""><spring:message code="top.admin.book" text="도서관리"/></a></li>
									<li><a href="admin_main.do?page=book_status_A" title=""><spring:message code="top.admin.current" text="현황관리"/></a></li>
									<li><a href="admin_main.do?page=com_A" title=""><spring:message code="top.admin.comm" text="커뮤니티관리"/></a></li>
									<li><a href="admin_main.do?page=dec_A" title=""><spring:message code="top.admin.report" text="신고관리"/></a></li>
									<li><a href="admin_main.do?page=chat_A" title=""><spring:message code="top.admin.chatbot" text="챗봇관리"/></a></li>
									<li><a href="admin_main.do?page=rent_A" title=""><spring:message code="top.admin.rent" text="도서대출"/></a></li>
									<li><a href="admin_main.do?page=return_A" title=""><spring:message code="top.admin.return" text="도서반납"/></a></li>
								</ul>
							</li>
							<li style="height:50px">
								<a href="list.do" title="" class="not-box-open">
									<span><i class="fas fa-user-cog"></i></span>
									<spring:message code="top.member" text="회원관리"/>
								</a>
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
					<div style="padding-top:5px" class="user-account">
						<div class="user-info">
							<a href="update1.do" title=""><spring:message code="top.right.modify" text="정보 수정"/></a>
							<p style="text-indent:1.2em;line-height:1;" />
							<a href="logout.do" title=""><spring:message code="top.right.logout" text="로그아웃"/></a>
						</div>
					</div>
				</c:when>

				<c:when test="${user_position eq null}">
					<div style="padding-top:5px" class="user-account">
						<div class="user-info">
							<a href="sign.do" title=""><spring:message code="top.right.sign" text="로그인/회원가입"/></a>
						</div>
					</div>
				</c:when>
				
			</c:choose>
		</div><!--header-data end-->
	</div>
</header><!--header end-->

</html>		