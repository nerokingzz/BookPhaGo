<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<h3>책 제목을 검색해주세요.</h3>
    <input id="bookName" type="text">
    <button onclick="search(1);">검색</button>

<div id="here"></div>
<div id="paging"></div>

</body>
</html>

<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>	

<script type="text/javascript">
function search(paging) {
	
	var keepPage = paging
    	
        $.ajax({
            method: "GET",
            url: "https://dapi.kakao.com/v3/search/book", // 전송 주소
            data: { query: $("#bookName").val(), size : "50", page : keepPage}, // 보낼 데이터
            headers: { Authorization: "KakaoAK 222c29a40d67ba4231d0c20e13ee5f72" }
        })
            .done(function (msg) { // 응답이 오면 처리를 하는 코드
            	console.log(msg);
            	console.log(msg.meta.total_count);
          		console.log(msg.documents.length);
          		
          		var totalData = msg.meta.pageable_count; // 검색결과 제공가능한 문서수 총  //데이터 수
          		var is_end = msg.meta.is_end; // 현재 페이자가 마지막페에지인지 여부
           		var total_count = msg.meta.total_count; //전체 검색된 문서수      
          		var dataPerPage = msg.documents.length; // 한 페이지 길이 // 한 페이지에 나타낼 데이터 수
          		var pageCount = 5; // 한 화면에 나타낼 페이지수
          		
          		
 // --------------------------도서 검색 페이징         		
          		function paging(totalData, dataPerPage, pageCount, currentPage) {
          			console.log("currentPage : " + currentPage);
          			
          			var totalPage = Math.ceil(totalData / dataPerPage); 
          			var pageGroup = Math.ceil(currentPage / pageCount); 
          			
          			console.log("pageGroup : " + pageGroup);
          			
          			var last = pageGroup * pageCount; // 화면에 보여질 마지막 페이지 번호
          			if(last > totalPage) last = totalPage;
          			var first = last - (pageCount-1); //화면에 보여질 첫번째 페이지 번호
          			if(first<0) first=1;
          			var next = last+1;
          			var prev = first-1;
          			
          			console.log("last : " + last);
          	        console.log("first : " + first);
          	        console.log("next : " + next);
          	        console.log("prev : " + prev);
          			
          	        var $pingingView = $("#paging");
          	        
          	        var html = "";
          	        
          	        if(prev > 0)
          	        	html += "<a href='#' id='prev'><</a>";
          	        	
          	       	for(var i=first; i<=last; i++) {
          	       		html += "<a href='#' class='load-list' id=" + i + ">" + i + "</a>";
          	       	}
          	       	
          	       	if(last <totalPage) 
          	       		html += "<a href='#' id='next'>></a>";
          	       	
          	      $("#paging").html(html);    // 페이지 목록 생성
                  $("#paging a").css("color", "black");
                  $("#paging a#" + currentPage).css({"text-decoration":"none", 
                                                     "color":"red", 
                                                     "font-weight":"bold"});    // 현재 페이지 표시
                                                     
                  $("#paging a").click(function(){
                      
                      var $item = $(this);
                      var $id = $item.attr("id");
                      var selectedPage = $item.text();
                      
                      if($id == "next")    selectedPage = next;
                      if($id == "prev")    selectedPage = prev;
                      
                      paging(totalData, dataPerPage, pageCount, selectedPage);
                  });
          		}
          		
          		
          			$("document").ready(function(){        
              	        paging(totalData, dataPerPage, pageCount, 1);
              	    });
          		
          			var select;
          			$(document).on('click', '.load-list', function(){
          				select = $(this).attr('id');     			
              			search1(select);
              		});
          		
          		
          		
// ---------------------------도서 검색 목록          		
            	 var str = "";
            	document.getElementById("here").innerHTML = str;
            	
            	
 				str += "<table>";
            	 for(var i=0;i<dataPerPage;i++){
            		 var title = msg.documents[i].title; // 제목
            		 var isbn = msg.documents[i].isbn;
            		 if(isbn.length > 20) {
            			 isbn = isbn.substring(11,24); // isbn
            		 }else {
            			isbn = msg.documents[i].isbn;
            		 }
            		 var writer = msg.documents[i].authors;
            		 var pub = msg.documents[i].publisher;
            		 var thumbnail ="<img src='" + msg.documents[i].thumbnail + "'>"; // 이미지
            		 str += "<tr>";
            		for(var j=0; j<1; j++){
            			str += "<td style='border:1px solid;'>" + thumbnail + "</td>";
            			str += "<td style='border:1px solid;'>" + title + "</td>";
            			str += "<td style='border:1px solid;'>" + writer + "</td>";
            			str += "<td style='border:1px solid;'>" + pub + "</td>";
            			str += "<td style='border:1px solid;'>" + isbn + "</td>";
            			str += "<td style='border:1px solid;' class='select_input' id=" + i + ">" + "<input type='button' value='선택하기'>" + "</td>";
            		}
            		str += "</tr>";
            	} 
            	str += "</table>";
            	document.getElementById("here").innerHTML = str; 
            	
            	$(document).on('click', '.select_input', function(){
           			var val = $(this).attr('id');
           			var keepPage = select;
           			search2(keepPage , val);
           		});
            });
}

function search1(paging) {
	var keepPage = paging
	
    $.ajax({
        method: "GET",
        url: "https://dapi.kakao.com/v3/search/book", // 전송 주소
        data: { query: $("#bookName").val(), size : "50", page : keepPage}, // 보낼 데이터
        headers: { Authorization: "KakaoAK 222c29a40d67ba4231d0c20e13ee5f72" }
    })
        .done(function (msg) { // 응답이 오면 처리를 하는 코드
        	console.log(msg);
        	console.log(msg.meta.total_count);
      		console.log(msg.documents.length);
      		
      		var totalData = msg.meta.pageable_count; // 검색결과 제공가능한 문서수 총  //데이터 수
      		var is_end = msg.meta.is_end; // 현재 페이자가 마지막페에지인지 여부
       		var total_count = msg.meta.total_count; //전체 검색된 문서수      
      		var dataPerPage = msg.documents.length; // 한 페이지 길이 // 한 페이지에 나타낼 데이터 수
      		var pageCount = 10; // 한 화면에 나타낼 페이지수
      		 
      		
      		var str = "";
         	document.getElementById("here").innerHTML = str;
         	
         	
				str += "<table>";
				for(var i=0;i<dataPerPage;i++){
           		 var title = msg.documents[i].title; // 제목
           		 var isbn = msg.documents[i].isbn;
           		 if(isbn.length > 20) {
           			 isbn = isbn.substring(11,24); // isbn
           		 }else {
           			isbn = msg.documents[i].isbn;
           		 }
           		 var writer = msg.documents[i].authors;
           		 var pub = msg.documents[i].publisher;
           		 var thumbnail ="<img src='" + msg.documents[i].thumbnail + "'>"; // 이미지
           		 str += "<tr>";
           		for(var j=0; j<1; j++){
           			str += "<td style='border:1px solid;'>" + thumbnail + "</td>";
           			str += "<td style='border:1px solid;'>" + title + "</td>";
           			str += "<td style='border:1px solid;'>" + writer + "</td>";
           			str += "<td style='border:1px solid;'>" + pub + "</td>";
           			str += "<td style='border:1px solid;'>" + isbn + "</td>";
           			str += "<td style='border:1px solid;' class='select_input' id=" + i + ">" + "<input type='button' value='선택하기'>" + "</td>";
           		}
         		str += "</tr>";
         	} 
         	str += "</table>";
         	document.getElementById("here").innerHTML = str; 
         	
       
         	
         });
}

function search2(keepPage, val) {
	var paging = keepPage
	var i = val;
    $.ajax({
        method: "GET",
        url: "https://dapi.kakao.com/v3/search/book", // 전송 주소
        data: { query: $("#bookName").val(), size : "50", page : paging}, // 보낼 데이터
        headers: { Authorization: "KakaoAK 222c29a40d67ba4231d0c20e13ee5f72" }
    })
        .done(function (msg) { // 응답이 오면 처리를 하는 코드
        	var isbn = msg.documents[i].isbn;
        	 if(isbn.length > 20) {
       			 isbn = isbn.substring(11,24); // isbn
       		 }else {
       			isbn = msg.documents[i].isbn;
       		 }
        	var title = msg.documents[i].title;
        	var contents = msg.documents[i].contents;
        	var authors = msg.documents[i].authors;
        	var translators = msg.documents[i].translators;
        	var publisher = msg.documents[i].publisher;
        	var datetime = msg.documents[i].datetime;
        	var date = datetime.substring(0,10);
        	var thumbnail = "<img src='" + msg.documents[i].thumbnail + "'>";
        	
        	//search3(isbn, title , contents, authors, translators, publisher, date, thumbnail);
        	
        	window.opener.document.getElementById("isbn").value = isbn;
        	window.opener.document.getElementById("bookName").value = title;
        	window.opener.document.getElementById("bookContents").value = contents;
        	window.opener.document.getElementById("bookWriter").value = authors;
        	window.opener.document.getElementById("bookTrans").value = translators;
        	window.opener.document.getElementById("bookPublisher").value = publisher;
        	window.opener.document.getElementById("bookDate").value = date;
        	window.opener.document.getElementById("bookThum").value = thumbnail;
         	
        	window.close(); 
         });
}

/* function search3(isbn, title , contents, authors, translators, publisher, date, thumbnail){
	alert(authors);
	$.ajax({
		url:"bookinsertckeck.do",
		data:{"authors":authors,"isbn":isbn},
		method:"POST",
		success:function(data) {
			//alert(data);
			//location.href="admin_main.do?page=com_A";
			//location.reload();
		}
	});
} */
</script>