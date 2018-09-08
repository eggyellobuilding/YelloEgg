<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>관리자 페이지</title>
<link href="/yelloMovie/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/yelloMovie/css/admin/header.css" type="text/css"
	rel="stylesheet">

<script>
	function repleDel(repleNum){
		location.href = 'adminRepleDel.do?repleIdx='+repleNum;
	}
	function upGo() {
		location.href = 'adminMovieUpdate.do';
	}
	function addGo() {
		location.href = 'adminMovieAdd.do';
	}
</script>
</head>
<body>
	<div class="container">
		<%@include file="../adminCommonsViews/adminHeader.jsp"%>
		<div class="container">
			<%@include file="../adminCommonsViews/adminNavi.jsp"%>
			<div class="col-xs-10"
				style="padding: 0px; padding-left: 5px; border-left: 1px solid #E1E1E1; height: 1900px;">
				<ul class="nav nav-tabs">
					<li class="active"><a href="adminMovieList.do"
						data-toggle="tab">영화목록</a></li>
					<li><a href="adminMovieAdd.do">영화등록</a></li>
				</ul>
				<div class="container">
					<div style="margin-left: 860px;">
					<form action="searchMovie.do">
						<select name="searchMovie">
							<option value="movieName">영화이름</option>
							<option value="movieGenre">영화장르</option>
							<option value="movieDistributer">배급사</option>
						</select> 
						<input type="text" name="searchContent">
						<input type="submit" value="검색">
					</form>	
					</div>
					<table class="table table-striped">
						<tr>
							<td>인덱스</td>
							<td>영화이름</td>
							<td>영화감독</td>
							<td>영화배우</td>
							<td>영화장르</td>
							<td>상영시간</td>
							<td>영화등급</td>
							<td>상영날짜</td>
							<td>상영종료</td>
							<td>배급사</td>
							<td>버튼</td>
						</tr>
						
						<c:if test="${empty searchList }">
						<c:if test="${empty movieList }">
							<tr>
								<td colspan="11" style="font-size: 30px;">등록된 영화가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!empty movieList }">
							<c:forEach var="movieList" items="${movieList}">
							<c:set var="count" value="${count + 1}" />
								<tr>
									<td>${movieList.movieIdx}</td>
									<td>${movieList.movieName}</td>
									<td>${movieList.movieDirector}</td>
									<td>${movieList.movieActor}</td>
									<td>${movieList.movieGenre}</td>
									<td>${movieList.movieRunTime}</td>
									<td>${movieList.movieGrade}</td>
									<td>${movieList.releaseDate}</td>
									<td>${movieList.endDate}</td>
									<td>${movieList.movieDistributer}</td>
									<td>
										<!-- 감상평 정보 모달 -->
										<button type="button" class="btn" data-toggle="modal"
											data-target="#ReplyModal${count}">감상평
											보기</button> <!-- reply Modal -->
										<div class="modal fade" id="ReplyModal${count}"
											tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
											aria-hidden="true">
											<div class="modal-dialog" style="margin-left: 380px;">
												<div class="modal-content" style="width: 1200px;">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
														<h4 class="modal-title" id="myModalLabel">감상평</h4>
													</div>
													<div class="modal-body">
														<table class="table table-hover">
															<tr>
																<td>No</td>
																<td>Name</td>
																<td>Content</td>
																<td>Btn</td>
															</tr>
															<c:forEach var="rep" items="${repList}">
															<c:if test="${rep.repleMovieIdx == movieList.movieIdx}">
															<tr>
																<td>${rep.repleIdx}</td>
																<td>${rep.id}</td>
																<td>${rep.repleContent}</td>
																<td><input type="button" class="btn btn-primary" onclick="repleDel(${rep.repleIdx})" value="삭제"></td>
															</tr>
															</c:if>
															</c:forEach>
														</table>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-primary"
															data-dismiss="modal">닫기</button>
													</div>
												</div>
											</div>
										</div> <!-- 영화정보 수정 모달 -->
										<form id="movieUpdateForm${count }">
										<!-- <form id="movieAdd" enctype="multipart/form-data" method="post" action="adminMovieAdd.do"> -->
										<%-- <button type="button" class="btn btn-primary"
											data-toggle="modal"
											data-target="#movieUpdateModal${count}">영화
											수정</button> --%> <!-- movie Update Modal -->
										<div class="modal fade"
											id="movieUpdateModal${count}" tabindex="-1"
											role="dialog" aria-labelledby="myModalLabel"
											aria-hidden="true">
											<div class="modal-dialog"
												style="margin-left: 320px; width: 1300px;">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
														<h4 class="modal-title" id="myModalLabel">영화정보 수정</h4>
													</div>
													<div class="modal-body">
														<div class="container">
															<h3>타이틀 컷</h3>
															<div id="View_area${count}" style="position:relative; color: black; border: 0px solid black; dispaly: inline;">
															<img id="prev_View_area${count}" alt="TitleCut" src="${movieList.movieTitleCut}" style="height: 200px;width: 200px;">
															</div>
															<div id="ti${count }">
															<input type="text" value="${movieList.movieTitleCut }" readonly="readonly" class="form-control" style="float: left; width: 1115px;" id="tCutInfo${count }" name="tCutInfo">
															<input type="button" value="삭제" id="tCutDelBtn${count}"class="btn btn-primary" onclick="imgDelete('ti'+${count})"></div>
															<pre><input type="file" name="movieTitleImg" id="titleCutImg${count}" onchange="previewImage(this,'View_area${count}','ti${count }')"></pre>
															
															<h3>스틸컷</h3>
															<c:forEach var="steelCutLists" items="${steelCutList}">
															<c:if test="${steelCutLists.steelCutMovieIdx==movieList.movieIdx }" >
															
															<div><input type="text" value="${steelCutLists.steelCutFileName }" readonly="readonly" class="form-control" style="float: left; width: 1115px;" id="sCutInfo${count }" name="sCutInfo">
															<input type="button" value="삭제" id="sCutDelBtn${count}"class="btn btn-primary" onclick="imgDelete(sCutInfo${count})"></div>
															
															</c:if>
															</c:forEach>
															<pre><input type="file" name="steelCutFileImg"
																	style="float: left;"><input type="button"
																	value="+" id="plus${count}" onclick="cutUpdate(${count})"></pre>
															<p id="steelCutPlus${count}"></p>
															<h3>상세정보</h3>
															<table class="table table-hover">
																<tr>
																	<td>배급사</td>
																	<td><input type="text" name="movieDistributer"
																		value="${movieList.movieDistributer}"></td>
																</tr>
																<tr>
																	<td>영화제목</td>
																	<td><input type="text" name="movieName"
																		value="${movieList.movieName}"></td>
																</tr>
																<tr>
																	<td>영화장르</td>
																	<td><input type="text" name="movieGenre"
																		value="${movieList.movieGenre}"></td>
																</tr>
																<tr>
																	<td>영화감독</td>
																	<td><input type="text" name="movieDirector"
																		value="${movieList.movieDirector}"></td>
																</tr>
																<tr>
																	<td>영화배우</td>
																	<td><input type="text" name="movieActor"
																		value="${movieList.movieActor}"></td>
																</tr>
																<tr>
																	<td>영화등급(예:15)</td>
																	<td><input type="text" name="grade"
																		value="${movieList.movieGrade}"></td>
																</tr>
																<tr>
																	<td>상영시간(예:180분)</td>
																	<td><input type="text" name="runTime"
																		value="${movieList.movieRunTime}"></td>
																</tr>
																<tr>
																	<td>상영날짜(예:2017-01-01)</td>
																	<td><input type="text" name="releaseDate"
																		value="${movieList.releaseDate}"></td>
																</tr>
																<tr>
																	<td>종료일(예:2017-01-01)</td>
																	<td><input type="text" name="endDate"
																		value="${movieList.endDate}"></td>
																</tr>
																<tr>
																	<td>줄거리</td>
																	<td><textarea rows="7" cols="60"
																			name="movieSummary">${movieList.movieSummary }</textarea></td>
																</tr>
															</table>
														</div>
														<!-- </form> -->
														
													</div>
													<div class="modal-footer" style="display: none;">
														<input type="button" class="btn btn-primary"
															data-dismiss="modal" style="margin-right: 580px;" value="수정완료">
													</div>
												</div>
											</div>
										</div>
										</form>	
									</td>
								</tr>
							</c:forEach>
							</c:if>
						</c:if>
						<c:if test="${!empty searchList }">
							<c:forEach var="searchInfo" items="${searchList}">
							<c:set var="count" value="${count + 1}" />
								<tr>
									<td>${searchInfo.movieIdx}</td>
									<td>${searchInfo.movieName}</td>
									<td>${searchInfo.movieDirector}</td>
									<td>${searchInfo.movieActor}</td>
									<td>${searchInfo.movieGenre}</td>
									<td>${searchInfo.movieRunTime}</td>
									<td>${searchInfo.movieGrade}</td>
									<td>${searchInfo.releaseDate}</td>
									<td>${searchInfo.endDate}</td>
									<td>${searchInfo.movieDistributer}</td>
									<td>
										<!-- 감상평 정보 모달 -->
										<button type="button" class="btn" data-toggle="modal"
											data-target="#ReplyModal${count}">감상평
											보기</button> <!-- reply Modal -->
										<div class="modal fade" id="ReplyModal${count}"
											tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
											aria-hidden="true">
											<div class="modal-dialog" style="margin-left: 380px;">
												<div class="modal-content" style="width: 1200px;">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
														<h4 class="modal-title" id="myModalLabel">감상평</h4>
													</div>
													<div class="modal-body">
														<table class="table table-hover">
															<tr>
																<td>No</td>
																<td>Name</td>
																<td>Content</td>
																<td>Btn</td>
															</tr>
															<c:forEach var="rep" items="${repList}">
															<c:if test="${rep.repleMovieIdx == searchInfo.movieIdx}">
															<tr>
																<td>${rep.repleIdx}</td>
																<td>${rep.id}</td>
																<td>${rep.repleContent}</td>
																<td><input type="button" class="btn btn-primary" onclick="repleDel(${rep.repleIdx})" value="삭제"></td>
															</tr>
															</c:if>
															</c:forEach>
														</table>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-primary"
															data-dismiss="modal">닫기</button>
													</div>
												</div>
											</div>
										</div> <!-- 영화정보 수정 모달 -->
										<form id="movieUpdateForm${count }">
										<!-- <form id="movieAdd" enctype="multipart/form-data" method="post" action="adminMovieAdd.do"> -->
										<%-- <button type="button" class="btn btn-primary"
											data-toggle="modal"
											data-target="#movieUpdateModal${count}">영화
											수정</button> --%> <!-- movie Update Modal -->
										<div class="modal fade"
											id="movieUpdateModal${count}" tabindex="-1"
											role="dialog" aria-labelledby="myModalLabel"
											aria-hidden="true">
											<div class="modal-dialog"
												style="margin-left: 320px; width: 1300px;">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
														<h4 class="modal-title" id="myModalLabel">영화정보 수정</h4>
													</div>
													<div class="modal-body">
														<div class="container">
															<h3>타이틀 컷</h3>
															<div id="View_area${count}" style="position:relative; color: black; border: 0px solid black; dispaly: inline;">
															<img id="prev_View_area${count}" alt="TitleCut" src="${searchInfo.movieTitleCut}" style="height: 200px;width: 200px;">
															</div>
															<div id="ti${count }">
															<input type="text" value="${searchInfo.movieTitleCut }" readonly="readonly" class="form-control" style="float: left; width: 1115px;" id="tCutInfo${count }" name="tCutInfo">
															<input type="button" value="삭제" id="tCutDelBtn${count}"class="btn btn-primary" onclick="imgDelete('ti'+${count})"></div>
															<pre><input type="file" name="movieTitleImg" id="titleCutImg${count}" onchange="previewImage(this,'View_area${count}','ti${count }')"></pre>
															
															<h3>스틸컷</h3>
															<c:forEach var="steelCutLists" items="${steelCutList}">
															<c:if test="${steelCutLists.steelCutMovieIdx==searchInfo.movieIdx }" >
															
															<div><input type="text" value="${steelCutLists.steelCutFileName }" readonly="readonly" class="form-control" style="float: left; width: 1115px;" id="sCutInfo${count }" name="sCutInfo">
															<input type="button" value="삭제" id="sCutDelBtn${count}"class="btn btn-primary" onclick="imgDelete(sCutInfo${count})"></div>
															
															</c:if>
															</c:forEach>
															<pre><input type="file" name="steelCutFileImg"
																	style="float: left;"><input type="button"
																	value="+" id="plus${count}" onclick="cutUpdate(${count})"></pre>
															<p id="steelCutPlus${count}"></p>
															<h3>상세정보</h3>
															<table class="table table-hover">
																<tr>
																	<td>배급사</td>
																	<td><input type="text" name="movieDistributer"
																		value="${searchInfo.movieDistributer}"></td>
																</tr>
																<tr>
																	<td>영화제목</td>
																	<td><input type="text" name="movieName"
																		value="${searchInfo.movieName}"></td>
																</tr>
																<tr>
																	<td>영화장르</td>
																	<td><input type="text" name="movieGenre"
																		value="${searchInfo.movieGenre}"></td>
																</tr>
																<tr>
																	<td>영화감독</td>
																	<td><input type="text" name="movieDirector"
																		value="${searchInfo.movieDirector}"></td>
																</tr>
																<tr>
																	<td>영화배우</td>
																	<td><input type="text" name="movieActor"
																		value="${searchInfo.movieActor}"></td>
																</tr>
																<tr>
																	<td>영화등급(예:15)</td>
																	<td><input type="text" name="grade"
																		value="${searchInfo.movieGrade}"></td>
																</tr>
																<tr>
																	<td>상영시간(예:180분)</td>
																	<td><input type="text" name="runTime"
																		value="${searchInfo.movieRunTime}"></td>
																</tr>
																<tr>
																	<td>상영날짜(예:2017-01-01)</td>
																	<td><input type="text" name="releaseDate"
																		value="${searchInfo.releaseDate}"></td>
																</tr>
																<tr>
																	<td>종료일(예:2017-01-01)</td>
																	<td><input type="text" name="endDate"
																		value="${searchInfo.endDate}"></td>
																</tr>
																<tr>
																	<td>줄거리</td>
																	<td><textarea rows="7" cols="60"
																			name="movieSummary">${searchInfo.movieSummary }</textarea></td>
																</tr>
															</table>
														</div>
													</div>
													<div class="modal-footer" style="display: none;">
														<input type="button" class="btn btn-primary"
															data-dismiss="modal" style="margin-right: 580px;" value="수정완료">
													</div>
												</div>
											</div>
										</div>
										</form>	
									</td>
								</tr>
							</c:forEach>							
							
						</c:if>
					</table>
					<c:if test="${!empty movieList }">
						<div align="center">${requestScope.pagestr }</div>
					</c:if>
					<c:if test="${!empty searchList }">
						<div align="center">${requestScope.pagestr }</div>
					</c:if>					
				</div>
			</div>
		</div>
	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/yelloMovie/js/admin/fileUpImg.js"></script>
<script>
function cutUpdate(count){
	$('#steelCutPlus'+count).append(
		'<pre id="cut'+count+'"><input type="file" name="steelCutFileImg" style="float: left;"><button onclick="minus('
		+ count + ')">-</button></pre>');
		count++;
}
function minus(cutcount) {
	var parent = document.getElementById('cut' + cutcount);
	parent.parentNode.removeChild(parent);
}

function imgDelete(movieImg){
	$('#'+movieImg).css('display','none');
}
</script>
</html>