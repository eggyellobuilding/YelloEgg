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
<script src="/yelloMovie/js/httpRequest.js"></script>
</head>
<style>
table, tr {
	vertical-align: middle;
}
</style>

<script>
function theaterList(cinemaIdx){
	var params = 'cinemaIdx='+cinemaIdx;
	sendRequest("adminCinemaTheaterFind.do",params,showTheater,'GET');
}

function showTheater(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			var theaterDiv = document.getElementById('theaterList');
			theaterDiv.innerHTML=data;
		}
	}
}
function openSeatModal(e){
	sendRequest("seatAjax.do", "theaterIdx=" + e.id, function(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data = XHR.responseText;
				var objData = eval('(' + data + ')');
				var yList = objData.yList;
				var xList = objData.xList;
				var ySize = objData.ySize;
				var xSize = objData.xSize;
				var alt = objData.alt;
				var seatsList = objData.seatsList;
				
				var result = '';
				result += '<div>';
				result += 	'<div class="seatsPosition" style="margin-top: 20px;">';
				result += 		'<div id="exitSeatPosition" style="height: ' + (80+ySize+17) + 'px;position:relative;">';
				result += 			'<p class="screen" style="text-align:center;">screen</p>';
				result += 			'<div id="exitPosition" style="width: '+ (xSize+17) + 'px; height: ' + (ySize+17) + 'px;z-index:1;margin:0px auto;position:relative;">';
				for(var i = 0; i < yList.length; i++){
					result += 			'<span style="z-index:2;text-align:center;width:16px;height:16px;position:absolute;top:'+ yList[i].seatY +'px;background-color:lightgray;margin-left:1px;">'+alt[i]+'</span>';
				}
				for(var i = 0; i < xList.length; i++){
					result += 			'<span class="xLists" style="z-index:2;text-align:center;display:none;width:16px;height:16px;position:absolute;left:' + xList[i].seatX + 'px;background-color:lightgray;margin-left:1px;">' + (i + 1) + '</span>';
				}
				for(var i = 0; i < seatsList.length; i++){
					result += 			'<span class="seats" style="z-index:2;text-align:center;display:inline-block;width:16px;height:16px;position:absolute;left:' + seatsList[i].seatX + 'px;top:' + seatsList[i].seatY + 'px;background-color:red;margin-left:1px;"></span>';
				}
				result +=				'</div>';
				result +=			'</div>';
				result +=	  '</div>';
				result +=	'</div>';
				
				var seatModalBodyNode = document.getElementById('seatModalBody');
				seatModalBodyNode.innerHTML = result;
				
				var xLists = document.getElementsByClassName('xLists');
				var seats = document.getElementsByClassName('seats');
				for (var i = 0; i < xLists.length; i++) {
					var xValue = xLists[i].style.left;
					for (j = 0; j < seats.length; j++) {
						var seatsValue = seats[j].style.left;
						if (xValue == seatsValue) {
							seats[j].innerHTML = i + 1;
						}

					}
				}
			}
		}
		
	}, "GET");
	$("#seatModal").modal();
}
</script>
<body>
	<div class="container">
		<%@include file="../adminCommonsViews/adminHeader.jsp"%>

		<div class="container">
			<%@include file="../adminCommonsViews/adminNavi.jsp"%>
			<div class="col-xs-10"
				style="padding: 0px; padding-left: 5px; border-left: 1px solid #E1E1E1; height: 900px;">
				<ul class="nav nav-tabs">
					<li class="active"><a href="adminCinema.do">영화관 목록</a></li>
					<li><a href="adminCinemaAdd.do">영화관 등록</a></li>
					<li><a href="adminTheaterAdd.do">상영관 수정</a></li>
					<li><a href="adminSeatsAdd.do">좌석 등록</a></li>
				</ul>
				<div class="container">
					<div class="col-xs-6" style="width:55%;">
						<h2>영화관 목록</h2>
						<table class="table table-hover text-center">
							<tr class="text-center">
								<th class="text-center">idx</th>
								<th class="text-center">영화관 이름</th>
								<th class="text-center">주소</th>
								<th class="text-center">수정/삭제</th>
							</tr>
							<c:forEach items="${lists}" var="cdto">
								<tr onclick="theaterList(${cdto.cinemaIdx})">
									<td>${cdto.cinemaIdx}</td>
									<td>${cdto.cinemaName}</td>
									<td>${cdto.cinemaAddr}</td>
									<td><input type="button" value="수정"
										class="btn btn-default"> <input type="button"
										value="삭제" class="btn btn-danger"></td>
								</tr>
							</c:forEach>
							<tr>
									<td colspan="4">
										<nav style="text-align: center">
											<ul class="pagination">
											${pageStr}
											</ul>
										</nav>
									</td>
							</tr>
						</table>
					</div>
					<div class="col-xs-1"
						style="padding: 0px; padding-left: 5px; border-left: 1px solid #E1E1E1; height: 854px; width: 0.1%"></div>

					<div class="col-xs-4">
						<h2>상영관 목록</h2>
						<div class="list-group col-xs-12" id="theaterList"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="seatModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<span class="modal-title" style="font-size: 30px;">좌석 정보</span>
				</div>
				<div class="modal-body" id="seatModalBody" style="position:relative;margin:0px auto;">
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
</html>