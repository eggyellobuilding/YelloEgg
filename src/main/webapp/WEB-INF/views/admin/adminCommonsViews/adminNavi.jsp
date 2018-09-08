<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="col-xs-2" style="padding:0px;" >
    <!--Sidebar content-->
      	<ul class="nav nav-tabs nav-stacked">
	      	<li><a href="adminMemberList.do">회원관리</a></li>
	      	<li><a href="adminEmployeeList.do">사원관리</a></li>
	      	<li><a href="adminMovieList.do">영화 관리</a></li>
	      	<li><a href="adminCinema.do">영화관 관리</a></li>
	      	<li><a href="adminSchedule.do">스캐줄 관리</a></li>
	      	<li><a href="adminReservationConfirmList.do">예매&스토어내역 관리</a></li>
	      	<li><a href="adminStoreList.do">상품 관리</a></li>
	      	<li><a href="adminNotice.do">공지사항 관리</a></li>
	      	<li><a href="adminQaboardList.do">1:1문의 관리
	      	<c:if test="${empty count}">
	      	<span class="badge" style="background-color: #337ab7;">0</span>
	      	</c:if>
	      	<c:if test="${!empty count}">
	      	<span class="badge" style="background-color: #337ab7;">${count}</span>
	      	</c:if>
	      	</a>
	      	</li>
	      	<li><a href="adminStatics.do">통계표</a></li>
      	</ul>
</div>