<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Yello egg</title>
     <script type="text/javascript" src="js/httpRequest.js"></script>
    부트스트랩
    <link href="/yelloMovie/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <link href="/yelloMovie/css/view/header.css" rel="stylesheet">
    
</head>

<script type="text/javascript">

  function loginForm() {

		sendRequest('memberLoginForm.do',null,loginFormResult,'GET');
	}
	function loginFormResult() {
		if(XHR.readyState==4){
			if(XHR.status==200){
				var loginForm=XHR.responseText;
				var divNode=document.getElementById('divLogin');
				if(divNode.hasChildNodes()){
					while(divNode.hasChildNodes()){
						divNode.removeChild(divNode.firstChild);
					}
				}else{
					divNode.style.display='block';
					divNode.style.height='45%';
					divNode.style.left='900px';
					divNode.innerHTML=loginForm;
				}
				
			}
		}
	}
	
	function loginState(memberIdx) {
		sendRequest('memberLoginState.do','memberIdx='+memberIdx,loginStateResult,'GET');
	}
	
	function loginStateResult() {
		if(XHR.readyState==4){
			if(XHR.status==200){
				var loginImfo=XHR.responseText;
				var divNode=document.getElementById('divLogin');
				
				if(divNode.hasChildNodes()){
					while(divNode.hasChildNodes()){
						divNode.removeChild(divNode.firstChild);
					}
				}else{
					divNode.style.display='block';
					divNode.style.height='63%';
					divNode.style.left='920px';
					divNode.innerHTML=loginImfo;
				}
			
				
			}
		}
	}
  </script>
<body> 
	<div>
		<ul class="nav nav-tabs navbar-fixed-top " style="padding-left: 550px; background-color: white; width:1600px;">
			 <li class="header logo"><a href="main.do"><img src="/yelloMovie/img/log.PNG" class="img-rounded" height="20" width="100"></a></li>
			<li class="header"><a href="movieBoxOffice.do" style="margin: 0px;">영화</a></li>
			<li class="header"><a href="storeView.do" style="margin: 0px;">스토어</a></li>
			<li class="header"><a href="NoticeList.do" style="margin: 0px;">공지&이벤트</a></li>
			<li class="header"><a href="movieReservation.do" style="margin: 0px;">빠른예매</a></li> 
			<c:if test="${!empty smdto}">
				<li class="header" style="width:13%;"><a href="#" style="margin: 0px;" onclick="loginState(${smdto.memberIdx})"><small>${smdto.id}님</small></a></li>			
			</c:if>
			<c:if test="${empty smdto}">
				<li class="header" style="width:11%;"><a href="#" style="margin: 0px;" onclick="loginForm()">로그인</a></li>			
			</c:if>
		</ul>
	</div>
<div id="divLogin" style="z-index: 2;"></div>
</body>
</html>