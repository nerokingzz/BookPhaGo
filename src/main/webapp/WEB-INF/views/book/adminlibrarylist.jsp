<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>도서 정보 출력</title>
<style>

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
	/* width: 50%; */ /* Could be more or less, depending on screen size */
}
/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 20px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

select {
width: 70px;
padding: .8em .5em;
border: 1px solid #999;
font-family: inherit;
background: url('arrow.jpg') no-repeat 95% 50%;
border-radius: 0px;
-webkit-appearance: none;
-moz-appearance: none;
appearance: none;
}

select::-ms-expand {
display: none;
}

</style>
</head>
<body>



	<!-- Trigger/Open The Modal -->
	<p align="center">
		<button style=" width:70px; height:50px; background-color:#e44d3a; border: none; color:#fff; padding: 15px 0; text-align: center; text-decoration: none; display: inline-block; font-size: 13px; margin: 4px; cursor: pointer;" id="myBtn">도서 등록</button>
	</p>
	
	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content" style="width: 50%;">
			<span class="close">&times;</span>
			<form method="get" action="admin_main.do">
				<h2 style="text-align: center">도서 등록창</h2><br><br>
				<input type="hidden" name="page" value="book_A">
				<div class="row">
				                                <div class="col-md-12 col-sm-12"><br>
				                                   <h6>isbn : <input type="text" name="isbn" id="isbn" > <input type="button" value="검색" onclick="searchIsbn();"></h6><br><br>
				                                </div>
				                                <div class="col-md-4 col-sm-4">
				                                	<h6>도서 제목 : <input type="text" name ="bookName" id="bookName" readonly></h6>
				                                </div>
				                                <div class="col-md-4 col-sm-4">
				                                    <h6>도서 소개 : <input type="text" name="bookContents" id="bookContents" readonly></h6>
				                                </div>
				                                <div class="col-md-4 col-sm-4">
				                                	<h6>도서 저자 : <input type="text" name="bookWriter" id="bookWriter" readonly></h6><br><br>
				                                </div>
				                                 <div class="col-md-4 col-sm-4">
				                                    <h6>도서 번역자 : <input type="text" name="bookTrans" id="bookTrans" readonly></h6>
				                                </div>
				                                 <div class="col-md-4 col-sm-4">
				                                	<h6>출판사 : <input type="text" name="bookPublisher" id="bookPublisher" readonly></h6>
				                                </div>
				                                 <div class="col-md-4 col-sm-4">
				                                	<h6>발행일 : <input type="text" name="bookDate" id="bookDate" readonly></h6><br><br>
				                                </div>
				                                <div class="col-md-4 col-sm-4">
				                                	<h6>장르 : <select name="bookGenre" id="bookGenre">
																<option value="총류">총류</option>
																<option value="철학">철학</option>
																<option value="종교">종교</option>
																<option value="사회과학">사회과학</option>
																<option value="자연과학">자연과학</option>
																<option value="기술과학">기술과학</option>
																<option value="예술">예술</option>
																<option value="언어">언어</option>
																<option value="문학">문학</option>
																<option value="역사">역사</option>
																</select> <input type="button"  name="search" placeholder="Search..." value="검색" onclick="bookNumberinput()" >
													</h6>
				                                </div>
				                                <div class="col-md-4 col-sm-4">
				                                	<h6>도서 번호 : <input type="text" name="bookNumber" id="bookNumber"></h6>
				                                </div>
				                                 <div class="col-md-4 col-sm-4">
				                                	<h6>도서 썸네일 : <input type="text" name="bookThum" id="bookThum" readonly></h6><br><br>
				                                </div>
				                                 <div class="col-md-6 col-sm-6 text-center" >
				                                	<h6>대출여부 : <input type="text" name="bookRent" id="bookRent" value="대출가능"></h6>
				                                </div>
				                                 <div class="col-md-6 col-sm-6 text-center">
				                                	<h6>예약여부 : <input type="text" name="bookReservation" id="bookReservation" value="예약불가"></h6><br><br>
				                                </div>
				                                <div style="margin:0 auto;">
				                                <input onclick="return inputCheck()" type="submit" value="도서등록">
				                                </div>
				 </div>
			</form>
		</div>
	</div>
 
	<div class="search-bar">
		<form action="admin_main.do" method="get">
			<input type="hidden" name="page" value="book_A">
	
			<select name="search_option">
				<option value="bookName">도서명</option>
				<option value="bookNumber">도서번호</option>
				<option value="bookWriter">저자</option>
				<option value="bookPublisher">출판사</option>
			</select>
		 	<input type="text" name="search_value" placeholder="Search..." style="width:200px; height:43.59px; border: 1px solid;">
			<button type="submit"><i class="la la-search"></i></button>
		</form>
	</div><!--search-bar end-->       

	<br>
	
 <h3>도서정보</h3>
 
 	
	<table align="center" border="1">
		<tr align="center" bgcolor="#e44d3a">
			<td width="20%"><b>도서명</b>
			<td width="8%"><b>도서번호</b>
			<td width="8%"><b>저자</b>
			<td width="8%"><b>출판사</b>
			<td width="8%"><b>발행일</b>
			<td width="7%"><b>장르</b>
			<td width="8%"><b>대출여부</b>
			<td width="4%"><b>ISBN</b>
			<td width="5%"><b>수정</b>
			<td width="5%"><b>삭제</b></td>

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
							<td>${booklist.get(i-1).get("ISBN") }</td>
							<td>
							<button onclick="window.open('modfindlibrary.do?bookNumber=${booklist.get(i-1).get('BOOKNUMBER') }','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');">수정</button>
							</td>
							<td>
								<form action="admin_main.do" method="post">
										<input type="hidden" name="page" value="book_A">
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
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
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
    	window.open(popUrl,"","width=1200,height=800");
    }

    
    function bookNumberinput() {
    	var bookGenre = {"bookGenre" : $('#bookGenre option:selected').val()};
    	
    	$.ajax({
    		url:"a.do",
    		data:JSON.stringify(bookGenre),
    		method:"POST",
    		contentType: "application/json",
    		success:function(data) {
    			
    			console.log("1111111111111111");
    			
    			var bookinfo = data;
    			var bookNumber = bookinfo.bookNumber;
    			
    			var bookNumbersplit = bookNumber.split('_');
    			
    			var firstbookNumber = bookNumbersplit[0];
    			
    			var secondbookNumber = bookNumbersplit[1];
    			
    			var secondbookNumber_1 = Number(secondbookNumber)+1;
    			
    			var firstbookNumber_1 = firstbookNumber.concat("_",secondbookNumber_1);
    			
    			console.log(bookNumbersplit[0]);
    			console.log(bookNumbersplit[1]);
    			console.log(secondbookNumber_1);
    			console.log(firstbookNumber_1);
    			$('#bookNumber').val(firstbookNumber_1);
    		},error:function(request,status,error){
    			console.log("22222222222222");
    		}
    	});
    }
</script>