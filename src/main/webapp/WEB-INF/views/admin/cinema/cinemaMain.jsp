<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>관리자 페이지</title>
    <link href="/yelloMovie/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 	<link href="/yelloMovie/css/admin/header.css" type="text/css"rel="stylesheet">
 	<script src="/yelloMovie/js/httpRequest.js"></script>
</head>
<style>
table,tr{
	vertical-align:middle;
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

</script>
<body>
<div class="container">
<%@include file="../adminCommonsViews/adminHeader.jsp" %>
		
		<div class="container">
			<%@include file="../adminCommonsViews/adminNavi.jsp" %>
    			<div class="col-xs-10" style="padding:0px;padding-left:5px; border-left: 1px solid #E1E1E1; height:1900px; ">
      				<ul class="nav nav-tabs" >
      					<li class="active"><a href="adminCinema.do">영화관 목록</a></li>
						<li><a href="adminCinemaAdd.do">영화관 등록</a></li>
						<li><a href="adminTheaterAdd.do">상영관 등록</a></li>
						<li><a href="adminSeatsAdd.do">좌석 등록</a></li>
					</ul>
						<div class="container">
						<div class="col-xs-6"> 
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
										<td>
										<input type="button" value="수정" class="btn btn-default">
										<input type="button" value="삭제" class="btn btn-danger">
										</td>
									</tr>
									</c:forEach>
								</table>
						</div>
							<div class="col-xs-1" style="padding:0px;padding-left:5px; border-left: 1px solid #E1E1E1; height:1900px;width:0.1%"></div>
						
						<div class="col-xs-4">
							<h2>상영관 목록</h2> 
								<div class="list-group col-xs-12" id="theaterList">
									
								</div>
						</div>
					</div>
    			</div>
			</div>
		</div>
</body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
</html>