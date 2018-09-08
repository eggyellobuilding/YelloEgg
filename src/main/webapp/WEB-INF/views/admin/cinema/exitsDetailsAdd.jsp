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
	var count = 0;
	//값넣어주기
	window.onload = function() {
		var xLists = document.getElementsByClassName('xLists');
		var seats = document.getElementsByClassName('seats');
		for (var i = 0; i < xLists.length; i++) {
			var xValue = xLists[i].style.left;
			for (j = 0; j < seats.length; j++) {
				var seatsValue = seats[j].style.left;
				if (xValue == seatsValue) {
					seats[j].firstChild.nodeValue = i + 1;
				}

			}
		}
	}

	//복사
	function dragStart(ev) {
		ev.dataTransfer.setData("image", ev.target.id);
		if (ev.target.className == "move") {
			ev.dataTransfer.dropEffect = "move";
		} else {
			ev.dataTransfer.dropEffect = "copy";
		}
	}

	function dragover(ev) {
		if (ev.target.className == "move") {
			ev.dataTransfer.dropEffect = "move";
		} else {
			ev.dataTransfer.dropEffect = "copy";
		}
		ev.preventDefault();
	}

	function drop(ev) {

		var data = ev.dataTransfer.getData("image");
		var data2 = document.getElementById(data);

		var div = document.getElementById('exitPosition');

		var divX = Math.round($("#exitPosition").offset().left);
		var divY = Math.round($("#exitPosition").offset().top);

		
		var left = ev.x-divX-8;
		var top = ev.y-divY-8;
		
		if (data2.className == 'move') {
			data2.style.left = left + 'px';
			data2.style.top = top + 'px';
			
			var count2 = data.split('e',2);
			var hiddenInputInfo = document.getElementById('inputTagInfo'+count2[1]);
			hiddenInputInfo.value= left +','+ top +','+data2.src;
			
		} else {
			var data3 = data2.cloneNode(data2);
			var hiddenForm = document.getElementById('hiddenForm');
			
			data3.setAttribute('style', 'z-index:3;');
			data3.setAttribute('style', "position:absolute;");
			data3.style.left=left+'px';
			data3.style.top=top+'px';
			data3.style.width = 16 + 'px';
			data3.style.heigth = 16 + 'px';
			data3.setAttribute('class', 'move');
			data3.setAttribute('id', 'move' + count);
			
			div.appendChild(data3);
		
			
			
			
			var inputTagInfo = document.createElement('input');
			inputTagInfo.setAttribute('id','inputTagInfo'+count);
			inputTagInfo.setAttribute('name','inputTagInfo'+count);
			inputTagInfo.setAttribute('type','hidden');
			hiddenForm.appendChild(inputTagInfo);
			inputTagInfo.value= left+','+top+','+data2.src;
			count++;
		}
	}
	function removeExit(){
		var exitClass = document.getElementsByClassName("move");
		var parent = document.getElementById("exitPosition");
		parent.removeChild(exitClass[count-1]);
		count--;
	}
</script>
</head>

<style>
.screen {
	background-color: lightgray;
	margin: 0 auto 41px auto;
	text-align: center;
}

#exitPosition {
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
					<h2>출입구 배치</h2>
					<div class="container seatsPosition" style="margin-top: 20px;">
					
						<div class="row" style="width: 94%;">
							<div id="exitSeatPosition" class="col-xs-9"
								style="height: ${80+ySize+17}px;position:relative;"
								ondragover="dragover(event)" ondrop="drop(event)">
								<p class="screen">screen</p>
								<div id="exitPosition"
									style="width: ${xSize+17}px; height: ${ySize+17}px;z-index:1;">

									<c:forEach items="${yList}" var="yList" varStatus="y">
										<span
											style="z-index:2;text-align:center;width:16px;height:16px;position:absolute;top:${yList.seatY}px;background-color:lightgray;margin-left:1px;">${alt[y.index]}</span>
									</c:forEach>

									<c:forEach items="${xList}" var="xList" varStatus="x">
										<span class="xLists"
											style="z-index:2;text-align:center;display:none;width:16px;height:16px;position:absolute;left:${xList.seatX}px;background-color:lightgray;margin-left:1px;">${x.count}</span>
									</c:forEach>

									<c:forEach items="${seatsList}" var="list">
										<span class="seats"
											style="z-index:2;text-align:center;display:inline-block;width:16px;height:16px;position:absolute;left:${list.seatX}px;top:${list.seatY}px;background-color:red;margin-left:1px;">
										</span>
									</c:forEach>
								</div>
							</div>

							<div class="col-xs-2"
								style="border: 1px solid red; width: 110px; height: 370px; margin-left: 10px;">
								<h4>출구 종류</h4>
								<div class="row text-center" style="margin-bottom: 10px;">
									<img id="img1" src="/yelloMovie/img/admin/cinema/exit1.PNG"
										draggable="true" ondragstart="dragStart(event)">
								</div>
								<div class="row text-center" style="margin-bottom: 10px;">
									<img id="img2" src="/yelloMovie/img/admin/cinema/exit2.PNG"
										draggable="true" ondragstart="dragStart(event)">
								</div>
								<div class="row text-center" style="margin-bottom: 10px;">
									<img id="img3" src="/yelloMovie/img/admin/cinema/exit3.PNG"
										draggable="true" ondragstart="dragStart(event)">
								</div>
								<div class="row text-center" style="margin-bottom: 10px;">
									<img id="img4" src="/yelloMovie/img/admin/cinema/exit4.PNG"
										draggable="true" ondragstart="dragStart(event)">
								</div>
							</div>
						</div>
					</div>
				</div>
				<form action="adminExitsAdd.do" method="post">
					<div id="hiddenForm">
							<input type="hidden" name="theaterIdx" value="${theaterIdx}">
					</div>
					<div class="row text-right" style="margin-top:20px;width:100%;">
						<input type="button" class="btn btn-danger" style="margin-right:10px;" value="마지막 출구 삭제 " onclick="removeExit()"><input class="btn btn-default" type="submit" value="등록">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
</html>