<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.post-topbar h1{
		font-size: 50px !important;
    	font-weight: bold !important;
    	margin-bottom: 10px !important;
    	margin-top: -5px !important;
    	text-align : center !important;
	}
	
	.post-topbar .topbar_desc{
		font-size: 13px !important;
    	margin-left: 5px !important;
    	text-align : center !important;
	}
	
	.post-topbar {
	    float: left !important;
	    width: 100% !important;
	    padding: 23px 20px !important;
	    background-color: #fff !important;
	    border-top: 4px solid #e44d3a !important;
	    border-left: 0 !important;
	    border-bottom: 1px solid #e4e4e4 !important;
	    border-right: 0 !important;
	    -webkit-box-shadow: 0  !important; 
	    -moz-box-shadow: 0 !important;
	    -ms-box-shadow: 0 !important;
	    -o-box-shadow: 0 !important;
	    box-shadow: 0 !important;
	    margin-bottom: 0px !important;
	    text-align : center !important;
	    }
</style>
</head>
<body>
	<div class="post-topbar">
		<a href="com_act_home.do?community_id=${comInfo.get('COMMUNITY_ID') }"><h1
				style="font-size: 50px">${comInfo.get("COMMUNITY_NAME")}</h1></a>
		<span class = "topbar_desc">${comInfo.get("COMMUNITY_DESCRIPTION") }</span>

	</div>
	<!--post-topbar end-->
</body>
</html>