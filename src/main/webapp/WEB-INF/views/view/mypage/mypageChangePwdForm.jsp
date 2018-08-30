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

	function isSame() {
		var newPwd=document.getElementById('newPwd').value;
		var newPwdConfirm=document.getElementById('newPwdConfirm').value;
		var regExp=/^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		if(!(regExp.test(newPwd))){
			window.alert('비밀번호는 문자와 숫자, 특수문자 포함해서 6~16자를 입력하셔야 됩니다.');
			document.getElementById('newPwd').focus();
			document.getElementById('newPwd').value='';
			document.getElementById('newPwdConfirm').value='';
			document.getElementById('same').innerHTML='';
		}
	
		if(newPwd !='' && newPwdConfirm !=''){
			if(newPwd==newPwdConfirm){
				document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
				document.getElementById('same').style.color='blue';
			}else{
				document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
				document.getElementById('same').style.color='red';
			}
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
				<p><a href="mypageQaboardList.do?memberIdx=${sessionScope.smdto.memberIdx}"><img src="/yelloMovie/img/mypage/mypage.jpg"
					style="margin-left: 7px;" width="50%" height="50%"
					alt="myYelloMovie" class="img-rounded"></a>
				</p>
				<span style="color:#A4A4A4;"><strong>나의 문의내역</strong></span>
			</div>
			<div class="col-xs-2" id="mypageCol">
				<p><a href="mypageUpdateMemberForm.do?memberIdx=${sessionScope.smdto.memberIdx}"><img
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
		
		<div style="margin-top: 80px; margin-left: 10px;"><h3><strong>비밀번호 변경</strong></h3></div>
		<div style="padding-top:8px;"><small style="color:#A4A4A4;padding-left: 20px;">현재 비밀번호를 입력한 후 새로 사용할 비밀번호를 입력하세요.</small></div>
		<div style="border-top: 4px solid #F4FA58; margin-top: 20px;">
		
			<form class="form-group" action="mypageChangePwd.do" method="post">
				<input type="hidden" name="memberIdx" id="memberIdx" value="${sessionScope.smdto.memberIdx}"/>
				<input type="hidden" name="pwd" id="pwd" value="${sessionScope.smdto.pwd}"/>
				<table class="table table-striped">
					<tr>
						<th id="updateTr"> * 현재 비밀번호</th>
						<td id="updateTd"><input type="password" name="nowPwd" id="nowPwd" class="form-control" style="width: 21%"></input></td>
					</tr>
					<tr>
						<th id="updateTr"> * 새 비밀번호</th>
						<td id="updateTd" class="form-inline"><input type="password" name="newPwd" id="newPwd" class="form-control" style="width: 21%" onchange="isSame()"></input>
						<span style="color:#A4A4A4;margin-left: 10px;">문자,숫자,특수문자를 포함 8~16자리 입력해주세요.</span>
						</td>
				
					</tr>
					<tr>
						<th id="updateTr"> * 새 비밀번호 확인</th>
						<td id="updateTd" class="form-inline"><input type="password" name="newPwdConfirm" id="newPwdConfirm" class="form-control" style="width: 21%" onchange="isSame()">
						<span id="same" style="margin-left: 30px;"></span>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<div style="padding-top: 10px;color:#848484;"><span class="glyphicon glyphicon-menu-right" aria-hidden="true" style="padding-left: 10px;padding-right: 10px;color:#2E64FE;"></span>생년월일, 전화번호 등 개인 정보와 관련된 숫자, 연속된 숫자와 같이 쉬운 비밀번호는 다른 사람이 쉽게 알아낼 수 있으니 사용을 자제해 주세요.</div><br>
						<div style="color:#848484;"><span class="glyphicon glyphicon-menu-right" aria-hidden="true" style="padding-left: 10px;padding-right: 10px;color:#2E64FE;"></span>비밀번호는 3-6개월마다 꼭 바꿔 주세요.</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" style="padding-top: 20px;">
						<button type="button" class="btn btn-default btn-lg" style="margin-right: 20px;width:120px;" onclick="cancelChangePwd()">취소</button>
						<button type="submit" class="btn btn-primary btn-lg" style="width:120px;">확인</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
 </div>
	
<%@include file="../commonsView/footer.jsp" %>
  </body>
</html>