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
 	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 	<!-- httpRequest -->
 	<script type="text/javascript" src="js/httpRequest.js"></script>
 	<link href="/yelloMovie/css/admin/cinema/theaterAdd.css" rel="stylesheet" type="text/css">
</head>
<style>
h2{
	margin-top: 40px;
}
#adminEmployeeTable th{
	text-align: center;
}

#adminEmployeeTable td{
	text-align: center;
	
}
</style>
<script type="text/javascript">
$(document).ready(function(){
    //(master)ajax 영화관 가져오기
    $("#selectCinemaName").click(function(){
    	$.ajax({
    		url:'adminEmployeeCinemaFindJquery.do',
    		type:'get',
    		success:function(data){
    			var cityLists = data.cityLists;
    		
    				var result = '';
    				var temp = '';
    				
    				temp += '<div class="container">';
    			    temp += '<div class="list-group" id="cinemaList">';
    			    temp += '<a href="#" class="list-group-item"><strong style="color:purple;">영화관 보기</strong></a>';
    			    temp += '<div class="row" style="margin:0px auto;">';
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
    				$('#div').css({position:'absolute',left:'137px','z-index':'3'}).html(result).toggle();
    		}
    	});
    });
});

//ajax 영화관 이름
function findCinemaName(cinemaCity){
	$.ajax({
	        	url:'adminEmployeeCinemaNameFindJquery.do?cinemaCity='+cinemaCity,
	        	type:'get',
	        	success:function(data){
	        		var cinemaNameLists=data.nameLists;
	        		
	        		var result='';
	        		var temp ='';
	        		
	        		temp += '<ul style="list-style: none;padding:0px;">';
	        		for(var i=0; i <cinemaNameLists.length;i++){
	        			var dto = cinemaNameLists[i];
	        			temp+= '<li ><a href="#" onclick="selectCinemaName('+dto.cinemaIdx+',&quot;'+dto.cinemaName+'&quot;,&quot;'+dto.cinemaCity+'&quot;)" style="display:inline-block;color:black;text-decoration: none;")><strong>'+dto.cinemaName+'</strong></a></li>';
	        		} 
	        		temp +='</ul>';
	        		result = temp;
	        		$("#cinemaNameList").html(result);
	        	}
		});
		
}
//영화관 선택시
function selectCinemaName(cinemaIdx,cinemaName,cinemaCity){
		$('#selectCinemaName').text(cinemaCity);
		$('#div').hide();
		$('#cinemaName').val(cinemaName);
		$('#cinemaIdx').val(cinemaIdx);
		
	$.ajax({
			url:'adminEmployeeCountJquery.do?cinemaIdx='+cinemaIdx,
	    	type:'post',
	    	success:function(data){
	    		var count = data.count;
	    		var adminId = "admin"+cinemaIdx+count; 
	    			$('#adminId').val(adminId);
	    		}
				
			}); 
	}

function adminIdCheck() {
	var adminId=document.getElementById('adminId').value;
	alert(adminId);
	sendRequest('adminIdCheck.do','adminId='+adminId,adminIdCheckResult,'GET');
}
function adminIdCheckResult() {
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			var divNode=document.all.adminIdCheckMsg;
			divNode.innerHTML=data;
		}
	}
}


function adminDeleteEmployee(adminIdx_s) {
	var adminIdx=adminIdx_s.value;
	alert(adminIdx);
	var result =window.confirm('진짜 삭제하시겠습니까?');
	if(result){
		location.href='adminDeleteEmployee.do?adminIdx='+adminIdx;
	}else{
		window.alert('삭제를 취소하였습니다.');
		location.href='adminEmployeeList.do';
	}
}

</script>
<body>
	<c:if test="${empty sessionScope.saddto.adminIdx}">
		<script type="text/javascript">
			window.alert('로그인후 사용하시기를 바랍니다.');
			location.href = 'main.do';
		</script>
	</c:if>
	<div class="container">
		<%@include file="../adminCommonsViews/adminHeader.jsp"%>

		<div class="container">
			<%@include file="../adminCommonsViews/adminNavi.jsp"%>
			<div class="col-xs-10"
				style="padding: 0px; padding-left: 5px; border-left: 1px solid #E1E1E1; height: 1900px;">
				<ul class="nav nav-tabs">
					<li class="active"><a href="adminEmployeeList.do">사원 관리</a></li>
				</ul>
				<div class="container">
					<h2>사원 목록</h2>
					
					<c:if test="${'1' eq sessionScope.saddto.adminGrade}">
					
					<form style="margin-top: 35px; overflow: auto; width: 95%;">
						<table id="adminEmployeeTable" class="table table-hover">
							<thead>
								<tr>
									<th>사원번호</th>
									<th>사원등급</th>
									<th>ID</th>
									<th>영화관 지역</th>
									<th>영화관 이름</th>
									<th>사원등록날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty lists}">
									<tr>
										<td colspan="6" align="center">
											사원내역이 없습니다.
										</td>
									</tr>
								</c:if>
								<c:forEach  var="addto" items="${lists}">
								<c:if test="${'3' ne addto.adminGrade}">
								
									<tr data-toggle="modal" data-target="#cinemaNameEmployeeModal">
										<td>${addto.adminIdx}</td>
										<td>${addto.adminGrade}</td>
										<td>${addto.adminId}</td>
										<td>${addto.cinemaCity}</td>
										<td>${addto.cinemaName}</td>
										<td>${addto.adminJoinDate}</td>
									</tr>
									</c:if>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="6">
										<nav>
											<ul class="pagination">
												${pageStr}
											</ul>
										</nav>
									</td>
								</tr>
							</tfoot>
						</table>
					</form>
					</c:if>
					
					<c:if test="${('2' eq sessionScope.saddto.adminGrade) or ('3' eq sessionScope.saddto.adminGrade)}">
					
					<form method="post" style="margin-top: 35px; overflow: auto; width: 95%;">
						
						<table id="adminEmployeeTable" class="table table-hover">
							<thead>
								<tr>
									<th>사원번호</th>
									<th>사원등급</th>
									<th>ID</th>
									<th>영화관 지역</th>
									<th>영화관 이름</th>
									<th>사원등록날짜</th>
									<th>비고</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty lists}">
									<tr>
										<td colspan="7" align="center">
											사원내역이 없습니다.
										</td>
									</tr>
								</c:if>
								<c:forEach  var="addto" items="${lists}">
								<input type="hidden" name=adminIdx${addto.adminIdx} value="${addto.adminIdx}"/>	
									<tr>
									<c:if test="${'3' ne addto.adminGrade}">
										<td>${addto.adminIdx}</td>
										<td>${addto.adminGrade}</td>
										<td>${addto.adminId}</td>
										<td>${addto.cinemaCity}</td>
										<td>${addto.cinemaName}</td>
										<td>${addto.adminJoinDate}</td>
										<td>
										<c:if test="${'3' eq sessionScope.saddto.adminGrade}">
										<input type="button" value="삭제" class="btn btn-danger" onclick="adminDeleteEmployee(adminIdx${addto.adminIdx})"/>
 										</c:if>
 										<c:if test="${'2' eq sessionScope.saddto.adminGrade}">
 										<c:if test="${'1' eq addto.adminGrade}">
										<input type="button" value="삭제" class="btn btn-danger" onclick="adminDeleteEmployee(adminIdx${addto.adminIdx})"/>
 										</c:if>
 										</c:if>
										</td>
									</c:if>
									</tr>
								</c:forEach>
									<tr>
										<td colspan="6"></td>
										<td>
										<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#AdminEmployeeRegister">
										 사원등록
										</button>
										</td>
									</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="7">
										<nav>
											<ul class="pagination">
												${pageStr}
											</ul>
										</nav>
									</td>
								</tr>
							</tfoot>
						</table>
					</form>
					</c:if>	
				</div>
			</div>
		</div>
		<!-- Modal -->
<div class="modal fade" id="AdminEmployeeRegister" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">YelloEgg 사원등록처</h4>
      </div>
      	<form class="form-group" action="adminRegisterEmployee.do" method="post">
      <div class="modal-body">
      		<table class="table table-striped">
      		     <tr>
      				<th>영화관 지역</th>
      				<td>
      					<button id="selectCinemaName" type="button" class="btn btn-default"> 영화관 선택  <span class="caret"></span></button>
      					<input type="hidden" name="adminCinemaIdx" id="cinemaIdx" class="form-control"/>
      					<div id="div" style="display:none;"></div>
      				</td>
      			</tr>
      			<tr>
      				<th>영화관 이름</th>
      				<td>
      					<input type="text" name="adminCinemaName" id="cinemaName" class="form-control"/>
      				</td>
      			</tr>
      			<tr>
      				<th>ID</th>
      				<td><input type="text" name="adminId" id="adminId" class="form-control" readonly/>
      				</td>
      			</tr>
      			<tr>
      				<th>비밀번호</th>
      				<td><input type="password" style="width:200px;" name="adminPwd" id="adminPwd" class="form-control"/></td>
      			</tr>
      			<tr>
      				<th>관리자 등급</th>
      				<c:if test="${'3' eq sessionScope.saddto.adminGrade}">
      				<td>
      					<input type="radio" style="width:20px;height: 14px;" name="adminGrade" value="2"/>관리자
      					<input type="radio" style="width:20px;height: 14px;" name="adminGrade" value="1"/>사원
      				</td>
      				</c:if>
      				<c:if test="${'2' eq sessionScope.saddto.adminGrade}">
      				<td colspan="2">
      					<input type="radio" style="width:20px;height: 14px;" name="adminGrade" value="2" disabled="disabled"/>관리자
      					<input type="radio" style="width:20px;height: 14px;" name="adminGrade" value="1"/>사원
      				</td>
      				</c:if>
      			</tr>
      		</table>
      	
      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	        <button type="submit" class="btn btn-primary">사원등록</button>
	      </div>
      </form>
    </div>
  </div>
</div>
	</div>
</body>
    <script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
</html>