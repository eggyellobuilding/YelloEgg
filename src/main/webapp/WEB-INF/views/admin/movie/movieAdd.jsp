<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>관리자 페이지</title>
<link href="/yelloMovie/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/yelloMovie/css/admin/header.css" type="text/css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<%@include file="../adminCommonsViews/adminHeader.jsp"%>
		<div class="container">
			<%@include file="../adminCommonsViews/adminNavi.jsp"%>
			<div class="col-xs-10"
				style="padding: 0px; padding-left: 5px; border-left: 1px solid #E1E1E1; height: 1900px;">
				<ul class="nav nav-tabs">
					<li><a href="adminMovieList.do">영화목록</a></li>
					<li class="active"><a href="adminMovieAdd.do">영화등록</a></li>
				</ul>
				<form id="movieAdd" enctype="multipart/form-data" method="post"
					action="adminMovieAdd.do">
					<div class="container">
						<h3>타이틀 컷</h3>
						<div id='View_area' style='position:relative; color: black; border: 0px solid black; dispaly: inline; '></div>
						<pre><input type="file" name="movieTitleImg" id="tImg" onchange="previewImage(this,'View_area')"></pre>
						
						<h3>스틸컷</h3>
						<pre><input type="file" name="steelCutFileImg" style="float: left;"><input type="button" value="+" id="plus"></pre>
						<p id="steelCutPlus"></p>
						
						<h3>상세정보</h3>
						<table class="table table-hover">
							<tr>
								<td>배급사</td>
								<td><input type="text" name="movieDistributer"></td>
							</tr>
							<tr>
								<td>영화제목</td>
								<td><input type="text" name="movieName"></td>
							</tr>
							<tr>
								<td>영화장르</td>
								<td><input type="text" name="movieGenre"></td>
							</tr>
							<tr>
								<td>영화감독</td>
								<td><input type="text" name="movieDirector"></td>
							</tr>
							<tr>
								<td>영화배우</td>
								<td><input type="text" name="movieActor"></td>
							</tr>
							<tr>
								<td>영화등급(예:15)</td>
								<td><input type="text" name="grade"></td>
							</tr>
							<tr>
								<td>상영시간(예:180분)</td>
								<td><input type="text" name="runTime"></td>
							</tr>
							<tr>
								<td>상영날짜(예:2017-01-01)</td>
								<td><input type="text" name="releaseDate"></td>
							</tr>
							<tr>
								<td>종료일(예:2017-01-01)</td>
								<td><input type="text" name="endDate"></td>
							</tr>
							<tr>
								<td>줄거리</td>
								<td><textarea rows="7" cols="60" name="movieSummary"></textarea></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;"><input
									type="submit" value="등록" id="movieAddBtn"
									class="btn btn-primary" style="margin-right: 20px;"> <input
									type="button" value="취소" class="btn"></td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/yelloMovie/js/admin/fileUpImg.js"></script>
<script>
	var count = 0;
	$('#plus').click(function() {
		$('#steelCutPlus').append('<pre id="cut'+count+'"><input type="file" name="steelCutFileImg" style="float:left;"><button onclick="minus('+ count + ')">-</button></pre>');
		count++;
	});
	function minus(cutcount) {
		var parent = document.getElementById('cut' + cutcount);
		parent.parentNode.removeChild(parent);
	}
</script>
</html>