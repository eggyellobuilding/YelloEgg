<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Yello egg</title>
    <!-- 부트스트랩 -->
    <link href="/yelloMovie/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
  	    <!-- mypage css -->
    <link href="/yelloMovie/css/mypage/mypage.css" rel="stylesheet">
        <link href="/yelloMovie/css/admin/cinema/theaterAdd.css" rel="stylesheet" type="text/css">
        <link href="/yelloMovie/css/admin/header.css" type="text/css"rel="stylesheet">
  </head>

    <script type="text/javascript">
  function cancelQaboardWrite() {
	location.href='mypageQaboardList.do';
}
  
  $(document).ready(function(){
	    //(master)ajax 영화관 가져오기
	    $("#selectCinemaName").click(function(){
	    	$.ajax({
	    		url:'adminQaCinemaFindJquery.do',
	    		type:'get',
	    		success:function(data){
	    			var cityLists = data.cityLists;
	    		
	    				var result = '';
	    				var temp = '';
	    				
	    				temp += '<div class="container">';
	    			    temp += '<div class="list-group" id="cinemaList">';
	    			    temp += '<a href="#" class="list-group-item"><strong style="color:purple;">영화관 보기</strong></a>';
	    			    temp += '<div class="row" style="margin:0px auot;">';
	    			    temp += '<div id="cinemaSi"class="col-xs-6" style="background-color:white;">'
	    				 for(var j = 0 ; j <cityLists.length;j++){
	    					 var dto = cityLists[j].cinemaCity;
	    					 temp +='<a style="color:black;"class="list-group-item" onclick=findCinemaName("'+dto+'") id="findCinemaName">'+dto+'<span class="glyphicon glyphicon-menu-right"></span></a>';	
	    					}
	    				temp +=	'</div>';				
	    				temp +=	'<div id="cinemaNameList"class="col-xs-6 text-center">';				
	    				temp +=	'</div>';
	    				temp +=	'</div>';
	    				temp +=	'</div>';
	    				temp +=	'</div>';
	    				result += temp;
	    				$('#div').css({position:'absolute',left:'472px','z-index':'3'}).html(result).toggle();
	    		}
	    	});
	    });
	});

	//ajax 영화관 이름
	function findCinemaName(cinemaCity){
		$.ajax({
		        	url:'adminQaCinemaNameFindJquery.do?cinemaCity='+cinemaCity,
		        	type:'get',
		        	success:function(data){
		        		var cinemaNameLists=data.nameLists;
		        		
		        		var result='';
		        		var temp ='';
		        		
		        		temp += '<ul style="list-style: none;padding:0px;">';
		        		for(var i=0; i <cinemaNameLists.length;i++){
		        			var dto = cinemaNameLists[i];
		        			temp+= '<li ><a onclick="selectCinemaName('+dto.cinemaIdx+',&quot;'+dto.cinemaName+'&quot;,&quot;'+dto.cinemaCity+'&quot;)" style="display:inline-block;color:black;text-decoration: none;")><strong>'+dto.cinemaName+'</strong></a></li>';
		        		} 
		        		temp +='</ul>';
		        		result = temp;
		        		$("#cinemaNameList").html(result);
		        	}
			});
	}
	function selectCinemaName(cinemaIdx , cinemaName,cinemaCity){
		var info = cinemaCity+'/'+cinemaName
		$('#selectCinemaName').text(info);
		$('#cinemaIdx').val(cinemaIdx);
		$('#div').hide();
	}
  </script>
  <body>
     <%@include file="../commonsView/header.jsp" %>
	<c:if test="${empty sessionScope.smdto.memberIdx}">
		<script type="text/javascript">
			window.alert('로그인후 사용하시기를 바랍니다.');
			location.href = 'main.do';
		</script>
	</c:if>     
<div class="container" id="divMypageContainer">
 <div class="mypageHeader"><h2><b>My YelloMovie</b></h2></div>
 		<div class="row" id="mypageNav">
			<div class="col-xs-2" id="mypageCol">
				<p><a href="mypageQaboardList.do?memberIdx=${sessionScope.smdto.memberIdx}"><img src="/yelloMovie/img/mypage/mypage.jpg"
					style="margin-left: 7px;" width="50%" height="50%"
					alt="myYelloMovie" class="img-rounded"></a>
				</p>
				<span style="color:#A4A4A4;"><strong>나의 문의내역</strong></span>
			</div>
			<div class="col-xs-2" id="mypageCol">
				<p><a href="mypageUpdateMemberForm.do?memberIdx=${sessionScope.smdto.memberIdx}"><img
					src="/yelloMovie/img/mypage/reservation.jpg" width="50%" height="50%"
					alt="updateMember" class="img-rounded"></a>
				</p>
				<span style="color:#A4A4A4;"><strong>개인정보수정</strong></span>
			</div>
			<div class="col-xs-2" id="mypageCol">
				<p><a href="mypageReservationList.do"><img
					src="/yelloMovie/img/mypage/reservation.jpg" width="50%" height="50%"
					alt="reservationImfo" class="img-rounded"></a>
				</p>
				<span style="color:#A4A4A4;"><strong>예매확인/취소</strong></span>
			</div>
			<div class="col-xs-2" id="mypageCol">
				<p><a href="mypageStoreBuyList.do"><img src="/yelloMovie/img/mypage/store.jpg"
					width="50%" height="50%" alt="storeImfo" class="img-rounded"></a>
				</p>
				<span style="color:#A4A4A4;"><strong>스토어 구매내역</strong></span>
			</div>
		</div>
		<div style="margin-top: 80px; margin-left: 10px;"><h3><strong>1:1문의</strong></h3></div>
		<div><h4><strong>개인정보 수집에 대한 동의</strong></h4></div>
		<textarea class="form-control" name="agreementContents" rows="10">
		귀하께서 문의하신 다음의 내역은 법률에 의거 개인정보 수집.이용에 대한 본인동의가 필요한 항목입니다.

개인정보의 수집 및 이용목적
회사는 1:1 문의내역의 확인, 요청사항 처리 또는 완료 시 원활한 의사소통 경로 확보를 위해 수집하고 있습니다.

수집하는 개인정보의 항목
이름, 연락처, 이메일 주소

개인정보의 보유기간 및 이용기간
문의 접수 ~ 처리 완료 후 6개월
(단, 관계법령의 규정에 의하여 보존 할 필요성이 있는 경우에는 관계 법령에 따라 보존)
자세한 내용은 '개인정보 처리방침'을 확인하시기 바랍니다.
		</textarea>
		<div class="row">
			<div class="col-xs-8" style="margin-top: 15px;">
				<p>개인정보 수집에 동의하십니까?<br>
				* 원활한 서비스 이용을 위한 최소한의 개인정보이므로 동의하지 않을 경우 서비스를 이용하실 수 없습니다.</p>
				
			</div>
			<div class="col-xs-4" style="padding-top: 20px; text-align: right;">
				<p>
				<input type="checkbox" name="inquiryAgree" style="width:20px; height: 14px; margin-right: 5px;"/>동의함
				<input type="checkbox" name="inquiryAgree" style="width:20px; height: 14px; margin-left: 15px; margin-right: 5px;"/>동의 하지 않음
				</p>
				
			</div>
		</div>
		
		<div style="border-top: 4px solid #F4FA58; margin-top: 20px;">
			<form class="form-group"  action="mypageQaboardWrite.do" method="post">
				<table class="table table-striped">
					<tr>
						<th id="inquiryCol"> 이름</th>
						<td colspan="3"><input type="text" value="${sessionScope.smdto.name}" readonly name="name" class="form-control" style="width: 30%"></input></td>
					</tr>
					<tr>
						<th id="inquiryCol"> 연락처</th>
						<td class="form-inline" style="width:30%">
						<input type="text" name="tel" value="${sessionScope.smdto.tel}"class="form-control" style="width: 20%"/> 
						</td>
						<th id="inquiryCol"> 이메일</th>
						<td><input type="email" name="email" value="${sessionScope.smdto.email}" class="form-control" style="width: 75%"></input></td>
					</tr>
					<tr>
						<th id="inquiryCol"> 문의지점</th>
					
						<td colspan="3">
							<button id="selectCinemaName" type="button" class="btn btn-default"> 영화관 선택  <span class="caret"></span></button>
	      					<input type="hidden" name="qaCinemaIdx" id="cinemaIdx" class="form-control"/>
	      					<div id="div" style="display:none;"></div>
						</td>
					
					</tr>
					<tr>
						<th id="inquiryCol"> 문의유형</th>
						<td colspan="3">
						<select class="form-control" name="qaCate" style="width:30%">
  							<option value="문의유형 선택">문의유형 선택</option>
  							<option value="일반문의">일반문의</option>
  							<option value="칭찬">칭찬</option>
  							<option value="불만">불만</option>
  							<option value="제안">제안</option>
						</select>
						</td>
					</tr>
					<tr>
						<th id="inquiryCol"> 제목</th>
						<td colspan="3">
						<input type="text" name="qaTitle" class="form-control">
						</td>
					</tr>
					<tr>
						<th id="inquiryCol"> 내용</th>
						<td colspan="3">
						<textarea class="form-control" name="qaContents" rows="20"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center" style="padding-top: 20px;">
						<button type="button" style="margin-right: 20px;width:120px;"class="btn btn-default btn-lg" onclick="cancelQaboardWrite()">취소</button>
						<button type="submit" style="width:120px;"class="btn btn-primary btn-lg">글작성</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
 </div>

	
<%@include file="../commonsView/footer.jsp" %>
  </body>
</html>