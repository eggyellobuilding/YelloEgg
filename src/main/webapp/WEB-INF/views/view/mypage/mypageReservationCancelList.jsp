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
  </head>
	    <!-- mypage css -->
    <link href="/yelloMovie/css/mypage/mypage.css" rel="stylesheet">
  <body>
   <%@include file="../commonsView/header.jsp" %>
<div class="container" id="divMypageContainer">
 	<div class="mypageHeader"><h2><b>My YelloMovie</b></h2></div>
 		<div class="row" id="mypageNav">
			<div class="col-xs-2" id="mypageCol">
				<p><a href="mypageInquiryList.do"><img src="/yelloMovie/img/mypage/mypage.jpg"
					style="margin-left: 7px;" width="50%" height="50%"
					alt="myYelloMovie" class="img-rounded"></a>
				</p>
				<span style="color:#A4A4A4;"><strong>나의 문의내역</strong></span>
			</div>
			<div class="col-xs-2" id="mypageCol">
				<p><a href="mypageUpdateMemberForm.do"><img
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
		<div style="margin-top: 80px; margin-left: 10px;"><h3><strong>예매확인/취소</strong></h3></div>
		<div style="padding-top:8px;color:#A4A4A4;padding-left: 20px;">예매하신 영화 내역과 취소 내역을 확인할 수 있습니다.</div>
 		<div style="margin-top: 30px; margin-left: 20px;">
 			<ul class="nav nav-pills">
  				<li role="presentation" ><a href="mypageReservationList.do">예매 내역</a></li>
 				 <li role="presentation" class="active" ><a href="mypageReservationCancelList.do">예매 취소내역</a></li>
			</ul>
 		</div>
 		<div id="divList">
 		<form name="mypageReservationCancelList">
		<div style="text-align: center; margin-top: 15px;">
				<table class="table table-hover" >
					<thead>
					<tr class="active">
						<th width="10%"  class="text-center">NO.</th>
						<th width="10%"  class="text-center">예매번호</th>
						<th width="20%"  class="text-center">영화명</th>
						<th width="20%"  class="text-center">영화관</th>
						<th width="15%"  class="text-center">상영일시</th>
						<th width="15%"  class="text-center">예매일</th>
						<th width="30%"  class="text-center">취소일시</th>
					</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="7" align="center">취소한 내역이 없습니다.</td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>	
	</div>	
 </div>
<%@include file="../commonsView/footer.jsp" %>
  </body>
</html>