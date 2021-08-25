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
.green{
background: lightgreen;
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
		
		<div id = "calendar">
				<H1>${getyear}</H1>
				<a onclick="preMon()"><h1 style="display : inline;"><</h1></a>
				<h2 style="display : inline; margin :20px;">${getmonth}</h2>
				<input type="hidden" readonly value="${getmonth}" id = "month">
				<input type="hidden" readonly value="${getyear}" id = "year">
				<a onclick="nexMon()"><h1 style="display : inline;">></h1></a>
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
							<c:if test="${lis.chk_sun=='Y'}">
								<td class="green"><a onclick="createSchedule(${lis.sun})" >${lis.sun}</a></td>
							</c:if>
							<c:if test="${lis.chk_sun=='N'}">
								<td class="red"><a onclick="createSchedule(${lis.sun})" >${lis.sun}</a></td>
							</c:if>
							<c:if test="${lis.chk_mon=='Y'}">
								<td class="green"><a onclick="createSchedule(${lis.mon})" >${lis.mon}</a></td>
							</c:if>
							<c:if test="${lis.chk_mon=='N'}">
								<td><a onclick="createSchedule(${lis.mon})" >${lis.mon}</a></td>
							</c:if>
							<c:if test="${lis.chk_tue=='Y'}">
								<td class="green"><a onclick="createSchedule(${lis.tue})" >${lis.tue}</a></td>
							</c:if>
							<c:if test="${lis.chk_tue=='N'}">
								<td><a onclick="createSchedule(${lis.tue})" >${lis.tue}</a></td>
							</c:if>
							<c:if test="${lis.chk_wed=='Y'}">
								<td class="green"><a onclick="createSchedule(${lis.wed})" >${lis.wed}</a></td>
							</c:if>
							<c:if test="${lis.chk_wed=='N'}">
								<td><a onclick="createSchedule(${lis.wed})" >${lis.wed}</a></td>
							</c:if>
							<c:if test="${lis.chk_thu=='Y'}">
								<td class="green"><a onclick="createSchedule(${lis.thu})" >${lis.thu}</a></td>
							</c:if>
							<c:if test="${lis.chk_thu=='N'}">
								<td><a onclick="createSchedule(${lis.thu})" >${lis.thu}</a></td>
							</c:if>
							<c:if test="${lis.chk_fri=='Y'}">
								<td class="green"><a onclick="createSchedule(${lis.fri})" >${lis.fri}</a></td>
							</c:if>
							<c:if test="${lis.chk_fri=='N'}">
								<td><a onclick="createSchedule(${lis.fri})" >${lis.fri}</a></td>
							</c:if>
							<c:if test="${lis.chk_sat=='Y'}">
								<td class="green"><a onclick="createSchedule(${lis.sat})" >${lis.sat}</a></td>
							</c:if>
							<c:if test="${lis.chk_sat=='N'}">
								<td class="blue"><a onclick="createSchedule(${lis.sat})" >${lis.sat}</a></td>
							</c:if>
							
							
						</tr>
				</c:forEach>
			</table>
		</div>
		<div id="modal" class="modalis" onclick="closeModal()">
		</div>
	 	<div id="scheduleSpace">
	 		<form >
		 			<table id="ScheduleTable">
	 					<tr><td  colspan="8"><h4 style="margin-bottom : 0px;">스케쥴 입력</h4></td></tr>
	 					<tr>
	 					<td id="ymd" style="padding-bottom : 5px;"></td>
	 					<td><input type="hidden" class="ymd" id="yyyymmdd"/></td>
	 					<td><input type="hidden" id="calYear" name="calYear" value="${getyear}"/></td>
	 					<td><input type="hidden" id="calMonth" name="calMonth" value="${getmonth}"/></td>
	 					<td><input type="hidden" id="calDay"  name="calDay"/></td>
	 					<td><input type="hidden" name="calDay" value="" id="getday"/></td>
	 					</tr>
		 				<thead>
		 					<tr>
			 					<th class="col1">시간</th>
			 					<th class="col2">내용</th>
			 					<th class="col3">중요</th>
			 					<th class="col4">삭제</th>
		 					</tr>
		 				</thead>
		 				<tbody id="jqueryTable">
						</tbody>
		 				<tr>
		 					<td colspan="4"><legend>시간</legend><input type="time" id="calTime" name="calTime" style="width:150px;height:35px;"/></td>
		 				</tr>
		 				<tr>
		 					<td colspan="4"><legend>내용</legend><input type="text" id="calContents" name="calContents" style="width:100%; height:35px;" placeholder="스케쥴 내용을 입력해 주세요."/></td>
		 				</tr>
		 				<tr>
		 					<td colspan="4"><input type="checkbox" name="calReq" id="calReq"/><label for="calReq">중요 스케쥴(체크시 * 표시됩니다.)</label></td>
		 					
		 				</tr>
		 				<tr>
		 					<td class="col1"></td>
		 					<td class="col2"></td>
		 					<td class="col3"><input type="reset" value="취소" onclick="closeModal()"/></td>
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
		
		$(document).ready(function(){
			var date = new Date();
			var ty = String((date.getFullYear()));
		})
			
		//달력에서 보이는 현재 년도와 월
		function getDocDate(){
			var month = $('#month').val();
			var year = $('#year').val();
		}
		
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

			//지난달 비동기
			$.ajax({
				type : 'get',
				url : '/board/calendar?ywitm='+ywitm,
				dataType : "html",// 보내는타입이 아니라 리턴타입이다!! xml, json, script, html
				success : function(data) {
						$('body').html(data);
				},
				error : function(data) {
					console.log("preMon() is Failed : "+ data);
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
			} else {
				var changeMonth = tm+1
				$('#month').val(arrMonth[changeMonth]);
			}
			var ywitm = $('#year').val()+$('#month').val();
			//다음달 비동기
			$.ajax({
				type : 'get',
				url : '/board/calendar?ywitm='+ywitm,
				dataType : "html",// 보내는타입이 아니라 리턴타입이다!! xml, json, script, html
				success : function(data) {
					$('body').html(data);
				},
				error : function(data) {
					console.log("nexMon is Failed : "+data);
				}
			});
		}
		// 스케쥴 가져오기(저장 후 재로딩용)
		function getScheduleAjax(calDate){
			var objArr=[];
			$.ajax({
					type : 'GET',
					url : '/board/getSchedule?date='+calDate,
					dataType : "json",// 보내는타입이 아니라 리턴타입이다!! xml, json, script, html
					success:function(data) {
						for(var i=0; i<data.length; i++){
							objArr.push(data[i]);
						}
						var html ='';
						for(key in objArr){
							html+='<tr>';
							html+='<td>'+objArr[key].calTime+'</td>';
							html+='<td>'+objArr[key].calContents+'</td>';
							if(objArr[key].calReq =='true'){
								html+='<td style="color : red">*</td>';
							} else{
								html+='<td></td>';
							}
							html+='<td><a onclick="delSchedule('+objArr[key].calNo+')">삭제</a></td>';
							html+='</tr>';
						}
						$('#jqueryTable').empty();
						$('#jqueryTable').append(html);
							},
					error : function(data) {
								console.log("getScheduleAjax() Failed : "+ data);
							}
					})
		}

		// 스케쥴 만들기
		function createSchedule(date){
			//달에 0붙여주기
			var thisYear = year;
			var thisMonth = month;
			if(date<10){
				date ="0"+date}
			var thisDate=date;
			$("#ymd").text($('#year').val()+"년"+$('#month').val()+"월"+date+"일");
			$(".ymd").val($('#year').val()+$('#month').val()+date);
			
			var selectedDate =date;
			$("#getday").val(date);
			$("#calDay").val(date);
			var actualDate = $(".ymd").val();
			$('#modal').css('display','block');
			$('#scheduleSpace').css('display','block');
			var objArr=[];
			$.ajax({
				type : 'GET',
				url : '/board/getSchedule?date='+actualDate,
				dataType : "json",// 보내는타입이 아니라 리턴타입이다!! xml, json, script, html
				success : function(data) {
					for(var i=0; i<data.length; i++){
						objArr.push(data[i]);
					}
					var html ='';
					for(key in objArr){
						html+='<tr>';
						html+='<td>'+objArr[key].calTime+'</td>';
						html+='<td>'+objArr[key].calContents+'</td>';
						if(objArr[key].calReq =='true'){
							html+='<td style="color : red">*</td>';
						} else {
							html+='<td></td>';
						}
						html+='<td><a onclick="delSchedule('+objArr[key].calNo+')">삭제</a></td>';
						html+='</tr>';
					}
					$('#jqueryTable').empty();
					$('#jqueryTable').append(html);
				},
				error : function(data) {
					console.log("createSchedule is Failed : "+ data);
				}
			});
		}
		
		function closeModal(){
			if($("#modal").css('display')==='block'){
		    	$('#scheduleSpace').hide();
		    	$('#modal').hide();
			}
			var ywitm = $('#year').val()+$('#month').val();
			location.replace('/board/calendar?ywitm='+ywitm);
		};

		function saveSchedule(){
			if($('#calTime').val()==null || $('#calTime').val()=='' ){
				alert("시간을 입력하세요");
				return false;
			}
			if($('#calContents').val()==null||$('#calContents').val()==''){
				alert("내용을 입력하세요");
				return false;
			}
			var form ={
				"calYear":$('#calYear').val(),
				"calMonth":$('#calMonth').val(),
				"calDay":$('#calDay').val(),
				"calTime":$('#calTime').val(),
				"calReq": $('#calReq').is(":checked"),
				"calDate":$('#yyyymmdd').val(),
				"calContents":$('#calContents').val()
				};
			$.ajax({
				type : 'POST',
				url : '/board/saveschedule',
				data : JSON.stringify(form), //보내는 데이터
				dataType : "html",// 보내는타입이 아니라 리턴타입이다!! xml, json, script, html
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					$('#jqueryTable').empty();
					getScheduleAjax($('#yyyymmdd').val());
				},
				error : function(data) {
					console.log("saveSchedule is Failed : "+ data);
				}
			});
		}
		// 스케쥴 삭제기능
		function delSchedule(calNo){
			$.ajax({
				type : 'GET',
				url : '/board/delSchedule?calNo='+calNo,
				dataType : "html",// 보내는타입이 아니라 리턴타입이다!! xml, json, script, html
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					getScheduleAjax($('#yyyymmdd').val());
				},
				error : function(data) {
					console.log("delSchedule is Failed : " + data);
				}
			});
		}
	</script>
</body>
</html>