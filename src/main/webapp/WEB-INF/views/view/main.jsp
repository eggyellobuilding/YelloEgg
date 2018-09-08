<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Yello egg</title>

<link href="/yelloMovie/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/yelloMovie/css/movie/movieInfo.css" rel="stylesheet">
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="js/movieList.js"></script>
<!-- <script type="text/javascript" src="js/view/main.js"></script> -->
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
<script type="text/javascript">

/** 별점 넣기 */
function starScore(score,mvIdx){
	var star = document.getElementById('score'+mvIdx);
	star.value=score;
	$('.starRev span').parent().children('span').removeClass('on');
	
	for(var i = 1; i<=score; i++){
		
		$('.st'+i).addClass('on');
		//return false;
	}
}

//영화 박스오피스 AJAX
function mainBox(){
	sendRequest('office.do',null,boxResult,'GET');
}

function boxResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			var objData=eval('('+data+')');
			var lists = objData.movie;
			var stCutList = objData.movieSteelCut;
			var repList = objData.movieReple;
			var mv = '';
			var movie = document.getElementById('movie');
			var steelCutNumCount = 0;
			var ageAll = document.getElementsByClassName('mg0');
			for(var i = 0; i<lists.length; i++){
				mv+='<div id="movie'+i+'"><ul class="col-xs-2" style="margin-left:25px; width:250px;">';
				mv+='<li style="heigth:360px; width:250px; border:1px; solid gray">';
				mv+='<img alt="yelloMovie" src="'+lists[i].movieTitleCut+'" style="width:250px; height:358px;"></li>';				
				mv+='<li style="height:30px; width:250px; border:1px solid gray; padding-top:2px;">';
				if(lists[i].movieGrade==0){
					mv+='<span class="mg'+lists[i].movieGrade+'" style="padding:3px; border-radius:5px; margin-left: 5px; font-size:17px; margin-right: 5px;">All</span>'; 
				}else{
					mv+='<span class="mg'+lists[i].movieGrade+'" style="padding:3px; border-radius:5px; margin-left: 5px; font-size:17px; margin-right: 5px;">'+lists[i].movieGrade+'</span>'; 
				} 
				mv+='<span style="font-size: 17px;">'+lists[i].movieName+'</span></li>';
				mv+='<li style="height:50px; width:250px; border:1px solid gray; padding-top:7px;">';
				mv+='<a href="#" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#movieOf'+i+'"style="margin-left:35px; margin-right:30px;">상세정보</a>';
				mv+='<a href="movieReservation.do" class="btn btn-warning btn-sm">예약하기</a></li></ul>';
				mv+='<div class="modal fade" id="movieOf'+i+'" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">';
				mv+='<div class="modal-dialog" style="width: 700px;">';
				mv+='<div class="modal-content">';
				mv+='<div class="modal-body">';
				mv+='<img alt="" src="'+lists[i].movieTitleCut+'" style="height: 250px; width: 200px; float: left; margin-right: 10px; margin-top: 20px;">';
				mv+='<button type="button" class="close" data-dismiss="modal" aria-label="Close">';
				mv+='<span aria-hidden="true">&times;</span></button>';
				mv+='<div id="mname'+i+'" style="margin-top: 40px;font-size:25px;">';
				if(lists[i].movieGrade==0){
					mv+='<span class="mg'+lists[i].movieGrade+'" style="padding:3px; border-radius:5px;">All</span>';
				}else{
					mv+='<span class="mg'+lists[i].movieGrade+'" style="padding:3px; border-radius:5px; margin-left:10px; margin-right:5px;">'+lists[i].movieGrade+'</span>';
				}
				mv+='<span>'+lists[i].movieName+'</span></div><hr>';
				mv+='<div class="topInfo" id="mrel'+i+'">개봉일:'+lists[i].movieReleaseDate+'</div>';
				mv+='<div class="topInfo" id="mdir'+i+'">감독:'+lists[i].movieDirector+'</div>';
				mv+='<div class="topInfo" id="mact'+i+'">배우:'+lists[i].movieActor+'</div>';
				mv+='<div class="topInfo" id="mgen'+i+'">장르:'+lists[i].movieGenre+'</div>';
				mv+='<div class="topInfo" id="mdis'+i+'">배급사:'+lists[i].movieDistributer+'</div><br> <br>';
				mv+='<div><h4 style="margin-top: 20px;">줄거리</h4><div id="msum'+i+'">'+lists[i].movieSummary+'</div><hr></div>';
				mv+='<div><h4>스틸컷</h4><div id="carousel-example-generic'+i+'"class="carousel slide"';
				mv+='data-interval="false" style="background-color: black; padding-top: 10px; padding-bottom: 10px;">';
				//Wrapper for slides
				mv+='<div class="carousel-inner" role="listbox">';
			for(var j = 0; j<stCutList.length; j++){
				
				if(stCutList[j].steelCutMovieIdx == lists[i].movieIdx){
					if(steelCutNumCount==0){
						mv+='<div class="item active" id="item'+j+'"style="margin-left: 87px;">';
					}else{
						mv+='<div class="item '+j+'" id="item'+j+'"style="margin-left: 87px;">';
					}
						mv+='<img src="'+stCutList[j].steelCutFileName+'" alt="yelloMovie" style="height: 600px; width: 500px; float: left; padding-right: 10px;"></div>';
						steelCutNumCount+=1;
					}
				}
				steelCutNumCount=0;
				mv+='</div>';
				//Controls
				mv+='<a class="left carousel-control"href="#carousel-example-generic'+i+'" role="button"data-slide="prev">';
				mv+='<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>';
				mv+='<span class="sr-only">Previous</span></a>';
				mv+='<a class="right carousel-control" href="#carousel-example-generic'+i+'" role="button" data-slide="next">';
				mv+='<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>';
				mv+='<span class="sr-only">Next</span></a>';
				mv+='</div></div><br>';
				mv+='<div><h4>감상평</h4><br>';
				mv+='<div class="starRev" style="padding-bottom: 10px;">';
				mv+='<span class="starR st1 on" onclick="starScore(1,'+lists[i].movieIdx+')">별1</span> <span class="starR st2" onclick="starScore(2,'+lists[i].movieIdx+')">별2</span>';
				mv+='<span class="starR st3" onclick="starScore(3,'+lists[i].movieIdx+')">별3</span> <span class="starR st4" onclick="starScore(4,'+lists[i].movieIdx+')">별4</span>';
				mv+='<span class="starR st5" style="margin-right:25px;" onclick="starScore(5,'+lists[i].movieIdx+')">별5</span>';
				mv+='<input type="text" name="repleContent" style="width: 460px;" id="content'+lists[i].movieIdx+'">';
				mv+='<input type="button" value="등록" class="btn" onclick="repAdd('+lists[i].movieIdx+')">';
				mv+='<input type="hidden" value="${sessionScope.smdto.memberIdx}" name="reMemberIdx" id="member'+lists[i].movieIdx+'">';
				mv+='<input type="hidden" value="1" name="reScore" id="score'+lists[i].movieIdx+'">';
				mv+='<input type="hidden" value="'+lists[i].movieIdx+'" name="reMovieIdx" id="movie'+lists[i].movieIdx+'"></div>';
				mv+='<div style="overflow-y: scroll;width: 660px; height: 450px;">';
				mv+='<div id="repList'+lists[i].movieIdx+'">';	 
				for(var r = 0; r<repList.length; r++){
				mv+='<div>';
				if(lists[i].movieIdx==repList[r].repleMovieIdx){
				mv+='<div style="width:433px; float:left;"><span style="font-size: 19px; color:#FF5E00">'+repList[r].id+'</span><br>';	
				mv+=repList[r].repleDate;
				for(var star = 1; star<=5; star++){
					if(repList[r].repleScore>=star){
						mv+='<img src="img/star/star_1.png" style="width: 18px;">';
					}else if(repList[r].repleScore<star){
						mv+='<img src="img/star/star_2.png" style="width: 18px;">';
					}
				}
				mv+='<br>'+repList.repleContent+'<br><hr></div>';
				}
				mv+='</div>';
				}
				mv+='</div>';
				mv+='</div>';
				mv+='</div>';
				mv+='</div>';
				mv+='</div>';
				mv+='</div>';
				mv+='</div>';
			} 
			mv+='</div>';
			mv+='</div>';
		}
		movie.innerHTML=mv;
		
		ageAll.innerHTML="<span class='mg0' style='padding:3px; border-radius:5px;'>All</span>";
	}
}

//최신개봉작
function mainLat(){
	sendRequest('latest.do',null,latResult,'GET');
}
function latResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			var objData=eval('('+data+')');
			var lists = objData.movie;
			var stCutList = objData.movieSteelCut;
			var repList = objData.movieReple;
			var mv = '';
			var movie = document.getElementById('movie');
			var steelCutNumCount = 0;
			var ageAll = document.getElementsByClassName('mg0');
			for(var i = 0; i<lists.length; i++){
				mv+='<div id="movie'+i+'"><ul class="col-xs-2" style="margin-left:25px; width:250px;">';
				mv+='<li style="heigth:360px; width:250px; border:1px; solid gray">';
				mv+='<img alt="yelloMovie" src="'+lists[i].movieTitleCut+'" style="width:250px; height:358px;"></li>';				
				//mv+='<li style="height: 40px; width: 250px; border: 1px solid gray; padding-top: 10px; text-align:center;">평점 '+lists[i].moviereplescoreavg+'</li>';
				mv+='<li style="height:30px; width:250px; border:1px solid gray; padding-top:2px;">';
				if(lists[i].movieGrade==0){
					mv+='<span class="mg'+lists[i].movieGrade+'" style="padding:3px; border-radius:5px; margin-left: 5px; font-size:17px; margin-right: 5px;">All</span>'; 
				}else{
					mv+='<span class="mg'+lists[i].movieGrade+'" style="padding:3px; border-radius:5px; margin-left: 5px; font-size:17px; margin-right: 5px;">'+lists[i].movieGrade+'</span>'; 
				}
				mv+='<span style="font-size: 17px;">'+lists[i].movieName+'</span></li>';
				mv+='<li style="height:50px; width:250px; border:1px solid gray; padding-top:7px;">';
				mv+='<a href="#" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#movieOf'+i+'"style="margin-left:35px; margin-right:30px;">상세정보</a>';
				mv+='<a href="movieReservation.do" class="btn btn-warning btn-sm">예약하기</a></li></ul>';
				mv+='<div class="modal fade" id="movieOf'+i+'" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">';
				mv+='<div class="modal-dialog" style="width: 700px;">';
				mv+='<div class="modal-content">';
				mv+='<div class="modal-body">';
				mv+='<img alt="" src="'+lists[i].movieTitleCut+'" style="height: 250px; width: 200px; float: left; margin-right: 10px; margin-top: 20px;">';
				mv+='<button type="button" class="close" data-dismiss="modal" aria-label="Close">';
				mv+='<span aria-hidden="true">&times;</span></button>';
				mv+='<div id="mname'+i+'" style="margin-top: 40px;font-size:25px;">';
				if(lists[i].movieGrade==0){
					mv+='<span class="mg'+lists[i].movieGrade+'" style="padding:3px; border-radius:5px;">All</span>';
				}else{
					mv+='<span class="mg'+lists[i].movieGrade+'" style="padding:3px; border-radius:5px; margin-left:10px; margin-right:5px;">'+lists[i].movieGrade+'</span>';
				}
				mv+='<span>'+lists[i].movieName+'</span></div><hr>';
				mv+='<div class="topInfo" id="mrel'+i+'">개봉일:'+lists[i].movieReleaseDate+'</div>';
				mv+='<div class="topInfo" id="mdir'+i+'">감독:'+lists[i].movieDirector+'</div>';
				mv+='<div class="topInfo" id="mact'+i+'">배우:'+lists[i].movieActor+'</div>';
				mv+='<div class="topInfo" id="mgen'+i+'">장르:'+lists[i].movieGenre+'</div>';
				mv+='<div class="topInfo" id="mdis'+i+'">배급사:'+lists[i].movieDistributer+'</div><br> <br>';
				mv+='<div><h4 style="margin-top: 20px;">줄거리</h4><div id="msum'+i+'">'+lists[i].movieSummary+'</div><hr></div>';
				mv+='<div><h4>스틸컷</h4><div id="carousel-example-generic'+i+'"class="carousel slide"';
				mv+='data-interval="false" style="background-color: black; padding-top: 10px; padding-bottom: 10px;">';
				//Wrapper for slides
				mv+='<div class="carousel-inner" role="listbox">';
			for(var j = 0; j<stCutList.length; j++){
				
				if(stCutList[j].steelCutMovieIdx == lists[i].movieIdx){
					if(steelCutNumCount==0){
						mv+='<div class="item active" id="item'+j+'"style="margin-left: 87px;">';
					}else{
						mv+='<div class="item '+j+'" id="item'+j+'"style="margin-left: 87px;">';
					}
						mv+='<img src="'+stCutList[j].steelCutFileName+'" alt="yelloMovie" style="height: 600px; width: 500px; float: left; padding-right: 10px;"></div>';
						steelCutNumCount+=1;
					}
				}
				steelCutNumCount=0;
				mv+='</div>';
				//Controls
				mv+='<a class="left carousel-control"href="#carousel-example-generic'+i+'" role="button"data-slide="prev">';
				mv+='<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>';
				mv+='<span class="sr-only">Previous</span></a>';
				mv+='<a class="right carousel-control" href="#carousel-example-generic'+i+'" role="button" data-slide="next">';
				mv+='<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>';
				mv+='<span class="sr-only">Next</span></a>';
				mv+='</div></div><br>';
				mv+='<div><h4>감상평</h4><br>';
				mv+='<div class="starRev" style="padding-bottom: 10px;">';
				mv+='<span class="starR st1 on" onclick="starScore(1,'+lists[i].movieIdx+')">별1</span> <span class="starR st2" onclick="starScore(2,'+lists[i].movieIdx+')">별2</span>';
				mv+='<span class="starR st3" onclick="starScore(3,'+lists[i].movieIdx+')">별3</span> <span class="starR st4" onclick="starScore(4,'+lists[i].movieIdx+')">별4</span>';
				mv+='<span class="starR st5" style="margin-right:25px;" onclick="starScore(5,'+lists[i].movieIdx+')">별5</span>';
				mv+='<input type="text" name="repleContent" style="width: 460px;" id="content'+lists[i].movieIdx+'">';
				mv+='<input type="button" value="등록" class="btn" onclick="repAdd('+lists[i].movieIdx+')">';
				mv+='<input type="hidden" value="${sessionScope.smdto.memberIdx}" name="reMemberIdx" id="member'+lists[i].movieIdx+'">';
				mv+='<input type="hidden" value="1" name="reScore"  id="score'+lists[i].movieIdx+'">';
				mv+='<input type="hidden" value="'+lists[i].movieIdx+'" name="reMovieIdx" id="movie'+lists[i].movieIdx+'"></div>';
				mv+='<div style="overflow-y: scroll;width: 660px; height: 450px;">';
				mv+='<div id="repList'+lists[i].movieIdx+'">';	 
				for(var r = 0; r<repList.length; r++){
				mv+='<div>';
				if(lists[i].movieIdx==repList[r].repleMovieIdx){
				mv+='<div style="width:433px; float:left;"><span style="font-size: 19px; color:#FF5E00">'+repList[r].id+'</span><br>';	
				mv+=repList[r].repleDate;
				for(var star = 1; star<=5; star++){
					if(repList[r].repleScore>=star){
						mv+='<img src="img/star/star_1.png" style="width: 20px;">';
					}else if(repList[r].repleScore<star){
						mv+='<img src="img/star/star_2.png" style="width: 20px;">';
					}
				}
				mv+='<br>'+repList.repleContent+'<br><hr></div>';
				}
				mv+='</div>';
				}
				mv+='</div>';
				mv+='</div>';
				mv+='</div>';
				mv+='</div>';
				mv+='</div>';
				mv+='</div>';
				mv+='</div>';
			} 
			mv+='</div>';
			mv+='</div>';
		}
		movie.innerHTML=mv;
		
		
	}
}

//상영예정작
function mainExp(){
	sendRequest('expectation.do',null,expResult,'GET');
}
function expResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			var objData=eval('('+data+')');
			var lists = objData.movie;
			var stCutList = objData.movieSteelCut;
			var repList = objData.movieReple;
			var mv = '';
			var movie = document.getElementById('movie');
			var steelCutNumCount = 0;
			var ageAll = document.getElementsByClassName('mg0');
			for(var i = 0; i<lists.length; i++){
				mv+='<div id="movie'+i+'"><ul class="col-xs-2" style="margin-left:25px; width:250px;">';
				mv+='<li style="heigth:360px; width:250px; border:1px; solid gray">';
				mv+='<img alt="yelloMovie" src="'+lists[i].movieTitleCut+'" style="width:250px; height:358px;"></li>';				
				//mv+='<li style="height: 40px; width: 250px; border: 1px solid gray; padding-top: 10px; text-align:center;">평점 '+lists[i].moviereplescoreavg+'</li>';
				mv+='<li style="height:30px; width:250px; border:1px solid gray; padding-top:2px;">';
				if(lists[i].movieGrade==0){
					mv+='<span class="mg'+lists[i].movieGrade+'" style="padding:3px; border-radius:5px; margin-left: 5px; font-size:17px; margin-right: 5px;">All</span>'; 
				}else{
					mv+='<span class="mg'+lists[i].movieGrade+'" style="padding:3px; border-radius:5px; margin-left: 5px; font-size:17px; margin-right: 5px;">'+lists[i].movieGrade+'</span>'; 
				}
				mv+='<span style="font-size: 17px;">'+lists[i].movieName+'</span></li>';
				mv+='<li style="height:50px; width:250px; border:1px solid gray; padding-top:7px;">';
				mv+='<a href="#" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#movieOf'+i+'"style="margin-left:35px; margin-right:30px;">상세정보</a>';
				mv+='<a href="movieReservation.do" class="btn btn-warning btn-sm">예약하기</a></li></ul>';
				mv+='<div class="modal fade" id="movieOf'+i+'" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">';
				mv+='<div class="modal-dialog" style="width: 700px;">';
				mv+='<div class="modal-content">';
				mv+='<div class="modal-body">';
				mv+='<img alt="" src="'+lists[i].movieTitleCut+'" style="height: 250px; width: 200px; float: left; margin-right: 10px; margin-top: 20px;">';
				mv+='<button type="button" class="close" data-dismiss="modal" aria-label="Close">';
				mv+='<span aria-hidden="true">&times;</span></button>';
				mv+='<div id="mname'+i+'" style="margin-top: 40px;font-size:25px;">';
				if(lists[i].movieGrade==0){
					mv+='<span class="mg'+lists[i].movieGrade+'" style="padding:3px; border-radius:5px;">All</span>';
				}else{
					mv+='<span class="mg'+lists[i].movieGrade+'" style="padding:3px; border-radius:5px; margin-left:10px; margin-right:5px;">'+lists[i].movieGrade+'</span>';
				}
				mv+='<span>'+lists[i].movieName+'</span></div><hr>';
				mv+='<div class="topInfo" id="mrel'+i+'">개봉일:'+lists[i].movieReleaseDate+'</div>';
				mv+='<div class="topInfo" id="mdir'+i+'">감독:'+lists[i].movieDirector+'</div>';
				mv+='<div class="topInfo" id="mact'+i+'">배우:'+lists[i].movieActor+'</div>';
				mv+='<div class="topInfo" id="mgen'+i+'">장르:'+lists[i].movieGenre+'</div>';
				mv+='<div class="topInfo" id="mdis'+i+'">배급사:'+lists[i].movieDistributer+'</div><br> <br>';
				mv+='<div><h4 style="margin-top: 20px;">줄거리</h4><div id="msum'+i+'">'+lists[i].movieSummary+'</div><hr></div>';
				mv+='<div><h4>스틸컷</h4><div id="carousel-example-generic'+i+'"class="carousel slide"';
				mv+='data-interval="false" style="background-color: black; padding-top: 10px; padding-bottom: 10px;">';
				//Wrapper for slides
				mv+='<div class="carousel-inner" role="listbox">';
			for(var j = 0; j<stCutList.length; j++){
				
				if(stCutList[j].steelCutMovieIdx == lists[i].movieIdx){
					if(steelCutNumCount==0){
						mv+='<div class="item active" id="item'+j+'"style="margin-left: 87px;">';
					}else{
						mv+='<div class="item '+j+'" id="item'+j+'"style="margin-left: 87px;">';
					}
						mv+='<img src="'+stCutList[j].steelCutFileName+'" alt="yelloMovie" style="height: 600px; width: 500px; float: left; padding-right: 10px;"></div>';
						steelCutNumCount+=1;
					}
				}
				steelCutNumCount=0;
				mv+='</div>';
				//Controls
				mv+='<a class="left carousel-control"href="#carousel-example-generic'+i+'" role="button"data-slide="prev">';
				mv+='<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>';
				mv+='<span class="sr-only">Previous</span></a>';
				mv+='<a class="right carousel-control" href="#carousel-example-generic'+i+'" role="button" data-slide="next">';
				mv+='<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>';
				mv+='<span class="sr-only">Next</span></a>';
				mv+='</div></div><br>';
				mv+='<div><h4>감상평</h4><br>';
				mv+='<div class="starRev" style="padding-bottom: 10px;">';
				mv+='<span class="starR st1 on" onclick="starScore(1,'+lists[i].movieIdx+')">별1</span> <span class="starR st2" onclick="starScore(2,'+lists[i].movieIdx+')">별2</span>';
				mv+='<span class="starR st3" onclick="starScore(3,'+lists[i].movieIdx+')">별3</span> <span class="starR st4" onclick="starScore(4,'+lists[i].movieIdx+')">별4</span>';
				mv+='<span class="starR st5" style="margin-right:25px;" onclick="starScore(5,'+lists[i].movieIdx+')">별5</span>';
				mv+='<input type="text" name="repleContent" style="width: 460px;" id="content'+lists[i].movieIdx+'">';
				mv+='<input type="button" value="등록" class="btn" onclick="repAdd('+lists[i].movieIdx+')">';
				mv+='<input type="hidden" value="${sessionScope.smdto.memberIdx}" name="reMemberIdx" id="member'+lists[i].movieIdx+'">';
				mv+='<input type="hidden" value="1" name="reScore"  id="score'+lists[i].movieIdx+'">';
				mv+='<input type="hidden" value="'+lists[i].movieIdx+'" name="reMovieIdx" id="movie'+lists[i].movieIdx+'"></div>';
				mv+='<div style="overflow-y: scroll;width: 660px; height: 450px;">';
				mv+='<div id="repList'+lists[i].movieIdx+'">';	 
				for(var r = 0; r<repList.length; r++){
				mv+='<div>';
				if(lists[i].movieIdx==repList[r].repleMovieIdx){
				mv+='<div style="width:433px; float:left;"><span style="font-size: 19px; color:#FF5E00">'+repList[r].id+'</span><br>';	
				mv+=repList[r].repleDate;
				for(var star = 1; star<=5; star++){
					if(repList[r].repleScore>=star){
						mv+='<img src="img/star/star_1.png" style="width: 18px;">';
					}else if(repList[r].repleScore<star){
						mv+='<img src="img/star/star_2.png" style="width: 18px;">';
					}
				}
				mv+='<br>'+repList.repleContent+'<br><hr></div>';
				}
				mv+='</div>';
				}
				mv+='</div>';
				mv+='</div>';
				mv+='</div>';
				mv+='</div>';
				mv+='</div>';
				mv+='</div>';
				mv+='</div>';
			} 
			mv+='</div>';
			mv+='</div>';
		}
		movie.innerHTML=mv;
	}
}

</script>
</head>
<body>
<%@include file="commonsView/header.jsp"%>
<input type="hidden" value="${sessionScope.smdto.memberIdx}" id="smidx">
<!-- 메인 캐러셀 -->
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="background-color:black ; padding-left: 200px; padding-right: 200px;">
  <!-- Indicators -->
  <ol class="carousel-indicators">
	<c:forEach var="mainCEG" items="${mainMovieCarousel}" varStatus="mceg">
    	<li data-target="#carousel-example-generic" data-slide-to="${mceg}" class="${mceg}"></li>
    </c:forEach>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <c:forEach var="mainC" items="${mainMovieCarousel}" varStatus="mc">
    	<div class="item ${mc.count}">
      		<img src="${mainC.movieTitleCut}" alt="..." style="width: 100%;height: 650px;margin-top: 26px;">
    	</div>
    </c:forEach>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<div style="margin-left:700px; padding-top: 20px;padding-bottom: 20px; width: 500px; height: 80px;" class="btn-group btn-group-justified" role="group" >
	<a class="btn" style="border: 1px solid;" onclick="mainBox()">박스오피스</a>
	<a class="btn" style="border: 1px solid;" onclick="mainLat()">최신개봉작</a>
	<a class="btn" style="border: 1px solid;" onclick="mainExp()">상영예정작</a>
</div>



<div class="row" style="margin: 25px auto; padding-left: 360px; padding-right: 280px;">
	<div id="movie">
		<c:forEach var="mainM" items="${mainMovie}" varStatus="mm">
			<c:set var="steelCutCount" value="${0}"/>
			<ul class="col-xs-2"
				style="display: inline; margin-left: 25px; width: 250px;">
				<li style="height: 360px; width: 250px; border: 1px solid gray;"><img
					alt="eggFire" src="${mainM.movieTitleCut}"
					style="width: 248px; height: 358px;"></li>
				
				<li
					style="height: 30px; width: 250px; border: 1px solid gray;padding-top: 2px; font-size: 17px;">
					<span class="mg${mainM.movieGrade}" style="padding:3px; border-radius:5px; margin-left: 5px; margin-right: 5px;">${mainM.movieGrade}</span> 
					<span>${mainM.movieName}</span></li>
				<li
					style="height: 50px; width: 250px; border: 1px solid gray; padding-top: 7px;">
					<a href="#" style="margin-left: 35px; margin-right: 30px;"
					class="btn btn-warning btn-sm" data-toggle="modal"
					data-target="#movieOff${mm.count-1}" id="aw${mm.count-1}">상세정보</a> 
					<a href="movieReservation.do" class="btn btn-warning btn-sm">예약하기</a>
				</li>
			</ul>
			
			<!-- Modal 상세정보 -->
			<div class="modal fade" id="movieOff${mm.count-1}" tabindex="-1"
				 role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" style="width: 700px;">
					<div class="modal-content">
						<div class="modal-body">
							<img alt="" src="${mainM.movieTitleCut}" style="height: 250px; width: 200px; float: left; margin-right: 10px; margin-top: 20px;">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<div id="mname${mm.count-1}" style="margin-top: 40px; font-size:25px; padding-left: ">
							<span class="mg${mainM.movieGrade}" style="padding:3px; border-radius:5px; margin-left: 10px; margin-right: 5px;">${mainM.movieGrade}</span>
							<span>${mainM.movieName}</span></div><hr>
							<div class="topInfo" id="mrel${mm.count-1}">개봉일:${mainM.movieReleaseDate}</div>
							<div class="topInfo" id="mdir${mm.count-1}">감독:${mainM.movieDirector }</div>
							<div class="topInfo" id="mact${mm.count-1}">배우:${mainM.movieActor}</div>
							<div class="topInfo" id="mgen${mm.count-1}">장르:${mainM.movieGenre }</div>
							<div class="topInfo" id="mdis${mm.count-1}">배급사:${mainM.movieDistributer}</div>
							<br> <br>
							<div>
								<h4 style="margin-top: 20px;">줄거리</h4>
								<div id="msum${mm.count-1}">${mainM.movieSummary}</div>
								<hr>
							</div>
							<div>
								<h4>스틸컷</h4>
								<div id="carousel-example-generic${mm.count-1}"
									class="carousel slide" data-interval="false"
									style="background-color: black; padding-top: 10px; padding-bottom: 10px;">

									<!-- Wrapper for slides -->
									<div class="carousel-inner" role="listbox">
										<c:forEach var="steelCutImg" items="${mainSteelCut}">
										<c:if test="${mainM.movieIdx==steelCutImg.steelCutMovieIdx}">
										<c:set var="steelCutCount" value="${steelCutCount+1}"></c:set>
											<div class="item ${steelCutCount}" id="item${steelCutCount}"style="margin-left: 87px;">
												<img src="${steelCutImg.steelCutFileName}" alt="..." style="height: 600px; width: 500px; float: left; padding-right: 10px;">
											</div>
										</c:if>	
										</c:forEach>
									</div>

									<!-- Controls -->
									<a class="left carousel-control"
										href="#carousel-example-generic${mm.count-1}" role="button"
										data-slide="prev"> <span
										class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
										<span class="sr-only">Previous</span>
									</a> <a class="right carousel-control"
										href="#carousel-example-generic${mm.count-1}" role="button"
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
								<div class="starRev" style="padding-bottom: 10px;">
									<span class="starR st1 on" onclick="starScore(1,${mainM.movieIdx})">별1</span> <span class="starR st2" onclick="starScore(2,${mainM.movieIdx})">별2</span>
									<span class="starR st3" onclick="starScore(3,${mainM.movieIdx})">별3</span> <span class="starR st4" onclick="starScore(4,${mainM.movieIdx})">별4</span>
									<span class="starR st5" onclick="starScore(5,${mainM.movieIdx})">별5</span>
									&nbsp;&nbsp;&nbsp;
									<input type="text" name="repleContent" style="width: 460px;" id="content${mainM.movieIdx}">
										<input type="button" value="등록" class="btn" onclick="repAdd(${mainM.movieIdx})">
										<input type="hidden" value="${sessionScope.smdto.memberIdx}" name="reMemberIdx" id="member${mainM.movieIdx}">
										<input type="hidden" value="1" name="reScore"  id="score${mainM.movieIdx}">
										<input type="hidden" value="${mainM.movieIdx}" name="reMovieIdx" id="movie${mainM.movieIdx}">
								</div>
								<div style="overflow-y: scroll;width: 660px; height: 450px; margin-top: 10px;">
								<div id="repList${mainM.movieIdx}">
								<c:forEach var="rep" items="${movieReple}">
									<div>
									<c:if test="${mainM.movieIdx==rep.repleMovieIdx}">
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
</div> 

<%@include file="commonsView/footer.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>

<script>
$(window).load(function(){
	$('.1').attr('class','item active');
	$('.mg0').html('<span class="mg0" style="padding:3px; border-radius:5px;">All</span>');
});
</script>
</body>
</html>