<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${ pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-serialize-object/2.5.0/jquery.serialize-object.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta charset="UTF-8">


<title>AJAX 게시판</title>
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
	<h1>게시판 ajax</h1>

	<table class="table">
		<tr>
			<td><input type="checkbox" id="checkAll"/>전체선택</td>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>날짜</td>
			<td></td>
		</tr>
		<tr>
			<td colspan ="6">
				<input  class="btn btn-warning"type="button" value="선택삭제" id="deleteSelected" onclick="deleteSelected()">
			</td>
		</tr>
		<c:forEach items="${list}" var="vo">
			<tr>
				<td><input type="checkbox" value="${vo.boardNum}" name="chk"></td>
				<td>${vo.boardNum}</td>
				<td><a onclick="getBoard('${vo.boardNum}')">${vo.title}</a></td>
				<td>${vo.writer}</td>
				<td>${vo.writeDate}</td>
				<td><input class="btn btn-warning" type='button' value="삭제"
					onclick="deleteCheck('${vo.boardNum}')"></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4"><input type="button" value="글쓰기 "
				class="btn btn-default" onclick="chk()">
		</tr>
	</table>
	<div class="ajax" style="display: none" ID="ajaxWriteForm">
		<form method="post" name="frm" action="${ctx}/board/reg"
			id="writeForm">
			<ul>
				<li>제목</li>
				<li><input type="text" placeholder="제목을 입력하세요" name="title"
					id="title"></li>
				<br>
				<li>작성자</li>
				<li><input type="text" placeholder="작성자를 입력하세요" name="writer"
					id="writer"></li>
				<br>
				<li>내용</li>
				<li><input type="text" placeholder="내용을 입력하세요"
					name="boardContent" id="boardContent"></li>
				<br>
			</ul>
			<input type="button" value="글쓰기" onclick="check()">
			<table class="table">
			</table>
		</form>
	</div>
	<div id="ajaxDetail" style="display: none">
		<div>
			<p>제목</p>
			<p id="titleDetail"></p>
			<p>작성자</p>
			<p id="writerDetail"></p>
			<p>내용</p>
			<p id="contentDetail"></p>
			<input type="button" onclick="closeP()" value="닫기" />
		</div>
	</div>
</body>
<script>
	//체크박스기능
	$(document).ready(function(){
		$('#checkAll').click(function(){
			if($('#checkAll').prop("checked")){
				$("input[name=chk]").prop("checked",true);
			}else{
				$("input[name=chk]").prop("checked",false);
			}
		});
	})
	//폼 내용 누락 체크
	function check() {
		//제목 누락 체크
		if (document.getElementById("title").value == "") {
			alert("제목을 입력해주세요");
			return;
			//글쓴이 누락 체크
		} else if (document.getElementById("writer").value == "") {
			alert("작성자를 입력해주세요");
			return;
			//내용 누락 체크
		} else if (document.getElementById("boardContent").value == "") {
			alert("내용을 입력해주세요");
			return;
		}

		//Form 데이터 바인딩
		var form = {
			"title" : $('#title').val(),
			"writer" : $('#writer').val(),
			"boardContent" : $('#boardContent').val()
		};
// 		var frm = $("#writeForm").serializeJSON();
		//ajax 처리부분
		$.ajax({
			type : 'POST',
			url : '/board/regajax',
			data : JSON.stringify(form), //보내는 데이터
			dataType : "json",// 보내는타입이 아니라 리턴타입이다!! xml, json, script, html
			contentType : "application/json; charset=UTF-8",
			success : function() {
				alert('성공');
				$('body').load(data);
			},
			error : function(data) {
				alert('실패');
			}
		});
	}

	// 삭제기능(삭제버튼)
	function deleteCheck(Num) {
		confirm("삭제하시겠습니다?");
		console.log(Num);

		$.ajax({
			type : 'GET',
			url : '/board/deleteAjax?boardNum=' + Num,
			dataType : 'text',
			success : function(data) {
				console.log('성공');
				$('body').load('/board/ajax');
			},
			error : function(data) {
				alert('실패');
			}
		});
	}
	
	// 체크박스 선택 목록 삭제 기능
	function deleteSelected() {
		testArray = [];
		
		$("input[name=chk]:checked").each(function(){
			testArray.push($(this).val());
		});
		if(testArray==""){
			alert('선택해주세요');
			return;
		} else {
			alert(testArray)
		}
		$.ajax({
			type : 'POST',
			url : '/board/deleteListAjax?testArray='+testArray, //testArray
			data :  testArray,
			dataType :  "html",
			traditional : true,
// 			contentType: "application/json;",
			success : function(data) {
				console.log('체크리스트 삭제 성공')
				$('body').load('/board/ajax');
			},
			error : function(data) {
				alert('실패');
			}
		});
	}
	
	function getBoard(Num) {

		console.log(Num);

		$.ajax({
			type : 'GET',
			url : '/board/detailAjax?boardNum='+Num,
			dataType : 'json',
// 			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				console.log("======" + data);
				$('#titleDetail').html(data["title"]);
				$('#writerDetail').html(data["writer"]);
				$('#contentDetail').html(data["boardContent"]);
			},
			error : function(data) {
				alert('실패');
			}
		});
		// 		alert('디스플레이 옵션 전');
		if (document.getElementById('ajaxWriteForm').style.display == 'block') {
			document.getElementById('ajaxWriteForm').style.display = 'none'
		}
		// 		alert('디스플레이 옵션 후');
		;
		var box = document.getElementById('ajaxDetail');
		if (box.style.display == 'none') {
			box.style.display = 'block';
		}
	}

	function chk() {
		var box = document.querySelector(".ajax");
		var detailbox = document.getElementById('ajaxDetail');
		if (box.style.display === 'none') {
			detailbox.style.display = 'none';
			box.style.display = 'block';
		} else {
			document.getElementById('writeForm').reset();
		}
	}

	function closeP() {
		// 		alert('close 호출성공');
		var box = document.getElementById('ajaxDetail');
		box.style.display = 'none';
	}
</script>
</html>