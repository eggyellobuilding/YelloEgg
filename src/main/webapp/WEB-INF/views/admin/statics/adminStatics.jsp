<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>관리자 페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link href="/yelloMovie/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="/yelloMovie/jquery-ui-1.12.1/jquery-ui.min.css">
<script src="/yelloMovie/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script src="/yelloMovie/jquery-ui-1.12.1/datepicker-ko.js"></script>
<link href="/yelloMovie/css/admin/header.css" type="text/css"
	rel="stylesheet">
<link class="include" rel="stylesheet" type="text/css"
	href="/yelloMovie/jqplot/jquery.jqplot.min.css" />
<script type="text/javascript"
	src="/yelloMovie/jqplot/jquery.jqplot.min.js"></script>
<script type="text/javascript"
	src="/yelloMovie/jqplot/plugins/jqplot.categoryAxisRenderer.min.js"></script>
<script type="text/javascript"
	src="/yelloMovie/jqplot/plugins/jqplot.barRenderer.min.js"></script>
<style>
.container {
	width: 1200px !important;
}

#selectBar {
	margin-top: 50px;
	padding: 10px;
	background-color: lightgray;
}

th {
	text-align: center;
}

#graphBar {
	margin-top: 40px;
}
</style>

<script>
	$(document).ready(function() {
		$('#date1').datepicker();
		$('#date2').datepicker();
			
		
		//graph
	        	$.ajax({
        		   url:'movieRate.do?date1='+$('#startDay').text()+'&date2='+$('#endDay').text()+'&num=1',
        		   type:'post',
        		   success:function(data){
        			   var map = data.resultMap;
        			   var city = data.citys;
        			   var line = new Array();
        			  for(var i = 0 ; i < city.length ;i ++){
        				  var linepush = new Array();
        				  linepush.push(city[i].cinemaCity,Number(map[city[i].cinemaCity]));
        				  line[i]= linepush;
        			  }
        			       $(function() {
								
        					$.jqplot('graph',[line], {
        						title : {
        							text : "매출액",
        							fontSize : "20pt"
        						},
        						series : [ {
        							render : jQuery.jqplot.LineRenderer
        						} ],
        						axes : {
        							xaxis : {
        								renderer : jQuery.jqplot.CategoryAxisRenderer
        							} 	
        						}
        					});
        				}); 
        		   }
        	   }) 
	})
	
	function changeGraph(num){
		window.alert(num);
		$('#graph').empty();
		$.ajax({
 		   url:'movieRate.do?date1='+$('#startDay').text()+'&date2='+$('#endDay').text()+'&num='+num,
 		   type:'post',
 		   success:function(data){
 			   var map = data.resultMap;
 			   var city = data.citys;
 			   var line = new Array();
 			   var title = num==1?"매출액":num==2?"관객수":num==3?"상영 점유율":"지역 예매율";
 			  for(var i = 0 ; i < city.length ;i ++){
 				  var linepush = new Array();
 				  linepush.push(city[i].cinemaCity,Number(map[city[i].cinemaCity]));
 				  line[i]= linepush;
 			  }
 			  
 			       $(function() {
							
 					$.jqplot('graph',[line], {
 						title : {
 							text : title,
 							fontSize : "20pt"
 						},
 						series : [ {
 							render : jQuery.jqplot.LineRenderer
 						} ],
 						axes : {
 							xaxis : {
 								renderer : jQuery.jqplot.CategoryAxisRenderer
 							} 	
 						}
 					});
 				}); 
 			       
 			       $('.active').removeClass('active');
 			       $('#graph'+num).addClass('active');
 		   }
 	   }) 
	}
</script>
</head>
<body>
	<div class="container">
		<%@include file="../adminCommonsViews/adminHeader.jsp"%>

		<div class="container">
			<%@include file="../adminCommonsViews/adminNavi.jsp"%>
			<div class="col-xs-10"
				style="padding: 0px; padding-left: 5px; border-left: 1px solid #E1E1E1; height: 1200px;">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#">지역별 통계</a></li>
				</ul>

				
					<h1>통계표</h1>
					
					<form class="form-inline" id="selectBar" action="adminStatics.do" method="post" style="margin-top: 40px;">
						<div class="form-group">
							<label style="margin-right: 30px;">조회기간</label>
							<div class="input-group">
								<input type="text" name="date" id="date1" size="12"class="form-control"> 
								<span style="font-size: 20px;" class="input-group-addon glyphicon glyphicon-calendar"></span>
							</div>
						</div>
						~
						<div class="form-group">
							<div class="input-group">
								<input type="text" name="date" id="date2" size="12" class="form-control"> 
								<span style="font-size: 20px;" class="input-group-addon glyphicon glyphicon-calendar"></span>
							</div>
						</div>
						<button type="submit" class="btn btn-default" style="margin-left: 43%;">조회</button>
					</form>
					
					<h3><span id="startDay">${date[0]}</span>~<span id="endDay">${date[1]}</span></h3>
					
					<div>
						<fmt:parseNumber var="mapList"  value="1234.12" integerOnly="true"/>
						<table class="table table-striped table-bordered text-center" style="margin-top: 80px;">
						
							<tr class="text-center">
								<th>지역</th>
								<th>상영편수</th>
								<th>매출액</th>
								<th>관객수</th>
								<th>상영 점유율(%)</th>
								<th>지역 예매율(%)</th>
							</tr>
							<c:forEach items="${resultMap}" var="map" varStatus="city">
								<tr class="text-center">
									<th class="regions" id="regions${city.index}">${map.key}</th>
									<c:forEach var="mapList" items="${map.value}" varStatus="de">
									 	<td class="city${city.index}" id="detail${city.index}${de.index}">${mapList}</td>
									</c:forEach>

									
								</tr>
							</c:forEach>
						</table>


						<ul id="graphBar" class="nav nav-tabs nav-justified">
							<li class="active graphNav" id="graph1" onclick="changeGraph(1)"><a>매출액</a></li>
							<li class="graphNav" id="graph2" onclick="changeGraph(2)"><a>관객수</a></li>
							<li class="graphNav" id="graph3" onclick="changeGraph(3)"><a>상영 점유율</a></li>
							<li class="graphNav" id="graph4" onclick="changeGraph(4)"><a>지역 예매율</a></li>
						</ul>
						<div id="graph" style="width: 100%; height: 500px; margin: 30px auto;"></div>
						</div>

				
			</div>
		</div>
	</div>


</body>



<script type="text/javascript"
	src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
</html>