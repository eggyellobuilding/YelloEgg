<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
 <link href="/yelloMovie/css/member/memberLogin.css" rel="stylesheet">
    <div class="container" id="divLoginContainer" >
			  <div>
				<form role="form" action="memberLogin.do" method="post">
					<fieldset style="margin:0px auto;">
					<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h2>YelloEgg 로그인</h2>
						<hr class="colorgraph">
							<div class="form-group">
								<div class="input-group">
									<input type="text" class="form-control" name="id" id="id"
									  value="${cookie.rememberId.value}" placeholder="아이디">
									<label for="uLogin"	class="input-group-addon glyphicon glyphicon-user"></label>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<input type="password" class="form-control" name="pwd" id="pwd"
										placeholder="Password"> <label for="uPassword"
										class="input-group-addon glyphicon glyphicon-lock"></label>
								</div>
							</div>

							<div class="checkbox">
								<label> <input type="checkbox" name="rememberId" 
									id="rememberId" ${empty cookie.rememberId.value?'':'checked'}>
									아이디 저장
								</label>
							</div>
							<div class="memberOption">
								<ul style="font-size: 16px;">
									<li><a href="memberFindForm.do">ID/패스워드 찾기</a></li>
									<li><a href="memberAgreeForm.do">회원가입</a></li>
								</ul>
							</div>
						
						<hr class="colorgraph">
						<div class="row" style="padding-top: 15px;">
							<div class="col-xs-12">
								<input type="submit" class="btn btn-lg btn-primary btn-block" value="로그인">
							</div>
						</div>
					</fieldset>
				</form>
			</div>
	</div>