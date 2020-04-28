<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<style>
.chart {
	width: 100%;
	min-height: 450px;
}

.row {
	margin: 0 !important;
}
</style>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>

<script type="text/javascript">

            	
    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart1);
    	function drawChart1() {
            	          
            	          var dataRows = [['Date', '대화 수']];
            	          
            	          for(var i = 0; i < 10 ; i++){
            	        	  dataRows.push(['04-05',i]);
                      		}

            	          var line_data = google.visualization.arrayToDataTable(dataRows);

            	          var chart = new google.visualization.LineChart(document.getElementById('chartNo1'));

            	          
            	          chart.draw(line_data,{
            	        	  title: 'Bookphago Performance',
            	              legend: { position: 'none' },
            	              chartArea:{
            	            	  left:50,
            	            	  top:50,
            	            	  bottom : 50,
            	            	  right : 50,
            	            	  width:"100%",
            	            	  height:"100%"
            	            		  },
            	          });
            	   }
            	 
            	 
            	 $(window).resize(function(){
            		  drawChart1();
            		});
            	
    </script>
</head>
<body>
	<div class="row">
		<div class="chart" id="chartNo1"></div>
	</div>
</body>
</html>