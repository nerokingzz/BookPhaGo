<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
&nbsp&nbsp

<div class="row">
<input type="text" style="background-color:transparent;border:0 solid black;text-align:right;" id="test1">
<form action="admin_main.do" method="post">
		<input type="hidden" name="page" value="return_A"> 
		<input type="hidden" name="bookReservationn"> 
		<div class="col-md-12 col-sm-12"><br>
				 <h6>userid : <input type="text" name="userid2" id="userid2" > <input type="button" value="검색" onclick="searchUserId1();"></h6><br>
			</div>
			<div class="col-md-12 col-sm-12"><br>
				 <h6>도서번호 : <input type="text" name="bookNumber2" id="bookNumber2" class="bookNumber2"> <input type="button" value="검색" onclick="searchbNumber1();"></h6><br>
			</div>
			<div class="col-md-12 col-sm-12"><br>
				 <h6>도서명 : <input type="text" name="bookName2" id="bookName2" > </h6><br>
			</div>
			<div class="col-md-12 col-sm-12"><br>
				 <h6>저자 : <input type="text" name="bookWriter2" id="bookWriter2" > </h6><br>
			</div>
			<div class="col-md-12 col-sm-12"><br>
				 <h6>출판사 : <input type="text" name="bookPublisher2" id="bookPublisher2" > </h6><br>
			</div>
			<div class="col-md-12 col-sm-12"><br>
				 <h6>발행일 : <input type="text" name="bookDate2" id="bookDate2" > </h6><br>
			</div>
			<div class="col-md-12 col-sm-12"><br>
				 <h6>isbn : <input type="text" name="isbn2" id="isbn2" > </h6><br>
			</div>
			<div class="col-md-12 col-sm-12"><br>
				 <h6>반납날짜 : <input type="text" name="RreturnDate" id="today" readonly></td>
			</div>
			<div class="col-md-12 col-sm-12"><br>
			<button type="submit" onclick="return check()" disabled>반납하기</button>		
			</div>	     
</form>
</div>

<script src="resources/book/js/date.js"></script>

</body>
</html>

<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script type="text/javascript">

function searchUserId1() {
	var return_borrowcnt = {"userid" : $('input[name=userid2]').val()};
	
	$.ajax({
		url:"return_borrowcnt.do",
		data:JSON.stringify(return_borrowcnt),
		method:"POST",
		contentType: "application/json",
		success:function(data) {
			
			console.log("1111111111111111");
			
			var borrowcnt = data.borrowcnt;

			
			console.log(borrowcnt);
			
			 if(borrowcnt==0){
				
			        $('#test1').val('반납할 도서 : 0');
			        
			        $("button") .prop('disabled', true);
			  
			}else if (borrowcnt==1){
				
			        $('#test1').val('반납할 도서 : 1');
			        
			        $("button") .prop('disabled', false);
			   
			}else{
				 $('#test1').val('반납할 도서 : 2');
				
				$("button") .prop('disabled', false);
			} 
			
			
		},error:function(request,status,error){
			console.log("22222222222222");
		}
	});
	
}

function searchbNumber1() {
	var bookNumber = $('input[name=bookNumber2]').val();
	var userid = $('input[name=userid2]').val();
	
	var bookNumberanduserid = {"bookNumber" : bookNumber, "userid" : userid}
	
	 $.ajax({
		url:"return_bookNumber.do",
		data:JSON.stringify(bookNumberanduserid),
		method:"POST",
		contentType: "application/json",
		success:function(data) {
			
			console.log(data);
			
			
			var info = data;
			var isbn = info.booklist[0].ISBN;
			var bookName = info.booklist[0].BOOKNAME;
			var bookWriter = info.booklist[0].BOOKWRITER;
			var bookDate = info.booklist[0].BOOKDATE;
			var bookPublisher = info.booklist[0].BOOKPUBLISHER;
			var bookRent = info.booklist[0].BOOKRENT;
			var bookReservatin = info.booklist[0].BOOKRESERVATION;
			
			if(bookRent == "대출불가") {
				$('#bookName2').val(bookName);
				$('#bookWriter2').val(bookWriter);
				$('#bookPublisher2').val(bookPublisher);
				$('#bookDate2').val(bookDate);
				$('#isbn2').val(isbn);
				$("input[type=hidden][name=bookReservationn]").val(bookReservatin);
			} 
			
			
		},error:function(request,status,error){
			console.log("22222222222222");
		}
	}); 
}


function check(){
	if (confirm("대출 하시겠습니까??") == true){    //확인
	    return true;
	}else{   //취소
	    return false;
	}
}
</script>