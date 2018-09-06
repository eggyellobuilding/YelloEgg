<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<title>Yello egg</title>
<!-- 부트스트랩 -->
<link href="/yelloMovie/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="/yelloMovie/js/httpRequest.js"></script>
<link href="/yelloMovie/css/movie/reservationMovie.css" rel="stylesheet">
<script>
//영화 선택
function selectMovie(movieName , movieGrade,movieIdx,movieTitleCut){
	$('.movieActive').removeClass();
	$('#'+movieIdx).addClass('movieActive');
	
	var temp = "";
	var result = "";
	temp +=' <img id="movieTitleCut"src="'+movieTitleCut+'" style="width:74px;height:104px;">';
	temp +=' <ul id="movieDetail" style="display:inline-block;width:125px;height:104px;">';
	temp +=' <li id="movieTitle" style="color:white;">'+movieName+'<input type="hidden" id="movieIdx" value="'+movieIdx+'"></li>';
	temp +='<li id="movieGrade" style="color:white;margin-top: 17px;">'+movieGrade+'세 이용가</li>';
	temp += '</ul>';
	result = temp;
	$('#movieInfo').html(result);
}
$('document').ready(function(){
	$('.city').first().addClass('cityActive');
	
	var selectedCity = $('.cityActive').text();
	//영화관 이름 리스트
 	$.ajax({
		   url:'reservationCinemaNameJquery.do?cinemaCity='+selectedCity,
		   type:'post',
		   success:function(data){
			    var movieInfoList = data.cinemaName;
			    var temp = "";
			    var result = "";
			    
			    temp +='<ul class="list-group" style="height:100%;overflow-y: auto;overflow-x: hidden;">';
				for(var i = 0 ; i < movieInfoList.length ; i ++){
					var dto = movieInfoList[i]; 
					temp +='<li class="cinemaName" id="cinemaIdx'+dto.cinemaIdx+'" onclick="changeCinema('+dto.cinemaIdx+')">'+dto.cinemaName+'</li>';
				}
					temp += '</ul>';
					result  = temp;
					$('#cinemaNameList').html(result);
			   }
	   })
	   
 
//영화관 시
$('.city').click(function(){
	$('.cityActive').removeClass('cityActive');
	$(this).toggleClass('cityActive');
	var selectedCity = $('.cityActive').text();
	//영화관 이름 리스트
 	$.ajax({
		   url:'reservationCinemaNameJquery.do?cinemaCity='+selectedCity,
		   type:'post',
		   success:function(data){
			    var movieInfoList = data.cinemaName;
			    var temp = "";
			    var result = "";
			    
			    temp +='<ul class="list-group" style="height:100%;overflow-y: auto;overflow-x: hidden;">';
				for(var i = 0 ; i < movieInfoList.length ; i ++){
					var dto = movieInfoList[i]; 
					temp +='<li class="cinemaName" id="cinemaIdx'+dto.cinemaIdx+'" onclick="changeCinema('+dto.cinemaIdx+')">'+dto.cinemaName+'</li>';
				}
					temp += '</ul>';
					result  = temp;
					$('#cinemaNameList').html(result);
			   }
	   })
})

//스캐줄 시간 가져오기
$.ajax({
	   url:'reservationScheduleDateJquery.do',
	   type:'post',
	   success:function(data){
		    var count = 0 ;
		    var scheduleMap = data.scheduleList;
		    var key = data.key;
		    var temp = "";
		    var result = "";
		    var size = Object.keys(scheduleMap).length;
 			temp +='<div style="overflow-y: auto;height:100%;">';
 			temp +=		'<ul>';
	 		for(var i = 0 ; i<size;i++){
	 			var list = scheduleMap[key[i]]
	 			var yearMonth=key[i].split('-',2);
	 			temp +=			'<li>';
				temp +=				'<div>';
				temp +=					'<span class="year" id="year'+count+'">'+yearMonth[0]+'</span>';
				temp +=					'<span class="month" id="month'+count+'">'+yearMonth[1]+'</span>';
				temp +=				'</div>';
				temp +=			'</li>';
				for(var j = 0 ; j <list.length ; j++){
					var date = new Date(list[j].scheduleDate);
					
					var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
				    
				    var today = new Date(date).getDay();
				    var todayLabel = week[today];
					
				    var todayLabel2 = todayLabel.split('요',1);
					var date2 = date.toLocaleDateString().split(
							'.',3);
					var fulldate = yearMonth[0]+'-'+yearMonth[1]+'-'+date2[2].trim()+"";
					temp +='<li class="scheduleDateList" id="'+count+'" onclick="changeDate(\''+fulldate+'\','+count+')"><span class="day">'+todayLabel2+'</span><span class="date">'+date2[2]+'</span></li>';
					count++;
				}
			}
			temp +=		'</ul>';
			temp +=	'</div>';
	 		$('#scheduleDay').html(temp);
		  }
	   })

});
//영화관 이름

function changeCinema(cinemaIdx){
	$('.cinemaNameActive').removeClass('cinemaNameActive');
	$('#cinemaIdx'+cinemaIdx).addClass('cinemaNameActive');
	
	var temp = "";
	var result = "";
	
	temp +='<div class="row">';
	temp +='<span class="theaterHeader"> 극장 :</span><span id="cinemaNameResult">'+$('#cinemaIdx'+cinemaIdx).text()+'</span>';
	temp +='</div>';
	temp +=' <span class="theaterHeader"> 일시 :</span><span id="scheduleDateResult">옐로 에그</span>';
	temp +='</div>';
	temp +=' <div class="row">';
	temp +=' <span class="theaterHeader"> 상영관 :</span><span id="theaterNameResult">옐로 에그</span>';
	temp +='</div>';
	temp +='<div class="row">';
	temp +='<span class="theaterHeader"> 인원 :</span><span id="ticketCountResult">옐로 에그</span>';
	temp +='</div>';
    
 	result = temp;
	$('#theaterInfo').html(result);
}

function changeDate(id,count){
	$('.scheduleDateActive').removeClass('scheduleDateActive');
	$('#'+count).addClass('scheduleDateActive');
	$('#scheduleDateResult').html(id); 
}

</script>
</head>
<body>
	<%@include file="../commonsView/header.jsp"%>

	<div class="container">
    <div class="row" style="width:1000px;height: 655px; margin:0px auto;margin-top: 160px;background-color: #F2F0E5">
        <div class="col-xs-4" style="height:100%; padding: 0px;border-right:1px solid lightgray;">
            <div class="topInfo text-center" >영화</div>
                <div style="height:600px;overflow-y:auto;margin-top: 20px;">
                    <div style="padding:5px;padding-top:0px;">
                        <ul class="movieList">
                        	<c:forEach items="${movieList}" var="rdto">
                        		 <li id="${rdto.movieIdx}" onclick="selectMovie('${rdto.movieName}','${rdto.movieGrade}',${rdto.movieIdx},'${rdto.movieTitleCut}')"> <span>${rdto.movieGrade}</span>${rdto.movieName}</li>
                        	</c:forEach>        
                        </ul>
                    </div>
                </div>
        </div>
    <div class="col-xs-3" style="height:100%;text-align: center; padding: 0px;border-right:1px solid lightgray;">
        <div class="topInfo">극장</div>
        <div style= "height:562px;margin-top: 20px;">
            <div id="cinemaCityList" class="col-xs-5" style="padding-left:1px;padding-right:0px;">
             	<ul style="height:100%;">
             		<c:forEach items="${cinemaSiList }" var="si">
             			<li class="city">${si.cinemaCity}</li>
             		</c:forEach>
             	</ul>
            </div>
            <div id="cinemaNameList" class="col-xs-7" style="height:100%;">
              
            </div>
        </div>
        </div>
        <div id="scheduleDate" class="col-xs-1" style="text-align: center; padding: 0px;height:600px;border-right:1px solid lightgray;">
            <div class="topInfo">날짜</div>
            <div id="scheduleDay" style="overflow-y: auto;height:100%;">
            
            </div>
        </div>

        <div class="col-xs-4" style="text-align: center; padding: 0px;height:100%;">
            <div class="topInfo">시간</div>
                <div style="margin-top: 20px;height:100%;overflow-y: auto;">
                            <div class="text-left seatList">
                                <span class="title"><span class="TheaterName">에그 옐로우</span><span class="emptySeat">(총 159석)</span></span>
                                <ul>
                                    <li>
                                        <span class="time scheduleDateActive">10:35</span>
                                        <span class="count">144석</span>
                                    </li>
                                    <li>
                                        <span class="time">10:35</span>
                                        <span class="count">144석</span>
                                    </li>

                                    <li>
                                        <span class="time">10:35</span>
                                        <span class="count">144석</span>
                                    </li>

                                     <li>
                                        <span class="time">10:35</span>
                                        <span class="count">144석</span>
                                    </li>
                                </ul>
                            </div>
                    <div class="text-left seatList">
                                <span class="title"><span class="TheaterName">에그 옐로우</span> <span class="emptySeat">(총 159석)</span></span>
                                <ul>
                                    <li>
                                        <span class="time">10:35</span>
                                        <span class="count">144석</span>
                                    </li>
                                    <li>
                                        <span class="time">10:35</span>
                                        <span class="count">144석</span>
                                    </li>

                                    <li>
                                        <span class="time">10:35</span>
                                        <span class="count">144석</span>
                                    </li>

                                     <li>
                                        <span class="time">10:35</span>
                                        <span class="count">144석</span>
                                    </li>
                                </ul>
                    </div>
                </div>
        </div>
    </div>
</div>
<!-- 정보 바 -->
<form action="#">
    <div id="bottomDiv">
        <div class="container">
            <div class="row" style="width:1000px;margin:0px auto;">
                <div style="float: left;border-right:1px solid #2D2D2D;">
                    <!--<span class="bottomInfo">
                        <span class="glyphicon glyphicon-menu-left" style="width:100px;font-size:100px;"></span>
                    </span>-->
                </div>
                <div id="movieInfo">
           				<span>영화 선택</span>
                </div>

                <div id="theaterInfo" style="margin-top:4px; float: left;width:187px;border-right:1px solid #2D2D2D;border-right:1px solid #2D2D2D; ">
                		<span id="theaterInfoSpan">극장 선택</span>

                </div>

                <div id="seatInfo">
                   <span style="font-size: 30px;">좌석 선택</span>
                </div>

                <div id="payInfo">
                    <span style="font-size: 30px;">금액 정보</span>
                </div>
                <div id="nextInfo">
                    <span style="font-size: 30px;">다음</span>
                </div>
                <span class="bottomInfo">
                    <span class="glyphicon glyphicon-menu-right" style="width:100px;font-size:100px;"></span>
                </span>
            </div>
        </div>
    </div>
</form>
	<%@include file="../commonsView/footer.jsp"%>
	
	<script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>