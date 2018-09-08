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
    
        	<!-- memberCSS -->
	<link href="/yelloMovie/css/member/memberJoin.css" rel="stylesheet">
  </head>
  <style>
#memberFindId table th {
	width: 20%;
	font-size: 15px;
	padding-top: 15px;
	text-align: center;
	background-color: #F3E2A9;
}

#memberFindId table td{
	padding-left: 40px;
}

#memberFindPwd table th {
	width: 20%;
	font-size: 15px;
	padding-top: 15px;
	text-align: center;
	background-color: #F3E2A9;
}

#memberFindPwd table td{
	padding-left: 40px;
}

</style>
<script type="text/javascript">
function cancelIdFind() {
	location.href='main.do';
}
function cancelFindPwd() {
	location.href='main.do';
}
function checkIdBlank() {
	
	var name=document.getElementById('name').value;
	var tel1=document.getElementById('tel1').value;
	var tel2=document.getElementById('tel2').value;
	var tel3=document.getElementById('tel3').value;
	var year=document.getElementById('year').value;
	var month=document.getElementById('month').value;
	var date=document.getElementById('date').value;

	if(name==''){
		alert('이름를 입력하세요.');
		return false;
	}

	if(tel1,tel2,tel3==''){
		alert('휴대폰번호를 입력하세요.');
		return false;
	}
	if(year,month,date==''){
		alert('생년월일을 입력하세요.');
		return false;
	}

}

function checkPwdBlank() {
	var id=document.getElementById('id').value;
	var name=document.getElementById('name').value;
	var email=document.getElementById('email').value;
	
	if(id==''){
		alert('아이디를 입력하세요.');
		return false;
	}
	if(name==''){
		alert('이름를 입력하세요.');
		return false;
	}
	if(email==''){
		alert('이메일을 입력하세요.');
		return false;
	}
}

function idExp() {
	var id=document.getElementById('id').value;
	var regExp =/[0-9a-zA-Z]{8,16}/;

	if(!(regExp.test(id))){
		alert('아이디는 영문자와 숫자 결합해서 8~16자를 입력하셔야 됩니다.');
		document.getElementById('id').focus();
		document.getElementById('id').value='';
		
	}
}

function idNnameExp() {
	var idName=document.getElementById('idName').value;
	if(!(regExp.test(idName))){
		alert('정확한 이름을 입력하세요.');
		document.getElementById('idName').value='';
		document.getElementById('idName').focus();
	}
}

function pwdNameExp() {
	var pwdName=document.getElementById('pwdName').value;
	var regExp=/^[가-힣]{2,5}$/;
	if(!(regExp.test(pwdName))){
		alert('정확한 이름을 입력하세요.');
		document.getElementById('pwdName').value='';
		document.getElementById('pwdName').focus();
	}
}

function telExp() {
	var tel1=document.getElementById('tel1').value;
	var tel2=document.getElementById('tel2').value;
	var tel3=document.getElementById('tel3').value;
	var regExp1=/^0(2|1[01679])$/;
	var regExp2=/^[0-9]{3,4}$/;
	var regExp3=/^[0-9]{4}$/;
	
    if (tel1 != '') {
  	  if (!(regExp1.test(tel1))){
  		alert('휴대폰번호 첫번째 자리는 3자리를 입력하세요.(010,011,016,019,017)');
  		document.getElementById('tel1').value='';
    	document.getElementById('tel1').focus();
    	
      }
    }  
  	if(tel2 != ''){
  		if (!(regExp2.test(tel2))){
	  		alert('휴대폰번호 두번째 자리는 3~4자리를 입력하세요.');
	  		document.getElementById('tel2').value='';
	    	document.getElementById('tel2').focus();
	    	return;
  	  }	
  	}  
  	  
  	 if(tel3 != ''){
	  	  if (!(regExp3.test(tel3))){
		  		alert('휴대폰번호 두번째 자리는 4자리를 입력하세요.');
		  		document.getElementById('tel3').value='';
		    	document.getElementById('tel3').focus();
		    	return;
		      }
  	 }
}	

function birthDateExp() {
	var year=document.getElementById('year').value;
	var month=document.getElementById('month').value;
	var date=document.getElementById('date').value;
	var regExp1=/^[1-9]{4}$/;
	var regExp2=/^[0-9]{1,2}$/;
	var regExp3=/^[0-9]{1,2}$/;
	
    if (year != '') {
  	  if (!(regExp1.test(year))){
  		alert('년도를 입력하세요.');
  		document.getElementById('year').value='';
    	document.getElementById('year').focus();
    	
      }
    }  
  	if(month != ''){
  		if (!(regExp2.test(month))){
	  		alert('달을 입력하세요.');
	  		document.getElementById('month').value='';
	    	document.getElementById('month').focus();
  	  }	
  	}  
  	  
  	 if(date != ''){
	  	  if (!(regExp3.test(date))){
		  	alert('날짜를 입력하세요.');
		  	document.getElementById('date').value='';
		    document.getElementById('date').focus();
		   }
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
  <div class="container" id="divContainer">
 	<div class="memberJoinHeader"><h2><b>ID/패스워드 찾기</b></h2></div>
 		
 		<div>
			<div id="divFind"><h3>ID 찾기</h3></div>
			<div id="divJoin">
			<form class="form-group" id="memberFindId" action="memberIdFind.do" method="post" onsubmit="return checkIdBlank()">
				<table class="table table-striped">
					<tr>
						<th class="text-center">이름</th>
						<td><input type="text" name="name" id="idName" class="form-control" style="width: 140px;" onchange="idNameExp()"></input></td>
					</tr>
					<tr>
						<th class="text-center">생년월일</th>
						<td class="form-inline" onchange="birthDateExp()">
						<input type="text" name="year"  id="year" class="form-control" style="width: 70px;"/> 년
						<input type="text" name="month" id="month" class="form-control" style="width: 55px;"/> 월
						<input type="text" name="date"  id="date" class="form-control" style="width: 55px;"/> 일
						</td>
					</tr>
					<tr>
						<th class="text-center">휴대폰번호</th>
 						<td class="form-inline"  onchange="telExp()">
 							<input type="text" class="form-control" id="tel1" name="tel1" style="width:60px;"/> -
 							<input type="text" class="form-control" id="tel2" name="tel2" style="width:70px;"/> -
 							<input type="text" class="form-control" id="tel3" name="tel3" style="width:70px;"/>
 						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" style="padding-top: 20px;">
						<button type="button" id="idCancelButton" class="btn btn-default btn-lg" onclick="cancelFindId()">취소</button>
						<button type="submit" id="idSubmitButton" class="btn btn-primary btn-lg">확인</button>
						</td>
					</tr>
				</table>
			</form>
			
		</div>
 	</div>
 	
 		<div>
			<div id="divFind"><h3>패스워드 찾기</h3></div>
 			<div id="divJoin">
			<form class="form-group" id="memberFindPwd" action="memberFindPwd.do" method="post" onsubmit="return checkPwdBlank()">
				<table class="table table-striped">
					<tr>
						<th class="text-center">아이디</th>
						<td><input type="text" name="id" id="id" class="form-control" style="width: 140px;" onchange="idExp()"></input></td>
					</tr>
					<tr>
						<th class="text-center">이름</th>
						<td ><input type="text" name="name" id="pwdName" class="form-control"  style="width: 140px;" onchange="pwdNameExp()"></input></td>
					</tr>
					<tr>
						<th class="text-center">Email</th>
						<td><input type="email" name="email" id="email" class="form-control"  style="width: 250px;"onchange="emailExp()"></input>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" style="padding-top: 20px;">
						<button type="button" id="pwdCancelButton" class="btn btn-default btn-lg" onclick="cancelFindPwd()">취소</button>
						<button type="submit" id="pwdSubmitButton" class="btn btn-primary btn-lg">확인</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
 	</div>
 </div>
<%@include file="../commonsView/footer.jsp" %>
  </body>
</html>