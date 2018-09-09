<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<title>Yello egg</title>
<!-- 부트스트랩 -->
<link href="/yelloMovie/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script src="/yelloMovie/js/httpRequest.js"></script>
<link href="/yelloMovie/css/movie/reservationMovie.css" rel="stylesheet">
<style>
.dimmed {
	color: dimgray;
}
</style>
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
					temp +='<li class="cinemaName" id="cinemaIdx'+dto.cinemaIdx+'" onclick="changeCinema('+dto.cinemaIdx+');showSchedule();">'+dto.cinemaName+'</li>';
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
					var idDate = yearMonth[0]+yearMonth[1]+date2[2].trim()+"";
					temp +='<li class="scheduleDateList" id="'+idDate+'" onclick="changeDate(\''+fulldate+'\','+idDate+');showSchedule(); "><span class="day">'+todayLabel2+'</span><span class="date">'+date2[2]+'</span></li>';
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
	$('#cinemaNameResultIdx').val(cinemaIdx);
	
	$('#theaterInfoDiv').css('display','block');
	$('#theaterInfoSpan').css('display','none');
	$('#cinemaNameResult').text($('#cinemaIdx'+cinemaIdx).text())

}

//일시 등록
function changeDate(id,idDate){
	$('#theaterInfoDiv').css('display','block');
	$('#theaterInfoSpan').css('display','none');
	$('.scheduleDateActive').removeClass('scheduleDateActive');
	$('#'+idDate).addClass('scheduleDateActive');
	$('#scheduleDateResult').html(id); 
}

//scheduleList
 function showSchedule(){
	var schedule = $('.scheduleDateActive').length;
	var cinema = $('.cinemaNameActive').length;
	var movie = $('.movieActive').length;
	if(cinema!=0 && schedule!=0 && movie!=0){
		//영화 Idx
			var movieIdx = $('#movieIdx').val();
		//영화관 Idx
			var cinemaIdx = $('#cinemaNameResultIdx').val();
		//날짜 
			var date = $('#scheduleDateResult').text();
		//ajax 시작
			$.ajax({
				   url:'reservationScheduleListJquery.do?cinemaIdx='+cinemaIdx+'&date='+date+'&movieIdx='+movieIdx,
				   type:'post',
				   success:function(data){
					    var map = data.map;
					    var tKey = data.theaterIdxKey;
						var sKey = data.scheduleIdxKey;
						
						var temp = "";
					    var result = "";
						for(var i = 0 ; i <tKey.length;i++){
							var theater = map[tKey[i]];
							temp +='<div class="text-left seatList">';
							temp +='<span class="title"><span class="TheaterName">'+tKey[i]+'</span></span>';
							temp +='<ul>';
							for(var j = 0 ; j < sKey.length ; j++){
							temp +='<li class="seatListDetail" onclick="changeSeat('+sKey[j]+',\''+theater[sKey[j]][0]+'\',\''+tKey[i]+'\')">';
							temp +='<span class="seatDetail" id="'+sKey[j]+'" class="time">'+theater[sKey[j]][0]+'</span>';
							temp +='<span class="count">'+"("+theater[sKey[j]][1]+"석)"+'</span>';
							temp +='</li>';
							}
							temp +='</ul>';
							temp +='</div>';
						}
						$('#scheduleList').html(temp);
					  }
				   })

	}
} 
//스캐줄 선택
function changeSeat(id,time,name){
	$('.seatDetail').removeClass('seatListActive');
	$('#'+id).addClass('seatListActive');
	
	$('#scheduleTimeResult').html(time);
	$('#theaterNameResult').html(name);
	$('#scheduleResultIdx').val(id);
}
//보내기
function submitInfo(){
	$('#stage1').hide();
	$('#stage2').show();
	$('#reservationBefore').show();
	$('#payment').show();
	$('#next').hide();
	//상영관 좌석 정보가져오기
	$('#theaterNameResult').text();
		$.ajax({
				   url:'reservationScheduleSeatListJquery.do?theaterIdx='+theaterIdx+'&scheduleIdx='+scheduleIdx,
				   type:'post',
				   success:function(data){
						var yList = data.yList;
						var xList = objData.xList;
						var ySize = objData.ySize;
						var xSize = objData.xSize;
						var alt = objData.alt;
						var seatsList = objData.seatsList;
						
						var result = '';
						result += '<div  style="width: ${xSize+17}px; height: ${ySize+17}px;z-index:1;">';
						result += 	'<div class="seatsPosition" style="margin-top: 20px;">';
						result += 		'<div id="exitSeatPosition" style="height: ' + (80+ySize+17) + 'px;position:relative;">';
						result += 			'<p class="screen" style="text-align:center;">screen</p>';
						result += 			'<div id="exitPosition" style="width: '+ (xSize+17) + 'px; height: ' + (ySize+17) + 'px;z-index:1;margin:0px auto;position:relative;">';
						for(var i = 0; i < yList.length; i++){
							result += 			'<span style="z-index:2;text-align:center;width:16px;height:16px;position:absolute;top:'+ yList[i].seatY +'px;background-color:lightgray;margin-left:1px;">'+alt[i]+'</span>';
						}
						for(var i = 0; i < xList.length; i++){
							result += 			'<span class="xLists" style="z-index:2;text-align:center;display:none;width:16px;height:16px;position:absolute;left:' + xList[i].seatX + 'px;background-color:lightgray;margin-left:1px;">' + (i + 1) + '</span>';
						}
						for(var i = 0; i < seatsList.length; i++){
							result += 			'<span class="seats" style="z-index:2;text-align:center;display:inline-block;width:16px;height:16px;position:absolute;left:' + seatsList[i].seatX + 'px;top:' + seatsList[i].seatY + 'px;background-color:red;margin-left:1px;"></span>';
						}
						result +=				'</div>';
						result +=			'</div>';
						result +=	  '</div>';
						result +=	'</div>';
						
						var seatModalBodyNode = document.getElementById('exitPosition');
						seatModalBodyNode.innerHTML = result;
						
						var xLists = document.getElementsByClassName('xLists');
						var seats = document.getElementsByClassName('seats');
						for (var i = 0; i < xLists.length; i++) {
							var xValue = xLists[i].style.left;
							for (j = 0; j < seats.length; j++) {
								var seatsValue = seats[j].style.left;
								if (xValue == seatsValue) {
									seats[j].innerHTML = i + 1;
								}

							}
						}
						
					  }
				   })

	//스케줄 가져가서 예약 정보가져오기

}

//뒤로 가기
function goBackReservation(){
	$('#stage1').show();
	$('#stage2').hide();
	$('#reservationBefore').hide();
	$('#payment').hide();
	$('#next').show();
}

</script>
</head>
<body>
	<%@include file="../commonsView/header.jsp"%>
				<div class="container" id="stage1">
					<div class="row"
						style="width: 1000px; height: 655px; margin: 0px auto; margin-top: 160px; background-color: #F2F0E5">
						<div class="col-xs-4"
							style="height: 100%; padding: 0px; border-right: 1px solid lightgray;">
							<div class="topInfo text-center">영화</div>
							<div style="height: 600px; overflow-y: auto; margin-top: 20px;">
								<div style="padding: 5px; padding-top: 0px;">
									<ul class="movieList">
										<c:forEach items="${movieList}" var="rdto">
											<li class="movieList" id="${rdto.movieIdx}"
												onclick="selectMovie('${rdto.movieName}','${rdto.movieGrade}',${rdto.movieIdx},'${rdto.movieTitleCut}');showSchedule();">
												<span>${rdto.movieGrade}</span>${rdto.movieName}</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-xs-3"
							style="height: 100%; text-align: center; padding: 0px; border-right: 1px solid lightgray;">
							<div class="topInfo">극장</div>
							<div style="height: 562px; margin-top: 20px;">
								<div id="cinemaCityList" class="col-xs-5"
									style="padding-left: 1px; padding-right: 0px;">
									<ul style="height: 100%;">
										<c:forEach items="${cinemaSiList }" var="si">
											<li class="city">${si.cinemaCity}</li>
										</c:forEach>
									</ul>
								</div>
								<div id="cinemaNameList" class="col-xs-7" style="height: 100%;">

								</div>
							</div>
						</div>
						<div id="scheduleDate" class="col-xs-1"
							style="text-align: center; padding: 0px; height: 600px; border-right: 1px solid lightgray;">
							<div class="topInfo">날짜</div>
							<div id="scheduleDay" style="overflow-y: auto; height: 100%;">

							</div>
						</div>

						<div class="col-xs-4"
							style="text-align: center; padding: 0px; height: 100%;">
							<div class="topInfo">시간</div>
							<div id="scheduleList"
								style="margin-top: 20px; height: 100%; overflow-y: auto;">
							</div>
						</div>
					</div>
				</div>

				<div class="container" id="stage2" style="display:none;">
				    <div class="row" style="width:1000px;height: 655px; margin:0px auto;margin-top: 160px;background-color: #F2F0E5">
				        <div class="col-xs-12" style="padding:0px;height:100%;">
				            <div class="topInfo text-center" >인원 / 좌석</div>
				            <div class="col-xs-6 ticketInfo" style="height:130px;border-right:1px solid lightgray;padding-left:22px;padding-top:9px;">
				                <div style=" float:left;width:100%;height:40px;">
				                    <ul style="list-style: none;float:left">
				                        <li class="title">일반</li>
				                        	<c:forEach begin="0" end="8" var="t">
				                        		<li class="ticketCount"><a class="count">${t}</a></li>	
				                        	</c:forEach>
				                    </ul>
				                </div>
				                <div style=" float:left;width:100%;height:40px;">
				                    <ul style="list-style: none;float:left">
				                        <li class="title">청소년</li>
				                        <c:forEach begin="0" end="8" var="t">
				                        	<li class="ticketCount"><a class="count">${t}</a></li>	
				                        </c:forEach>
				                    </ul>
				                </div>
				                <div style=" float:left;width:100%;height:40px;">
				                    <ul style="list-style: none;float:left">
				                        <li class="title">어린이</li>
				                        <c:forEach begin="0" end="8" var="t">
				                        	<li class="ticketCount"><a class="count">${t}</a></li>	
				                        </c:forEach>
				                    </ul>
				                </div>
				
				            </div>
				            <div class="col-xs-6" style="height:130px;text-align: center; padding: 0px;border-right:1px solid lightgray;">
				                <p style="margin-top: 20px;"><span id="cinemaName">CGV 대학로</span>
				                    <span id="theaterName" >지하2층 3관</span>
				                    <span id="leftSeat">남은좌석 201/217</span></p>
				                <p class="reservationTime"><span id="reservationDate">2018-09-03</span>&nbsp;&nbsp;<span id="#reservationTime">11:15 ~ 13:10</span></p>
				            </div>
				
				<!-- 티켓 등록 -->
				            <div class="col-xs-12" >
				                <div class="text-center" id="screen" style="">screen</div>
									<div id="exitPosition">
										
									</div>
					            </div>
					        </div>
					    </div>
	    			</div>


	<!-- 정보 바 -->

		<div id="bottomDiv">
			<div class="container">
				<div class="row" style="width: 1000px; margin: 0px auto;">
					<div style="float: left; border-right: 1px solid #2D2D2D;">
					
						<span class="bottomInfo" id="reservationBefore" onclick="goBackReservation()"style="display:none;">
	                        <span class="glyphicon glyphicon-menu-left" style="width:100px;font-size:100px;"></span>
	                    </span>
                  
					</div>
					<div id="movieInfo" class="resultInfo">
						<span>영화 선택</span>
					</div>

					<div id="theaterInfo" style="margin-top: 4px; float: left; width: 187px; border-right: 1px solid #2D2D2D; border-right: 1px solid #2D2D2D;">
						<span id="theaterInfoSpan">극장 선택</span>
						<div id="theaterInfoDiv" class="row" style="display: none;">
							<div class="row">
								<span class="theaterHeader"> 극장 :</span><span
									id="cinemaNameResult"></span> <input type="hidden"
									id="cinemaNameResultIdx">
							</div>
							<div class="row">
								<span class="theaterHeader"> 일시 :</span><span
									id="scheduleDateResult"></span>&nbsp;<span
									id="scheduleTimeResult"></span> <input type="hidden"
									id="scheduleResultIdx">
							</div>
							<div class="row">
								<span class="theaterHeader"> 상영관 :</span><span
									id="theaterNameResult"></span><input type="hidden"
									id="theaterNameResultIdx">
							</div>
							<div class="row">
								<span class="theaterHeader"> 인원 :</span><span
									id="ticketCountResult"></span>
							</div>
						</div>

					</div>

					<div id="seatInfo">
						<span style="font-size: 30px;">좌석 선택</span>
					</div>

					<div id="payInfo">
						<span style="font-size: 30px;">금액 정보</span>
					</div>

					<div>
						<span class="bottomInfo" id="next" onclick="submitInfo()"> 
							<span class="glyphicon glyphicon-menu-right" style="width: 100px; font-size: 100px;"></span>
						</span>
						
						<span class="bottomInfo" id="payment" style="display:none;"> 
							<span class="glyphicon glyphicon-menu-right" style="width: 100px; font-size: 100px;"></span>
						</span>
					</div>
				</div>
			</div>
		</div>
	<%@include file="../commonsView/footer.jsp"%>

	<script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>