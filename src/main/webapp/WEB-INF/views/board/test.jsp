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
		<li role="presentation" class="active"><a href="/board/test">test</a></li>
		<li role="presentation" class=""><a href="/board/calculator">계산기</a></li>
		<li role="presentation" class=""><a href="/board/calendar">캘린더</a></li>
	</ul>
	<h1>TEST2 - 구구단</h1>
	<h1>
		<select name="gugu" id="guguCalc" onchange="change()">
	</h1>
	<option value="선택">선택</option>
	<option value="1">1단</option>
	<option value="2">2단</option>
	<option value="3">3단</option>
	<option value="4">4단</option>
	<option value="5">5단</option>
	<option value="6">6단</option>
	<option value="7">7단</option>
	<option value="8">8단</option>
	<option value="9">9단</option>
	</select>
	<button onclick="calc()">계산</button>
	<div id="calcResult"></div>
	<h1>TEST4 - 색상변경</h1>
	<div id="colorChange()">
		<ul style="list-style: none;" id="list">
			<li value="첫번째">첫번째</li>
			<li value="두번째">두번째</li>
			<li value="세번째">세번째</li>
			<li value="네번째">네번째</li>
		</ul>
		<h1>
			<select name="color" id="selectedOrder" onchange="colorChangeFirst()">
		</h1>
		<option value="">선택</option>
		<option value="All">전체</option>
		<option value="0">첫번째</option>
		<option value="1">두번째</option>
		<option value="2">세번째</option>
		<option value="3">네번째</option>
		</select> <select name="color" id="selectedColor"
			onchange="colorChangeSecond()"></h1>
			<option value="none">선택</option>
			<option value="red">빨강</option>
			<option value="blue">파랑</option>
			<option value="yellow">노랑</option>
			<option value="green">초록</option>
		</select>
		<button onclick="colorChange()">변경</button>
	</div>
	<div>
		<input type="text" name="boxNum" id="boxNum" />
		<button onclick="createBox()">선택</button>
		<h1>
			<div id="numBox"></div>
		</h1>
	</div>
	<script>
		//테이블 생성 로직
		// 		function createBox() {
		//팀장님 소스
		// 			var boxSize = document.getElementById('boxNum').value;
		// 			var v = boxSize;
		// 			var v4 = 0;
		// 			if(4-(v%4) != 4){
		// 				v4 = 4-(v%4);
		// 			}
		// 			var result = parseInt(v) + parseInt(v4);
		// 			var html = "";
		// 			for(var i = 1; i<=result; i++){
		// 				if(i%4 == 1){
		// 					html += "<tr>";
		// 				}
		// 				if(i > (result-v4)){
		// 					html += "<td>x</td>";
		// 				}else{
		// 					html += "<td>"+i+"</td>";
		// 				}
		// 				if(i == 0){
		// 					html += "</tr>";
		// 				}				
		// 			}
		// 			$("#numBox").html(html);
		function createBox() {
			var boxSize = document.getElementById('boxNum').value;
			var result = parseInt(boxSize / 4);
			if (boxSize % 4 > 0) {
				result += 1;
			}
			var needBox = result * 4;
			// 			console.log("몫 계산" + result);
			// 			console.log("박스사이즈" + boxSize);
			// 			console.log("필요한 전체 td수" + needBox)

			const table = document.getElementById("numBox");
			var text = '<table border="1">';
			for (var i = 1; i <= needBox; i++) {
				if (i % 4 == 1) {
					text += '<tr>';
				}
				text += '<td>';
				if (i > boxSize) {
					text += 'x';
				} else {
					text += i;
				}
				text += '</td>';
			}
			if (i % 4 == 1) {
				text += '</tr>';
			}
			text += '</table>';
			table.innerHTML = text;
		}

		// 구구단 계산기 선택값 출력(변경시 자동출력)
		function change() {
			var num = document.getElementById('guguCalc').value;
			alert(num);
		}

		// 계산버튼 클릭시 계산 함수
		function calc() {
			$('#calcResult').empty();
			var num = document.getElementById('guguCalc').value;
			for (i = 1; i <= 9; i++) {
				$('#calcResult').append(num + "X" + i + "=" + (num * i));
				$('#calcResult').append("<br>");
			}
			;
		}

		// 색상변경 기능의 첫번째 선택지 변경시 선택지 자동 출력
		function colorChangeFirst() {
			var order = document.getElementById("selectedOrder").value;
			console.log(order);
		}
		// 색상 변경 기능의 두번째 선택지 변경시 자동 출력(콘솔)
		function colorChangeSecond() {
			var color = document.getElementById("selectedColor").value;
			console.log(color);
		}
		function colorChange() {
			if (document.getElementById("selectedColor").value == "none") {
				alert('변경할 색상을 선택해 주세요');
				return false;
			}
			var selectedOrder = $("#selectedOrder").val();
			var selectedColor = $("#selectedColor").val();
			$("#list").find("li").removeAttr('style');
			if (selectedOrder == 'All') {
				$("#list").find("li").css("color", selectedColor);
			} else {
				$("#list").find("li").eq(selectedOrder).css("color",
						selectedColor);
			}
			// 			var order = document.getElementById("selectedOrder").value;
			// 			var color = document.getElementById("selectedColor").value;

			// 			switch (order) {
			// 			case '1':
			// 				$('#list li').removeClass();
			// 				$('#list li:nth-child(1)').addClass(color);
			// 				break;
			// 			case '2':
			// 				$('#list li').removeClass();
			// 				$('#list li:nth-child(2)').addClass(color);
			// 				break;
			// 			case '3':
			// 				$('#list li').removeClass();
			// 				$('#list li:nth-child(3)').addClass(color);
			// 				break;
			// 			case '4':
			// 				$('#list li').removeClass();
			// 				$('#list li:nth-child(4)').addClass(color);
			// 				break;
			// 			}
			// 			console.log("순서" + order + "색상" + color);

		}
	</script>
</body>
</html>