<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p align="center">신청 도서 검색

	<div >
		<form action="userapplysearchbook.do" method="get">
			<table>
				<tr>
					<td style="text-align: center;">
						<select class="form-control"  name="search_option">
							<option value="bookName">도서명</option>
						</select>
					</td>
					<td>
						<div>
						  <input type="text" name="search_value">
						</div>
					</td>
					<td style="text-align: center;"><button type="submit" >검색</button></td>
				</tr>					
			</table>
		</form>
	</div>
	
	
	<table align="center" border="1">
			
			<c:choose>
				
				<c:when test="${booklistSize gt 0 }">
				<tr align="center" bgcolor="lightgreen">
					<td width="7%"><b>도서명</b>
					<td width="7%"><b>저자</b>
					<td width="7%"><b>출판사</b>
					<td width="7%"><b>발행일</b>
					<td width="7%"><b>isbn</b>
					<td width="7%"><b>선택</b></td>
					<c:forEach var="i"  begin="1" end="${booklistSize }">
						<tr align="center">
							<td><input type="text" id="cInput" value="${booklist.get(i-1).get('BOOKNAME') }" 
								 style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align:center;" readonly></td>
							<td>${booklist.get(i-1).get("BOOKWRITER") }</td>
							<td>${booklist.get(i-1).get("BOOKPUBLISHER") }</td>
							<td>${booklist.get(i-1).get("BOOKDATE") }</td>
							<td><input type="text" id="cInputt" value="${booklist.get(i-1).get('ISBN') }" 
								 style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align:center;" readonly></td>
							<td>
								<input type="button" value="선택하기" onclick="setParentText('${i}');">
							</td>
						</tr>
					</c:forEach>
				</tr>
				</c:when>
			</c:choose>
	</table>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>	

<script type="text/javascript">
	
	var isbnlist=new Array();
	var booknamelist=new Array();
	
	$(document).ready(function() {
		//community_id 배열
		$("input[id=cInputt]").each(function(index, item) {
			isbnlist.push($(item).val());
		});
		
	});
	
	$(document).ready(function() {
		//community_id 배열
		$("input[id=cInput]").each(function(index, item) {
			booknamelist.push($(item).val());
		});
		
	});
	
function setParentText(i){

	var isbn = isbnlist[i-1];
	var bookname = booknamelist[i-1];
	
	window.opener.document.getElementById("pInput").value = bookname;
	window.opener.document.getElementById("pInputt").value = isbn;
    
    window.close();
}


function CloseWindow() {
	window.close();
}
</script>