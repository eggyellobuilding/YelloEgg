<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>관리자 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <link href="/yelloMovie/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 	<link href="/yelloMovie/css/admin/header.css" type="text/css"rel="stylesheet">
</head>
<body>
<div class="container">
<%@include file="adminCommonsViews/adminHeader.jsp" %>
		
		<div class="container">
			<%@include file="adminCommonsViews/adminNavi.jsp" %>
    			<div class="col-xs-10" style="padding:0px;padding-left:5px; border-left: 1px solid #E1E1E1; height:1900px; ">
      				<ul class="nav nav-tabs" >
      					<li class="active"><a href="#" >가즈아~!</a></li>
						<li><a href="#">가즈아~2!</a></li>
					</ul>
					<div class="container">
						<h2>내용물</h2>
					</div>
    			</div>
		</div>
</div>
</body>
    
    <script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
</html>