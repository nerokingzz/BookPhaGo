<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표결과미리보기</title>
</head>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<body>

<div class="job_descp accountnone" id="chart_div"></div>

	<script type="text/javascript">

		// Load the Visualization API and the corechart package.
		google.charts.load('current', {'packages':['corechart']});

		// Set a callback to run when the Google Visualization API is loaded.
		google.charts.setOnLoadCallback(drawChart);

		// Callback that creates and populates a data table,
      	// instantiates the pie chart, passes in the data and
      	// draws it.
      	function drawChart() {
			var vote_title='${voteInfo.get("VOTE_TITLE") }';
			var selection_option1='${voteInfo.get("SELECTION_OPTION1") }';
			var selection_option1_count='${voteInfo.get("SELECTION_OPTION1_COUNT") }';
			var selection_option2='${voteInfo.get("SELECTION_OPTION2") }';
			var selection_option2_count='${voteInfo.get("SELECTION_OPTION2_COUNT") }';
			var selection_option3='${voteInfo.get("SELECTION_OPTION3") }';
			var selection_option3_count='${voteInfo.get("SELECTION_OPTION3_COUNT") }';
			var selection_option4='${voteInfo.get("SELECTION_OPTION4") }';
			var selection_option4_count='${voteInfo.get("SELECTION_OPTION4_COUNT") }';
			var selection_option5='${voteInfo.get("SELECTION_OPTION5") }';
			var selection_option5_count='${voteInfo.get("SELECTION_OPTION5_COUNT") }';

        	// Create the data table.
       		var data = new google.visualization.DataTable();
        	data.addColumn('string', 'SELECTION');
        	data.addColumn('number', 'COUNT');
        	data.addRows([
          		[selection_option1, parseInt(selection_option1_count)],
          		[selection_option2, parseInt(selection_option2_count)],
          		[selection_option3, parseInt(selection_option3_count)],
          		[selection_option4, parseInt(selection_option4_count)],
          		[selection_option5, parseInt(selection_option5_count)],

        	]);

        	// Set chart options
        	var options = {'title':vote_title, 'width':400, 'height':300};

        	// Instantiate and draw our chart, passing in some options.
        	var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        	chart.draw(data, options);
      	}
	</script>

</body>
</html>