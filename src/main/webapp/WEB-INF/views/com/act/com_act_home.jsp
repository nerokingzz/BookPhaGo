<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/com/css/com_home.css" rel="stylesheet" type="text/css">

</head>

<script type="text/javascript">
	alert('${comInfo.get("COMMUNITY_NAME")}');
</script>

<body>


	<div id="com_container">
		<div id="com_header">
			<jsp:include page="com_act_home_header.jsp"></jsp:include>
		</div>
		<div id="com_side">
			<jsp:include page="com_act_home_side.jsp"></jsp:include>
		</div>
		<div id="com_main">
			<jsp:include page="com_act_home_main.jsp"></jsp:include>
		</div>
		<div id="com_footer">
			<jsp:include page="com_act_home_footer.jsp"></jsp:include>
		</div>
	</div>
</body>

</html>