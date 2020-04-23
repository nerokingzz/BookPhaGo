<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
	margin-top: 1px;
	margin-bottom: 2px;
	border : 0;
	background-color : #e5e5e5;
	color: #e5e5e5;
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
	z-index:10;
}

.wrap-loading div { /*로딩 이미지*/
	position: fixed;
	top: 50%;
	left: 50%;
	margin-left: -21px;
	margin-top: -21px;
	z-index:10;
}



.wrap-loading1 { /*화면 전체를 어둡게 합니다.*/
	width : 100%;
	background: rgba(0, 0, 0, 0.2); /*not in ie */
	filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000',
		endColorstr='#20000000');
}

.wrap-loading1 div { /*로딩 이미지*/
	width : 100%;
}

.display-none1 { /*감추기*/
	display: none;
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

div.trends_row{
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

div.trends_row span{
	position : absolute;
	background-color : #E44D3A;
	top: -8px;
    left: -8px;
    width: 18px;
    border-radius: 18px;
    font-size: 13px;
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
	font-size : 13px;
}

div.trends_value {
	padding: 3px 3px 3px 3px;
	/*
		flex: 0 0 4rem; */
	line-height: 1rem;
	font-size: 13px;
	font-color: #5D5D5D;
}
.company_profile_info {
/*
	border-top: 1px solid #e4e4e4;
	
	*/
	
	border : 0;
	background: transparent;
}


.companies-info {
    padding: 10px 0 ;
    background: transparent;
}

.company-up-info {
    border : 0 !important;
    background: transparent;
}

hr.stat{
	width: 60%;
	margin : auto;
}
</style>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>



<body>
<div id = "wholeSection">
	<div class = "buttonSection helpforum">
		<a href="#">로그 다운로드</a>
		<div class="wrap-loading display-none">
				<div>
					<img src="${contextPath}/resources/chat/loader.gif" />
				</div>
			</div>
	</div>
	<div id = "statisticSection">
		<section class="companies-info">
			<div class="container">
				<div class="companies-list">
					<div class="row">
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="company_profile_info">
								<div class="company-up-info">
									<h4>누적 이용자 수</h4>
									<hr class = "stat">
									<h1 id = "totalID"></h1>
								</div>
							</div><!--company_profile_info end-->
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="company_profile_info">
								<div class="company-up-info">
									<h4>금일 이용자 수</h4>
									<hr class = "stat">
									<h1 id = "todayID"></h1>
								</div>
							</div><!--company_profile_info end-->
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="company_profile_info">
								<div class="company-up-info">
									<h4>총 대화 수</h4>
									<hr class = "stat">
									<h1 id="totalLog"></h1>
								</div>
							</div><!--company_profile_info end-->
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="company_profile_info">
								<div class="company-up-info">
									<h4>챗봇 이용률</h4>
									<hr class = "stat">
									<h1>37.4%</h1>
								</div>
							</div><!--company_profile_info end-->
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<div id="rankSection">
		<div id="resultDiv">
		</div>
	</div>
</div>
<script src = "resources/chat/js/log.js" ></script>
</body>
</html>