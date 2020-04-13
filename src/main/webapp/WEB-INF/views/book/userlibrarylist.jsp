<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>사용자 도서 목록</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<style>
.cls1 {
	font-size: 40px;
	text-align: center;
}

.cls2 {
	font-size: 20px;
	text-align: center;
}
</style>
</head>
<body>
<p class="cls1">도서 검색</p>

<div >
				<div ></div>
				<div >
					<form action="usersearchbook.do" method="get">
						<table>
							<tr>
								<td style="text-align: center;">
									<select class="form-control"  name="search_option">
										<option value="bookName">도서명</option>
										<option value="bookNumber">도서번호</option>
										<option value="bookWriter">저자</option>
										<option value="bookPublisher">출판사</option>
									</select>
								</td>
								<td>
									<div>
									  <input type="text" name="search_value"  id="inputSuccess2" aria-describedby="inputSuccess2Status">
									</div>
								</td>
								<td style="text-align: center;"><button type="submit" >검색</button></td>
							</tr>					
						</table>
					</form>
				</div>
				<div></div>
			</div>

<table align="center" border="1">
		<tr align="center" bgcolor="lightgreen">
			<td width="7%"><b>NO.</b>	
			<td width="7%"><b>도서명</b>
			<td width="7%"><b>도서번호</b>
			<td width="7%"><b>저자</b>
			<td width="7%"><b>출판사</b>
			<td width="7%"><b>발행일</b>
			<td width="7%"><b>장르</b>
			<td width="7%"><b>대출여부</b>
			<td width="7%"><b>예약여부</b></td>
			
			<c:choose>
				
				<c:when test="${booklistSize gt 0 }">
					<c:forEach var="i"  begin="1" end="${booklistSize }">
						<tr align="center">
							<td>${i }
							<td>${booklist.get(i-1).get("BOOKNAME") }</td>
							<td>${booklist.get(i-1).get("BOOKNUMBER") }</td>
							<td>${booklist.get(i-1).get("BOOKWRITER") }</td>
							<td>${booklist.get(i-1).get("BOOKPUBLISHER") }</td>
							<td>${booklist.get(i-1).get("BOOKDATE") }</td>
							<td>${booklist.get(i-1).get("BOOKGENRE") }</td>
							<td>${booklist.get(i-1).get("BOOKRENT") }</td>
							<td>
							<input type="button" id="${booklist.get(i-1).get('BOOKRESERVATION') }" value= "${booklist.get(i-1).get('BOOKRESERVATION') }" onClick="calculate(${booklist.get(i-1).get('BOOKNUMBER') });">
						
							</td>
							
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tr>
</table>
</body>
</html>

<script type="text/javascript">
function calculate(value){
    var e = window.event,
        btn = e.target || e.srcElement;
    //alert(btn.id);

    if(btn.id == "예약가능"){
    	var popUrl = "userreservationlist.do?bookNumber="+value;
    	window.open(popUrl,"","width=400,height=400");

    }
}
</script>
