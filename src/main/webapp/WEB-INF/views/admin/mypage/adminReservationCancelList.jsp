<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>관리자 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <link href="/yelloMovie/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 	<link href="/yelloMovie/css/admin/header.css" type="text/css"rel="stylesheet">
</head>
<style>
h2{
	margin-top: 40px;
}
#reservationCancelTable tr{
	text-align: center;
}
#reservationCancelTable th{
	text-align: center;
}
</style>
<body>
	<div class="container">
		<c:if test="${empty sessionScope.saddto.adminIdx}">
			<script type="text/javascript">
				window.alert('로그인후 사용하시기를 바랍니다.');
				location.href = 'main.do';
			</script>
		</c:if>
		<%@include file="../adminCommonsViews/adminHeader.jsp"%>

		<div class="container">
			<%@include file="../adminCommonsViews/adminNavi.jsp"%>
			<div class="col-xs-10"
				style="padding: 0px; padding-left: 5px; border-left: 1px solid #E1E1E1; height: 1900px;">
				<ul class="nav nav-tabs">
					<li><a href="adminReservationConfirmList.do">예약 확인 내역</a></li>
					<li class="active"><a href="adminReservationCancelList.do">예약 취소 내역</a></li>
					<li><a href="adminStoreBuyList.do">스토어 구매 내역</a></li>
					<li><a href="adminStoreCancelList.do">스토어 취소 내역</a></li>
				</ul>
				<div class="container">
					<h2>예약 취소 내역</h2>
					<table id="reservationCancelTable" class="table table-hover" style="margin-top:35px;overflow: auto;width:95%;" >
					<thead>
					<tr class="active">
						<th width="8%"  class="text-center">NO.</th>						
						<th width="10%"  class="text-center">등급</th>						
						<th width="10%"  class="text-center">예매취소자</th>						
						<th width="15%"  class="text-center">영화명</th>												
						<th width="10%"  class="text-center">영화관</th>
						<th width="10%"  class="text-center">가격</th>
						<th width="10%"  class="text-center">사용마일리지</th>
						<th width="10%"  class="text-center">예매날짜</th>
						<th width="10%"  class="text-center">취소날짜</th>
						<th width="10%"  class="text-center">예매상태</th>
					</tr>
					</thead>
					<tbody>
					<c:if test="${empty lists}">
						<tr>
							<td colspan="10" align="center">예매취소한 내역이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty lists}">
						<c:forEach var="mpdto" items="${lists}">
							<tr>
								<td>${mpdto.reservationIdx}</td>
								<td>${mpdto.gradeName}</td>
								<td>${mpdto.id}</td>
								<td>${mpdto.movieName}</td>
								<td>${mpdto.cinemaName}</td>
								<td>${mpdto.ticketPrice}원</td>
								<c:if test="${0 ne mpdto.reservationMileage}">
								<td>${mpdto.reservationMileage}P</td>
								</c:if>
								<c:if test="${0 eq mpdto.reservationMileage}">
								<td>-</td>
								</c:if>
								<td>${mpdto.reservationDate}</td>
								<td>${mpdto.delReservationDate}</td>
								<c:if test="${'N' eq mpdto.reservationStatus}">
								<td>예매취소</td>
								</c:if>
							</tr>
						</c:forEach>
					</c:if>	
					</tbody>
					<tfoot>
						<tr>
							<td colspan="10">
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
			</div>
		</div>
	</div>
</body>
    
    <script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
</html>