<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${ pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul class="nav nav-tabs">
		<li role="presentation"><a href="/">Home</a></li>
		<li role="dropdown-toggle" class="dropdown"><a
			class="dropdown-toggle" data-toggle="dropdown" href="#" role="button"
			aria-expanded="false"> 게시판 <span class="caret"></span>
		</a>
			<ul class="dropdown-menu" role="menu">
				<li><a href="/board/home">게시판</a>
				<li><a href="/board/ajax">게시판 Ajax</a>
			</ul></li>
		<li role="presentation" class="active"><a href="/board/test">test</a></li>
		<li role="presentation" class=""><a href="/board/calculator">계산기</a></li>
		<li role="presentation" class=""><a href="/board/calendar">캘린더</a></li>
	</ul>
	<h1>게시글 수정</h1>

	<form action="${ctx}/board/update?boardNum=${vo.boardNum}"
		method="POST" name="update">
		<%-- 	<input type="hidden" value="${vo.boardNum}" name="boardNum"> --%>
		<table>
			<tr>
				<td><h5>제목</h5></td>
			</tr>
			<tr>
				<td><input type="text" value="${vo.title}" name="title"></td>
			</tr>
			<tr>
				<td><h5>작성자</h5></td>
			</tr>
			<tr>
				<td><input type="text" value="${vo.writer}" name="writer"
					readonly></td>
			</tr>
			<tr>
				<td><h5>내용</h5></td>
			</tr>
			<tr>
				<td><input type="text" value="${vo.boardContent}"
					name="boardContent"></td>
			</tr>


			<tr>
				<td colspan="4">
				<input type="submit" value="수정" class="btn btn-info"> 
				<input type="button" value="삭제 " class="btn btn-danger" onclick="location.href='/board/delete'">
				<input type="button" value="목록 " class="btn btn-primary" onclick="location.href='/board/home'"></td>
			</tr>
		</table>
	</form>
</body>
</html>