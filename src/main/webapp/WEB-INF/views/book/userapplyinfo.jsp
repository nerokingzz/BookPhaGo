<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<p align="center"><h3>도서 신청 시스템</h3>

<form method="post" name="form">
    <input type="submit" value="신청안내" onclick="javascript: form.action='userapplyinfo';"/>
    <input type="submit" value="도서신청" onclick="javascript: form.action='userapply';"/>
</form><br>
○ <input  style = "text-align:center;" type="text" value="희망도서 신청안내" disabled><br><br>
＊신청대상 : 회원가입한 모든 사용자<br><br>

* 신청방법  :  희망하시는 도서가 소장된 자료인지 확인하시고 도서가 없는 경우 홈페이지내 희망도서 신청화면에서 도서정보를 정확하게 기재해주시기 바랍니다.<br><br>

* 신청권수  :  1인 월 2권<br><br>

* 소요기간 :  1~2개월 소요  <br><br>

○ <input  style = "text-align:center;" type="text" value="희망도서 신청결과 확인" disabled> <br><br>
* 홈페이지 내 <마이 라이브러리 -> 현황조회 ->  도서 신청 현황> 에서 확인 가능합니다. <br><br>

* 각 진행상태는 아래와 같습니다. <br><br>
 - 신청중  : 담당자가 검토중인 상태 <br><br>
 - 처리중  : 구입하여 정리하고 있는 상태 <br><br>
 - 취소됨 : 구입에서 제외된 상태(사유) <br><br>
 
 ○ <input  style = "text-align:center;" type="text" value="희망도서 선정 제외 기준" disabled> <br><br>
* 도서관내 이미 소장중이거나 중복신청도서<br><br>

* 고가의 도서 <br><br>

* 선정적인 도서 <br><br>

* 문제집 혹은 수험서 또는 만화도서 <br><br>

* 품절이거나 절판된 도서 <br><br>
</body>
</html>