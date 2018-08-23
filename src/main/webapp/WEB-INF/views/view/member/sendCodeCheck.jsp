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
 </head>
 <script>
 function checkCode() {
		var v1 = document.getElementById('randomCode').value;
		var v2 = document.getElementById('inputCode').value;
		
		if(v1!=v2){
			document.getElementById('checkCode').style.color="red";
			document.getElementById('checkCode').innerHTML ="잘못된 인증번호입니다.";
			makeNull();
			
		}else if(v1==v2){
			document.getElementById('checkCode').style.color="blue";
			document.getElementById('checkCode').innerHTML ="인증이 되었습니다.";
			makeReal();
		}
	}

  	
 function makeReal() {
		var check = document.getElementById('check');
		check.type="submit";
	}
  	
 function makeNull() {
  		var check = document.getElementById('check');
  		check.type="hidden";
	}

  	
  	var SetTime = 180;	
	function msg_time() {		
		m = Math.floor(SetTime/60) + ":" + Math.floor(SetTime%60);				
		var msg = "<font color='red' size='3px'>" + m + "</font>";
				
		var spanNode=document.all.viewTimer;
		spanNode.innerHTML=msg;
		
		SetTime--;				
		
		if (SetTime < 0) {					
			clearInterval(tid);		
			window.alert("시간제한으로 인해 인증번호 재발급을 받으세요.");
			location.href='memberJoinForm.do';
		}		
	}
	window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };

</script>
 <body>
  <div class="container">
	<h2 class="text-center">회원가입<small>인증번호 확인</small></h2>
		<form id="form2">
			<input type="hidden" readonly="readonly" name="randomCode" id="randomCode" value="${code}">
			<table class="table table-striped">
				<tr>
					<th>인증번호</th>
					<td><input type="text" name="inputCode" id="inputCode" onkeyup="checkCode()" placeholder="인증번호를 입력하세요."> 
					<span id="viewTimer"></span> <span id="checkCode"></span></td>
				</tr>
			</table>
			<input type="hidden" id="check" class="btn btn-warning btn-sm" value="인증하기">
		</form>
	</div>
	

 </body>
</html>