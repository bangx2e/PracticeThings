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
<style>
#calendar {

text-align: center;
}
 
#calendar table{
width:500px;
margin: 0 auto;
}
</style>
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
		<li role="presentation" class=""><a href="/board/test">test</a></li>
		<li role="presentation" class=""><a href="/board/calculator">계산기</a></li>
		<li role="presentation" class="active"><a href="/board/calendar">캘린더</a></li>
	</ul>
	<h1>달력</h1>
	<div id = "calendar">
		<button value="" onclick="preMonth()"><h1><</h1></button>
		<button value="" onclick="nextMonth()"><h1>></h1></button>
		<table border="1">
			<tr>
				<td>주차</td>
				<td>월요일</td>
				<td>화요일</td>
				<td>수요일</td>
				<td>목요일</td>
				<td>금요일</td>
				<td>토요일</td>
				<td>일요일</td>
			</tr>
	<c:forEach var="lis" items="${cm}">
			<tr>
				<td>${lis.week_num}</td>
				<td>${lis.mon}</td>
				<td>${lis.tue}</td>
				<td>${lis.wed}</td>
				<td>${lis.thu}</td>
				<td>${lis.fri}</td>
				<td>${lis.sat}</td>
				<td>${lis.sun}</td>
			</tr>
	</c:forEach>
		</table>
	</div>
	<script>
		$(document).ready(function(){
			  var date = new Date();
			  var tm = ("0"+(date.getMonth()+1)).slice(-2);
			  var ty = date.getFullYear();
// 			  console.log("지금 : "+date);
// 			  console.log("금년 : "+ty);
// 			  console.log("금월 : "+tm);
// 			  console.log(ty+""+tm);
			  getDocDate();
			})
			
		//달력에서 보이는 현재 년도와 월
		function getDocDate(){
			var month = $('#month').val();
			var year = $('#year').val();
			console.log("년" + year);
			console.log("월" + month);
		}
		
		// 지난달 기능
		function preMonth(){
			var month = $('#month').val();
			var year = $('#year').val();
				if(month =="1"){
					year=$('#year').val(year-1);
					month=$('#month').val(12);;
					console.log('작년으로 갑니다');
				} else {
					month = $('#month').val(month-1);
					console.log('지난달입니다');
				}
				var ywitm = year+("0"+$('#month').val()).slice(-2);
				console.log("ywitm : " + ywitm);
				//비동기 통신
				$.ajax({
					type : 'get',
					url : '/board/calendarChange?ywitm='+ywitm,
// 					data : , //보내는 데이터
					dataType : "json",// 보내는타입이 아니라 리턴타입이다!! xml, json, script, html
					contentType : "application/json; charset=UTF-8",
					success : function(data) {
						alert('성공',data);
					},
					error : function(data) {
						alert('실패');
					}
				});
		}
		
		// 다음달 기능
		function nextMonth(){
			var month = $('#month').val();
			var year = $('#year').val();
				if(month =="12"){
					year=$('#year').val(parseInt(year)+1);
					month=$('#month').val(1);;
					console.log('내년으로 갑니다');
				} else {
					month = $('#month').val(parseInt(month)+1);
					console.log('다음달입니다');
				}
			var ywitm = year+("0"+$('#month').val()).slice(-2);
			console.log("ywitm : " + ywitm);

				//비동기 통신
				$.ajax({
					type : 'get',
					url : '/board/calendarChange?ywitm='+ywitm,
// 					data : , //보내는 데이터
					dataType : "html",// 보내는타입이 아니라 리턴타입이다!! xml, json, script, html
// 					contentType : "application/json; charset=UTF-8",
					success : function() {
						alert('성공');
// 						$('body').load('/board/calendarChange');
					},
					error : function(data) {
						alert('실패');
					}
				});
		}
	</script>
</body>
</html>