<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
	 	<title>게시판</title>
	 		 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
			
			/* #col-xs-2 col-sm-2{
				margin-left:300px;
			} */
			
/* 			.col-md-offset-3{
				margin-left:0px;
				} */
				
			.search{
				margin-left:300px;
			}
			#keywordInput{
				float:right;
				width:30%;
			}
			
			#search{
				float:right;
			}
		</style>
		
		<script>
		 $(function(){
		        $('#searchBtn').click(function() {
		          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
		        });
		      }); 

		 function d_click(){
				    return confirm("회원정보를 삭제하시겠습니까?");
			
			}
		 
		</script>
	</head>
	<body>
		<div id="root">
			<header>
				<h1> 회원정보페이지</h1>
			</header>
			<hr />
			<section id="container">
				<form role="form" method="get" id="delForm">
					<table align="center" width="100%" class="table table-hover">
						<tr><th>번호</th><th>아이디</th><th>비밀번호</th><th>이름</th><th>이메일</th><th>나이</th><th>성별</th><th>취향1</th><th>취향2</th><th>취향3</th>
						<th>badcnt</th><th>badsts</th><th>stopstart</th><th>stopend</th><th>applycnt</th><th>borrowcnt</th><th>reservecnt</th><th>userposition</th><th>emailcheck</th><th>가입일</th><th>회원삭제</th></tr>
						
						<c:forEach items="${list}" var = "list">
							<tr>
								<td><c:out value="${list.bno}" />
								<td><c:out value="${list.userId}" /></td>
								<td><c:out value="${list.userPass}" /></td>
								<td><c:out value="${list.userName}" /></td>
								<td><c:out value="${list.userEmail}" /></td>
								<td><c:out value="${list.userAge}" /></td>
								<td><c:out value="${list.userGender}" /></td>
								<td><c:out value="${list.userTaste1}" /></td>
								<td><c:out value="${list.userTaste2}" /></td>
								<td><c:out value="${list.userTaste3}" /></td>
								<td><c:out value="${list.badcnt}" /></td>
								<td><c:out value="${list.badsts}" /></td>
								<td><c:out value="${list.stopstart}" /></td>
								<td><c:out value="${list.stopend}" /></td>
								<td><c:out value="${list.applycnt}" /></td>
								<td><c:out value="${list.borrowcnt}" /></td>
								<td><c:out value="${list.reservecnt}" /></td>
								<td><c:out value="${list.userposition}" /></td>
								<td><c:out value="${list.emailcheck}" /></td>
								
								<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								
								
								<c:choose>
									<c:when test="${list.userId eq 'admin'}">
									</c:when>
									<c:otherwise>
										<td><a href="adminDelete.do?id=${list.userId}" onclick="d_click();" id="delete_click">회원삭제</a></td>
									</c:otherwise>
								</c:choose>
							</tr>

						</c:forEach>

					</table>
					<hr/>
					
				<div class="col-md-offset-3">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li><a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>

				</div>
				
					
				<div class="search row">
						<div class="col-xs-2 col-sm-2">
						    <select name="searchType" id="search" class="form-control">
						      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
						      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>아이디</option>
						      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>이름</option>
						      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>이메일</option>
						      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>취향</option>
						    </select>
						</div>
						
			<div class="col-xs-10 col-sm-10">
				<div class="input-group">
					    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control" />
					<span class="input-group-btn">
					    <button id="searchBtn" type="button" class="btn btn-default">검색</button>
				 </span>
							</div>
						</div>
 				 </div>
					
					
				
			</form>
			</section>
			<hr />
		</div>
	</body>
</html>