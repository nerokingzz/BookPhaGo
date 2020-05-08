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
.company-up-info h1 img{
	widwth : 14px !important;
	height : 40px !important;
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
	min-height: 550px;
}

div.buttonSection{
	box-shadow : none;
	padding : 15px 15px 0;
	text-align : right;
	display: inline;
    float: right;
    background-color : transparent;
    margin-top : -20px;
}

div#statisticSection{
	display: block;
    width: 100%;
    min-height: 130px;
    margin: 30px 0 30px 0;
}
	


div#linechartSection{

	display: block;
    width: 100%;
    min-height: 200px;
    margin-bottom: 20px;
}


div#chart_div{
	width: 100%;
    height: auto;
    margin : auto;
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

p#exp{
	font-size: 10px;
    color: #666666;
    display: inline-block;
    margin :5px 0 0 15px;
}

.company_profile_info {
/*
	border-top: 1px solid #e4e4e4;
	
	*/
	
	border : 0;
	background: transparent;
}


.companies-info {
    padding: 0px 0 ;
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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>



<body>
<div id = "wholeSection">
	<p id="exp">서버 사정에 따라 최신 정보가 반영되는 데에 다소 시간이 소요될 수 있습니다.</p>
	<div class = "buttonSection helpforum">
		<a href="#" style="color:white">로그 다운로드</a>
		<div class="wrap-loading display-none">
				<div>
					<img src="${contextPath}/resources/chat/loader.gif" />
				</div>
			</div>
	</div>
	<div id = "statisticSection">
		<div class="companies-info">
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
									<h4>이해하지 못한 요청 수</h4>
									<hr class = "stat">
									<h1 id="failCount"></h1>
								</div>
							</div><!--company_profile_info end-->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="linechartSection">
		<div style = "margin : 0 36px 0 36px">
			<h5>일별 대화 수</h5>
			<br><hr>
		</div>
		<div id = "chart_div">
			
		</div>
	</div>
	<div id="rankSection">
		<div id="resultDiv">
		</div>
	</div>
</div>
</body>
</html>