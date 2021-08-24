<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${ pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul class="nav nav-tabs">
		<li role="presentation" class="active"><a href="/">Home</a></li>
		<li role="dropdown-toggle" class="dropdown"><a
			class="dropdown-toggle" data-toggle="dropdown" href="#" role="button"
			aria-expanded="false"> 게시판 <span class="caret"></span>
		</a>
			<ul class="dropdown-menu" role="menu">
				<li><a href="/board/home">게시판</a>
				<li><a href="/board/ajax">게시판 Ajax</a>
			</ul></li>
		<li role="presentation" class=""><a href="/board/test">test</a></li>
		<li role="presentation" class=""><a href="/board/calculator">계산기</a></li>
		<li role="presentation" class=""><a href="/board/calendar">캘린더</a></li>
	</ul>
	<h1>HOME</h1>
	<h1>
		<a href="http://www.wooriict.com/main.html"><img alt="우리ICT"
			src="http://www.wooriict.com/wooriict_logo.png"></a>
	</h1>
</body>

<script>
// 위 textarea로 결과를 확인한다.
var consoleArea = document.getElementById("console");
// dropdown 메뉴가 보이기 직전에 호출되는 이벤트
$('.event-dropdown').on('show.bs.dropdown', function () {
consoleArea.log("메뉴가 열리기 전 이벤트!");
});
// dropdown 메뉴가 보이기 직후에 호출되는 이벤트
$('.event-dropdown').on('shown.bs.dropdown', function () {
consoleArea.log("메뉴가 열린 후 이벤트!");
});
// dropdown 메뉴가 사라지기 직전에 호출되는 이벤트
$('.event-dropdown').on('hide.bs.dropdown', function () {
consoleArea.log("메뉴가 닫히기 전 이벤트!");
});
// dropdown 메뉴가 사라진 직후에 호출되는 이벤트
$('.event-dropdown').on('hidden.bs.dropdown ', function () {
consoleArea.log("메뉴가 닫힌 후 이벤트!");
});
</script>
</html>