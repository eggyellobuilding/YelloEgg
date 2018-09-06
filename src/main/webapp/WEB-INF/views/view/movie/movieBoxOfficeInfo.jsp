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
	font-size: 20px;
}
</style>
<script type="text/javascript">

/** 별점 넣기 */
function starScore(score,mvIdx){
	var star = document.getElementById('score'+mvIdx);
	star.value=score;
}

/** 감상평 등록 및 가져오기 */
function repAdd(idx){
	
	var content = document.getElementById('content'+idx);
	var score = document.getElementById('score'+idx);
	var member = document.getElementById('member'+idx);
	var movie = document.getElementById('movie'+idx);
	
	var repleAdd = 'repleContent='+content.value+'&reScore='+score.value+'&reMemberIdx='+member.value+'&reMovieIdx='+movie.value;
	sendRequest('movieReple.do',repleAdd,repResult,'GET');	
		
}
function repResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			var objData=eval('('+data+')');
			var lists=objData.repleLists;
			var mRep='';
			var mReple=document.getElementById('repList'+lists[0].repleMovieIdx);
			for(var i=0; i<lists.length;i++){
				$('#repList'+lists[0].repleMovieIdx).append(
				'<div>작성자:'+lists[i].id+'<br>날짜:'
				+lists[i].repleWriteDate+'<br>평점:'+lists[i].repleScore+
				'<br>내용:'+lists[i].repleContent+'<hr></div>');
			}
			
		}
	}
}
/** 스틸컷 정보 */
function cutUpdate(count){
	$('#steelCutPlus'+count).append(
		'<pre id="cut'+count+'"><input type="file" name="steelCutFileImg" style="float: left;"><button onclick="minus('
		+ count + ')">-</button></pre>');
		count++;
}

</script>
</head>
<body>
	<%@include file="../commonsView/header.jsp"%>
							
	<nav class="navbar navbar-default navbar-static-top"
		style="margin-top: 100px; padding-top: 15px; z-index: 1;">
		<div class="container">
			<ul class="movieNav" style="padding-left: 180px;">
				<li><a href="movieBoxOffice.do"
					style="padding-right: 60px; font-size: 17px;">박스오피스</a></li>
				<li><a href="movieLatest.do"
					style="padding-right: 60px; font-size: 17px;">최신개봉작</a></li>
				<li><a href="movieExpectation.do" style="font-size: 17px;">상영예정작</a></li>
			</ul>
		</div>
	</nav>
	<div class="row" style="margin: 25px auto; padding-left: 100px;">
		<c:forEach var="office" items="${officeList }">
			<c:set var="count" value="${count + 1}" />
			<c:set var="steelCutCount" value="${0}"/>
			<ul class="col-xs-2"
				style="display: inline; margin-left: 25px; width: 250px;">
				<li style="height: 360px; width: 250px; border: 1px solid red;"><img
					alt="eggFire" src="${office.movieTitleCut}"
					style="width: 248px; height: 358px;"></li>
				<li
					style="height: 40px; width: 250px; border: 1px solid red; padding-top: 23px;">평점
					및 별점</li>
				<li
					style="height: 30px; width: 250px; border: 1px solid red; text-align: center; padding-top: 4px;">${office.movieName }</li>
				<li
					style="height: 50px; width: 250px; border: 1px solid red; padding-top: 7px;">
					<a href="#" style="margin-left: 35px; margin-right: 30px;"
					class="btn btn-warning btn-sm" data-toggle="modal"
					data-target="#movieInfo${count}" id="aw${count}">상세정보</a> 
					<a href="movieReservation.do" class="btn btn-warning btn-sm">예약하기</a>
				</li>
			</ul>
			
			<!-- Modal 상세정보 -->
			<div class="modal fade" id="movieInfo${count}" tabindex="-1"
				 role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" style="width: 900px;">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">${office.movieName}</h4>
						</div>
						<div class="modal-body">
							<img alt="" src="${office.movieTitleCut }"
								style="height: 250px; width: 200px; float: left; margin-right: 10px;">
							<div class="topInfo" style="margin-top: 60px;">개봉일:${office.releaseDate}</div>
							<div class="topInfo">감독:${office.movieDirector }</div>
							<div class="topInfo">배우:${office.movieActor}</div>
							<div class="topInfo">장르:${office.movieGenre }</div>
							<div class="topInfo">배급사:${office.movieDistributer}</div>
							<br> <br>
							<div>
								<h4 style="margin-top: 20px;">줄거리</h4>
								${office.movieSummary}
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
											<c:if test="${office.movieIdx==steelCutImg.steelCutMovieIdx}">
											<c:set var="steelCutCount" value="${steelCutCount+1}"></c:set>
											<div class="item ${steelCutCount }" id="item${steelCutCount }"style="margin-left: 187px;">
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
									<span class="starR on" onclick="starScore(1,${office.movieIdx})">별1</span> <span class="starR" onclick="starScore(2,${office.movieIdx})">별2</span>
									<span class="starR" onclick="starScore(3,${office.movieIdx})">별3</span> <span class="starR" onclick="starScore(4,${office.movieIdx})">별4</span> <span
										class="starR" onclick="starScore(5,${office.movieIdx})">별5</span>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="text" name="repleContent" style="width: 500px;" id="content${office.movieIdx}">
										<input type="button" value="등록" class="btn" onclick="repAdd(${office.movieIdx})">
										<input type="hidden" value="${sessionScope.smdto.memberIdx}" name="reMemberIdx" id="member${office.movieIdx}">
										<input type="hidden" value="1" name="reScore"  id="score${office.movieIdx}">
										<input type="hidden" value="${office.movieIdx}" name="reMovieIdx" id="movie${office.movieIdx}">
								</div>
								<div id="repList${office.movieIdx}"></div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
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
});

$('.starRev span').click(function() {
	$(this).parent().children('span').removeClass('on');
	$(this).addClass('on').prevAll('span').addClass('on');
	return false;
});

	</script>
</html>

