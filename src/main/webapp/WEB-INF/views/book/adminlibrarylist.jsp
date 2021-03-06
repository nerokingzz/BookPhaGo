<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
		<button style="width: 80px;
      height: 30px;
      background-color: #e44d3a;
       border: none;
       color: #fff;
       text-align: center;
       text-decoration: none;
       display: inline-block;
       margin: 4px;
       cursor: pointer;
      padding-top: 0px;
       padding-right: 0px;
       padding-bottom: 0px;
       padding-left: 0px;
       border-radius: 15px;" id="myBtn">도서 등록</button>
		</p>
	
	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content" style="width: 30%;">
			<span class="close">&times;</span>
			<form method="get" action="admin_main.do">
				<h2 style="text-align: center">도서 등록창</h2>
				<input type="hidden" name="page" value="book_A">
				<div class="row">
				                                <div class="col-md-12 col-sm-12"><br>
				                                   <h6>isbn : <input style="height: 20px;
				                                   width: 75%;
											    padding-bottom: 0px;
											    border: 1px solid #e5e5e5;
											    border-top-color: rgb(229, 229, 229);
											    border-top-style: solid;
											    border-top-width: 1px;
											    border-right-color: rgb(229, 229, 229);
											    border-right-style: solid;
											    border-right-width: 1px;
											    border-bottom-color: rgb(229, 229, 229);
											    border-bottom-style: solid;
											    border-bottom-width: 1px;
											    border-left-color: rgb(229, 229, 229);
											    border-left-style: solid;
											    border-left-width: 1px;
											    border-image-source: initial;
											    border-image-slice: initial;
											    border-image-width: initial;
											    border-image-outset: initial;
											    border-image-repeat: initial;
											    padding-left: 15px;
											    padding-right: 15px;
											    border-radius: 15px;"type="text" name="isbn" id="isbn" class="isbn" readonly> <input style="width: 50px; height: 20px;
											    padding-left: 0px;
											    padding-right: 0px;
											    padding-bottom: 0px;
											    border: 1px solid #e5e5e5;
											    border-top-color: rgb(229, 229, 229);
											    border-top-style: solid;
											    border-top-width: 1px;
											    border-right-color: rgb(229, 229, 229);
											    border-right-style: solid;
											    border-right-width: 1px;
											    border-bottom-color: rgb(229, 229, 229);
											    border-bottom-style: solid;
											    border-bottom-width: 1px;
											    border-left-color: rgb(229, 229, 229);
											    border-left-style: solid;
											    border-left-width: 1px;
											    border-image-source: initial;
											    border-image-slice: initial;
											    border-image-width: initial;
											    border-image-outset: initial;
											    border-image-repeat: initial;
											    border-radius: 15px;" type="button" value="검색" onclick="searchIsbn();"></h6><br><br>
				                                </div>
				                                <div class="col-md-12 col-sm-12">
				                                	<h6>도서명 : <input style="width: 73%; height: 20px; padding-left: 15px; padding-right: 15px;" type="text" name ="bookName" id="bookName" readonly></h6>
				                                </div>
				                                <div class="col-md-12 col-sm-12">
				                                    <h6>소개글 : <input style="width: 73%; height: 20px; padding-left: 15px; padding-right: 15px;" type="text" name="bookContents" id="bookContents" readonly></h6>
				                                </div>
				                                <div class="col-md-12 col-sm-12">
				                                	<h6>저자명 : <input style="width: 73%; height: 20px; padding-left: 15px; padding-right: 15px;" type="text" name="bookWriter" id="bookWriter" readonly></h6>
				                                </div>
				                                 <div class="col-md-12 col-sm-12">
				                                    <h6>번역자 : <input style="width: 73%; height: 20px; padding-left: 15px; padding-right: 15px;" type="text" name="bookTrans" id="bookTrans" readonly></h6>
				                                </div>
				                                 <div class="col-md-12 col-sm-12">
				                                	<h6>출판사 : <input style="width: 73%; height: 20px; padding-left: 15px; padding-right: 15px;" type="text" name="bookPublisher" id="bookPublisher" readonly></h6>
				                                </div>
				                                 <div class="col-md-12 col-sm-12">
				                                	<h6>발행일 : <input style="width: 73%; height: 20px; padding-left: 15px; padding-right: 15px;" type="text" name="bookDate" id="bookDate" readonly></h6>
				                                </div>
				                                 <div class="col-md-12 col-sm-12">
				                                	<h6>썸네일 : <input style="width: 73%; height: 20px; padding-left: 15px; padding-right: 15px;" type="text" name="bookThum" id="bookThum" readonly></h6><br><br>
				                                </div>
				                                <div class="col-md-12 col-sm-12">
				                                	<h6>장르 : <select name="bookGenre" id="bookGenre" style="width: 65px;
															    height: 30px;
															    border-radius: 15px;
															    padding-left: 5px;
															    padding-bottom: 0px;
															    padding-top: 0px;
															    padding-right: 0px;
															    font-size: 13px;">
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
																</select> <input style="width:50px;height: 20px; padding-left: 0px; padding-right: 0px; padding-bottom: 0px;"type="button"  name="search" placeholder="Search..." value="검색" onclick="bookNumberinput()" >
													</h6>
				                                </div>
				                                <div class="col-md-12 col-sm-12">
				                                	<h6>도서번호 : <input style="width: 69%; height: 20px; padding-left: 15px; padding-right: 15px;" type="text" name="bookNumber" id="bookNumber" class="bookNumber" readonly></h6>
				                                </div>
				                                 <div class="col-md-12 col-sm-12" >
				                                	<h6>대출여부 : <input style="width: 69%; height: 20px; padding-left: 15px; padding-right: 15px;" type="text" name="bookRent" id="bookRent" value="대출가능" readonly></h6>
				                                </div>
				                                 <div class="col-md-12 col-sm-12">
				                                	<h6>예약여부 : <input style="width: 69%; height: 20px; padding-left: 15px; padding-right: 15px;" type="text" name="bookReservation" id="bookReservation" value="예약불가" readonly></h6><br><br>
				                                </div>
				                                <div style="margin:0 auto;">
				                                <!-- <input type="button" style="font-size: 15px;" onclick="change1();" value="등록하기"> -->
				                                  <input type="button" style="font-size: 14px; padding-top: 0px; padding-bottom: 0px;border: 1px solid #e5e5e5;border-top-color: rgb(229, 229, 229);border-top-style: solid; border-top-width: 1px;border-right-color: rgb(229, 229, 229);
                                                          border-right-style: solid;border-right-width: 1px;border-bottom-color: rgb(229, 229, 229); border-bottom-style: solid;border-bottom-width: 1px;border-left-color: rgb(229, 229, 229);border-left-style: solid;
                                                          border-left-width: 1px; border-image-source: initial; border-image-slice: initial;border-image-width: initial;border-image-outset: initial; border-image-repeat: initial; border-top-color: rgb(229, 229, 229);
                                                          border-top-style: solid; border-top-width: 1px; border-right-color: rgb(229, 229, 229);border-right-style: solid;border-right-width: 1px;border-bottom-color: rgb(229, 229, 229);border-bottom-style: solid;
                                                          border-bottom-width: 1px;border-left-color: rgb(229, 229, 229);border-left-style: solid;border-left-width: 1px;border-image-source: initial;border-image-slice: initial;border-image-width: initial;
                                                          border-image-outset: initial;border-image-repeat: initial;border-radius: 15px;border-top-left-radius: 15px;border-top-right-radius: 15px;border-bottom-right-radius: 15px;border-bottom-left-radius: 15px;
                                                          border-top-left-radius: 15px;border-top-right-radius: 15px;border-bottom-right-radius: 15px;border-bottom-left-radius: 15px;width: 80px;
                                                          height: 25px;" onclick="change1();" value="등록하기"> 
				                                </div>
				 </div>
			</form>
		</div>
	</div>
 
	<%-- <div class="search-bar">
		<form action="admin_main.do" method="get">
			<input type="hidden" name="page" value="book_A">
	
			<select name="search_option">
				<option value="bookName">도서명</option>
				<option value="bookNumber">도서번호</option>
				<option value="bookWriter">저자</option>
				<option value="bookPublisher">출판사</option>
			</select>
		 	<input type="text" name="search_value" placeholder="Search..." style="width:200px; height:43.59px; border: 1px solid;">
			<button type="submit" style=""><i class="la la-search"></i></button>
		</form>
	</div><!--search-bar end-->       

	<br>
	
 <h3>도서정보</h3>
 
 	<table style="border-collapse:collapse; border:1px gray solid; text-align:center;">
		<tr style="text-align:center;" bgcolor="#e44d3a">
			<td width="15%" style="border:1px gray solid;"><b>도서명</b>
			<td width="6%" style="border:1px gray solid;"><b>도서번호</b>
			<td width="7%" style="border:1px gray solid;"><b>저자</b>
			<td width="7%" style="border:1px gray solid;"><b>출판사</b>
			<td width="9%" style="border:1px gray solid;"><b>발행일</b>
			<td width="7%" style="border:1px gray solid;"><b>장르</b>
			<td width="7%" style="border:1px gray solid;"><b>대출여부</b>
			<td width="5%" style="border:1px gray solid;"><b>ISBN</b>
			<td width="5%" style="border:1px gray solid;"><b>수정</b>
			<td width="5%" style="border:1px gray solid;"><b>삭제</b></td>

			<c:choose>
				
				<c:when test="${booklistSize gt 0 }">
					<c:forEach var="i"  begin="1" end="${booklistSize }">
						<tr style="border-collapse:collapse; border:1px gray solid;">
							<td style="border:1px gray solid; padding-bottom:20px;">${booklist.get(i-1).get("BOOKNAME") }</td>
							<td style="border:1px gray solid;">${booklist.get(i-1).get("BOOKNUMBER") }</td>
							<td style="border:1px gray solid;">${booklist.get(i-1).get("BOOKWRITER") }</td>
							<td style="border:1px gray solid;">${booklist.get(i-1).get("BOOKPUBLISHER") }</td>
							<td style="border:1px gray solid;">${booklist.get(i-1).get("BOOKDATE") }</td>
							<td style="border:1px gray solid;">${booklist.get(i-1).get("BOOKGENRE") }</td>
							<td style="border:1px gray solid;">${booklist.get(i-1).get("BOOKRENT") }</td>
							<td style="border:1px gray solid;">${booklist.get(i-1).get("ISBN") }</td>
							<td style="border:1px gray solid; align:center;">
							<button onclick="window.open('modfindlibrary.do?bookNumber=${booklist.get(i-1).get('BOOKNUMBER') }','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');">수정</button>
							</td>
							<td style="border:1px gray solid; align:center; padding-top:10px;">
								<form action="admin_main.do" method="post">
										<input type="hidden" name="page" value="book_A">
										<input type="hidden" name="bookNumber" value="${booklist.get(i-1).get('BOOKNUMBER') }">
										<button style="line-height: inherit;" onclick="return check1()" type="submit" aria-hidden="true">삭제</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
	</table> --%>
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
    
    function check1(){
    	if (confirm("삭제 하시겠습니까??") == true){    //확인
    	    return true;
    	}else{   //취소
    	    return false;
    	}
    }
    
    function inputCheck(){
    	if($("#isbn").val()==""){
            swal("도서를 검색하세요.");
            $("#isbn").focus();
            return false;
    	}else if($("#bookNumber").val()==""){
            swal("도서번호를 검색하세요.");
            $("#bookNumber").focus();
            return false;
    	}else{
    		if (confirm("추가 하시겠습니까??") == true){    //확인
        	    return true;
        	}else{   //취소
        	    return false;
        	}
    	}
    }
	
    function searchIsbn() {
    	var popUrl = "adminisbnsearchlist.do";
    	window.open(popUrl,"","width=1200,height=910");
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
    
    function change1() {
        var isbn = $("input:text[name=isbn]").val();
        var bookName = $("input:text[name=bookName]").val();
        var bookContents = $("input:text[name=bookContents]").val();
        var bookWriter = $("input:text[name=bookWriter]").val();
        var bookTrans = $("input:text[name=bookTrans]").val();
        var bookPublisher = $("input:text[name=bookPublisher]").val();
        var bookDate = $("input:text[name=bookDate]").val();
        var bookThum = $("input:text[name=bookThum]").val();
        var target = document.getElementById("bookGenre");
       var bookGenre = target.options[target.selectedIndex].text;
       var bookNumber = $("input:text[name=bookNumber]").val();
       var bookRent = $("input:text[name=bookRent]").val();
       var bookReservation = $("input:text[name=bookReservation]").val();
        
        if (confirm("등록 하시겠습니까??") == true){ 
        $.ajax({
           url:"booklibinsert.do",
           data:{"isbn" : isbn , "bookName" : bookName, "bookName" : bookName, "bookContents" : bookContents, "bookWriter" : bookWriter, "bookTrans" : bookTrans, "bookPublisher" : bookPublisher,
              "bookDate" : bookDate, "bookThum" : bookThum, "bookGenre" : bookGenre, "bookNumber" : bookNumber, "bookRent" : bookRent, "bookReservation" : bookReservation
           },
           method:"POST",
           success:function(data) {
              location.reload();
              window.close();
           }
        });
        }
     }
</script>