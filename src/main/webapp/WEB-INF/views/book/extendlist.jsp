<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.jd {
   font-size: 20px;
    text-align: center;
}
</style>
</head>
<body style="text-align: center;">

<h6 class="jd">도서 연장</h6>
<br>

   <c:choose>
      <c:when test="${booklistSize gt 0 }">
         <c:forEach var="i" begin="1" end="${booklistSize }">
            <input type="hidden" name="bookNumber" value="${booklist.get(i-1).get('BOOKNUMBER') }">
            <input type="text" style="text-align: center; font-size: 14px;border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; width:100%;" size="20" name="bookNumber" value="${booklist.get(i-1).get('BOOKNAME') }" readonly>를 연장하시겠습니까?
         </c:forEach>
      </c:when>
   
   </c:choose>
   <br><br><br>
   <p align="center"><td><input type="button" onclick="change();" value="확인"> <input type="button" onclick="CloseWindow();" value="닫기"></td></p>

<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>   
   
<script type="text/javascript">
function CloseWindow() {
   window.close();
}

function change() {
   var bookNumber=$("input:hidden[name=bookNumber]").val();
   console.log("111111111");
   console.log(bookNumber);
   $.ajax({
      url:"myLib_main.do?page=status",
      data:{"bookNumber" : bookNumber},
      method:"POST",
      success:function(data) {
         opener.location.href="myLib_main.do?page=status";
         window.close();
      }
   });
   
}
</script>
</body>
</html>