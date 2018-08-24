<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>관리자 페이지</title>
    <link href="/yelloMovie/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 	<link href="/yelloMovie/css/admin/header.css" type="text/css"rel="stylesheet">
 	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
</head>
<style>
h2{
	margin-top: 40px;
}
#adminDelMemberTable th{
	text-align: center;
	
}
#adminDelMemberTable td{
	text-align: center;
}
</style>
<body>
<div class="container">
<%@include file="../adminCommonsViews/adminHeader.jsp" %>
		
		<div class="container">
			<%@include file="../adminCommonsViews/adminNavi.jsp" %>
    			<div class="col-xs-10" style="padding:0px;padding-left:5px; border-left: 1px solid #E1E1E1; height:1900px; ">
      				<ul class="nav nav-tabs" >
      					<li><a href="adminMemberList.do">가입된 회원관리</a></li>
						<li class="active"><a href="adminDeleteMemeberList.do">탈퇴 회원관리</a></li>
					</ul>
					<div class="container" class="col-xs-10">
						<h2>탈퇴한 회원목록</h2>
							<form name="memberDeleteList" action="afterDaysDeleteMember.do" style="margin-top:35px;overflow: auto;width:95%;">
								<table id="adminDelMemberTable" class="table table-striped">
									<thead>
									<tr>
										<th>번호</th>
										<th>등급</th>
										<th>이름</th>
										<th>ID</th>
										<th>성별</th>
										<th>생년월일</th>
										<th>휴대폰번호</th>
										<th>Email</th>
										<th>탈퇴한 날짜</th>
									</tr>
									</thead>
									<tbody>
										<c:if test="${empty lists}">
										<tr>
											<td colspan="9" align="center">
												회원내역이 없습니다.
											</td>
										</tr>
										</c:if>
								<c:forEach var="dmdto" items="${lists}">
									<tr>
										<td>${dmdto.memberIdx}</td>
										<td>${dmdto.gradeName}</td>
										<td>${dmdto.name}</td>
										<td>${dmdto.id}</td>
										<td>${dmdto.gender}</td>
										<td>${dmdto.birthDate}</td>
										<td>${dmdto.tel}</td>
										<td>${dmdto.email}</td>
										<td>${dmdto.joinDate}</td>
									</tr>
								</c:forEach>
									<tr>
										<td colspan="8"></td>
										<td>
											<input type="submit" value="삭제" class="btn btn-danger">
										</td>
									</tr>
									</tbody>
									<tfoot>
								<tr>
									<td colspan="9">
										<nav>
											<ul class="pagination pagination-lg">
												<li><a href="#" aria-label="Previous"> <span
														aria-hidden="true">&laquo;</span>
												</a></li>
												<li><a href="#">1</a></li>
												<li><a href="#">2</a></li>
												<li><a href="#">3</a></li>
												<li><a href="#">4</a></li>
												<li><a href="#">5</a></li>
												<li><a href="#" aria-label="Next"> <span
														aria-hidden="true">&raquo;</span>
												</a></li>
											</ul>
										</nav>
									</td>
								</tr>
							</tfoot>		
								</table>
							</form>
					</div>
    			</div>
		</div>
</div>
</body>

</html>