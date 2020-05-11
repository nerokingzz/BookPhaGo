<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.seo {
	float: left;
    width: 100%;
    padding-top: 30px;
    padding-right: 75px;
    padding-left: 60px;
    padding-bottom: 30px;
    font-size:14px;
    font-family: "inherit";
}

div.col-md-12 input {
	width:100%;
	height: 40px;
	padding-top: 0px;
    padding-right: 15px;
    padding-bottom: 0px;
    padding-left: 40px;
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
    border-radius: 15px;
}

.seo_button { 
	color: #ffffff; 
	font-size: 16px;
	background-color: #e44d3a;
	border: 0;
    border-top-color: initial;
    border-top-style: initial;
    border-top-width: 0px;
    border-right-color: initial;
    border-right-style: initial;
    border-right-width: 0px;
    border-bottom-color: initial;
    border-bottom-style: initial;
    border-bottom-width: 0px;
    border-left-color: initial;
    border-left-style: initial;
    border-left-width: 0px;
    border-image-source: initial;
    border-image-slice: initial;
    border-image-width: initial;
    border-image-outset: initial;
    border-image-repeat: initial;
    margin-top: 30px;
    border-radius: 15px;
}

</style>
</head>
<body>
&nbsp&nbsp
<div class="seo">
	<div class="row">
		<form action="admin_main.do" method="post" name="myform">
		<input type="hidden" name="page" value="rent_A">
				<div class="col-md-12 col-sm-12"><br>
					 <h5>사용자 ID</h5><br>
					 <input style="width:80%;" type="text" name="userid" id="userid" > <input style="width:19%; padding-left: 0px; padding-right: 0px; background-color:#e44d3a;font-weight: bold; color: #ffffff;" type="button" value="조회" onclick="searchUserId();"><br>
					 <p id="first"></p>
				</div>
				<div class="col-md-12 col-sm-12"><br>
					 <h5>도서번호</h5><br>
					 <input style="width:80%;" type="text" name="bookNumber1" id="bookNumber1" class="bookNumber1"> <input style="width:19%; padding-left: 0px; padding-right:0px; background-color:#e44d3a;font-weight: bold; color: #ffffff;" type="button" value="검색" onclick="searchbNumber();"><br>
					 <p id="second"></p>
				</div>
				<div class="col-md-12 col-sm-12"><br>
					 <h5>도서명</h5><br>
					 <input type="text" name="bookName1" id="bookName1" readonly><br>
				</div>
				<div class="col-md-12 col-sm-12"><br>
					 <h5>저자</h5><br>
					 <input type="text" name="bookWriter1" id="bookWriter1" readonly><br>
				</div>
				<div class="col-md-12 col-sm-12"><br>
					 <h5>출판사</h5><br>
					 <input type="text" name="bookPublisher1" id="bookPublisher1" readonly><br>
				</div>
				<div class="col-md-12 col-sm-12"><br>
				<input class="seo_button" id="seo_button" style="width:118.56px; padding-left: 0px; padding-right:0px;" type="button" value="대출하기" onclick="go();" disabled>	
				</div>	                                
		</form>			                               
		</div>	
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
					$("#first").empty();
			        $('#first').append('대출가능횟수 : 2');
			        
			        $("#seo_button") .prop('disabled', false);
			  
			}else if (aa==1){
					$("#first").empty();
					$('#first').append('대출가능횟수 : 1');
			        
			        $("#seo_button") .prop('disabled', false);
			   
			}else{
				$("#first").empty();
				$('#first').append('대출가능횟수 : 0');
				
				$("#seo_button") .prop('disabled', true);
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
			
			if(info.booklist.length != 0) {
			var aa = info.booklist[0].ISBN;
			var bb = info.booklist[0].BOOKNAME;
			var cc = info.booklist[0].BOOKWRITER;
			var dd = info.booklist[0].BOOKDATE;
			var ee = info.booklist[0].BOOKPUBLISHER;
			var ff = info.booklist[0].BOOKRENT;
				if(ff == "대출가능") {
					$("#second").empty();
					$('#second').append("대출가능한 도서입니다.");
					$('#bookName1').val(bb);
					$('#bookWriter1').val(cc);
					$('#bookPublisher1').val(bb);
				}else {
					$("#second").empty();
					$('#second').append("대출불가능한 도서입니다.");
					$('#bookName1').val("");
					$('#bookWriter1').val("");
					$('#bookPublisher1').val("");
				}
			}else {
				$("#second").empty();
				$('#second').append("없는 도서입니다.");
				$('#bookName1').val("");
				$('#bookWriter1').val("");
				$('#bookPublisher1').val("");
			}
			

						
			
		},error:function(request,status,error){
			console.log("22222222222222");
		}
	}); 
}

function go() {
	 if($("#bookName1").val()==""){
         alert("도서번호를 검색하세요.");
         $("#bookName1").focus();
         return false;
      }else {
    	  if (confirm("대출 하시겠습니까??") == true){    //확인
    		  document.myform.submit();
      	    return true;
      	}else{   //취소
      	    return false;
      	}
      }
	}

</script>