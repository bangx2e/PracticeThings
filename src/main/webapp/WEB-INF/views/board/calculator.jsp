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
.button{
	width:100%;
	height:100%;
	transition-duration:10s;
}
/* td:active { */
/* 	background-color:gray; */
/*  } */
.red {
	color: red;
}

.blue {
	color: blue;
}

.yellow {
	color: yellow;
}

.green {
	color: green;
}
td {
width : 200px;
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
		<li role="presentation" class="active"><a href="/board/calculator">계산기</a></li>
		<li role="presentation" class=""><a href="/board/calendar">캘린더</a></li>		
	</ul>
	<section>
		<div><h1>계산기</h1>
			<table class="table" border="1" style="width:800px">
				<tr>
					<td colspan="4" style="padding:0px;">
						<input type="text" style="width:100%; height:100%" id="formula"/>
					</td>
				</tr>
				<tr>
					<td onclick="addNum(7)">7</td>
					<td onclick="addNum(8)">8</td>
					<td onclick="addNum(9)">9</td>
					<td onclick="addNum('*')">X</td>
				</tr>
				<tr>
					<td onclick="addNum(4)">4</td>
					<td onclick="addNum(5)">5</td>
					<td onclick="addNum(6)">6</td>
					<td onclick="addNum('-')">-</td>
				</tr>
				<tr>
					<td onclick="addNum(1)">1</td>
					<td onclick="addNum(2)">2</td>
					<td onclick="addNum(3)">3</td>
					<td onclick="addNum('+')">+</td>
				</tr>
				<tr>
					<td onclick="del()">Del</td>
					<td onclick="addNum(0)">0</td>
					<td onclick="reset()">AC</td>
					<td onclick="calc()">=</td>
				</tr>
				
			</table>
		</div>
	</section>
	
	<script>
	var formula = document.getElementById('formula');
	var timeOut = function (id) {
		$(id).css("background-color", "#fff");
	}
	$(".table tr td").on("click", function() {
	    $(this).css("background-color", "gray");
	    setTimeout(timeOut, 100, this);
	});	
	function addNum(num){
		var last = document.getElementById('formula').value.substring(formula.value.length-1,formula.value.length);
		if(isNaN(num)){
			if(isNaN(formula.value.substring(formula.value.length-1,formula.value.length))){
			formula.value = formula.value.substring(0,formula.value.length-1)+num;
			} else {
				formula.value+=num;
			}
		} else {
			formula.value+=num;
		}
	console.log("막글자" + last);
// 	console.log("막글자" + formula.value.substring(formula.value.length-1,formula.value.length));
// 	console.log("글자 길이" + formula.value.length);
// 	console.log("글자 밸류" + formula.value);
	}
	function calc(){
		if(isNaN(formula.value.substring(formula.value.length-1,formula.value.length))){
// 			console.log("왔습니다 왔어요");
// 			alert('마지막글자에 기호가 들어갈 수 없습니다.')
			formula.value=formula.value.substring(0,formula.value.length-1);
		} else if(formula.value==""){
			formula.value="";
		} else{
			var result = eval(formula.value);
			console.log("결과값:" + result);
			formula.value=result;
		} 
	}
	function del(){
		formula.value=formula.value.substring(0,formula.value.length-1);
	}
	function reset(){
		formula.value="";
	}
// 	var arr=[];
// 	$(document).ready(function(){
// 		$("button").click(function(){
// 			let newVal = $(this).val();
// 			console.log("새로 들어온 값은: " + newVal)
// // 			alert("뉴발: " +newVal);
// 				arr.push(newVal);
// 				alert('푸쉬됨');
// 			if(arr[arr.length-1] != 'Del'|| arr[arr.length-1] !="+"||arr[arr.length-1] !="-"||arr[arr.length-1]!="X"||arr[arr.length-1]!="="){
// 					console.log('배열 길이: ' + arr.length);
// 				for(var i=0; i<arr.length; i++){
// 					console.log('리스트: ' + arr[i]);
// 				};
// 				$("#formula").val(function(){
// 					for(var i=0; i<arr.length; i++){



// 						arr[i];
// 					};
// 				});
				
// 			} else {
// 				switch(newVal){
// 				case "Del":
// 					alert("delete선택됨");
// 				}
// 			}
// 			if(newVal =="Del"){
// 				arr.splice(arr[arr.length-1]); 
// 				var result = arr;
// 				console.log("arrpop"+arr);
// 			} else {	
// 				arr.push(newVal);
// 				var result = arr;
// 				console.log("arrpush"+arr);
// 			}
// 			console.log(newVal);
// 			$("#formula").val(function(){
// 				for(var i=0; i<arr.length; i++){
// 					arr[i]};
// 				});
// 			});
// 		})
		
	</script>
</body>
</html>