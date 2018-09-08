<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>관리자 스토어</title>
 	<link href="/yelloMovie/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 	<link href="/yelloMovie/css/admin/header.css" type="text/css"rel="stylesheet">
<script>
</script>
</head>
<body>
<div class="container">
<%@include file="../adminCommonsViews/adminHeader.jsp" %>
		
<div class="container">
	<%@include file="../adminCommonsViews/adminNavi.jsp" %>
    	<div class="col-xs-10" style="padding:0px;padding-left:5px; border-left: 1px solid #E1E1E1; height:1900px; ">
      				<ul class="nav nav-tabs" >
      					<li class="active"><a href="#adminStoreList" data-toggle="tab" >상품 리스트</a></li>
						<li><a href="#adminStoreAdd" data-toggle="tab">상품 등록</a></li>
					</ul>
					
  				<div class="tab-content">
   					<div class="tab-pane active" id="adminStoreList">
     					<%@include file="../store/adminStoreList.jsp" %>
   					</div> 
   					 <div class="tab-pane" id="adminStoreAdd">
      					<%@include file="../store/adminStoreAdd.jsp" %>
    				</div>
 		 		</div>
		</div>
	</div>
</div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>