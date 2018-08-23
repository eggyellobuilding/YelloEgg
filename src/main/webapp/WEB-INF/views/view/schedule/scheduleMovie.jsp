<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 스케줄</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/yelloMovie/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/yelloMovie/css/movie/movieInfo.css" rel="stylesheet">
</head>
<body>
	<%@include file="../commonsView/header.jsp"%>

	<nav class="navbar navbar-default navbar-static-top"
		style="margin-top: 100px; padding-top: 15px;">
		<div class="container">
			<ul class="movieNav" style="padding-left: 180px;">
				<li><a href="scheduleInfo.do"
					style="padding-right: 60px; font-size: 17px;">상영시간표</a></li>
			</ul>
		</div>
	</nav>
		<!-- 계산식---------------------------------------------- -->
	<%-- <c:set var="inum" value="${1}"/>
	<c:forEach var="iresult" items="${scheduleMovieImg}">
		<c:set var="num" value="${num+1}"/>
			<c:if test="${num==9}">
				<c:set var="inum" value="${inum+1}"/>
				<c:set var="num" value="${1}"/>
			</c:if>
	</c:forEach> --%>
	<!-- ------------------------------------------------------------ -->
	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel" style="background-color: black; padding-top: 50px; padding-bottom: 50px;">
		<!-- Indicators -->
		<ol class="carousel-indicators" style="top:270px;">
			<c:forEach var="indicatorsNum" begin="1" end="${inum }" varStatus="1">
				<li data-target="#carousel-example-generic" data-slide-to="${inum }" class="active"></li>
			</c:forEach>
		</ol>
		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox" style="padding-left: 245px;padding-right: 160px;">
		
			<!-- 여기 해야됨 -->
		
			<c:forEach var="itemClass" begin="1" end="${inum}" varStatus="1">
			<c:set var="itemCount" value="${itemCount+1}"/>
			<div class="item" id="item${itemCount}">
				<c:forEach var="sMImg" items="${simg1}">
				<c:set var="scheduleMovieImgCount" value="${scheduleMovieImgCount+1}"/>
					<img src="${sMImg}" alt="..." style="height: 200px; width: 180px; float: left; padding-right: 10px;">
				</c:forEach>
			</div>
			</c:forEach>
		</div>
		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	<%@include file="../commonsView/footer.jsp"%>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
	<script>
	$(window).load(function(){
		$('#item1').attr('class','item active');
	});
	</script>
</body>
</html>