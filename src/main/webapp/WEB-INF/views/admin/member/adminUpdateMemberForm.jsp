<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>관리자 페이지</title>
<link href="/yelloMovie/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/yelloMovie/css/admin/header.css" type="text/css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
</head>
<style>
h2 {
	margin-top: 40px;
}

#adminUpdateMemberTable th {
	width: 15%;
	text-align: center;
}

#genderRadio1 {
	width: 20px;
	height: 14px;
	margin-right: 10px;
}

#genderRadio2 {
	width: 20px;
	height: 14px;
	margin-left: 20px;
	margin-right: 10px;
}
</style>
<script type="text/javascript">
function cancelAdminUpdateMember() {
	location.href='adminMemberList.do';
}

</script>
<body>
	<c:if test="${empty sessionScope.saddto.adminIdx}">
		<script type="text/javascript">
			window.alert('로그인후 사용하시기를 바랍니다.');
			location.href = 'main.do';
		</script>
	</c:if>
	<div class="container">
		<%@include file="../adminCommonsViews/adminHeader.jsp"%>
		<div class="container">
			<%@include file="../adminCommonsViews/adminNavi.jsp"%>
			<div class="col-xs-10"
				style="padding: 0px; padding-left: 5px; border-left: 1px solid #E1E1E1; height: 1900px;">
				<ul class="nav nav-tabs">
					<li class="active"><a href="adminMemberList.do">가입된 회원관리</a></li>
					<li><a href="adminDeleteMemberList.do">탈퇴 회원관리</a></li>
				</ul>
				<div class="container">
					<h2>회원 정보 수정</h2>
					<form class="form-group" action="adminUpdateMember.do" method="post">
						<input type="hidden" name="memberIdx" value="${dtos.memberIdx}"/>
						<table id="adminUpdateMemberTable" class="table table-striped">
							<tr>
								<th>회원등급</th>
								<td><input type="text" style="width: 50%" class="form-control" name="gradeName" value="${dtos.gradeName}" readonly="readonly" /></td>
							</tr>
							<tr>
								<th>아이디</th>
								<td><input type="text" style="width: 50%" class="form-control" name="id" value="${dtos.id}" readonly="readonly" /></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" style="width: 50%" name="name" class="form-control" value="${dtos.name}" readonly="readonly" />
								</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input type="text" style="width: 50%" name="birthDate" class="form-control" value="${dtos.birthDate}" readonly="readonly" /></td>
							</tr>
							<tr>
								<th>성별</th>
								<c:if test="${'남자'eq dtos.gender}">
									<td>
									 <input type="radio" name="gender" value="남자" checked="checked" disabled="disabled" id="genderRadio1" />남자
									 <input	type="radio" name="gender" value="여자" disabled="disabled" id="genderRadio2" />여자</td>
								</c:if>
								<c:if test="${'여자'eq dtos.gender}">
									<td>
									<input type="radio" name="gender" value="남자" disabled="disabled" id="genderRadio1" />남자 
									<input type="radio"	name="gender" value="여자" checked="checked" disabled="disabled"	id="genderRadio2" />여자</td>
								</c:if>
							</tr>
							<tr>
								<th>Email</th>
								<td><input type="text" style="width: 50%" name="email" class="form-control" value="${dtos.email}" /></td>
							</tr>
							<tr>
								<th>휴대폰 번호</th>
								<td><input type="text" style="width: 50%" name="tel" class="form-control" value="${dtos.tel}" /></td>
							</tr>
							<tr>
								<td colspan="2" style="width: 50%; padding-top: 20px;" align="center">
									<input type="button"	style="margin-right: 20px; width: 120px;" class="btn btn-default btn-lg" value="취소" onclick="cancelAdminUpdateMember()" /> 
									<input type="submit" style="width: 120px;" class="btn btn-primary btn-lg" value="수정" />
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

</html>