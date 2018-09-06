<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>관리자 페이지</title>
<link href="/yelloMovie/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/yelloMovie/css/admin/header.css" type="text/css"
	rel="stylesheet">
<link rel="stylesheet"
	href="/yelloMovie/jquery-ui-1.12.1/jquery-ui.min.css">
<link href="/yelloMovie/css/admin/cinema/theaterAdd.css"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/yelloMovie/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script src="/yelloMovie/jquery-ui-1.12.1/datepicker-ko.js"></script>
</head>
<style>
.form-control {
	width: 61%;
}

#scheduleList {
	margin-top: 20px;
}

#scheduleList th:first-child {
	width: 50px;
}

.input-group input {
	height: 40px;
}

.table {
	width: 100%;
}

#topDate {
	width: 82%;
}

.theaterName {
	width: 80px;
}

.time {
	padding: 3px;
}

.table tr td {
	border-left: 1px solid lightgray;
	border-right: 1px solid lightgray;
}

.time {
	width: 20px;
}
</style>
<script>
    $(document).ready(function(){
		//달력 눌렀을때 
        $("#date1").datepicker();
        
        $("#date1").change(function(){
            var changeDate=$(this).val().split("-",3);
            $("#topDate").text($(this).val());
            window.alert($('#selectCinemaIdxInput').val());
        	$.ajax({
        		   url:'adminScheduleMainJquery.do?date='+$('#topDate').text()+'&cinemaIdx='+$('#selectCinemaIdxInput').val(),
        		   type:'post',
        		   success:function(data){
        			    var movieInfoList = data.scheduleMap;
        			    var theaterList = data.theaterList;
					
        			 
							
							for(var j = 0 ; j <theaterList.length;j++){
								var dto = movieInfoList[theaterList[j].theaterIdx];
								
								for(var k = 0; k < dto.length;k++){
									var list = dto[k];
									var blockCount=Math.floor(list.movieRunTime/30)+1;
									var id= list.scheduleStartTime+'_'+list.scheduleTheaterIdx;
										$("#"+id).attr("rowspan",blockCount).html('<h3 style="text-align:center">'+list.movieName+'</h3>').addClass('on')
									
									for(var l = 1 ; l < blockCount ;l++){
										var id2= (parseInt(list.scheduleStartTime)+l)+'_'+list.scheduleTheaterIdx;
											$('#'+id2).addClass('on'+l).css('display','none');
										}
								}
							}
								
						      			    
            			var result='';
        	        	var temp ='';
        	      
        	        	result+=temp;
        		   }
        	   })

            });
        
        
        //현제 날짜 재 설정
        function formatDate() {
            var d = new Date(),
                month = '' + (d.getMonth() + 1),
                day = '' + d.getDate(),
                year = d.getFullYear();

            if (month.length < 2) month = '0' + month;
            if (day.length < 2) day = '0' + day;

            return [year,month, day].join('-');
        }
        $("#topDate").text(formatDate());
        
        //(master)ajax 영화관 가져오기
        $("#selectCinemaName").click(function(){
        	$.ajax({
        		url:'adminCinemaFindJquery.do',
        		type:'get',
        		success:function(data){
        			var cityLists = data.cityLists;
        		
        				var result = '';
        				var temp = '';
        				
        				temp += '<div class="container">';
        			    temp += '<div class="list-group" id="cinemaList">';
        			    temp += '<a href="#" class="list-group-item"><strong style="color:purple;">영화관 보기</strong></a>';
        			    temp += '<div class="row">';
        			    temp += '<div id="cinemaSi"class="col-xs-6" style="background-color:white;">'
        				 for(var j = 0 ; j <cityLists.length;j++){
        					 var dto = cityLists[j].cinemaCity;
        					 temp +='<a href="#" style="color:black;"class="list-group-item" onclick=findCinemaName("'+dto+'") id="findCinemaName">'+dto+'<span class="glyphicon glyphicon-menu-right"></span></a>';	
        					}
        				temp +=	'</div>';				
        				temp +=	'<div id="cinemaNameList"class="col-xs-6 text-center">';				
        				temp +=	'</div>';
        				temp +=	'</div>';
        				temp +=	'</div>';
        				temp +=	'</div>';
        				result += temp;
        				$('#div').css({position:'absolute',left:'60px','z-index':'3'}).html(result).toggle();
        				
        		}
        			
        		
        	});
        });
       //등록/수정 모달
       $('#adminScheduleAdd').click(function(){
               $("#myModal").modal();
               var date = $("#topDate").text();
               $("#scheduleDate").text(date);
       });
       
       //영화 정보 찾기
       $('#findMovieInfo').click(function(){
    	   var movieName = $('#findMovieInfoInput').val();
    	   $.ajax({
    		   url:'adminScheduleMovieFindJquery.do?movieName='+movieName,
    		   type:'post',
    		   success:function(data){
    			    var movieInfoList = data.movieNameList;
	    			var result='';
		        	var temp ='';
		        	for(var i = 0 ; i < movieInfoList.length;i++){
		        		var dto = movieInfoList[i];
		        		temp +='<a href="#" class="list-group-item" id="'+dto.movieIdx+'" onclick="movieInfoDetail('+dto.movieIdx+')">';
		        		temp +='<div class="media" style="margin-top:10px;">';
		        		temp +='<div class="media-left">';
		        		temp +='<img class="media-object" src="'+dto.movieTitleCut+'" alt="'+dto.movieTitleCut+'" style="width:64px;">';
		        		temp +='</div>';
		        		temp +=' <div class="media-body">';
		        		temp +='<h4 class="media-heading">('+dto.movieGrade+')'+dto.movieName+'</h4>';
		        		temp +='<h5 class="media-heading">감독 :<strong>'+dto.movieDirector+'</strong></h5>';
		        		temp +='<h5 class="media-heading">배우 :<strong>'+dto.movieActor+'</strong></h5>';
		        		temp +='<h5 class="media-heading">런타임 :<strong>'+dto.movieRunTime+'</strong></h5>';
		        		temp +='</div>';
		        		temp +='</div>';
		        		temp +='</a>';
		        		
		        	}
		        	result+=temp;
		        	$('#findMovieInfoResult').html(result);
    		   }
    	   })
       });
    

    });
    //메인 상영관 보여주기
    
	   	   
    //ajax 영화관 이름
    function findCinemaName(cinemaCity){
    	
      	$.ajax({
		        	url:'adminCinemaNameFindJquery.do?cinemaCity='+cinemaCity,
		        	type:'get',
		        	success:function(data){
		        		var cinemaNameLists=data.nameLists;
		        		
		        		var result='';
		        		var temp ='';
		        		
		        		temp += '<ul style="list-style: none;padding:0px;">';
		        		for(var i=0; i <cinemaNameLists.length;i++){
		        			var dto = cinemaNameLists[i];
		        			temp+= '<li ><a href="adminSchedule.do?cinemaIdx='+dto.cinemaIdx+'" style="display:inline-block;color:black;text-decoration: none;")><strong>'+dto.cinemaName+'</strong></a></li>';
		        		} 
		        		temp +='</ul>';
		        		result = temp;
		        		$("#cinemaNameList").html(result);
		        		
		        	}
      	});
      };
      
      //영화 상세 보기
      function movieInfoDetail(movieIdx){
    	 	$.ajax({
	        	url:'adminScheduleMovieDetailJquery.do?movieIdx='+movieIdx,
	        	type:'get',
	        	success:function(data){
	        		var dto=data.movieDetail;
	        		var blockCount=Math.floor(dto.movieRunTime/30)+1;
	        		var result='';
	        		var temp ='';
	        		
	        		temp+='<div class="row text-center" style="margin:0px auto;">';
	        		temp+=' <img src="'+dto.movieTitleCut+'" style="width:71%;height:296px;margin-bottom: 20px;">';
	        		temp+=' <input id="movieTitleCut" value="'+dto.movieTitleCut+'" type="hidden">';
	        		temp+='</div>';
	        		temp+='<div class="form-horizontal">';
	        		temp+='<div class="form-group" >';
	        		temp+='<label class="col-xs-4 control-label">이름 : </label>';
	        		temp+='<input type="text" id="movieName" class="form-control" readonly value="'+dto.movieName+'" >';
	        		temp+='</div>';
	        		temp+='<div class="form-group">';
	        		temp+='<label class="col-xs-4 control-label">런타임 : </label>';
	        		temp+='<input type="text" id="movieRuntime" class="form-control" readonly value="'+dto.movieRunTime+'">';
	        		temp+='</div>';
	        		temp+='<div class="form-group">';
	        		temp+='<label class="col-xs-4 control-label">영화 감독 : </label>';
	        		temp+='<input type="text" id="movieDirector" class="form-control" readonly value="'+dto.movieDirector+'">';
	        		temp+='</div>';
	        		temp+='<div class="form-group">';
	        		temp+='<label class="col-xs-4 control-label">영화 배우 : </label>';
	        		temp+='<input type="text" id="movieActor" class="form-control" readonly value="'+dto.movieActor+'">';
	        		temp+='</div>';
	        		temp+='<div class="form-group">';
	        		temp+='<label class="col-xs-4 control-label">등급 : </label>';
	        		temp+='<input type="text" id="movieGrade" class="form-control" readonly value="'+dto.movieActor+'">';
	        		temp+='</div>';
	        		temp+='<div class="form-group" >';
	        		temp+='<label class="col-xs-4 control-label">영화 장르 : </label>';
	        		temp+='<input type="text" id="movieGenre" class="form-control" readonly value="'+dto.movieGenre+'">';
	        		temp+='</div>';
	        		temp+='<div class="form-group">';
	        		temp+='<label class="col-xs-4 control-label">배급사 : </label>';
	        		temp+='<input type="text"  id="movieDistributer" class="form-control" readonly value="'+dto.movieDistributer+'">';
	        		temp+='</div>';
	        		temp+='<input type="hidden" id ="movieIdx" value="'+dto.movieIdx+'">';
                   	temp+='</div>';
                   	temp+='<div>';
                	temp+='<h4 style="margin-top:40px;text-align:center;color:red;">시작시간을 선택해 주세요!</h4>';
                	temp+='<h4 style="margin-top:40px;text-align:center;color:red;margin-top:0px;">위 영화는'+blockCount+'칸 만큼 차지합니다.</h4>';
                	temp+='</div>';
                	
                	result =temp;
                	
                	$('#movieDetail').html(result);
	        	}
  			});
       };
       //상영관 선택
       function selectTheaterName(theaterIdx,theaterName){
    	   $('#theaterName').text(theaterName);
    	   $('#selectedTheaterIdx').val(theaterIdx);
    	   var params = "theaterIdx="+theaterIdx+"&scheduleDate="+$('#scheduleDate').text();
    	   $.ajax({
	        	url:'adminScheduleSelectJquery.do?'+params,
	        	type:'post',
	        	success:function(data){
	        	
	        		var timeData = data.time;
	        		var result='';
	        		var temp ='';
	        		
	        		var count = 1;
	        		
	        		
	        		//스캐줄 탬플릿
	        		temp += '<div class="panel-heading" id="theaterName2">'+theaterName+'</div>';
	        		temp += '<table class="table text-center">';
	        		temp += '<tr>';
	        		temp += '<th>시간</th>';
	        		temp += '<th>영화</th>';
	        		temp += '</tr>';
	        		
					for(var i = 0 ; i<timeData.length;i++){
						var time = timeData[i];
							temp +='<tr>';
							temp +='<th class="time">'+time+'</th>';
							temp +='<td style="vertical-align:middle;"id="time'+count+'" onclick="startTime('+count+')"></td>';
							temp +='</tr>';	
							count++;
						}
					temp +='</table>';
					result =temp;
					$('#scheduleTable').html(result);
					
					//스캐줄 입력
					var adminScheduleList=data.asdtoList;
					window.alert(adminScheduleList.length);
					for(var i=0 ; i < adminScheduleList.length;i++){
						var dto = adminScheduleList[i];
						var blockCount=Math.floor(dto.movieRunTime/30)+1;
						$('#time'+dto.scheduleStartTime).attr("rowspan",blockCount).html('<img style="width:100%;height:21%" src="'+dto.movieTitleCut+'">').addClass('on');
						for(var j = dto.scheduleStartTime+1 ; j <dto.scheduleStartTime+blockCount ;j++){
									$('#time'+j).addClass('on'+j).css('display','none');
								}
						}
					
					}      	
 	});
    	   
    	   
       }
       
       //영화 시작 시간등록
       function startTime(count){
    	   
    	   if($('#movieRuntime').length==0){
    		   $('#scheduleTable').off('click');
    	   }else{
	    	   var runTime = $('#movieRuntime').val();
	    	   var blockCount=Math.floor(runTime/30)+1;
	    	   var i =  parseInt(count)+1;
	    	   for(i = parseInt(count)+1; i<blockCount+parseInt(count);i++){
		    		   if($('#time'+i).hasClass("on")){
		        		  window.alert("불가능한 위치입니다.");
		        		  return;
		        	   }	    		 
					}

	    	   
	 
	    	   
	    	   if($('#time'+count).hasClass("on")){
					$('#time'+count).removeAttr('rowspan').removeClass('on');
					$('#time'+count).children().remove();
					$('.on'+count).show().removeClass('on'+count);
	    	   }else{
	    	
	    		   //값 넣어주기
	    		   for(var i = parseInt(count)+1; i<blockCount+parseInt(count);i++){
	   					if($('#time'+i).length==0){
		   					 window.alert("불가능한 위치입니다.");
		   	     		 	 return;
	   					}
	   				}
	    		   
	    		   //첫 시작 크기 변경
		    		   $('#time'+count).attr('rowspan',blockCount).addClass('on').html('<h3>'+$('#movieName').val()+'</h3>');
	    	
		    			var scheduleInfo = $('#scheduleDate').text()+','+count+','+$('#selectedTheaterIdx').val()+','+$("#movieIdx").val();
		    			var movieIdx = '<input type="hidden" name="scheduleInfo" value="'+scheduleInfo+'">';
		    			$('#time'+count).append(movieIdx);
		    			   for(var i = parseInt(count)+1; i<blockCount+parseInt(count);i++){
			   					$('#time'+i).addClass('on'+count).css('display','none').hide();	
		    			   }
	    	   }
    	   }
    	   
    	   
			
       }
</script>
<body>
	<!-- Modal -->
	<div class="modal fade" id="myModal" style="display: none;">
		<!--전체틀-->
		<div class="modal-dialog " style="width: 1216px;">
		<form action="adminScheduleAdd.do" method="post">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<span id="scheduleDate"></span>스캐줄 등록 수정
					</h4>
				</div>
				<div class="row text-right"
					style="margin: 0px; margin-top: 20px; margin-right: 20px;">
					<div class="btn-group">
						<button type="button" class="btn btn-default" id="theaterName">상영관
							선택</button>
							<input type="hidden" id="selectedTheaterIdx">
						<button type="button" class="btn btn-default dropdown-toggle"
							data-toggle="dropdown">
							<span class="caret"></span> <span class="sr-only">Toggle
								Dropdown</span>
						</button>
						<!-- 상영관 이름 리스트 -->
						<ul class="dropdown-menu">
							<c:forEach items="${lists}" var="tdto">
								<li onclick="selectTheaterName('${tdto.theaterIdx}','${tdto.theaterName}')">
									<input type="hidden" value="${tdto.theaterIdx}" id="theaterIdx">
									<a href="#">${tdto.theaterName}</a>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="modal-body container" style="height: 700px;">
					<!-- 영화 검색 -->
					<div class="col-xs-4 "
						style="border: 1px solid red; height: 100%; overflow-y: auto;">
						<h3 class="text-center">영화검색</h3>

						<div class="input-group">
							<input type="text" class="form-control" placeholder="영화 이름"
								id="findMovieInfoInput"> <span class="input-group-btn">
								<button class="btn btn-default" type="button" id="findMovieInfo">Go!</button>
							</span>
						</div>
						<!-- 영화 검색 결과 -->
						<div class="list-group" id="findMovieInfoResult"></div>
					</div>

					<!-- 영화 상세 정보-->
					<div class="col-xs-4"
						style="border: 1px solid blue; height: 100%; overflow-y: auto; overflow-x: hidden;">
						<h3 class="text-center">영화상세 정보</h3>
						<div id="movieDetail"></div>
					</div>

					<!-- 스케줄-->
					<div class="col-xs-4" style="border: 1px solid yellow; height: 100%; overflow-y: auto;">
						<h3 class="text-center">상영관 스케줄 등록</h3>
							<div class="panel panel-default"  id="scheduleTable">

							</div>
					
					</div>
				</div>

				<div class="modal-footer">
					<button type="submit" class="btn btn-default">등록</button>
					<button type="button" class="btn btn-default">Close</button>
				</div>
			</div>
				</form>
		</div>
	</div>
	<!-- 메인 -->
	<div class="container">
		<%@include file="../adminCommonsViews/adminHeader.jsp"%>

		<div class="container">
			<%@include file="../adminCommonsViews/adminNavi.jsp"%>
			<div class="col-xs-10"
				style="padding: 0px; padding-left: 5px; border-left: 1px solid #E1E1E1; height: 1900px;">
				<ul class="nav nav-tabs">
					<li class="active"><a href="adminSchedule.do">스캐줄 목록</a></li>
				</ul>

				<!-- 마스터 -->
				<form class="form-inline" id="selectCinemaForm"
					style="margin-top: 20px;">
					<div class="form-group">
						<label>영화관 : </label>
						<button id="selectCinemaName" type="button"
							class="btn btn-default">
							영화관 선택 <span class="caret"></span>
						</button>
					
					</div>
				</form>
				<div id="div" style="display: none;"></div>
				<!-- 마스터 -->

				<!-- 영화관 관리자  &  마스터-->
				<c:if test="${!empty cdto }">
					<div class="container">
						<h1 id="cinemaName">${cdto.cinemaName}영화관 스캐줄</h1>
							<input type="hidden" value="${cdto.cinemaIdx}" id="selectCinemaIdxInput" name="selectCinemaIdxInput">
						<div class="row" style="margin-top: 30px;">
							<div class="input-group" style="width: 160px; height: 40px;">
								<input type="text" name="date" id="date1" size="12"
									class="form-control"> <span style="font-size: 20px;"
									class="input-group-addon glyphicon glyphicon-calendar"></span>
							</div>
							<div class="row text-center">
								<h2 id="topDate" onchange="changeSchedulList()"></h2>
							</div>

							<div class="text-right">
								<span class="btn btn-default" style="margin-right: 11%"
									id="adminScheduleAdd">등록/수정</span>
							</div>
						</div>
						<div class="row"
							style="width: 1030px; height: 1000px; overflow: auto; margin-left: 10px;">
							<table class="table" id="scheduleList">
								<tr class="text-center">
									<th class="time">시간\상영관</th>
									<c:forEach items="${lists}" var="tdto">
										<th class="theaterName text-center">${tdto.theaterName}</th>
									</c:forEach>
								</tr>
								<c:forEach items="${arr}" var="t" step="1" varStatus="time">
									<tr>
										<th class="time">${t}</th>
										<c:forEach items="${lists}" var="tdto">
											<td style="vertical-align:middle;" id="${time.count}_${tdto.theaterIdx}"></td>
										</c:forEach>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
<script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
</html>