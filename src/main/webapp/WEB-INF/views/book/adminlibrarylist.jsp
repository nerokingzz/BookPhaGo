<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>도서 정보 출력</title>
<style>
.cls1 {
	font-size: 40px;
	text-align: center;
}

.cls2 {
	font-size: 20px;
	text-align: center;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}
/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>

<p class="cls1">도서 정보</p>

	<!-- Trigger/Open The Modal -->
	<p align="center">
		<button id="myBtn">도서 등록</button>
	</p>
	
	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<form method="get" action="inputlibrary.do">
				<h3 style="text-align: center">도서 등록창</h3>
				<table align="center">
					<tr>
						<td width="200">
							<p align="right">isbn :</p>
						</td>
						<td width="400"><input type="text" name="isbn" id="pinput" readonly>
							<input type="button" value="검색" onclick="searchIsbn()" ></td>
					</tr>
					<tr>
						<td width="200">
							<p align="right">도서명 :</p>
						</td>
						<td width="400"><input type="text" id="pinputt" readonly></td>
					</tr>
					<tr>
						<td width="200">
							<p align="right">지은이 :</p>
						</td>
						<td width="400"><input type="text" id="pinputtt" readonly></td>
					</tr>
					<tr>
						<td width="200">
							<p align="right">출판사 :</p>
						</td>
						<td width="400"><input type="text" id="pinputttt" readonly></td>
					</tr>
					<tr>
						<td width="200">
							<p align="right">발행일 :</p>
						</td>
						<td width="400"><input type="text" id="pinputtttt" readonly></td>
					</tr>
					<tr>
						<td width="200">
							<p align="right">도서번호 :</p>
						</td>
						<td width="400"><input type="text" name="bookNumber"></td>
					</tr>
					<tr>
						<td width="200">
							<p align="right">장르 :</p>
						</td>
						<td width="400"><input type="text" name="bookGenre"></td>
					</tr>
					<tr>
						<td width="200">
							<p align="right">대출여부 :</p>
						</td>
						<td width="400"><input type="text" name="bookRent"
							value="대출가능"></td>
					</tr>
					<tr>
						<td width="200">
							<p align="right">예약여부 :</p>
						</td>
						<td width="400"><input type="text" name="bookReservation"
							value="예약불가"></td>
					</tr>
					<tr>
						<td width="200">
							<p>&nbsp;</p>
						</td>
						<td width="400"><input onclick="return inputCheck()" type="submit" value="도서등록"> <input
							type="reset" value="다시입력"></td>
					</tr>

				</table>
			</form>
		</div>
	</div>
 
	<div >
				<div ></div>
				<div >
					<form action="adminsearchbook.do" method="get">
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
	
	<br>
	<table align="center" border="1">
		<tr align="center" bgcolor="lightgreen">
			<td width="7%"><b>도서명</b>
			<td width="7%"><b>도서번호</b>
			<td width="7%"><b>저자</b>
			<td width="7%"><b>출판사</b>
			<td width="7%"><b>발행일</b>
			<td width="7%"><b>장르</b>
			<td width="7%"><b>대출여부</b>
			<td width="7%"><b>예약여부</b>
			<td width="7%"><b>ISBN</b>
			<td width="7%"><b>수정</b>
			<td width="7%"><b>삭제</b></td>

			<c:choose>
				
				<c:when test="${booklistSize gt 0 }">
					<c:forEach var="i"  begin="1" end="${booklistSize }">
						<tr align="center">
							<td>${booklist.get(i-1).get("BOOKNAME") }</td>
							<td>${booklist.get(i-1).get("BOOKNUMBER") }</td>
							<td>${booklist.get(i-1).get("BOOKWRITER") }</td>
							<td>${booklist.get(i-1).get("BOOKPUBLISHER") }</td>
							<td>${booklist.get(i-1).get("BOOKDATE") }</td>
							<td>${booklist.get(i-1).get("BOOKGENRE") }</td>
							<td>${booklist.get(i-1).get("BOOKRENT") }</td>
							<td>${booklist.get(i-1).get("BOOKRESERVATION") }</td>
							<td>${booklist.get(i-1).get("ISBN") }</td>
							<td>
							<button onclick="window.open('modfindlibrary.do?bookNumber=${booklist.get(i-1).get('BOOKNUMBER') }','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');">수정</button>
							</td>
							<td>
								<form action="librarydelete.do" method="post">
										<input type="hidden" name="bookNumber" value="${booklist.get(i-1).get('BOOKNUMBER') }">
										<button onclick="return check()" type="submit" aria-hidden="true">삭제</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
	</table>
</body>
</html>

<script type="text/javascript">
	  // Get the modal
    var modal = document.getElementById('myModal');

    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];                                          
     
    // When the user clicks on the button, open the modal 
    btn.onclick = function() {
        modal.style.display = "block";
    }
    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
    
    function check(){
    	if (confirm("삭제 하시겠습니까??") == true){    //확인
    	    return true;
    	}else{   //취소
    	    return false;
    	}
    }
    
    function inputCheck(){
    	if (confirm("추가 하시겠습니까??") == true){    //확인
    	    return true;
    	}else{   //취소
    	    return false;
    	}
    }
	
    function searchIsbn() {
    	var popUrl = "adminisbnsearchlist.do";
    	window.open(popUrl,"","width=1200,height=400");
    }
</script>