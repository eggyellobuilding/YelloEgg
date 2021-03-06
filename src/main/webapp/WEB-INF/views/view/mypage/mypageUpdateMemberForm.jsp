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
<style>
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
	function changePwdForm() {
		location.href = 'mypageChangePwdForm.do';
	}

	function cancelUpdateMember() {
		location.href = 'mypageForm.do';
	}
	
	function deleteMemberForm() {
		location.href = 'mypageDeleteMemberForm.do';
	}
	
	function mypageUpdateMember() {
		var memberIdx=document.getElementById('memberIdx').value;
		var email=document.getElementById('email').value;
		var tel=document.getElementById('tel').value;
		location.href='mypageUpdateMember.do?memberIdx='+memberIdx+'&email='+email+'&tel='+tel;
	}
	
	function telExp() {
		var tel = document.getElementById('tel').value;
		var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		if(!(regExp.test(tel))){
			alert('휴대폰 형식에 맞게 입력해주세요.(010-1234-5678)');
			document.getElementById('tel').value='';
			document.getElementById('tel').focus();
			
		}
	}
	function emailExp() {
		var email=document.getElementById('email').value;
		var regExp=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		if(!(regExp.test(email))){
			alert('이메일 형식에 맞게 입력해주세요.(example@example.com)');
			document.getElementById('email').value='';
			document.getElementById('email').focus();
			
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
		<div style="margin-top: 80px; margin-left: 10px;"><h3><strong>개인정보수정</strong></h3></div>
		<form class="form-group">
		<div class="row">
			<div class="col-xs-9">
				<div style="padding-top:8px;color:#A4A4A4;padding-left: 20px;">회원님의 정보를 정확히 입력하세요.(*표시 필수입력 항목입니다.)</div>
			</div>
			<div class="col-xs-3">
				<div class="form-inline" id="updateMemberCol">
					<button type="button" class="form-control btn-primary" onclick="changePwdForm()">비밀번호변경</button>
					<button type="button" class="form-control btn-primary" onclick="deleteMemberForm()" style="margin-left: 10px;">회원탈퇴</button>
				</div>
			</div>
		</div>
		</form>
		
		
		<div style="border-top: 4px solid #F4FA58; margin-top: 20px;">
			<form class="form-group" method="post">
				<input type="hidden" name="memberIdx" id="memberIdx" value="${sessionScope.smdto.memberIdx}"/>
				<table class="table table-striped">
					<tr>
						<th id="updateTr">회원등급</th>
						<td id="updateTd">
						<input type="text" class="form-control" name="gradeName" value="${dtos.gradeName}" style="width: 150px;" readonly="readonly" />
						</td>
					</tr>
					<tr>
						<th id="updateTr">이름</th>
						<td id="updateTd">
						<input type="text" name="name" value="${dtos.name}" readonly="readonly" class="form-control" style="width: 150px;"/>
						</td>
					</tr>
					<tr>
						<th id="updateTr">생년월일</th>
						<td id="updateTd">
						<input type="text" name="birthDate" value="${dtos.birthDate}" style="width: 150px;" class="form-control" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<th id="updateTr">성별</th>
						<c:if test="${'남자'eq dtos.gender}">
							<td id="updateTd">
								<input type="radio" name="gender" value="남자" checked="checked" disabled="disabled" id="genderRadio1"/>남자 
								<input type="radio"	name="gender" value="여자" disabled="disabled" id="genderRadio2"/>여자
							</td>
						</c:if>
						<c:if test="${'여자'eq dtos.gender}">
							<td id="updateTd">
								<input type="radio" name="gender" value="남자" disabled="disabled" id="genderRadio1"/>남자
								<input type="radio" name="gender" value="여자" checked="checked" disabled="disabled" id="genderRadio2"/>여자
							</td>
						</c:if>
					</tr>
					<tr>
						<th id="updateTr">휴대폰번호</th>
						<td id="updateTd" onchange="telExp()">
						<input type="text" name="tel" id="tel" value="${dtos.tel}"class="form-control" style="width: 150px;"/>
						</td>
					</tr>
					<tr>
						<th id="updateTr">Email</th>
						<td id="updateTd" onchange="emailExp()"><input type="email" name="email" id="email" value="${dtos.email}" class="form-control" style="width: 230px;"></input>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" style="padding-top: 20px;">
						<button type="button" style="margin-right: 20px;width:120px;" class="btn btn-default btn-lg" onclick="cancelUpdateMember()">취소</button>
						<button type="button" style="width:120px;" class="btn btn-primary btn-lg"onclick="mypageUpdateMember()">확인</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
 </div>
	
	<%@include file="../commonsView/footer.jsp" %>
  </body>
</html>