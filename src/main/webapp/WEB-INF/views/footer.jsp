<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>

<footer>
	<div class="footy-sec mn no-margin">
		<div class="container">
			<ul>
				<li><a href="#" title="">대표 : 심동현</a></li>
				<li><a href="#" title="">이사 : 김민선</a></li>
				<li><a href="#" title="">행인1 : 서종대</a></li>
				<li><a href="#" title="">행인2 : 이동주</a></li>
				<li>
					<div>
						<select name="locale"">
							<option value="">GLOBAL</option>
							<option value="ko">한국어</option>
							<option value="en">English</option>
							<option value="cn">中文</option>
							<option value="jp">日本語</option>
						</select>
					</div>
				</li>
			</ul>
			<p><img src="${contextPath}/resources/bootstrap/images/copy-icon2.png" alt="">Copyright 2020</p>
			<img class="fl-rgt" src="${contextPath}/resources/bootstrap/images/logo2.png" alt="">
		</div>
	</div>
</footer>

<!-- script -->
<script type="text/javascript">
	$('select[name=locale]').change(function() {
		var lang = $(this).val();
		if (lang == "") {
			
		} else {
			location.href = "${contextPath}/locale.do?locale=" + lang;
		}
	});
</script>

</html>