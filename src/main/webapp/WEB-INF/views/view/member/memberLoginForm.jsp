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
	<!-- memberCSS -->
	<link href="/yelloMovie/css/member/memberLogin.css" rel="stylesheet">

  <body>
    <div class="container" id="divLoginContainer">
			  <div>
				<form role="form" name="memberLoginForm" action="memberLogin.do" method="post">
					<fieldset style="margin:0px auto;">
					<button type="button" class="close" aria-label="Close"><span aria-hidden="true"  onclick="close()">&times;</span></button>
						<h2>Please Sign In</h2>
						<hr class="colorgraph">
							<div class="form-group">
								<div class="input-group">
									<input type="text" class="form-control" name="id" 
									  value="${cookie.rememberid.value}" placeholder="Login">
									<label for="uLogin"	class="input-group-addon glyphicon glyphicon-user"></label>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<input type="password" class="form-control" name="pwd"
										placeholder="Password"> <label for="uPassword"
										class="input-group-addon glyphicon glyphicon-lock"></label>
								</div>
							</div>

							<div class="checkbox">
								<label> <input type="checkbox" name="rememberid" 
									id="rememberid" ${empty cookie.rememberid.value?'':'checked'}>
									Remember me
								</label>
							</div>
							<div class="memberOption">
								<ul style="font-size: 16px;">
									<li><a href="memberFindForm.do">ID/패스워드 찾기</a></li>
									<li><a href="memberJoinForm.do">회원가입</a></li>
								</ul>
							</div>
						
						<hr class="colorgraph">
						<div class="row" style="padding-top: 15px;">
							<div class="col-xs-12">
								<input type="submit" class="btn btn-lg btn-primary btn-block" value="Sign In">
							</div>
						</div>
					</fieldset>
				</form>
			</div>
	</div>

    
  </body>
</html>