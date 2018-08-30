<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<link href="/yelloMovie/css/member/memberLogin.css" rel="stylesheet">
	
<div class="container" id="divStateContainer">
    <div>
		<form role="form" name="memberLoginState" action="memberLogout.do">
			<fieldset style="margin:0px auto;">
			
				<h3 style="text-align: center">YelloEgg Moive</h3>
				<hr class="colorgraph">
				
				<div class="row">
					<div class="col-xs-6">
                        <p class="text-center" style="font-size:20px;">${sessionScope.smdto.id}님</p>
					</div>
					<div class="col-xs-6">
						<p class="text-center" style="font-size:20px; color: green;">달걀</p>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-6">
                        <p class="text-center" style="font-size:20px; color: blue;">마일리지 포인트</p>
					</div>
					<div class="col-xs-6">
						<p class="text-center" style="font-size:20px; color:green;">${dtos.mileagePrice}P</p>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
                        <p><a href="mypageForm.do"><img src="/yelloMovie/img/mypage/mypage.jpg" style="margin-left: 7px;" width="80%" height="80%" alt="myYelloMovie" class="img-circle"></a></p>
                        <span style="margin-left:7px;">My YelloMovie</span>
					</div>
					<div class="col-xs-4">
						<p><a href="mypageReservationList.do"><img src="/yelloMovie/img/mypage/reservation.jpg" width="80%" height="80%" alt="reservationImfo" class="img-circle"></a></p>
						<span style="margin-left:17px;">예매내역</span> 
					</div>
					<div class="col-xs-4">
						<p><a href="mypageStoreBuyList.do"><img src="/yelloMovie/img/mypage/store.jpg" width="80%" height="80%" alt="storeImfo" class="img-circle"></a></p>
						<span style="margin-left:10px;">스토어내역</span>
					</div>
				</div>
				<hr style="margin: 25px 0px 10px 0px;">
				<div class="row">
					<div class="col-xs-8">
                        <p style="margin-top: 3px; "><span style="font-size: 17px;">${cookie.lastday.value}</span></p>
					</div>
					<div class="col-xs-3">
						<input type="submit" class="btn btn-info btn-sm" value="로그아웃" onclick="memberLogout()"> 
					</div>
					<div class="col-xs-1" style="margin-top:3px;">
						<button type="button" class="close" aria-label="Close" ><span aria-hidden="true">&times;</span></button>
					</div>
				</div>
				<hr class="colorgraph" style="margin-top: 5px;">
			</fieldset>
		</form>
	</div>
</div>