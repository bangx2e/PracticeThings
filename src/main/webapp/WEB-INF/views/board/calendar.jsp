<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
#modal {
background-color: rgba(0,0,0,0.4);
position:fixed;
top:0px;
left:0px;
width:100%;
height:100%;
display:none;
z-index:0;
/* background: transparent; */

}
#calendar {

text-align: center;
}
.blue{
background: rgba(50,50,250,0.4);
}
.red{
background: rgba(150,50,50,0.4);

}
#calendar table{
width:500px;
margin: 0 auto;
background-color: white;
}
#ScheduleTable{
/* border:3px solid greem; */
position:absolute; 
/* left:20%; */
/* right:auto; */
/* top:150px; */
/* background-color:white; */
/* width:50%; */
/* height:50%; */
/* border-radius: 10px; */
z-index:10;
margin:20px;
width:95%;
height:90%;
}
#scheduleSpace{
display:none;
z-index:5;
border:3px solid greem;
position:absolute;
left:20%;
right:auto;
top:150px;
background-color:white;
width:50%;
height:50%;
border-radius: 10px;w
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
				<button value="" onclick="preMon()"><h1><</h1></button>
				<input type="text" readonly value="${getmonth}" id = "month">
				<input type="text" readonly value="${getyear}" id = "year">
				<button value="" onclick="nexMon()"><h1>></h1></button>
				<table border="1">
					<tr>
						<td>주차</td>
						<td>일요일</td>
						<td>월요일</td>
						<td>화요일</td>
						<td>수요일</td>
						<td>목요일</td>
						<td>금요일</td>
						<td>토요일</td>
					</tr>
				<c:forEach var="lis" items="${ymd}">
						<tr>
							<td>${lis.week_num}</td>
							<td class="red"><a onclick="createSchedule(${lis.sun})" >${lis.sun}</a></td>
							<td><a onclick='createSchedule(${lis.mon})'>${lis.mon}</a></td>
							<td><a onclick="createSchedule(${lis.tue})">${lis.tue}</a></td>
							<td><a onclick="createSchedule(${lis.wed})">${lis.wed}</a></td>
							<td><a onclick="createSchedule(${lis.thu})">${lis.thu}</a></td>
							<td><a onclick="createSchedule(${lis.fri})">${lis.fri}</a></td>
							<td class="blue"><a onclick="createSchedule(${lis.sat})">${lis.sat}</a></td>
							
						</tr>
				</c:forEach>
			</table>
		</div>
		<div id="modal" class="modalis" onclick="closeModal()">
		</div>
	 	<div id="scheduleSpace">
	 		<form >
		 			<table id="ScheduleTable">
	 					<tr><td  colspan="8"><h1>스케쥴 입력</h1></td></tr>
	 					<tr>
	 					<td id="ymd"></td>
	 					<td><input type="text" class="ymd" id="yyyymmdd"/></td>
	 					<td><input type="text" id="calYear" name="calYear" value="${getyear}"/></td>
	 					<td><input type="text" id="calMonth" name="calMonth" value="${getmonth}"/></td>
	 					<td><input type="text" id="calDay"  name="calDay"/></td>
	 					<td><input type="hidden" name="calDay" value="" id="getday"/></td>
	 					</tr>
		 				<tr>
		 					<td class="col1">시간</td>
		 					<td class="col2">내용</td>
		 					<td class="col3">중요</td>
		 					<td class="col4">삭제</td>
		 				</tr>
		 				<c:forEach var="lis" items="">
							<tr>
								<td class="col1"></td>
								<td class="col2"></td>
								<td class="col3"></td>
								<td class="col4"><a onclick="scheduleDel(calNo)">에이</a></td>
							</tr>
						</c:forEach>
		 				<tr>
		 					<td colspan="4"><legend>시간</legend><input type="time" id="calTime" name="calTime" style="width:150px;height:35px;"/></td>
		 				</tr>
		 				<tr>
		 					<td colspan="4"><legend>내용</legend><input type="text" id="calContents" name="calContents" style="width:100%; height:35px;" placeholder="스케쥴 내용을 입력해 주세요."/></td>
		 				</tr>
		 				<tr>
		 					<td colspan="4"><input type="checkbox" name="calReq" id="checkbox1"/><label for="checkbox1">중요 스케쥴(체크시 * 표시됩니다.)</label></td>
		 					
		 				</tr>
		 				<tr>
		 					<td class="col1"></td>
		 					<td class="col2"></td>
		 					<td class="col3"><input type="reset" value="취소"/></td>
		 					<td class="col4"><input type="button" value="저장" onclick="saveSchedule()"/></td>
		 				</tr>
		 			</table>
	 		</form>
	 	</div>
	<script>
		var monthChange=0;
	    var arrMonth = ['01','02','03','04','05','06','07','08','09','10','11','12'];
	    var month ="";
	    var year = "";
	    var tm = ${getmonth}-1;
	    // 	    var ywitm = $('#year').val()+$('#month').val();
	    
	    
		
		$(document).ready(function(){
			
			console.log("겟먼쓰" +typeof tm + tm)
			console.log("어레이에서 먼쓰:"+arrMonth[tm]);
			var date = new Date();
// 			var tm = String((date.getMonth()+1));
			var ty = String((date.getFullYear()));
// 			$("#year").val(ty);
		})
			
		//달력에서 보이는 현재 년도와 월
		function getDocDate(){
			var month = $('#month').val();
			var year = $('#year').val();
			console.log("년" + year);
			console.log("월" + month);
		}
		
		// 지난달 기능
// 		function preMonth(){
// 			var month = $('#month').val();
// 			var year = $('#year').val();
// 				if(month =="1"){
// 					year=$('#year').val(year-1);
// 					month=$('#month').val(12);;
// 					console.log('작년으로 갑니다');
// 				} else {
// 					month = $('#month').val(month-1);
// 					console.log('지난달입니다');
// 				}
// 				var ywitm = year+("0"+$('#month').val()).slice(-2);
// 				console.log("ywitm : " + ywitm);
// 				//비동기 통신
// 				$.ajax({
// 					type : 'get',
// 					url : '/board/calendarCall?ywitm=',
// // 					data : , //보내는 데이터
// 					dataType : "html",// 보내는타입이 아니라 리턴타입이다!! xml, json, script, html
// 					contentType : "application/json; charset=UTF-8",
// 					success : function(data) {
// 						alert('성공');
// 						$('body').load(data);
// 					},
// 					error : function(data) {
// 						alert('실패');
// 					}
// 				});
// 		}


		// 지난달 기능 수정
		function preMon(){
			var nowYear = $('#year').val();
			if($("#month").val() ==1){
				var changeYear = $('#year').val()-1;
				$("#month").val(arrMonth[11]);
				$('#year').val(changeYear);
			} else {
				var changeMonth = tm-1
				$('#month').val(arrMonth[changeMonth]);
			}
			var ywitm = $('#year').val()+$('#month').val();
			console.log("와윗엠:" +ywitm);

			//지난달 비동기
			$.ajax({
				type : 'get',
				url : '/board/calendar?ywitm='+ywitm,
// 					data : ywitm, //보내는 데이터
				dataType : "html",// 보내는타입이 아니라 리턴타입이다!! xml, json, script, html
//					contentType : "application/json; charset=UTF-8",
				success : function(data) {
					alert('성공');
						$('body').html(data);
				},
				error : function(data) {
					alert('실패');
				}
			});
		}

		// 다음달 기능 수정
		function nexMon(){
			var nowYear = $('#year').val();
			if($("#month").val() ==12){
				var changeYear = parseInt($('#year').val())+1;
				$('#month').val(arrMonth[0]);
				$("#year").val(changeYear);
				console.log("올해는 "+$('#year').val()+"년");
			} else {
				var changeMonth = tm+1
				$('#month').val(arrMonth[changeMonth]);
			}
			console.log("비동기전에 year 가져왔어" + $('#year').val());
			console.log("비동기전에 year 가져왔어" + $('#month').val());
			var ywitm = $('#year').val()+$('#month').val();
			console.log("와윗엠:" +ywitm);
			//다음달 비동기
			$.ajax({
				type : 'get',
				url : '/board/calendar?ywitm='+ywitm,
// 					data : ywitm, //보내는 데이터
				dataType : "html",// 보내는타입이 아니라 리턴타입이다!! xml, json, script, html
//					contentType : "application/json; charset=UTF-8",
				success : function(data) {
					alert('성공');
					$('body').html(data);
				},
				error : function(data) {
					alert('실패');
				}
			});
		}
		
		// 다음달 기능
// 		function nextMonth(){
// 			var month = $('#month').val();
// 			var year = $('#year').val();
// 				if(month =="12"){
// 					year=$('#year').val(parseInt(year)+1);
// 					month=$('#month').val(1);;
// 					console.log('내년으로 갑니다');
// 				} else {
// 					month = $('#month').val(parseInt(month)+1);
// 					console.log('다음달입니다');
// 				}
// 			var ywitm = year+("0"+$('#month').val()).slice(-2);
// 			console.log("ywitm : " + ywitm);
// 				//비동기 통신
// 				$.ajax({
// 					type : 'get',
// 					url : '/board/calendarChange?ywitm='+ywitm,
// // 					data : , //보내는 데이터
// 					dataType : "html",// 보내는타입이 아니라 리턴타입이다!! xml, json, script, html
// // 					contentType : "application/json; charset=UTF-8",
// 					success : function(data) {
// 						alert('성공');
// 						console.log(data);
// // 						$('body').load('/board/calendarChange');
// 					},
// 					error : function(data) {
// 						alert('실패');
// 					}
// 				});
// 		}

		function createSchedule(date){
			//달에 0붙여주기
			var thisYear = year;
			var thisMonth = month;
			if(date<10){
				date ="0"+date}
			var thisDate=date;
			console.log(thisDate+"일")
			console.log(typeof thisDate);
			console.log(typeof date);
			$("#ymd").text($('#year').val()+"년"+$('#month').val()+"월"+date+"일");
			$(".ymd").val($('#year').val()+$('#month').val()+date);
			
			console.log($("#ymd").val());
			console.log("ymd값: " + $(".ymd").val());
			var selectedDate =date;
			$("#getday").val(date);
			$("#calDay").val(date);
			var actualDate = $(".ymd").val();
			console.log("실제 일:"+actualDate);
			$('#modal').css('display','block');
			$('#scheduleSpace').css('display','block');
	
			$.ajax({
				type : 'GET',
				url : '/board/getSchedule',
				data : actualDate, //보내는 데이터
				dataType : "html",// 보내는타입이 아니라 리턴타입이다!! xml, json, script, html
// 				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					alert('성공');
					console.log(data);
// 					$('body').load('/board/saveschedule');
				},
				error : function(data) {
					alert('실패');
					console.log(data);
				}
			});
		}

		function closeModal(){
			if($("#modal").css('display')==='block'){
		    	$('#scheduleSpace').hide();
		    	$('#modal').hide();
			}
		};

		function saveSchedule(){
			var form ={
				"calYear":$('#calYear').val(),
				"calMonth":$('#calMonth').val(),
				"calDay":$('#calDay').val(),
				"calTime":$('#calTime').val(),
				"calReq":$('#checkbox1').val(),
				"calDate":$('#yyyymmdd').val(),
				"calContents":$('#calContents').val()
				};
			console.log(form);
			console.log(JSON.stringify(form));
			$.ajax({
				type : 'POST',
				url : '/board/saveschedule',
				data : JSON.stringify(form), //보내는 데이터
				dataType : "html",// 보내는타입이 아니라 리턴타입이다!! xml, json, script, html
				contentType : "application/json; charset=UTF-8",
				success : function() {
					alert('성공');
					$('body').load('/board/saveschedule');
				},
				error : function(data) {
					alert('실패');
				}
			});
		}
	</script>
</body>
</html>