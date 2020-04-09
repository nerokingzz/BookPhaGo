<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
    <%@ include file="watson.jsp" %>   
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
   request.setCharacterEncoding( "utf-8" );
%>

<h1>Page 1</h1>
<!--
 <table border='1' width='800' align='center'>
   <tr align='center' bgcolor='#FFFF66'> 
     <td>아이디</td>
     <td>대여 권수</td>
</tr>
     <tr align=center>
       <td>${searchMember.mem_id}</td>
       <td>${searchMember.mem_bookcount}</td>
     </tr> 
</table>

  -->
</body>
</html>