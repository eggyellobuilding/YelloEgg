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

 <script type="text/javascript">
	
	function idCheck() {
	var id=document.getElementById('id').value;
	location.href='idCheck.do?id='+id;	
	
	}
	
	function cancelMemberJoin() {
		alert('회원가입이 취소되었습니다.');
		location.href='main.do';
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
	
	function isSame() {
		var pwd=document.getElementById('pwd').value;
		var pwdConfirm=document.getElementById('pwdConfirm').value;
		var regExp=/^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		if(!(regExp.test(pwd))){
			window.alert('비밀번호는 문자와 숫자, 특수문자 포함해서 6~16자를 입력하셔야 됩니다.');
			document.getElementById('pwd').focus();
			document.getElementById('pwd').value='';
			document.getElementById('pwdConfirm').value='';
			document.getElementById('same').innerHTML='';
		}
	
		if(pwd !='' && pwdConfirm !=''){
			if(pwd==pwdConfirm){
				document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
				document.getElementById('same').style.color='blue';
			}else{
				document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
				document.getElementById('same').style.color='red';
			}
		}
	}
	
	function nameExp() {
		var name=document.getElementById('name').value;
		var regExp=/^[가-힣]{2,5}$/;
		if(!(regExp.test(name))){
			alert('정확한 이름을 입력하세요.');
			document.getElementById('name').value='';
			document.getElementById('name').focus();
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

	function sendCodeCheck() {
		var email=document.getElementById('email').value;
		var code=document.getElementById('code').value;
		location.href='sendCodeCheck.do?email='+email+'&code='+code;
		
	}
	
	function memberIdCheck() {
		var id=document.getElementById('id').value;
		alert(id);
		sendRequest('memberIdCheck.do','id='+id,idCheckResult,'GET');
	}
	function idCheckResult() {
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data = XHR.responseText;
				var idCheckMsg=document.all.idCheckMsg;
				idCheckMsg.innerHTML=data;
			}
		}
	}
	
</script>
<body>
  <%@include file="../commonsView/header.jsp" %>
 <div class="container" id="divContainer">
 <div class="memberJoinHeader"><h2><Strong>회원가입<small>YelloEgg에 오신것을 환영합니다.</small></Strong></h2></div>
<div class="row" id="rowJoin">
	<hr class="colorgraph">
        <h2>Please Sign Up <small>It's free and always will be.</small></h2>
    <div id="divJoin">
			<form class="form-group" name="memberJoin" action="memberJoin.do" method="post">
				<table class="table table-striped">
					<tr>
 					<th id="updateTr" class="warning text-center" style="width:30%;">*아이디<br>
 					<span style="color:red"><small>(*문자,숫자를 포함 8~16자리)</small></span></th>
 					<td id="updateTd" class="form-inline"><input type="text" style="width:30%;margin-right: 20px;margin-top:6px;" name="id" id="id" class="form-control" onchange="idExp()"/>
 					<input type="button" class="btn btn-info" value="중복확인" id="CheckButton" onclick="memberIdCheck()"/>
 					<div id="idCheckMsg" style="color:blue"></div>
 					</td>
 				</tr>
 				<tr>
 					<th id="updateTr" class="warning text-center">*비밀번호<br>
 					<span style="color:red"><small>(*문자,숫자,특수문자를 포함 8~16자리)</small></span></th>
 					<td id="updateTd"><input type="password" class="form-control" style="width:30%;margin-top:6px;" name="pwd" id="pwd" onchange="isSame()"/>
 					</td>
 				</tr>
 				<tr>
 					<th id="updateTr" class="warning text-center">*비밀번호 확인<br>
 					<span style="color:red"><small >(문자,숫자,특수문자를 포함 8~16자리)</small></span></th>
 					<td id="updateTd" class="form-inline"><input type="password" style="width:30%;margin-top:6px;" class="form-control" name="pwdConfirm" id="pwdConfirm" onchange="isSame()"/>
 					<span id="same" style="margin-left: 30px;"></span>
 					</td>
 				</tr>
 				<tr>
 					<th id="updateTr" class="warning text-center">*이름</th>
 					<td id="updateTd"><input type="text" name="name" id="name" onchange="nameExp()" class="form-control" style="width:30%;"/></td>
 				</tr>
 				<tr>
 					<th id="updateTr" class="warning text-center">*성별</th>
 					<td id="updateTd" ><input type="radio" name="gender" value="남자" id="genderCheckBox1"/>남자
 					<input type="radio" name="gender"value="여자" id="genderCheckBox2"/>여자</td>
 				</tr>
 				<tr>
 					<th id="updateTr" class="warning text-center">휴대폰번호</th>
 					<td  id="updateTd" class="form-inline" colspan="2" onchange="telExp()">
 					<input type="text" class="form-control" name="tel1" id="tel1" style="width:9%"/> -
 					<input type="text" class="form-control" name="tel2" id="tel2" style="width:11%"/> -
 					<input type="text" class="form-control" name="tel3" id="tel3" style="width:11%"/></td>
 				</tr>
 				<tr>
 					<th id="updateTr" class="warning text-center">*생년월일</th>
 					<td id="updateTd" class="form-inline" onchange="birthDateExp()">
 					<input type="text" name="year" id="year" style="width:12%" class="form-control"/>년
 					<input type="text" name="month" id="month" style="width:8%" class="form-control"/> 월
 					<input type="text" name="date" id="date" style="width:8%" class="form-control"/> 일
 					<span style="color:red"><small>*yyyy/mm/dd</small></span></td>
 				</tr>
 				<tr>
 					<th id="updateTr" class="warning text-center">*이메일</th>
 					<td id="updateTd" class="form-inline"><input type="email" name="email" id="email"class="form-control" onchange="emailExp()"/>
 					<input type="button" class="btn btn-info" value="이메일인증" style="margin-left: 10px;"onclick="sendCodeCheck()"/>
 					</td>
 				</tr>								
				<tr>
					<td colspan="2" align="center" style="padding-top: 15px;">
						<a href="#" class="btn btn-default btn-lg" id="cancelButton" onclick="cancelMemberJoin()">Cancel</a>
						<input type="submit"  value="Register" id="submitButton" class="btn btn-primary btn-lg"/>
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