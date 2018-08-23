<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Yello egg</title>
    <!-- 부트스트랩 -->
    <link href="/yelloMovie/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/header.css" rel="stylesheet">
</head>
<body> 
	<div class="visible-lg visible-md visible-sm">
		<ul class="nav nav-tabs navbar-fixed-top "
			style="padding-left: 26%; background-color: white;">
			<li class="header logo"><a href="main.do"><img src="image/eggFire.png" class="img-rounded" height="20" width="100"></a></li>
			<li class="header"><a href="movieBoxOffice.do" style="margin: 0px;">영화</a></li>
			<li class="header"><a href="scheduleInfo.do" style="margin: 0px;">상영시간표</a></li>
			<li class="header"><a href="#" style="margin: 0px;">스토어</a></li>
			<li class="header"><a href="#" style="margin: 0px;">공지&이벤트</a></li>
			<li class="header"><a href="movieReservation.do" style="margin: 0px;">빠른예매</a></li>
			<li class="header"><a href="#" style="margin: 0px;">로그인</a></li>
		</ul>
		
	</div>
	<div id="headerAllMenu"	style="position: absolute;left:26%;top:50px;">
		<div class="btn-group">
			<a class="btn dropdown-toggle btn btn-warning" data-toggle="dropdown"
				href="#" id="allMenu"> <span class="icon-align-justify"></span>전체메뉴
			</a>
			<ul class="dropdown-menu">
				<li>영화</li>
				<li><a tabindex="0" href="#">asd</a></li>
				<li><a tabindex="0" href="#">asdasdas</a></li>
			</ul>
		</div>
	</div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>