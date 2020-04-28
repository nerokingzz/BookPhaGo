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
<input type="text" style="background-color:transparent;border:0 solid black;text-align:right;" id="test"> 

<form action="admin_main.do" method="post">
<input type="hidden" name="page" value="rent_A">
		<div class="col-md-12 col-sm-12"><br>
			 <h6>userid : <input type="text" name="userid" id="userid" > <input type="button" value="검색" onclick="searchUserId();"></h6><br>
		</div>
		<div class="col-md-12 col-sm-12"><br>
			 <h6>도서번호 : <input type="text" name="bookNumber1" id="bookNumber1" class="bookNumber1"> <input type="button" value="검색" onclick="searchbNumber();"></h6><br>
		</div>
		<div class="col-md-12 col-sm-12"><br>
			 <h6>도서명 : <input type="text" name="bookName1" id="bookName1" > </h6><br>
		</div>
		<div class="col-md-12 col-sm-12"><br>
			 <h6>저자 : <input type="text" name="bookWriter1" id="bookWriter1" > </h6><br>
		</div>
		<div class="col-md-12 col-sm-12"><br>
			 <h6>출판사 : <input type="text" name="bookPublisher1" id="bookPublisher1" > </h6><br>
		</div>
		<div class="col-md-12 col-sm-12"><br>
			 <h6>발행일 : <input type="text" name="bookDate1" id="bookDate1" > </h6><br>
		</div>
		<div class="col-md-12 col-sm-12"><br>
			 <h6>isbn : <input type="text" name="isbn1" id="isbn1" > </h6><br>
		</div>
		<div class="col-md-12 col-sm-12"><br>
		<button type="submit" onclick="return check()" disabled>대출하기</button>		
		</div>	                                
</form>			                               
		</div>		                     
</body>
</html>

<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script type="text/javascript">

function searchUserId() {
	var a = {"userid" : $('input[name=userid]').val()};
	
	$.ajax({
		url:"c.do",
		data:JSON.stringify(a),
		method:"POST",
		contentType: "application/json",
		success:function(data) {
			
			console.log("1111111111111111");
			
			var aa = data.borrowcnt;

			
			console.log(aa);
			if(aa==0){
				
			        $('#test').val('대출가능횟수 : 2');
			        
			        $("button") .prop('disabled', false);
			  
			}else if (aa==1){
				
			        $('#test').val('대출가능횟수 : 1');
			        
			        $("button") .prop('disabled', false);
			   
			}else{
				 $('#test').val('대출가능횟수 : 0');
				
				$("button") .prop('disabled', true);
			}
			
			
		},error:function(request,status,error){
			console.log("22222222222222");
		}
	});
	
}

function searchbNumber() {
	var b = {"bookNumber" : $('input[name=bookNumber1]').val()};
	
	 $.ajax({
		url:"d.do",
		data:JSON.stringify(b),
		method:"POST",
		contentType: "application/json",
		success:function(data) {
			
			var info = data;
			console.log(info);
			
			var aa = info.booklist[0].ISBN;
			var bb = info.booklist[0].BOOKNAME;
			var cc = info.booklist[0].BOOKWRITER;
			var dd = info.booklist[0].BOOKDATE;
			var ee = info.booklist[0].BOOKPUBLISHER;
			var ff = info.booklist[0].BOOKRENT;
			
			if(ff == "대출가능") {
				$('#bookName1').val(bb);
				$('#bookWriter1').val(cc);
				$('#bookPublisher1').val(bb);
				$('#bookDate1').val(dd);
				$('#isbn1').val(aa);
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