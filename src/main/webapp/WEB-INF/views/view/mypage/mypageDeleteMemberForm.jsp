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
  </head>
  
  <script type="text/javascript">
  function cancelDeleteMember() {
	  location.href='mypageUpdateMemberForm.do';
}
  </script> 
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
		<div style="margin-top: 80px; margin-left: 10px;"><h3><strong>회원탈퇴</strong></h3></div>
		<div style="padding-top:8px;color:#FE2E64;padding-left: 20px;"><h4><strong>[주의] YelloEggMovie 회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</strong></h4></div>
 		<div style="border-top: 4px solid #F4FA58; margin-top: 20px;">
			<form class="form-group" name="mypageDeleteMemberForm" action="mypageDeleteMember.do">
				<table class="table table-striped">
					<tr>
						<td colspan="3">
						<div style="padding-top: 10px;"><strong style="padding-left: 10px;">1. 30일간 회원 재가입이 불가능합니다.</strong></div><br>
						<div style="color:#848484;"><span class="glyphicon glyphicon-menu-right" aria-hidden="true" style="padding-left: 10px;padding-right: 10px;color:#2E64FE;"></span> 
						회원 탈퇴 후, 30일 경과 후 재가입할 수 있습니다.</div>
						</td>
					</tr>
					<tr>
						<td colspan="3">
						<div style="padding-top: 10px;"><strong style="padding-left: 10px;">2. 탈퇴 후 삭제 내역 (회원 탈퇴하시면 회원정보와 개인 보유 포인트 등 정보가 삭제되며 데이터는 복구되지 않습니다.)</strong></div><br>
						<div style="color:#848484;"><span class="glyphicon glyphicon-menu-right" aria-hidden="true" style="padding-left: 10px;padding-right: 10px;color:#2E64FE;"></span>
						YelloEggMovie 멤버십 포인트 및 적립/차감 내역</div>
						<div style="color:#848484;padding-top: 10px;"><span class="glyphicon glyphicon-menu-right" aria-hidden="true" style="padding-left: 10px;padding-right: 10px;color:#2E64FE;"></span>
						영화 예매/취소 내역 </div>
						<div style="color:#848484;padding-top: 10px;"><span class="glyphicon glyphicon-menu-right" aria-hidden="true" style="padding-left: 10px;padding-right: 10px;color:#2E64FE;"></span>
						스토어 구매/취소 내역 </div>
						</td>
					</tr>
					<tr>
						<td colspan="3">
						<div style="padding-top: 10px;"><strong style="padding-left: 10px;">3. 고객님께서 불편하셨던 점, 아쉬웠던 점을 알려주시면 앞으로 더 나은 모습으로 찾아 뵙겠습니다.</strong></div><br>
						<div style="color:#848484;">
						<div style="padding-top: 10px; padding-left: 10px;"><input type="radio" name="inquiry" style="width: 16px;height: 16px;margin-right: 10px;" value="서비스 장애가 잦아서"/>서비스 장애가 잦아서</div>
						<div style="padding-top: 10px; padding-left: 10px;"><input type="radio" name="inquiry" style="width: 16px;height: 16px;margin-right: 10px;" value="이벤트 및 무료서비스 혜택이 적어서"/>이벤트 및 무료서비스 혜택이 적어서</div>
						<div style="padding-top: 10px; padding-left: 10px;"><input type="radio" name="inquiry" style="width: 16px;height: 16px;margin-right: 10px;" value="불만 및 불편사항에 대한 고객응대가 나빠서"/>불만 및 불편사항에 대한 고객응대가 나빠서</div>
						<div style="padding-top: 10px; padding-left: 10px;"><input type="radio" name="inquiry" style="width: 16px;height: 16px;margin-right: 10px;" value="영화관람시 시설 및 가격등의 불만 때문에"/>영화관람시 시설 및 가격등의 불만 때문에</div>
						<div style="padding-top: 10px; padding-left: 10px;"><input type="radio" name="inquiry" style="width: 16px;height: 16px;margin-right: 10px;" value="이용빈도가 낮고 개인정보 유출이 우려되어"/>이용빈도가 낮고 개인정보 유출이 우려되어</div>
						<div style="padding-top: 10px; padding-left: 10px;"><input type="radio" name="inquiry" style="width: 16px;height: 16px;margin-right: 10px;" value="탈퇴 후 재가입을 위해"/>탈퇴 후 재가입을 위해</div>
						<div class="form-inline">
						<div style="padding-top: 10px; padding-left: 10px; padding-bottom: 15px;"><input type="radio" name="inquiry" style="width: 16px;height: 16px;margin-right: 10px;" value="기타"/>기타 
						<input type="text" name="inquiryEtc"  class="form-control input-sm" style="width:70%;"></div>
						</div>
						</div>
						</td>
					</tr>
					<tr>
						<th id="updateTr"> *비밀번호</th>
						<td id="updateTd"  colspan="2"><input type="password" name="pwd" id="pwd" class="form-control" style="width: 21%"></input></td>
					</tr>
					<tr>
						<td colspan="3" align="center" style="padding-top: 20px;">
						<button type="button" style="margin-right: 20px;width:120px;height: 50px;"class="btn btn-default btn-lg" onclick="cancelDeleteMember()">Cancel</button>
						<button type="submit" style="width:120px;"class="btn btn-primary btn-lg">Submit</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
 </div>

	
<%@include file="../commonsView/footer.jsp" %>
  </body>
</html>