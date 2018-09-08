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
 <script type="text/javascript">
 function mypageCancelStoreBuy(storePayIdx_s) {
	 var storePayIdx=storePayIdx_s.value;
	 var memberIdx=document.getElementById('memberIdx').value;
	 var result =window.confirm('진짜 결제를 취소 하시겠습니까?');
		if(result){
			location.href='mypageCancelStoreBuy.do?storePayIdx='+storePayIdx+'&memberIdx='+memberIdx;
		}else{
			window.alert('결제를 취소하였습니다.');
			location.href='mypageStoreBuyList.do?memberIdx='+memberIdx;
		}
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
				<p><a href="mypageQaboardList.do?memberIdx=${sessionScope.smdto.memberIdx}">
				<img src="/yelloMovie/img/mypage/mypageQaboard.png"
					style="margin-left: 7px;" width="50px" height="50px"
					alt="myYelloMovie" class="img-rounded"></a>
				</p>
				<span style="color:#A4A4A4;"><strong>나의 문의내역</strong></span>
			</div>
			<div class="col-xs-2" id="mypageCol">
				<p><a href="mypageUpdateMemberForm.do?memberIdx=${sessionScope.smdto.memberIdx}"><img
					src="/yelloMovie/img/mypage/mypageUpdate.png" width="50px" height="50px"
					alt="updateMember" class="img-rounded"></a>
				</p>
				<span style="color:#A4A4A4;"><strong>개인정보수정</strong></span>
			</div>
			<div class="col-xs-2" id="mypageCol">
				<p><a href="mypageReservationList.do?memberIdx=${sessionScope.smdto.memberIdx}"><img
					src="/yelloMovie/img/mypage/mypageReservation.png" width="61px" height="50px"
					alt="reservationImfo" class="img-rounded"></a>
				</p>
				<span style="color:#A4A4A4;"><strong>예매확인/취소</strong></span>
			</div>
			<div class="col-xs-2" id="mypageCol">
				<p><a href="mypageStoreBuyList.do?memberIdx=${sessionScope.smdto.memberIdx}">
				<img src="/yelloMovie/img/mypage/mypageStore.png"
					width="50px" height="50px" alt="storeImfo" class="img-rounded"></a>
				</p>
				<span style="color:#A4A4A4;"><strong>스토어 구매내역</strong></span>
			</div>
		</div>
				<div style="margin-top: 80px; margin-left: 10px;"><h3><strong>스토어 구매내역</strong></h3></div>
		<div style="margin-top: 67px; margin-left: 20px;">
 			<ul class="nav nav-pills">
  				<li role="presentation" class="active"><a href="mypageStoreBuyList.do?memberIdx=${sessionScope.smdto.memberIdx}">스토어 구매내역</a></li>
 				 <li role="presentation" ><a href="mypageStoreCancelList.do?memberIdx=${sessionScope.smdto.memberIdx}">스토어 취소내역</a></li>
			</ul>
 		</div>
 		<div id="divList">
 		<form>
 		<input type="hidden" name="memberIdx" id="memberIdx" value="${sessionScope.smdto.memberIdx}"/>
		<div style="text-align: center; margin-top: 15px;">
				<table class="table table-hover" >
					<thead>
					<tr class="active">
						<th width="10%"  class="text-center">NO.</th>
						<th width="20%"  class="text-center">상품명</th>
						<th width="10%"  class="text-center">수량</th>
						<th width="15%"  class="text-center">가격</th>
						<th width="15%"  class="text-center">결제상태</th>
						<th width="15%"  class="text-center">구매날짜</th>
						<th width="40%"  class="text-center">취소여부</th>
					</tr>
					</thead>
					<tbody>
					<c:if test="${empty lists}">
						<tr>
							<td colspan="7" align="center">구매한 내역이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty lists}">
						<c:forEach var="mpdto" items="${lists}">
						<input type="hidden" name=storePayIdx${mpdto.storePayIdx} value="${mpdto.storePayIdx}"/>
							<tr>
								<td>${mpdto.storePayIdx}</td>
								<td>${mpdto.storeName}</td>
								<td>${mpdto.storePayCount}개</td>
								<td>${mpdto.storePayPrice}원</td>
								<td>${mpdto.storePayState}</td>
								<td>${mpdto.storePayDate}</td>
								<td>
								<input type="button" class="btn btn-danger" value="구매취소" onclick="mypageCancelStoreBuy(storePayIdx${mpdto.storePayIdx})"/>
								</td>
							</tr>
						</c:forEach>
					</c:if>	
					</tbody>
					<tfoot>
						<tr>
							<td colspan="7">
							<nav style="text-align: center">
								<ul class="pagination">
									${pageStr}
								</ul>
							</nav>
							</td>		
						</tr>	
					</tfoot>
				</table>
			</div>
		</form>	
	</div>	

 </div>
	
<%@include file="../commonsView/footer.jsp" %>
  </body>
</html>