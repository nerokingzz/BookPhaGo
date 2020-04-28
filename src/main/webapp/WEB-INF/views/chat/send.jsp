<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
	<h1>Page 2</h1>
	From: <input type="text" id="datepicker">
    To: <input type="text" id="datepicker2">
    <br> <button id="dateSub">날짜 입력</button>
 
    <script>
        $(function() {
            //모든 datepicker에 대한 공통 옵션 설정
            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시                    
                ,yearSuffix: "." //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['01','02','03','04','05','06','07','08','09','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['01','02','03','04','05','06','07','08','09','10','11','12'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일','월','화','수','목','금','토'] //달력의 요일 부분 Tooltip 텍스트     
                ,maxDate: "today" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후) 
            });
            
            $('#datepicker').datepicker();
            $('#datepicker2').datepicker();
            //From의 초기값을 오늘 날짜로 설정
            $('#datepicker').datepicker('setDate', '-7D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
            //To의 초기값을 내일로 설정
            $('#datepicker2').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
            
            
            $('#dateSub').on('click',function(){
            	var startDate = $('#datepicker').val();
            	var endDate = $('#datepicker2').val();
            	
            	//startDate가 endDate보다 클 때 (비정상적인 날짜 period)
            	if(startDate > endDate){
            		alert("올바르지 않은 기간입니다."); 
            	}else{
                	$.ajax({
                		url: '/showMeDate.do',
            			async:false,
            			data : {"startDate" : startDate,
            					"endDate" : endDate}, 
            			type : 'get',
            			success : function(result){
            				
            				console.log(result);
           			
            			},
            			error : function(result, status, error){
            				container.append("error alert!");
            			}
                		
                	})
                	
            	}
            })

        });
      </script>
</body>
</html>