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
#storeCancelTable th{
	text-align: center;
	
}
#storeCancelTable tr{
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
<%@include file="../adminCommonsViews/adminHeader.jsp" %>
		
		<div class="container">
			<%@include file="../adminCommonsViews/adminNavi.jsp" %>
    			<div class="col-xs-10" style="padding:0px;padding-left:5px; border-left: 1px solid #E1E1E1; height:1900px; ">
      				<ul class="nav nav-tabs" >
      					<li><a href="adminReservationConfirmList.do" >예약 확인 내역</a></li>
						<li><a href="adminReservationCancelList.do">예약 취소 내역</a></li>
						<li><a href="adminStoreBuyList.do">스토어 구매 내역</a></li>
						<li class="active"><a href="adminStoreCancelList.do">스토어 취소 내역</a></li>
					</ul>
				<div class="container">
					<h2>스토어 취소 내역</h2>
					<table id="storeCancelTable" class="table table-hover" style="margin-top:35px;overflow: auto;width:95%;" >
					<thead>
					<tr class="active">
						<th width="10%"  class="text-center">No.</th>
						<th width="10%"  class="text-center">등급</th>
						<th width="10%"  class="text-center">구매취소자</th>
						<th width="10%"  class="text-center">구매날짜</th>
						<th width="10%"  class="text-center">취소날짜</th>
						<th width="10%"  class="text-center">상품명</th>
						<th width="5%"  class="text-center">수량</th>
						<th width="10%"  class="text-center">가격</th>
						<th width="10%"  class="text-center">사용마일리지</th>
						<th width="10%"  class="text-center">결제상태</th>
					</tr>
					</thead>
					<tbody>
						<c:if test="${empty lists}">
						<tr>
							<td colspan="10" align="center">구매한 내역이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty lists}">
						<c:forEach var="mpdto" items="${lists}">
							<tr>
								<td>${mpdto.storePayIdx}</td>
								<td>${mpdto.gradeName}</td>
								<td>${mpdto.id}</td>
								<td>${mpdto.storePayDate}</td>
								<td>${mpdto.delPaymentDate}</td>
								<td>${mpdto.storeName}</td>
								<td>${mpdto.storePayCount}개</td>
								<td>${mpdto.storePayPrice}원</td>
								<c:if test="${0 ne mpdto.storePayMileage}">
								<td>${mpdto.storePayMileage}P</td>
								</c:if>
								<c:if test="${0 eq mpdto.storePayMileage}">
								<td>-</td>
								</c:if>
								<td>${mpdto.storePayState}</td>
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