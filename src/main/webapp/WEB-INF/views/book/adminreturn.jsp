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
<div class="seo">
<div class="row">
<form action="admin_main.do" method="post" name="myform1">
		<input type="hidden" name="page" value="return_A"> 
		<input type="hidden" name="bookReservationn"> 
		<div class="col-md-12 col-sm-12"><br>
				 <h5>사용자 ID</h5><br>
				 <input style="width:80%;" type="text" name="userid2" id="userid2" > <input style="width:19%; padding-left: 0px; padding-right: 0px; background-color:#e44d3a;font-weight: bold; color: #ffffff;" type="button" value="조회" onclick="searchUserId1();"><br>
				 <p id="first1"></p>
			</div>
			<div class="col-md-12 col-sm-12"><br>
				 <h5>도서번호</h5><br>
				 <input style="width:80%;" type="text" name="bookNumber2" id="bookNumber2" class="bookNumber2"> <input style="width:19%; padding-left: 0px; padding-right:0px; background-color:#e44d3a;font-weight: bold; color: #ffffff;" type="button" value="검색" onclick="searchbNumber1();"><br>
				 <p id="second1"></p>
			</div>
			<div class="col-md-12 col-sm-12"><br>
				 <h5>도서명</h5><br>
				 <input type="text" name="bookName2" id="bookName2" readonly><br>
			</div>
			<div class="col-md-12 col-sm-12"><br>
				 <h5>저자</h5><br>
				 <input type="text" name="bookWriter2" id="bookWriter2" readonly><br>
			</div>
			<div class="col-md-12 col-sm-12"><br>
				 <h5>출판사</h5><br>
				 <input type="text" name="bookPublisher2" id="bookPublisher2" readonly><br>
			</div>
			<div class="col-md-12 col-sm-12"><br>
				 <h5>반납날짜</h5><br>
				 <input type="text" name="RreturnDate" id="today" readonly><br>
			</div>
			<div class="col-md-12 col-sm-12"><br>
			<input class="seo_button" id="seo_buttom_sec" style="width:118.56px; padding-left: 0px; padding-right:0px;" type="button" value="반납하기" onclick="gone();" disabled>	
			</div>	     
</form>
</div>
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
				 	$("#first1").empty();
			        $('#first1').append('반납할 도서 : 0');
			        
			        $("#seo_buttom_sec") .prop('disabled', true);
			  
			}else if (borrowcnt==1){
				$("#first1").empty();
		        $('#first1').append('반납할 도서 : 1');
			        
			        $("#seo_buttom_sec") .prop('disabled', false);
			   
			}else{
				$("#first1").empty();
		        $('#first1').append('반납할 도서 : 2');
				$("#seo_buttom_sec") .prop('disabled', false);
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
			if(info.booklist.length != 0) {
				var isbn = info.booklist[0].ISBN;
				var bookName = info.booklist[0].BOOKNAME;
				var bookWriter = info.booklist[0].BOOKWRITER;
				var bookDate = info.booklist[0].BOOKDATE;
				var bookPublisher = info.booklist[0].BOOKPUBLISHER;
				var bookRent = info.booklist[0].BOOKRENT;
				var bookReservatin = info.booklist[0].BOOKRESERVATION;
				
				if(bookRent == "대출불가" || bookRent == "연체중") {
					$('#bookName2').val(bookName);
					$('#bookWriter2').val(bookWriter);
					$('#bookPublisher2').val(bookPublisher);
					$("input[type=hidden][name=bookReservationn]").val(bookReservatin);
					$("#second1").empty();
					$('#second1').append("사용자께서 빌린 도서입니다.");
				}else {
					$('#bookName2').val("");
					$('#bookWriter2').val("");
					$('#bookPublisher2').val("");
					$("input[type=hidden][name=bookReservationn]").val("");
					$("#second1").empty();
					$('#second1').append("사용자께서 빌리지 않은 도서입니다.");
				}
			}else {
				$('#bookName2').val("");
						$('#bookWriter2').val("");
						$('#bookPublisher2').val("");
						$("input[type=hidden][name=bookReservationn]").val("");
						$("#second1").empty();
						$('#second1').append("사용자께서 빌리지 않은 도서입니다.");
			}
			
			
			
			
			
		},error:function(request,status,error){
			console.log("22222222222222");
		}
	}); 
}


function gone() {
	 if($("#bookName2").val()==""){
        alert("도서번호를 검색하세요.");
        $("#bookNumber2").focus();
        return false;
     }else {
   	  if (confirm("반납 하시겠습니까??") == true){    //확인
   		  document.myform1.submit();
     	    return true;
     	}else{   //취소
     	    return false;
     	}
     }
	}
</script>