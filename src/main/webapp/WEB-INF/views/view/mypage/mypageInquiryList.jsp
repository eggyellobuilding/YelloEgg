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
  function mypageInquiryWrite() {
	location.href='mypageInquiryWriteForm.do';
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
		<form name="mypageInquiryList" action="mypageInquiryWriteForm.do">
		<div style="margin-top: 80px; margin-left: 10px;"><h3><strong>나의 문의내역</strong></h3></div>
		<div style="margin-top: 20px;margin-left: 10px;"><button type="submit" class="btn btn-primary" style="width:10%">1:1문의</button></div>
		<div style="text-align: center; margin-top: 15px;">
				<table class="table table-hover" >
					<thead>
					<tr class="active">
						<th width="10%"  class="text-center">NO.</th>
						<th width="50%"  class="text-center">제목</th>
						<th width="20%"  class="text-center">답변상태</th>
						<th width="20%"  class="text-center">등록일</th>
					</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="4">문의글이 없습니다.</td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>	
</div>	
<%@include file="../commonsView/footer.jsp" %>
  </body>
</html>