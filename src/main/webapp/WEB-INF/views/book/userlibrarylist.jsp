<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
table.type11 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    margin: 20px 10px;
}
table.type11 th {
    font-size: 14px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background-color: #e44d3a;
}
table.type11 td {
    font-size: 14px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #eee;
}
</style>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>

</head>
<body>
&nbsp&nbsp

			<div style="float:right;">
					<form action="book_main.do" method="get">
					<input type="hidden" name="page" value="search">
						<table>
							<tr>
								<td style="text-align: center;">
									<select class="form-control"  name="search_option">
										<option value="bookName">도서명</option>
										<option value="bookNumber">도서번호</option>
										<option value="bookWriter">저자</option>
										<option value="bookPublisher">출판사</option>
										<option value="bookGenre">장르</option>
										<option value="bookRent">대출여부</option>
									</select>
								</td>
								<td>
									<div>
									  <input type="text" style="height:38px;" name="search_value"  id="inputSuccess2" aria-describedby="inputSuccess2Status">
									</div>
								</td>
								<td><button type="submit" style="width: 50px;height: 38px;padding-left: 0px;padding-right: 0px;color: white;background-color: #e44d3a;
                                             border: 1px solid #e5e5e5;margin-top: 10px;margin-right: 10px;margin-left: 2px;">검색</button></td>
							</tr>					
						</table>
					</form>
			</div>

<h3>도서정보</h3>

<table class="type11">
		<tbody>
			<c:choose>
				<c:when test="${booklistSize eq 0 }">
				<div>&nbsp</div><div>&nbsp</div><div>&nbsp</div>
				<div style="text-align:center;">
				<c:out value="검색된 결과가 없습니다."></c:out>
				</div>
				</c:when>
			
				<c:when test="${booklistSize gt 0 }">
				<thead>
		<tr>
		<th width="20%">도서명</th>
	    <th width="13%">도서번호</th>
		<th width="13%">저자</th>
		<th width="13%">출판사</th>
		<th width="13%">발행일</th>
		<th width="13%">장르</th>
		<th width="13%">대출여부</th>
		</tr>
		</thead>
					<c:forEach var="i"  begin="1" end="${booklistSize }">
						<tr>
							<td width="20%">${booklist.get(i-1).get("BOOKNAME") }</td>
							<td>${booklist.get(i-1).get("BOOKNUMBER") }</td>
							<td>${booklist.get(i-1).get("BOOKWRITER") }</td>
							<td>${booklist.get(i-1).get("BOOKPUBLISHER") }</td>
							<td>${booklist.get(i-1).get("BOOKDATE") }</td>
							<td>${booklist.get(i-1).get("BOOKGENRE") }</td>
							<td>${booklist.get(i-1).get("BOOKRENT") }</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
														
</table>

											            <nav aria-label="Page navigation example" class="full-pagi">
															<ul class="pagination" style="width: auto;float: right;">
																<c:if test="${paging.startPage != 1 }">
																	<li class="page-item"><a a class="page-link pvr" href="/book_main.do?page=search&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">Previous</a></li>
																</c:if>	
																
																<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
																	<c:choose>
																		<c:when test="${p == paging.nowPage }">
																			<li class="page-item"><a class="page-link active">${p }</a></li>
																		</c:when>
																		<c:when test="${p != paging.nowPage }">
																			<li class="page-item"><a class="page-link" href="/book_main.do?page=search&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
																		</c:when>
																	</c:choose>
																</c:forEach>
																
																<c:if test="${paging.endPage != paging.lastPage}">
																	<li class="page-item"><a class="page-link pvr" href="/book_main.do?page=search&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">Next</a></li>
																</c:if>
															</ul>
														</nav>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>	

<script type="text/javascript">
$(document).on('click', '.load-list', function(){
		var a = $(this).attr('id');  
		var b = $(this).attr('value');  
		c(a,b);
	});
	
	function c(a,b){
		var a1 = a;
		var b1 = b;
		
		if(b1 == '예약가능'){
			var popUrl = "userreservationlist.do?bookNumber="+a1;
	    	window.open(popUrl,"","width=400,height=400");
		}
	}
</script>
