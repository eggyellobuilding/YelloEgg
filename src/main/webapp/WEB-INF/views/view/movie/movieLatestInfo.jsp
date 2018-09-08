<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Yello egg</title>
<!-- 부트스트랩 -->
<link href="/yelloMovie/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/yelloMovie/css/movie/movieInfo.css" rel="stylesheet">
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="js/movieList.js"></script>
<style>
.starR {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 22px;
	height: 22px;
	display: inline-block;
	text-indent: -9999px;
	cursor: pointer;
}

.starR.on {
	background-position: 0 0;
}

.topInfo{
	font-size: 16px;
	padding-left: 220px;
	padding-bottom: 5px;
}
.mg0{
	color: white;
	background-color: #1DDB16;
}
.mg12{
	color: white;
	background-color: #0054FF;
}
.mg15{
	color: white;
	background-color: #FF5E00;
}
.mg19{
	color: white;
	background-color: #FF0000;
}
</style>
</head>
<body>
	<%@include file="../commonsView/header.jsp"%>
	<input type="hidden" value="${sessionScope.smdto.memberIdx}" id="smidx">						
	<nav class="navbar navbar-default navbar-static-top"
		style="margin-top: 30px; padding-top: 15px; z-index: 1; background-color: #A6A6A6;">
		<div class="container">
			<ul class="movieNav" style="padding-left: 180px;">
				<li><a href="movieBoxOffice.do"	style="padding-right: 60px; font-size: 17px; color: white;">박스오피스</a></li>
				<li><a href="movieLatest.do" style="padding-right: 60px; font-size: 17px; color: white;">최신개봉작</a></li>
				<li><a href="movieExpectation.do" style="font-size: 17px; color: white;">상영예정작</a></li>
			</ul>
		</div>
	</nav>
	<div class="row" style="margin: 25px auto; padding-left: 100px;">
		<c:forEach var="latest" items="${LatestList }">
			<c:set var="count" value="${count + 1}" />
			<c:set var="steelCutCount" value="${0}"/>
			<ul class="col-xs-2"
				style="display: inline; margin-left: 25px; width: 250px;">
				<li style="height: 360px; width: 250px; border: 1px solid gray;"><img
					alt="eggFire" src="${latest.movieTitleCut}"
					style="width: 248px; height: 358px;"></li>
				<li
					style="height: 40px; width: 250px; border: 1px solid gray; padding-top: 10px; text-align: center;">평점 ${latest.movieRepleScoreAvg}</li>
				<li
					style="height: 30px; width: 250px; border: 1px solid gray;padding-top: 2px; font-size: 17px;">
					<span class="mg${latest.movieGrade}" style="padding:3px; border-radius:5px; margin-left: 5px; margin-right: 5px;">${latest.movieGrade}</span> 
					<span>${latest.movieName}</span></li>
				<li
					style="height: 50px; width: 250px; border: 1px solid gray; padding-top: 7px;">
					<a href="#" style="margin-left: 35px; margin-right: 30px;"
					class="btn btn-warning btn-sm" data-toggle="modal"
					data-target="#movieInfo${count}" id="aw${count}">상세정보</a> 
					<a href="movieReservation.do" class="btn btn-warning btn-sm">예약하기</a>
				</li>
			</ul>
			
			<!-- Modal 상세정보 -->
			<div class="modal fade" id="movieInfo${count}" tabindex="-1"
				 role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" style="width: 700px;">
					<div class="modal-content">
						<div class="modal-body">
						<img alt="" src="${latest.movieTitleCut }" style="height: 250px; width: 200px; float: left; margin-right: 10px; margin-top: 20px;">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button><div class="topInfo" style="margin-top: 40px;font-size:25px;">
							<span class="mg${latest.movieGrade}" style="padding:3px; border-radius:5px; margin-left: 10px; margin-right: 5px;">${latest.movieGrade}</span>
							<span>${latest.movieName}</span></div><hr>
							<div class="topInfo">개봉일:${latest.releaseDate}</div>
							<div class="topInfo">감독:${latest.movieDirector }</div>
							<div class="topInfo">배우:${latest.movieActor}</div>
							<div class="topInfo">장르:${latest.movieGenre }</div>
							<div class="topInfo">배급사:${latest.movieDistributer}</div>
							<br> <br>
							<div>
								<h4 style="margin-top: 20px;">줄거리</h4>
								${latest.movieSummary}
								<hr>
							</div>
							<div>
								<h4>스틸컷</h4>
								<div id="carousel-example-generic${count }"
									class="carousel slide" data-interval="false"
									style="background-color: black; padding-top: 10px; padding-bottom: 10px;">

									<!-- Wrapper for slides -->
									<div class="carousel-inner" role="listbox">
										<c:forEach var="steelCutImg" items="${steelCutList}">
											<c:if test="${latest.movieIdx==steelCutImg.steelCutMovieIdx}">
											<c:set var="steelCutCount" value="${steelCutCount+1}"></c:set>
											<div class="item ${steelCutCount }" id="item${steelCutCount }"style="margin-left: 87px;">
												<img src="${steelCutImg.steelCutFileName }" alt="..." style="height: 600px; width: 500px; float: left; padding-right: 10px;">
											</div>
											</c:if>
										</c:forEach>
									</div>

									<!-- Controls -->
									<a class="left carousel-control"
										href="#carousel-example-generic${count }" role="button"
										data-slide="prev"> <span
										class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
										<span class="sr-only">Previous</span>
									</a> <a class="right carousel-control"
										href="#carousel-example-generic${count }" role="button"
										data-slide="next"> <span
										class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
										<span class="sr-only">Next</span>
									</a>
								</div>
							</div>
							<br>
							<div>
								<h4>감상평</h4>
								<br>
								<div class="starRev">
									<span class="starR on" onclick="starScore(1,${latest.movieIdx})">별1</span> <span class="starR" onclick="starScore(2,${latest.movieIdx})">별2</span>
									<span class="starR" onclick="starScore(3,${latest.movieIdx})">별3</span> <span class="starR" onclick="starScore(4,${latest.movieIdx})">별4</span>
									<span class="starR" onclick="starScore(5,${latest.movieIdx})">별5</span>
									&nbsp;&nbsp;&nbsp;
									<input type="text" name="repleContent" style="width: 460px;" id="content${latest.movieIdx}">
										<input type="button" value="등록" class="btn" onclick="repAdd(${latest.movieIdx})">
										<input type="hidden" value="${sessionScope.smdto.memberIdx}" name="reMemberIdx" id="member${latest.movieIdx}">
										<input type="hidden" value="1" name="reScore"  id="score${latest.movieIdx}">
										<input type="hidden" value="${latest.movieIdx}" name="reMovieIdx" id="movie${latest.movieIdx}">
								</div>
								<div style="overflow-y: scroll;width: 660px; height: 450px; margin-top: 10px; margin-top: 10px;">
								<div id="repList${latest.movieIdx}">
								<c:forEach var="rep" items="${movieReple}">
									<div>
									<c:if test="${latest.movieIdx==rep.repleMovieIdx}">
										<div style="width: 433px; float: left;">
										<span style="font-size: 19px; color:#FF5E00">${rep.id}</span><br>
										${rep.repleDate}
										
										<c:forEach var="star" begin="1" end="5" step="1">
											<c:if test="${rep.repleScore>=star}">
												<img src="img/star/star_1.png" style="width: 18px;">
											</c:if>
											<c:if test="${rep.repleScore<star}">
												<img src="img/star/star_2.png" style="width: 18px;">
											</c:if>
										</c:forEach>
										
										<br>
										${rep.repleContent}<hr>
										</div>
									</c:if>	
									</div>
								</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
		</c:forEach>
	</div>
	<%@include file="../commonsView/footer.jsp"%>
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
	
</body>
<script>

$(window).load(function(){
	$('.1').attr('class','item active'); 
	$('.mg0').html('<span class="mg0" style="padding:3px; border-radius:5px;">All</span>');
});

$('.starRev span').click(function() {
	$(this).parent().children('span').removeClass('on');
	$(this).addClass('on').prevAll('span').addClass('on');
	return false;
});
		
	</script>
</html>

