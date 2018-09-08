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
    <style>
     	.PurchaseView , .paymentView{
     		width: 140px;
     		text-align: right;
     		background-color: #EAEAEA;
     		font-weight: bold;
     	}
    </style>
    <script>
    	function mileagePurchase(num){
    		var milPrice = document.getElementById('milPrice');	// 내 마일리지
    		var milMoney = document.getElementById('milMoney'); // 마일리지 사용금액
    		var payMoney = document.getElementById('payMoney');	// 사용자가 보는 총 결제금액(마일리지 적용가능)
    		var payMoneySave = document.getElementById('payMoneySave');	// 총 결제금액 저장(마일리지 적욜불가능)
    		
    		var pMoney = payMoney.value;
    		
    		var useMil = document.getElementById('useMil');
    		var useMileage = document.getElementById('useMileage');
    		
			var mileageExcessMsg = document.getElementById('mileageExcessMsg');
    		if(Number(milMoney.value)<=Number(milPrice.value)){
    			if(num==1){
    				if(Number(milMoney.value)>Number(payMoneySave.value)){
    					useMileage.value = Number(payMoneySave.value);
        				payMoney.value = 0;
    				}else{
    					useMileage.value = Number(milMoney.value);
        				payMoney.value = Number(payMoneySave.value)-Number(useMileage.value);
    				}
    			}
    			mileageExcessMsg.innerHTML="<div style='color:red;' id='mileageExcessMsg'></div>";
    		}else if(Number(milMoney.value)>Number(milPrice.value)){
    			mileageExcessMsg.innerHTML="<div style='color:red;' id='mileageExcessMsg'>내 마일리지 보다 높은 금액입니다.</div>";
    		}
    	}
    </script>
  </head>
  <body>
  	<%@include file="../commonsView/header.jsp"%>
  	<div class="container" style="margin-left: 500px; margin-top: 150px;">
  	<form action="storePaymentOk.do">
  		<div class="row">
  			<h3>구매자정보</h3>
  			<table class="table" style="border-bottom: 1px solid #D5D5D5; width:955px;">
  				<tr style="border-top: 2px solid #A6A6A6;">
  					<td class="PurchaseView">아이디</td>
  					<td>${requestScope.memberInfo[0].id}</td>
  				</tr>
  				<tr>
  					<td class="PurchaseView">이메일</td>
  					<td>${requestScope.memberInfo[0].email}</td>
  				</tr>
  				<tr>
  					<td class="PurchaseView">휴대폰 번호</td>
  					<td>${requestScope.memberInfo[0].tel}</td>
  				</tr>
  			</table>
  		</div>
		<div class="row">
  			<h3>결제정보</h3>
  			<table class="table" style="border-bottom: 1px solid #D5D5D5; width: 955px;">
  				<tr style="border-top: 2px solid #A6A6A6;">
  					<td class="paymentView">상품명</td>
  					<td>${requestScope.payMentInfo.storeName}</td>
  				</tr>
  				<tr>
  					<td class="paymentView">결제방식</td>
  					<td>
  						<select name="storePayCard">
  							<option value="카드">카드</option>
  						</select>
  					</td>
  				</tr>
  				<tr>
  					<td class="paymentView">마일리지</td>
  					<td>
  						<div>
  						사용:<input type="text" id="useMileage" name="storePayMileage" style="border: 0px; width: 60px;" value="0" readonly="readonly">
  						보유:<input type="text" readonly="readonly" id="milPrice"
  						value="${requestScope.memberInfo[0].mileagePrice}" 
  						style="width:50px; border: 0px; text-align: right;">원
  						<input type="button" id="mileageSelect" value="마일리지 사용하기" class="btn"></div>
  						<div id="mileageMoney" style="display: none;">
  						<input type="text" style="margin-top: 10px;"
  						id="milMoney" onkeyup="mileagePurchase(0),this.value=this.value.replace(/[^0-9]/g,'')">
  						<input type="button" value="마일리지 적용" id="milOk" class="btn" onclick="mileagePurchase(1)">
  						<div id="mileageExcessMsg"></div></div>
  					</td>
  				</tr>
  				<tr>
  					<td class="paymentView">상품개수</td>
  					<td><input type="text" name="storePayCount" value="${requestScope.payMentInfo.sPayCount}"
  					style="border: 0px; width: 15px;"readonly="readonly">개</td>
  				</tr>
  				<tr>
  					<td class="paymentView">총결제금액</td>
  					<td>
  					<input type="hidden" id="payMoneySave" value="${requestScope.payMentInfo.sPayMoney}">
  					<input type="text" name="payMoney" value="${requestScope.payMentInfo.sPayMoney}" id="payMoney" readonly="readonly" 
  					style="border: 0px; width: 50px;">원
  					
  					</td>
  				</tr>
  			</table>
  		</div>
  		<input type="hidden" value="결제완료" name="storePayState">
  		<input type="hidden" value="${requestScope.memberInfo[0].memberIdx }" name="storePayMemberIdx">
  		<input type="hidden" value="${requestScope.payMentInfo.storeIdx}" name="storePayStoreIdx">
  		<input type="submit" value="결제하기" class="btn btn-warning"
  		style="margin-left: 400px; width: 200px; height: 90px; font-size: 30px; margin-bottom: 153px;">
  		</form>
	</div>	
	<%@include file="../commonsView/footer.jsp"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
    <script>
    	$('#mileageSelect').click(function(){
    		$('#mileageMoney').slideToggle();
    	});
    	$('milMoney').change(function(){
    		//$('#payMoney').attr('value','10000');
    	});
    </script>
  </body>
</html>