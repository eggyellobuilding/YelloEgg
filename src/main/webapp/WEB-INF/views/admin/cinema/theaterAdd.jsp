<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>관리자 페이지</title>
    <link href="/yelloMovie/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 	<link href="/yelloMovie/css/admin/header.css" type="text/css" rel="stylesheet">
 	<link href="/yelloMovie/css/admin/cinema/theaterAdd.css" type="text/css" rel="stylesheet">
 	<script type="text/javascript" src="/yelloMovie/js/httpRequest.js"></script>
 	<script type="text/javascript" src="/yelloMovie/js/findCinemaName.js"></script>
</head>

<body>
<div class="container">
<%@include file="../adminCommonsViews/adminHeader.jsp" %>
		<div class="container">
			<%@include file="../adminCommonsViews/adminNavi.jsp" %>
    			<div class="col-xs-10" style="padding:0px;padding-left:5px; border-left: 1px solid #E1E1E1; height:1200px; ">
      				<ul class="nav nav-tabs" >
      					<li><a href="adminCinema.do">영화관 목록</a></li>
						<li><a href="adminCinemaAdd.do">영화관 등록</a></li>
						<li class="active"><a href="adminTheaterAdd.do">상영관 등록</a></li>
						<li><a href="adminSeatsAdd.do">좌석 등록</a></li>
					</ul>
						<div class="container">
						<h1>상영관 정보 등록</h1>
						<!-- 영화관 고르기 -->
						<form class="form-inline">
							영화관 이름 :
							<div class="dropdown btn-group">
								 <button class="btn btn-default dropdown-toggle" type="button" aria-expanded="true" onclick="showCinema()" id="findCinemaBtn" style="position:relative;">
									영화관 선택
									<span class="caret" id="caret"></span>
									
								  </button>
								  <!-- AJAX를 이용한 영화관, 상영관 선택 -->
								  <div id="div"></div>
							</div>
						</form>
						
						<!-- 이름 등록 -->
					
							<form  id="theaterNameSubmit" class="form-horizontal" action="adminTheaterAdd.do" method="POST">
								<c:forEach begin="1" end="${count}" var="i">
									<div class="form-group" style="margin-top:30px;">
										<label class="col-xs-1 control-label">${i} : </label>
										<input type="text" name="${i}" class="form-control theaterName" style="width:50%;"  placeholder="이름">
									</div>
								</c:forEach>
									<input type="hidden" name="theaterCinemaIdx" value="${idx}">
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