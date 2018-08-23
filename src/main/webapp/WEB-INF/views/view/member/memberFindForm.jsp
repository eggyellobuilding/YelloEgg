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
  <body>
  <%@include file="../commonsView/header.jsp" %>
  <div class="container" id="divContainer">
 		<div class="memberJoinHeader"><h2><b>ID/패스워드 찾기</b></h2></div>
 		<div>
 			<div>
			<div id="divFind"><h3>ID 찾기</h3></div>
			<div id="divJoin">
			<form class="form-group" name="memberIdFindForm" action="memberIdFind.do">
				<table class="table table-striped">
					<tr>
						<th id="updateTr"> 이름</th>
						<td id="updateTd"><input type="text" name="name" class="form-control" style="width: 20%"></input></td>
					</tr>
					<tr>
						<th id="updateTr"> 생년월일</th>
						<td class="form-inline" id="updateTd">
						<input type="text" name="year" id="year" class="form-control" style="width: 8%"/> 년
						<input type="text" name="month" id="month" class="form-control" style="width: 6%"/> 월
						<input type="text" name="date" id="date" class="form-control" style="width: 6%"/> 일
						</td>
					</tr>
					<tr>
						<th id="updateTr"> * 휴대폰번호</th>
						<td class="form-inline" id="updateTd">
						<input type="text" name="tel1" id="tel1" class="form-control" style="width: 7%"/> -
						<input type="text" name="tel2" id="tel2" class="form-control" style="width: 8%"/> -
						<input type="text" name="tel3" id="tel3" class="form-control" style="width: 8%"/>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" style="padding-top: 20px;">
						<button type="button" id="idCancelButton" class="btn btn-default btn-lg" onclick="cancelFindId()">Cancel</button>
						<button type="submit" id="idSubmitButton" class="btn btn-primary btn-lg">Submit</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
 			</div>
 			<div>
			<div id="divFind"><h3>패스워드 찾기</h3></div>
 			<div id="divJoin">
			<form class="form-group" name="memberFindPwdForm" action="memberFindPwd.do">
				<table class="table table-striped">
					<tr>
						<th id="updateTr"> 아이디</th>
						<td id="updateTd"><input type="text" name="id" class="form-control" style="width: 20%"></input></td>
					</tr>
					<tr>
						<th id="updateTr"> 이름</th>
						<td id="updateTd"><input type="text" name="name" class="form-control" style="width: 20%"></input></td>
					</tr>
					<tr>
						<th id="updateTr"> 이메일</th>
						<td id="updateTd"><input type="email" name="email"  class="form-control" style="width: 30%"></input>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" style="padding-top: 20px;">
						<button type="button" id="pwdCancelButton" class="btn btn-default btn-lg" onclick="cancelFindPwd()">Cancel</button>
						<button type="button" id="pwdSubmitButton" class="btn btn-primary btn-lg">Submit</button>
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