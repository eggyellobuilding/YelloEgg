<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>관리자 페이지</title>
    <link href="/yelloMovie/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 	<link href="/yelloMovie/css/admin/header.css" type="text/css"rel="stylesheet">
</head>
<body>
<div class="container">
<%@include file="adminCommonsViews/adminHeader.jsp" %>
		
		<div class="container">
			<%@include file="adminCommonsViews/adminNavi.jsp" %>
					<h1>어드민페이지 환영</h1>
		</div>
</div>
</body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
</html>