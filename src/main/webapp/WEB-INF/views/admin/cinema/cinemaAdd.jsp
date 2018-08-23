<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>관리자 페이지</title>
    <link href="/yelloMovie/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 	<link href="/yelloMovie/css/admin/header.css" type="text/css" rel="stylesheet">
 	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
 	<script src="/yelloMovie/js/admin/cinema.js"></script>
</head>
<body>
<div class="container">
<%@include file="../adminCommonsViews/adminHeader.jsp" %>
		
		<div class="container">
			<%@include file="../adminCommonsViews/adminNavi.jsp" %>
    			<div class="col-xs-10" style="padding:0px;padding-left:5px; border-left: 1px solid #E1E1E1; height:1900px; ">
      				<ul class="nav nav-tabs" >
      					<li><a href="adminCinema.do">영화관 목록</a></li>
						<li class="active"><a href="adminCinemaAdd.do">영화관 등록</a></li>
						<li><a href="adminTheaterAdd.do">상영관 등록</a></li>
						<li><a href="adminSeatsAdd.do">좌석 등록</a></li>
					</ul>
					
					<div class="container">
						<h2>영화관 정보 등록</h2>
						
						<form action="adminCinemaAdd.do" method="POST">
							<div class="form-group">
								<label>영화관 주소</label>		
								<div class=" form-inline">
									<input type="text" id="addr" name="addr" class="form-control" style="width:60%;" placeholder="주소" readonly>
									<input type="button" class="btn btn-default" value="주소 검색" onclick="addrFind()">
								</div>
								<input type="text" id="bunji" name="cinemaAddr" class="form-control" style="width:60%;margin-top:10px;" placeholder="상세주소">
							</div>
							<div class="form-group">
								<label>영화관 이름</label>
									<input type="text" id="cinemaName" name="cinemaName" class="form-control" style="width:60%;" placeholder="이름">
							</div>
							<div class="form-group">
								<label>상영관 수</label>
									<select class="form-control" style="width:60%;" name="cinemaTheater">
									  <c:forEach var="i" begin="1" end="20">
									  	<option value="${i}">${i}</option>
									  </c:forEach>
									</select>
							</div>
							<div class="col-xs-8 text-right">
								<input type="submit" value="등록" class="btn btn-default">
							</div>
						</form>
					</div>
    			</div>
		</div>
</div>
</body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
</html>