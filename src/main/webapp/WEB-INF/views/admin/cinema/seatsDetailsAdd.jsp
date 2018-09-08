<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>관리자 페이지</title>
<link href="/yelloMovie/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/yelloMovie/css/admin/header.css" type="text/css"
	rel="stylesheet">
<link href="/yelloMovie/css/admin/cinema/theaterAdd.css" type="text/css"
	rel="stylesheet">
<script src="/yelloMovie/js/httpRequest.js"></script>
<script>
	function showCinema(){
		sendRequest("adminCinemaFind.do",null,showCinemaResult,'GET');
	}
	
	function showCinemaResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data=XHR.responseText;
				var findCinema = document.getElementById('div');
				if(findCinema.hasChildNodes()){
					while(findCinema.hasChildNodes()){
						findCinema.removeChild(findCinema.firstChild)
					}
				}else{
					findCinema.style.position='absolute';
				    findCinema.style.left=624+'px';
					findCinema.style.top=137+'px'; 
					findCinema.innerHTML=data;
				}
			}
		}
	}
	
	function findCinemaName(cinemaCity){
		var params = 'cinemaCity='+cinemaCity;
		sendRequest("adminSeatsFindName.do",params,changeCity,'GET');
	}
	
	function changeCity(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data = XHR.responseText;
				var cinemaNameList = document.getElementById("cinemaNameList");
				cinemaNameList.innerHTML=data;
			}
		}
	}
	
	function selectCinemaName(cinemaName,cinemaIdx){
		var selectCinemaName = document.getElementById('selectCinemaName');
		var selectCinemaNameInput =document.getElementById('selectCinemaIdxInput');
		selectCinemaName.firstChild.nodeValue=cinemaName;
		selectCinemaNameInput.value=cinemaIdx;
		
		
		var div = document.getElementById('div');
		while(div.hasChildNodes()){
			div.removeChild(div.firstChild);
		}
		
		var params = "cinemaIdx="+cinemaIdx;
		sendRequest("adminSeatsTheaterLists.do",params,showTheaterList,'GET');
	
	}

	function showTheaterList(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data = XHR.responseText;
				var theaterList = document.getElementById('theaterList');
				theaterList.innerHTML=data;
			}
		}
	}
	
	function selectTheaterName(theaterName,theaterIdx){
		var selectTheaterName = document.getElementById('selectTheaterName');
		var selectTheaterNameInput =document.getElementById('selectTheaterIdxInput');
		selectTheaterName.firstChild.nodeValue=theaterName;
		selectTheaterIdxInput.value=theaterIdx;
	}

	function seatsPosition(){
		var x = document.getElementById('x');
		var y = document.getElementById('y');
		var position = document.getElementById('seatPosition');
		position.style.width=21*x.value+'px';
		position.style.height=21*y.value+'px';
		
		var params='x='+x.value+'&y='+y.value;
		sendRequest("adminSeatsPositionSetting.do",params,seatPositionSettingResult,'GET');
	}
	
	function seatPositionSettingResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data = XHR.responseText;
				var position = document.getElementById('seatPosition');
				position.innerHTML = data;
			}
		}		
	}
	
	function columnLeftBtn(btnX,fullX,y){
		var topColumn = document.getElementById('column'+btnX);
		topColumn.classList.toggle('on');
				if(topColumn.classList.contains("on")){
					for(var i = btnX ; i <= fullX; i++){
						var column = document.getElementsByClassName('column'+i);
						var btnX = document.getElementById('column'+i);
						var left = btnX.style.left.split('p',1);
							btnX.style.left=parseInt(left)+17+'px';
					
						for(var j = 0 ; j <y ; j++){
					 		column[j].style.left = parseInt(left)+17+'px';
						 }
					}
				}else{
					for(var i = btnX ; i <=fullX ; i++){
						var column = document.getElementsByClassName('column'+i);
						var btnX = document.getElementById('column'+i);
						var left = btnX.style.left.split('p',1);
							btnX.style.left=parseInt(left)-17+'px';
					for(var j = 0 ; j <y ; j++){
					 	column[j].style.left = parseInt(left)-17+'px';
						}
					}
				}
		}
	
	function rowTopBtn(btnY,fullX,fullY){
		var topRow = document.getElementById('row'+btnY);
		topRow.classList.toggle('on');
				if(topRow.classList.contains("on")){
					for(var i = btnY ; i <= fullY; i++){
						var row = document.getElementsByClassName('row'+i);
						var btnY = document.getElementById('row'+i);
						var top = btnY.style.top.split('p',1);
							btnY.style.top=parseInt(top)+17+'px';
					
						for(var j = 0 ; j <=fullX ; j++){
					 		row[j].style.top = parseInt(top)+17+'px';
						 }
					}
				}else{
					for(var i = btnY ; i <= fullY; i++){
						var row = document.getElementsByClassName('row'+i);
						var btnY = document.getElementById('row'+i);
						var top = btnY.style.top.split('p',1);
						btnY.style.top=parseInt(top)-17+'px';
					for(var j = 0 ; j <=fullX ; j++){
						row[j].style.top = parseInt(top)-17+'px';
						}
					}
				}
		}
	
	function seatsSubmit(){
		var seatsInfo = document.getElementsByClassName('seatsInfo');
		var seatsSubmit = document.getElementById('seatsSubmit');
		window.alert(seatsInfo.length);
		for(var i = 0; i<seatsInfo.length;i++){
			if(seatsInfo[i].checked){
				seatsInfo[i].setAttribute('value',(seatsInfo[i].style.left).split('p',1)+","+(seatsInfo[i].style.top).split('p',1));
			}
			
		}
		seatsSubmit.submit();
	}
	
</script>
</head>

<style>
.screen {
	background-color: lightgray;
	margin: 0 auto 41px auto;
	text-align: center;
}

#seatPosition {
	position: relative;
	margin: 0 auto;
}

#seatPosition input {
	margin: 0px;
}
</style>


<body>
	<div class="container">
		<%@include file="../adminCommonsViews/adminHeader.jsp"%>

		<div class="container">
			<%@include file="../adminCommonsViews/adminNavi.jsp"%>
			<div class="col-xs-10"
				style="padding: 0px; padding-left: 5px; border-left: 1px solid #E1E1E1; height: 1000px;">
				<ul class="nav nav-tabs">
					<li><a href="adminCinema.do">영화관 목록</a></li>
					<li><a href="adminCinemaAdd.do">영화관 등록</a></li>
					<li><a href="adminTheaterAdd.do">상영관 수정</a></li>
					<li class="active"><a href="adminSeatsAdd.do">좌석 등록</a></li>
				</ul>
				<div class="container">
					<h2>좌석 배치</h2>

					<!-- 영화관 입력 -->
					<form class="form-inline text-right"
						style="width:81%;position:relative;${!empty theaterIdx?'display:none;':''}"
						action="adminSeatsAdd.do" method="post">
						<div class="form-group">
							<label>영화관 : </label>
							<button id="selectCinemaName" type="button"
								class="btn btn-default" onclick="showCinema()">
								영화관 선택 <span class="caret"></span>
							</button>
							<input type="hidden" value="" id="selectCinemaIdxInput"
								name="selectCinemaIdxInput">
						</div>

						<!-- 상영관 입력 -->
						<div class="form-group dropdown">
							<label>상영관 : </label>
							<button class="btn btn-default dropdown-toggle" type="button"
								id="selectTheaterName" data-toggle="dropdown"
								aria-expanded="true">
								선택하세요 <span class="caret"></span>
							</button>
							<input type="hidden" value="" id="selectTheaterIdxInput"
								name="selectTheaterIdxInput">
							<ul class="dropdown-menu" role="menu" id="theaterList">

							</ul>
						</div>
						<button type="submit" class="btn btn-default">선택</button>
					</form>

					<!-- 영화관 이름 모달 -->
					<div id="div" style="z-index: 1;"></div>

					<!-- 좌석 배치 메뉴 -->
					<c:if test="${!empty theaterIdx}">
						<div class="form-inline text-right seatsPosition"
							style="margin-top: 20px; width: 81%;">
							<div class="form-group">
								<label>행: </label> <input type="text" class="form-control"
									placeholder="행" id="x">
							</div>
							<div class="form-group">
								<label>열: </label> <input type="text" class="form-control"
									placeholder="열" id="y">
							</div>
							<div class="form-group">
								<button type="button" class="btn btn-default"
									onclick="seatsPosition()">선택</button>
							</div>
						</div>

						<!-- 좌석 배치 -->
						<form action="adminSeatsInfoAdd.do" method="POST" id="seatsSubmit">
						<input type="hidden" name="theaterIdx" value="${theaterIdx}">
						<div class="container seatsPosition" style="margin-top: 20px;">
							<div class="row" style="width: 94%;">
								<div class="col-xs-9">
									<p class="screen">screen</p>
									<div id="seatPosition" style="width: 100px; height: 100px;">

									</div>
								</div>

								<div class="col-xs-2" style="border: 1px solid red; width: 110px; height: 370px; margin-left: 10px;">
									<h4>좌석 종류</h4>
									
								</div>
							</div>
						</div>

						<div class="text-right seatsPosition" style="margin-top: 20px; width: 81%;">
							<input type="button" class="btn btn-default" value="등록" onclick="seatsSubmit()">
						</div>
						</form>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
</html>