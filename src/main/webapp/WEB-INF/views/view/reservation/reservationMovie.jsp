<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Yello egg</title>
<!-- 부트스트랩 -->
<link href="/yelloMovie/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<style>
ul{
	padding-left: 0px;
	border-left: 1px solid black;
	border-right: 1px solid black;
}
li {
	list-style-type: none;
	text-align: left;
}
.col-xs{
	padding: 0px;
}
</style>
</head>
<body>
	<%@include file="../commonsView/header.jsp"%>

	<div class="container" style="margin-top: 120px;">
		<div class="col-xs-12" style="border: 1px solid red;">
			<div class="col-xs-3" style="text-align: center; padding: 0px;">
				<div>영화</div>
				<ul>
					<li>11</li>
					<li>11</li>
					<li>11</li>
					<li>11</li>
					<li>11</li>
					<li>11</li>
					<li>11</li>
					<li>11</li>

				</ul>
			</div>
			<div class="col-xs-3" style="text-align: center; padding: 0px;">
				<div>극장</div>
				<ul>
					<li>11</li>
					<li>11</li>
					<li>11</li>
					<li>11</li>
					<li>11</li>
					<li>11</li>
					<li>11</li>
					<li>11</li>

				</ul>
			</div>
			<div class="col-xs-2" style="text-align: center; padding: 0px;">
				<div>날짜</div>
				<ul>
					<li>11</li>
					<li>11</li>
					<li>11</li>
					<li>11</li>
					<li>11</li>
					<li>11</li>
					<li>11</li>
					<li>11</li>
				</ul>
			</div>
			<div class="col-xs-4" style="text-align: center; padding: 0px;">
				<div>시간</div>
				<ul>
					<li>11</li>
					<li>11</li>
					<li>11</li>
					<li>11</li>
					<li>11</li>
					<li>11</li>
					<li>11</li>
					<li>11</li>
				</ul>
			</div>
		</div>
	</div>
	<form action="reservationSeat.do">
		<input type="submit" value="좌석예매 이동">
	</form>
	<%@include file="../commonsView/footer.jsp"%>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>