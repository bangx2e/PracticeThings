<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<h1>게시글 작성</h1>
	<form method="post" name="frm" action="${ctx}/board/reg">
		<ul>
			<li>제목</li>
			<li><input type="text" placeholder="제목을 입력하세요" name="title" id="title"></li>
			<li>작성자</li>
			<li><input type="text" placeholder="작성자를 입력하세요" name="writer" id="writer"></li>
			<li>내용</li>
			<li><input type="text" placeholder="내용을 입력하세요" name="boardContent" id="content"></li>
		</ul>
		<input type="button" value="글쓰기" onclick="check()">
		<table class="table">
		</table>
	</form>
<script>
function check(){
	if(document.getElementById("title").value=="") {
	 alert("제목을 입력해주세요");
	 return;
	 } else if(document.getElementById("writer").value=="") {
		 alert("작성자를 입력해주세요");
		 return;
		 } else if(document.getElementById("content").value==""){ 
		alert("내용을 입력해주세요");
		return;
	}
	frm.submit()
}
</script>
</body>
</html>