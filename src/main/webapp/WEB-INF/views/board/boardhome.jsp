<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul class="nav nav-tabs">
		<li role="presentation"><a href="/">Home</a></li>
		<li role="dropdown-toggle" class="dropdown active"><a
			class="dropdown-toggle" data-toggle="dropdown" href="#" role="button"
			aria-expanded="false"> 게시판 <span class="caret"></span>
		</a>
			<ul class="dropdown-menu" role="menu">
				<li><a href="/board/home">게시판</a>
				<li><a href="/board/ajax">게시판 Ajax</a>
			</ul></li>
		<li role="presentation"><a href="/board/test">test</a></li>
		<li role="presentation" class=""><a href="/board/calculator">계산기</a></li>
		<li role="presentation" class=""><a href="/board/calendar">캘린더</a></li>		
	</ul>
	<h1>게시판</h1>

	<table class="table">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>날짜</td>
		</tr>
		<c:forEach items="${list}" var="vo">
			<tr>
				<td>${vo.boardNum}</td>
				<td><a href="/board/detail?boardNum=${vo.boardNum}">${vo.title}</a></td>
				<td>${vo.writer}</td>
				<td>${vo.writeDate}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4"><input type="button" value="글쓰기 "
				class="btn btn-default" onclick="location.href='/board/reg'"></td>
		</tr>
	</table>
</body>
</html>