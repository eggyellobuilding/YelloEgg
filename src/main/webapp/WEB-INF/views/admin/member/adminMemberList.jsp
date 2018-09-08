<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
#adminMemberTable th{
	text-align: center;
}

#adminMemberTable td{
	text-align: center;
	
}
</style>
<script type="text/javascript">
function adminUpdateMemberForm(memberIdx) {
	location.href='adminUpdateMemberForm.do?memberIdx='+memberIdx;
}
function adminDeleteMember(memberIdx_s) {
	var memberIdx=memberIdx_s.value;
	alert(memberIdx);
	var result =window.confirm('진짜 삭제하시겠습니까?');
	if(result){
		location.href='adminDeleteMember.do?memberIdx='+memberIdx;
	}else{
		window.alert('삭제를 취소하였습니다.');
		location.href='adminMemberList.do';
		
	}
}
</script>
<body>
<div class="container">
<%@include file="../adminCommonsViews/adminHeader.jsp" %>
	<c:if test="${empty sessionScope.saddto.adminIdx}">
		<script type="text/javascript">
			window.alert('로그인후 사용하시기를 바랍니다.');
			location.href = 'main.do';
		</script>
	</c:if>
		<div class="container">
			<%@include file="../adminCommonsViews/adminNavi.jsp" %>
    			<div class="col-xs-10" style="padding:0px;padding-left:5px; border-left: 1px solid #E1E1E1; height:1900px; ">
      				<ul class="nav nav-tabs" >
      					<li class="active"><a href="adminMemberList.do" >가입된 회원관리</a></li>
						<li><a href="adminDeleteMemberList.do">탈퇴 회원관리</a></li>
					</ul>
					<div class="container">
				
						<h2>가입된 회원목록</h2>
							<form method="post" style="margin-top:35px;overflow: auto;width:95%;">
								
								<table id="adminMemberTable" class="table table-hover">
									<thead>
									<tr>
										<th>번호</th>
										<th>등급</th>
										<th>ID</th>
										<th>이름</th>
										<th>성별</th>
										<th>생년월일</th>
										<th>휴대폰번호</th>
										<th>Email</th>
										<th>마일리지</th>
										<th>가입날짜</th>
										<th>비고</th>
									</tr>
									</thead>
									<tbody>
								<c:if test="${empty lists}">
									<tr>
										<td colspan="11" align="center">
											회원내역이 없습니다.
										</td>
									</tr>
								</c:if>
								<c:forEach var="mdto" items="${lists}">
								<input type="hidden" name=memberIdx${mdto.memberIdx} id="memberIdx" value="${mdto.memberIdx}"/>
									<tr>
										<td>${mdto.memberIdx}</td>
										<td>${mdto.gradeName}</td>
										<td>${mdto.id}</td>
										<td>${mdto.name}</td>
										<td>${mdto.gender}</td>
										<td>${mdto.birthDate}</td>
										<td>${mdto.tel}</td>
										<td>${mdto.email}</td>
										<td>${mdto.mileagePrice}</td>
										<td>${mdto.joinDate}</td>
										<td>
										<input type="button" value="수정" class="btn btn-default"  onclick="adminUpdateMemberForm(${mdto.memberIdx})">
										<input type="button" value="삭제" class="btn btn-danger" onclick="adminDeleteMember(memberIdx${mdto.memberIdx})" >
										</td>
									</tr>
								</c:forEach>
								</tbody>
								<tfoot>
								<tr>
									<td colspan="11">
										<nav style="text-align: center">
											<ul class="pagination">
												${pageStr}
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