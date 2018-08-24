<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>관리자 페이지</title>
    <link href="/yelloMovie/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 	<link href="/yelloMovie/css/admin/header.css" type="text/css"rel="stylesheet">
 	<link rel="stylesheet" href="/yelloMovie/jquery-ui-1.12.1/jquery-ui.min.css">
    <link href="/yelloMovie/css/admin/cinema/theaterAdd.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/yelloMovie/jquery-ui-1.12.1/jquery-ui.min.js"></script>
    <script src="/yelloMovie/jquery-ui-1.12.1/datepicker-ko.js"></script>
</head>
<style>
	.row{
		margin:0px auto;
	}
    #scheduleList{
        margin-top:20px;
    }
    #scheduleList th:first-child{
        width:100px;
    }
   .input-group{
        width:160px;
        height:40px;
    }
    .input-group input{
        height:40px;
    }
    .table{
    	width:100%;
    	
    }
    #topDate{
    	width:82%;
    }


</style>
<script>
    $(document).ready(function(){
		//달력 눌렀을때 
        $("#date1").datepicker();
        
        $("#date1").change(function(){
            var changeDate=$(this).val().split("-",3);
            $("#topDate").text(changeDate[1]+'.'+changeDate[2]);
            });
        
        
        //현제 날짜 재 설정
        function formatDate() {
            var d = new Date(),
                month = '' + (d.getMonth() + 1),
                day = '' + d.getDate(),
                year = d.getFullYear();

            if (month.length < 2) month = '0' + month;
            if (day.length < 2) day = '0' + day;

            return [month, day].join('.');
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
       
    
    });
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
      
</script>
<body>
<div class="container">
<%@include file="../adminCommonsViews/adminHeader.jsp" %>
		
		<div class="container">
			<%@include file="../adminCommonsViews/adminNavi.jsp" %>
    			<div class="col-xs-10" style="padding:0px;padding-left:5px; border-left: 1px solid #E1E1E1; height:1900px; ">
      				<ul class="nav nav-tabs" >
      					<li class="active"><a href="adminSchedule.do" >스캐줄 목록</a></li>
					</ul>
					 
					   <!-- 마스터 -->
						   <form class="form-inline" id="selectCinemaForm" style="margin-top:20px;">
							   <div class="form-group">
									<label>영화관 : </label>
										<button id="selectCinemaName" type="button"
											class="btn btn-default"> 영화관 선택 <span class="caret"></span>
										</button>
									<input type="hidden" value="" id="selectCinemaIdxInput" name="selectCinemaIdxInput">
								</div>
							</form>
							<div id="div" style="display:none;">
								
							</div>
					   <!-- 마스터 -->
					   
                <!-- 영화관 관리자  &  마스터-->
           <c:if test="${!empty cdto }">
             <div class="container">
                <h1 id="cinemaName">${cdto.cinemaName }  영화관 스캐줄</h1>
              
                <div class="row" style="margin-top: 30px;">
                    <div class="input-group">
                        <input type="text" name="date" id="date1" size="12" class="form-control">
                        <span  style="font-size: 20px;"class="input-group-addon glyphicon glyphicon-calendar"></span>
                    </div>
                    <div class="text-center">
                        <h2 id="topDate"></h2>
                    </div>
                </div>
		                <div class="row" style="width:1030px; height:1000px; overflow:auto;">
			                <table class="table" id ="scheduleList">
			                    <tr>
			                        <th>시간\상영관</th>
			                        <th>상영관 이름</th>
			                    </tr>
			                    <c:forEach items="${arr}" var="t" step="1">
				                    <tr>
				                        <th style="padding:3px;">${t}</th>
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