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
</script>
  <body>
  <%@include file="../commonsView/header.jsp" %>
  <div class="container" id="divContainer">
 	<div class="memberJoinHeader"><h2><b>ID/패스워드 찾기</b></h2></div>
 		<div>
 			<div>
			<div id="divFind"><h3>ID 찾기</h3></div>
			<div id="divJoin">
			<form class="form-group" id="memberFindId" action="memberIdFind.do" method="post">
				<table class="table table-striped">
					<tr>
						<th class="text-center">이름</th>
						<td><input type="text" name="name" class="form-control" style="width: 20%"></input></td>
					</tr>
					<tr>
						<th class="text-center">생년월일</th>
						<td class="form-inline">
						<input type="text" name="year" class="form-control" style="width: 8%"/> 년
						<input type="text" name="month"  class="form-control" style="width: 6%"/> 월
						<input type="text" name="date"  class="form-control" style="width: 6%"/> 일
						</td>
					</tr>
					<tr>
						<th class="text-center">휴대폰번호</th>
 						<td class="form-inline">
 							<input type="text" class="form-control" name="tel1" style="width:9%"/> -
 							<input type="text" class="form-control" name="tel2" style="width:11%"/> -
 							<input type="text" class="form-control"  name="tel3" style="width:11%"/>
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
			<form class="form-group" id="memberFindPwd" action="memberFindPwd.do" method="post">
				<table class="table table-striped">
					<tr>
						<th class="text-center">아이디</th>
						<td><input type="text" name="id" class="form-control" style="width: 20%"></input></td>
					</tr>
					<tr>
						<th class="text-center">이름</th>
						<td><input type="text" name="name" class="form-control" style="width: 20%"></input></td>
					</tr>
					<tr>
						<th class="text-center">Email</th>
						<td><input type="email" name="email"  class="form-control" style="width: 30%"></input>
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
 	</div>
<%@include file="../commonsView/footer.jsp" %>
  </body>
</html>