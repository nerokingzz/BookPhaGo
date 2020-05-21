<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
				<div class="col-md-12 col-sm-12" style="padding-right: 165px; padding-left: 135px;">
					 <h5>사용자 ID</h5><br>
					 <input type="text" name="userid" id="userid" placeholder="아이디를 입력하세요" list="huge_list"><datalist id="huge_list"></datalist> <!-- <input style="width:19%; padding-left: 0px; padding-right: 0px; background-color:#e44d3a;font-weight: bold; color: #ffffff;" type="button" value="조회" onclick="searchUserId();"> --><br>
					 <p id="first"></p>
				</div>
				<div class="col-md-12 col-sm-12" style="padding-right: 165px; padding-left: 135px;"><br>
					 <h5>도서번호</h5><br>
					 <input type="text" name="bookNumber1" id="bookNumber1" class="bookNumber1" placeholder="도서번호를 입력하세요" list="booknumber_list"><datalist id="booknumber_list"></datalist> <!-- <input style="width:19%; padding-left: 0px; padding-right:0px; background-color:#e44d3a;font-weight: bold; color: #ffffff;" type="button" value="검색" onclick="searchbNumber();"> --><br>
					 <p id="second"></p>
				</div>
				<div class="col-md-12 col-sm-12" style="padding-right: 165px; padding-left: 135px;"><br>
					 <h5>도서명</h5><br>
					 <input type="text" name="bookName1" id="bookName1" readonly><br>
				</div>
				<div class="col-md-12 col-sm-12" style="padding-right: 165px; padding-left: 135px;"><br>
					 <h5>저자</h5><br>
					 <input type="text" name="bookWriter1" id="bookWriter1" readonly><br>
				</div>
				<div class="col-md-12 col-sm-12" style="padding-right: 165px; padding-left: 135px;"><br>
					 <h5>출판사</h5><br>
					 <input type="text" name="bookPublisher1" id="bookPublisher1" readonly><br>
				</div>
				<div class="col-md-12 col-sm-12" style="padding-right: 165px; padding-left: 135px;"><br>
				<input class="seo_button" id="seo_button" style="width:118.56px; padding-left: 0px; padding-right:0px;" type="button" value="대출하기" onclick="go();" disabled>	
				</div>	                                
		</form>			                               
		</div>	
</div>	                  

<!-- <h2>자동완성기능</h2>
<input id="us_email" type="text" />
<p id="a"></p> -->
<!-- <div class="wrapper">
  <input type="text" id="us_email" list="huge_list">
 	<datalist id="huge_list">
    </datalist>
</div>
</body>
</html> -->
<!-- <div class="wrapper">
  <input type="text" id="demo">
  <div id="target">
    <ul></ul>
  </div>
</div>
</body>
</html> -->

<script type="text/javascript">


$("#userid").keyup(function() {
    
    var us_email=$("#userid").val();
    
    $.ajax ({
        url:"auto.do",
        type:"POST",
        data:{us_email : us_email},
        success:function(data) {
        	var info = data;
        	console.log(data);
        	var br = data.borrowcnt;
        	console.log(br);
        	var dataList = $("#huge_list");
			dataList.empty();
        	if(info.booklist.length != 0) {
        		for(var i=0; i<info.booklist.length; i++) {
        			var opt = $("<option></option>").attr("value", info.booklist[i].USERID);
    				dataList.append(opt);
        		}
        	}
        	if(br == 1 || br == 2 || br== 0){
        		if(br==0){
					$("#first").empty();
			        $('#first').append('대출가능횟수 : 2');
			        
			        $("#seo_button") .prop('disabled', false);
			  
			}else if (br==1){
					$("#first").empty();
					$('#first').append('대출가능횟수 : 1');
			        
			        $("#seo_button") .prop('disabled', false);
			   
			}else if (br==2){
				$("#first").empty();
				$('#first').append('대출가능횟수 : 0');
				
				$("#seo_button") .prop('disabled', true);
			}}
        	else {
				$("#first").empty();
				$("#seo_button") .prop('disabled', true);	
        	}
        },
      }); 
 });
 
$("#bookNumber1").keyup(function() {
    
    var us_email=$("#bookNumber1").val();
    
    $.ajax ({
        url:"autobooknumber.do",
        type:"POST",
        data:{us_email : us_email},
        success:function(data) {
        	var info = data;
        	console.log(data);
        	var data = data;
        	
        	var dataList = $("#booknumber_list");
			dataList.empty();
        	if(info.booklist.length != 0) {
        		for(var i=0; i<info.booklist.length; i++) {
        			var opt = $("<option></option>").attr("value", info.booklist[i].BOOKNUMBER);
    				dataList.append(opt);
        		}
        	}
        	if(data.booklist.length == 1) {
        		var aa = data.booklist[0].ISBN;
    			var bb = data.booklist[0].BOOKNAME;
    			var cc = data.booklist[0].BOOKWRITER;
    			var dd = data.booklist[0].BOOKDATE;
    			var ee = data.booklist[0].BOOKPUBLISHER;
    			var ff = data.booklist[0].BOOKRENT;
    			
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
        	
        },
      }); 
 });

/* function searchUserId() {
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
	
} */

/* function searchbNumber() {
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
} */

function go() {
	 if($("#bookName1").val()==""){
         swal("도서번호를 검색하세요.");
         $("#bookName1").focus();
         return false;
      }else {
    	  if (confirm("대출 하시겠습니까??") == true){    //확인
    		  document.myform.submit();
    	  swal("대출이 완료되었습니다");
      	    return true;
      	}else{   //취소
      	    return false;
      	}
      }
	}
	
	
	
	
	
	
	
	
	
/* var $input = $("#demo");
var $displayArea = $('#target');
var data = ['멀홀랜드 드라이브', '화양연화', '데어 윌 비 블러드', '센과 치히로의 행방불명', '보이후드', '이터널 선샤인', '트리 오브 라이프', '하나 그리고 둘', '씨민과 나데르의 별거', '인사이드 르윈', '조디악', '칠드런 오브 맨', '액트 오브 킬링', '4개월, 3주... 그리고 2일', '홀리 모터스', '판의 미로', '하얀 리본', '매드 맥스: 분노의 도로', '시네도키, 뉴욕', '그랜드 부다페스트 호텔', '사랑도 통역이 되나요?', '히든', '마스터', '메멘토', '25시', '소셜 네트워크', '그녀에게', '월-E', '올드보이', '마가렛', '타인의 삶', '다크 나이트', '사울의 아들', '와호장룡', '팀북투', '엉클 분미', '시티 오브 갓', '뉴 월드', '브로크백 마운틴', '인사이드 아웃', '아무르', '멜랑콜리아', '노예 12년', '가장 따뜻한 색, 블루', '사랑을 카피하다', '리바이어던', '브루클린', '언어와의 작별', '자객 섭은낭', '인셉션', '열대병', '물랑 루즈', '원스 어폰 어 타임 인 아나톨리아', '이다', '베크마이스터 하모니즈', '제로 다크 서티', '물라데', '폭력의 역사', '징후와 세기', '언더 더 스킨', '바스터즈: 거친 녀석들', '토리노의 말', '더 그레이트 뷰티', '피쉬 탱크', '봄 여름 가을 겨울 그리고 봄', '허트 로커', '로열 테넌바움', '캐롤', '우리가 들려줄 이야기', '타부', '오직 사랑하는 이들만이 살아남는다', '비포 선셋', '스프링 브레이커스', '인히어런트 바이스', '도그빌', '잠수종과 나비', '더 울프 오브 월 스트리트', '올모스트 페이머스', '리턴', '셰임', '시리어스 맨', 'A.I.', '그녀', '예언자}', '파 프롬 헤븐', '아멜리에', '스포트라이트', '머리 없는 여인', '피아니스트', '엘 시크레토: 비밀의 눈동자', '비겁한 로버트 포드의 제시 제임스 암살', '라따뚜이', '렛미인', '문라이즈 킹덤', '니모를 찾아서', '백인의 것', '텐', '이삭줍는 사람들과 나', '레퀴엠 포 어 드림', '카를로스', '토니 에드만','화차'];


// 토글창 숨기기
function pannelToggle($ipt){
  var dataStr = $ipt.val();
  console.log(dataStr.length);
  dataStr.length > 0 ? $displayArea.css('display', 'block') : $displayArea.removeAttr('style');
  return dataStr;
}
pannelToggle($input);

$input.keyup(function () {
  var dataStr = pannelToggle($(this));
  
  var escape, filter = function (text) {
    return text.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, "\\$&")
  }(dataStr);
  
  $('#target').find('li').each(function () {
    ($(this).text()).search(new RegExp(filter, "i")) < 0 ? $(this).addClass("hidden") : $(this).removeClass("hidden")
  })
});



// 이건 리스트 생성 반복문 <li></li> 보통 백엔드에서 처리하지만 여긴 자바스크립트만 사용되므로...
$.each(data, function(i, v){
  var $list = $displayArea.find('ul');
  $list.append('<li>' + v + '</li>');
}); */

</script>