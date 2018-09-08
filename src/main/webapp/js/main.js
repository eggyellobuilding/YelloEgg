
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
				mv+='<a href="movieResrvation.do" class="btn btn-warning btn-sm">예약하기</a></li></ul>';
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
				mv+='<a href="movieResrvation.do" class="btn btn-warning btn-sm">예약하기</a></li></ul>';
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
				mv+='<a href="movieResrvation.do" class="btn btn-warning btn-sm">예약하기</a></li></ul>';
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
