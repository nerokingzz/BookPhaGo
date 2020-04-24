<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>   
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<style>
h5 {
	margin-top: 1em;
	font-weight: bold;
}

h1{
	font-weight : bold;
	font-size : 2.5em;
}

.company-up-info h4{
	font-size : 13px;
	margin-bottom : 8px;
}

hr {
	margin-top: 0;
	margin-bottom: 2px;
	border : 0;
	border-top : 0 !important;
	height : 1px;
	background-color : #E44D3A;
	color: #E44D3A;
	display : visible;
}

.wrap-loading { /*화면 전체를 어둡게 합니다.*/
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	background: rgba(0, 0, 0, 0.2); /*not in ie */
	filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000',
		endColorstr='#20000000');
}

.wrap-loading div { /*로딩 이미지*/
	position: fixed;
	top: 50%;
	left: 50%;
	margin-left: -21px;
	margin-top: -21px;
}

.display-none { /*감추기*/
	display: none;
}

div#wholeSection{
	min-height: 400px;
}

div.buttonSection{
	box-shadow : none;
	padding : 15px 15px 0;
	text-align : right;
}

}
div#rankSection {
	margin: 1.5em 0 1.5em 0;
	display: block;
}

div#resultDiv {
	margin: 0.2em 0 0.2em 0;
	display: flex;
	flex-wrap: wrap;
	width: 100%;
}

div.trends_panel {
	padding: 0 1rem;
	min-width: 300px;
	flex-grow: 1;
	margin: 0.5em 0 1.25rem;
}

div.trends_row {
	padding: 13px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.11), 0 2px 2px rgba(0, 0, 0, 0.11),
		0 4px 4px rgba(0, 0, 0, 0.11), 0 6px 8px rgba(0, 0, 0, 0.11), 0 8px
		16px rgba(0, 0, 0, 0.11);
	border-radius: 8px;
	background-color: white;
	margin: 5px;
	line-height: 1.5;
	display: flex;
	position : relative;
}

span{
	position : absolute;
	background-color : #E44D3A;
	top: -8px;
    left: -8px;
    width: 30px;
    border-radius: 13px;
    font-size: 12px;
    text-align: center;
    color: white;
    
}

div.trends_label {
	flex: 1;
	min-width: 0;
	overflow-x: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	font-weight: bold;
}

div.trends_value {
	padding: 3px 3px 3px 3px;
	/*
		flex: 0 0 4rem; */
	line-height: 1rem;
	font-size: 13px;
	font-color: #5D5D5D;
}

</style>
</head>
<body>
<h1>Page 2</h1>
<br>
	<img src = "resources/chat/small_loader.gif">
</body>
</html>