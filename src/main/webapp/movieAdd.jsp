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
		<%-- <%@include file="../adminCommonsViews/adminHeader.jsp"%> --%>
		<div class="container">
		<%-- 	<%@include file="../adminCommonsViews/adminNavi.jsp"%> --%>
			<div class="col-xs-10"
				style="padding: 0px; padding-left: 5px; border-left: 1px solid #E1E1E1; height: 1900px;">
				<ul class="nav nav-tabs">
					<li><a href="adminMovieList.do">영화목록</a></li>
					<li class="active"><a href="adminMovieAdd.do">영화등록</a></li>
				</ul>
				
				
				<form id="movieAdd" enctype="multipart/form-data" method="post" action="adminMovieAdd.do">
					<div class="container">
						<h3>타이틀 컷</h3>
						<input type="button" class="btn" style="height: 100px; width: 100px; float: left; margin-left: 10px;" value="title이미지">
						<br> <br> <br> <br> <input type="file" name="movieTitleImg">
						<hr>
						<h3>스틸컷</h3>
						<input type="file" name="steelCutFileImg" style="float: left;">
						<input type="button" value="+" id="plus">
						<p id="steelCutPlus"></p>
						<hr>
						<h3>상세정보</h3>
						
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>

<script>
	var count = 0;
	$('#plus').click(function() {
		$('#steelCutPlus').append('<div id="cut'+count+'"><input type="file" name="steelCutFileImg" style="float:left;"><button onclick="minus('+ count +')">-</button></div>');
		count++;
	});
	function minus(cutcount) {
		var parent = document.getElementById('cut' + cutcount);
		parent.parentNode.removeChild(parent);
	}
	$('#movieAddBtn').click(function() {
		$('#movieAdd').submit();
	});
</script>
</html>