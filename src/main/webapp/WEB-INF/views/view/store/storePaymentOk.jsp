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
  </head>
  <style>
	.orderMenu{
	 background-color: #EAEAEA;
	 width: 160px;
	 height: 50px;
	 font-size: 20px;
	 padding: 8px;
	}
	
  </style>
  <body>
    <%@include file="../commonsView/header.jsp"%>
    <div class="container" style="margin-left: 480px;">
    
    
    <br><br><br><br><br>
    <h1>결제완료</h1><hr>
    <h4 style="font-weight: bold;">결제가 정상적으로 완료되었습니다.</h4>
    <table class="table" style="border-bottom: 1px solid #D5D5D5;">
    	<tr>
    		<td class="orderMenu">구매날짜</td>
    		<td>${requestScope.lists[0].storePayDate}</td>
    	</tr>
    	<tr>
    		<td class="orderMenu">구매방법</td>
    		<td>${requestScope.lists[0].storePayCard}</td>
    	</tr>
    	<tr>
    		<td class="orderMenu">사용마일리지</td>
    		<td>${requestScope.lists[0].storePayMileage}</td>
    	</tr>
    	<tr>
    		<td class="orderMenu">구매갯수</td>
    		<td>${requestScope.lists[0].storePayCount}</td>
    	</tr>
    	<tr>
    		<td class="orderMenu">구매자ID</td>
    		<td>${requestScope.lists[0].id}</td>
    	</tr>	
    	<tr>
    		<td class="orderMenu">이메일</td>
    		<td>${requestScope.lists[0].email}</td>
    	</tr>	
    	<tr>
    		<td class="orderMenu">전화번호</td>
    		<td>${requestScope.lists[0].tel}</td>
    	</tr>	
    	<tr>
    		<td class="orderMenu">상품이름</td>
    		<td>${requestScope.lists[0].storeName}</td>
    	</tr>
    	<tr>
    		<td class="orderMenu">결제금액</td>
    		<td>${requestScope.lists[0].storePrice}원</td>
    	</tr>
    </table>
    	<input type="button" id="home" value="홈으로" class="btn btn-warning" style="width: 100px; height: 40px; font-size: 20px; margin-left: 500px; margin-bottom: 123px;">
    </div>
	<%@include file="../commonsView/footer.jsp"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
    <script>
    	$('#home').click(function(){
    		window.location.href='main.do';
    	});
    </script>
  </body>
</html>