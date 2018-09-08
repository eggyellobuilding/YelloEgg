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
<!-- 부트스트랩 -->
<link href="/yelloMovie/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/yelloMovie/css/movie/movieInfo.css" rel="stylesheet">
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="/yelloMovie/js/storeForm.js"></script>
</head>
<body>
	<%@include file="../commonsView/header.jsp"%>
	
	<div class="row" style="margin: 25px auto; padding-left: 350px; padding-right: 250px;margin-top: 100px;">
		<h1 style="margin-left: 35px;">티켓</h1>

		<c:forEach var="tList" items="${ticketLists}" varStatus="t">
			<ul class="col-xs-2" style="display: inline; margin-left: 25px; width: 250px;">
				<li style="height: 360px; width: 250px; border: 1px solid #EAEAEA;">		
					<img src="${tList.storeImg }" data-toggle="modal" data-target="#ticketModal${t.count}" style="height: 230px; width: 249px;">
					<div style="margin-top: 10px; margin-left: 10px; font-size: 20px; font-weight: bold;">${tList.storeName}</div>
					<div style="margin-top: 10px; margin-left: 10px;">${tList.storeInfo }</div>
					<div style="margin-top: 30px;text-align:right; font-size: 20px; font-weight: bold;">${tList.storePrice}원</div>
				</li>
			</ul>
			
			<!-- 티켓 모달 -->
<div class="modal fade" id="ticketModal${t.count }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="width: 900px; height: 800px;">
    <div class="modal-content">
      <div class="modal-body" style="padding-left: 25px; padding-right: 25px; height: 1000px;">
        <h3 style="border-bottom: 2px solid #FFBB00; padding-bottom: 10px; margin-bottom: 0px;">티켓
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </h3>
        <form id="tackePayment${t.count }" action="Payment.do">
        <input type="hidden" value="${tList.storeIdx}" name="storeIdx">
        <input type="hidden" value="${sessionScope.smdto.memberIdx}" id="stid${t.count}" name="mIdx">
        <div style="float: left; padding-right: 25px; padding-bottom: 45px; padding-top: 40px;">
        <h5 style="text-align: center; font-weight: bold;">판매기간:${tList.storeDate}</h5>
        	<img src="${tList.storeImg }" style="width: 400px;height: 400px;">
        </div>
        <div style="border-bottom:1px solid gray; float: left; width: 421px; padding: 20px;border-left:1px solid gray; float: left; ">
        	<h1>${tList.storeName}</h1>
        	<input type="hidden" name="storeName" value="${tList.storeName}">
        	<h5>${tList.storeInfo}</h5>
        </div>
        <div style="border-bottom:1px solid gray; float: left; width: 421px; padding: 20px;border-left:1px solid gray; float: left; ">
        	<ul>
        		<li><span style="padding-bottom: 10px; font-weight: bold;">사용가능 영화관 : </span>전체영화관</li>
        		<li><span style="padding-bottom: 10px; font-weight: bold;">유효기간 : </span>예매가능 유효기간은 구매일로부터 2년입니다.(일자기준)</li>
        		<li><span style="padding-bottom: 10px; font-weight: bold;">판매수량 : </span>1회 8개 구매가능</li>
        		<li><span style="padding-bottom: 10px; font-weight: bold;">구매 후 취소 : </span>구매한 관람권 일괄 환불만 가능하며, 부분 환불 불가하며, 구매 일로 일주일 이내에만 취소가 가능합니다.</li>
        	</ul>
        </div>
        <div style="border-bottom:1px solid gray; float: left; width: 421px; padding: 20px;border-left:1px solid gray; float: left; ">
        	<ul style="margin-bottom: 0px;">
        		<li style="margin-bottom: 10px;"><span style="padding-bottom: 10px; font-weight: bold; margin-right: 140px;">스토어 판매가</span>
        		<input type="text" id="twon${t.count}" value="${tList.storePrice}" readonly="readonly" style="width:90px; border: 0px; text-align: right;">원</li>
        		<li><span style="padding-bottom: 10px; font-weight: bold;">수량</span> 
        		<input type="button" value="-" class="btn" onclick="tminus(&quot;tcount${t.count}&quot;,&quot;tmoney${t.count}&quot;,&quot;twon${t.count}&quot;)" style="padding: 3px 8px; margin-left: 210px;">
        		<input type="text" name="sPayCount" id="tcount${t.count }" value="1" style="width: 40px; text-align: center;">
        		<input type="button" value="+" class="btn" onclick="tplus(&quot;tcount${t.count}&quot;,&quot;tmoney${t.count}&quot;,&quot;twon${t.count}&quot;)" style="padding: 3px 8px;"></li>
        	</ul>
        </div>
        <div style="float: left; width: 421px; padding: 20px; max-height: 99px;border-left:1px solid gray; float: left; ">
        	<ul>
        		<li style="margin-bottom: 15px;">
        		<span style="padding-bottom: 10px; font-weight: bold; margin-right: 140px;">총 상품금액</span>
        		<input type="text" name="sPayMoney" id="tmoney${t.count}" value="${tList.storePrice}" style="border: 0px; width: 80px;text-align: right;">원</li>
        		<li><span style="padding-bottom: 10px; font-weight: bold;">*구매 전 사용가능 영화관을 <br> 꼭 확인해주세요.</span>
        		<input type="button" value="구매하기" class="btn" style="position:absolute; 
        		left: 770px; top: 547px; padding: 10px; background-color: black; color: white;" 
        		onclick="tPayment(&quot;tackePayment${t.count}&quot;,&quot;stid${t.count}&quot;)"></li>
        	</ul>
        </div>
        <div style="border-top: 1px solid gray; float: left;">
        	<h4 style="font-weight: bold; padding-top: 50px;">상품이용안내</h4>
        	<div style="border: 6px ridge;">
        		<ul>
        			<li>본 권은 카카오 알림톡을 통해 전송 됩니다. (카카오톡 미설치 또는 미수신 고객은 MMS로 발송)</li>
					<li>본 권은 메가박스 홈페이지, 어플에서만 예매 가능합니다. (전화예매, 현장매표소 및 무인발권기 예매 불가)</li>        		
					<li>어플 및 홈페이지 예매방법: 지점 > 영화명 > 시간 > 인원 > 결제수단 > 관람권 > 스토어 관람권 > 전송 받은 PIN번호 16자리 입력> 결제</li>
					<li>관람권 구매 건당 PIN 번호가 생성됩니다.</li>
					<li>본 권은 2D 일반관 전용관람권입니다.</li>
					<li>가격 정책에 따라 티켓금액이 변동 될 수 있으며 이에 대한 차액 환불이 불가합니다. (조조/심야/청소년/어린이/마티네/우대 등)</li>
					<li>메가박스 홈페이지 스토어 구매내역에서 PIN 번호 확인 가능하며, 본 권 구매 시 등록한 휴대폰 번호로만 재전송이 가능합니다.</li>
					<li>본 권의 예매 가능한 유효기간은 구매일로부터 2년입니다.</li>
					<li>구매 취소는 미사용 관람권에 한해 가능하며, 구매 후 7일 이내에 일괄 취소만 가능합니다. (부분 취소 불가)</li>
					<li>(ex 2매 이상 한번에 구매 시 모든 관람권을 일괄 취소해야 하며, 취소 가능 시점은 구매일자 기준입니다.)</li>
					<li>일부 극장 [센트럴점, 일산벨라시타점, 삼천포점, 아트나인점], 특별관 [더 부티크, 발코니, MX, 더 퍼스트 클럽, 키즈관] </li>
					<li>및 특별콘텐트 예매가 불가합니다. (차액 지불 여부 상관없이 예매 불가)</li>
					<li>본 권으로 영화 관람 시 메가박스 멤버십 포인트는 권면금액의 10%가 적립됩니다.</li>
				</ul>
        	</div>
        </div>
        </form>
      </div>
    </div>
  </div>
</div>
		</c:forEach>
	</div>
	
	<div class="row" style="margin: 25px auto; padding-left: 350px; padding-right: 250px;">		
		<h1 style="margin-left: 35px;">이벤트</h1>
		
		<c:forEach var="eList" items="${eventLists}" varStatus="e">
			<ul class="col-xs-2" style="display: inline; margin-left: 25px; width: 250px;">
				<li style="height: 360px; width: 250px; border: 1px solid #EAEAEA;">
					<img src="${eList.storeImg }" data-toggle="modal" data-target="#eventModal${e.count }" style="height: 230px; width: 249px;">
					<div style="margin-top: 10px; margin-left: 10px; font-size: 20px; font-weight: bold;">${eList.storeName}</div>
					<div style="margin-top: 10px; margin-left: 10px;">${eList.storeInfo }</div>
					<div style="margin-top: 30px; margin-right:5px; text-align:right; font-size: 20px; font-weight: bold;">${eList.storePrice}원</div>
				</li>
			</ul>

			<!-- 이벤트 모달 -->
<div class="modal fade" id="eventModal${e.count }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="width: 900px;">
    <div class="modal-content">
            <div class="modal-body" style="padding-left: 25px; padding-right: 25px; height: 1000px;">
        <h3 style="border-bottom: 2px solid #FFBB00; padding-bottom: 10px; margin-bottom: 0px;">이벤트
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </h3>
        <form id="eventPayment${e.count }" action="Payment.do">
        <input type="hidden" value="${eList.storeIdx}" name="storeIdx">
        <input type="hidden" value="${sessionScope.smdto.memberIdx}" id="etid${e.count}" name="mIdx">
        <div style="float: left; padding-right: 25px; padding-bottom: 45px; padding-top: 40px;">
        <h5 style="text-align: center; font-weight: bold;">판매기간:${eList.storeDate}</h5>
        	<img src="${eList.storeImg }" style="width: 400px;height: 400px;">
        </div>
        <div style="border-bottom:1px solid gray; float: left; width: 421px; padding: 20px;border-left:1px solid gray; float: left; ">
        	<h1>${eList.storeName}</h1>
        	<input type="hidden" name="storeName" value="${eList.storeName}">
        	<h5>${eList.storeInfo}</h5>
        </div>
        <div style="border-bottom:1px solid gray; float: left; width: 421px; padding: 20px;border-left:1px solid gray; float: left; ">
        	<ul>
        		<li><span style="padding-bottom: 10px; font-weight: bold;">사용가능 영화관 : </span>전체영화관</li>
        		<li><span style="padding-bottom: 10px; font-weight: bold;">유효기간 : </span>이벤트 유효기간은 당첨일로부터 1개월 입니다.(일자기준)</li>
        		<li><span style="padding-bottom: 10px; font-weight: bold;">판매수량 : </span>당첨자 수</li>
        		<li><span style="padding-bottom: 10px; font-weight: bold;">구매 후 취소 : </span>구매한 관람권 일괄 환불만 가능하며, 부분 환불 불가하며, 구매 일로 일주일 이내에만 취소가 가능합니다.</li>
        	</ul>
        </div>
        <div style="border-bottom:1px solid gray; float: left; width: 421px; padding: 20px;border-left:1px solid gray; float: left; ">
        	<ul style="margin-bottom: 0px;">
        		<li style="margin-bottom: 10px;"><span style="padding-bottom: 10px; font-weight: bold; margin-right: 140px;">스토어 판매가</span>
        		<input type="text" id="ewon${e.count}" value="${eList.storePrice}" readonly="readonly" style="width:90px; border: 0px; text-align: right;">원</li>
        		<li><span style="padding-bottom: 10px; font-weight: bold;">수량</span> 
        		<input type="button" value="-" class="btn" onclick="eminus(&quot;ecount${e.count}&quot;,&quot;emoney${e.count}&quot;,&quot;ewon${e.count}&quot;)" style="padding: 3px 8px; margin-left: 210px;">
        		<input type="text" name="sPayCount" id="ecount${e.count }" value="1" style="width: 40px; text-align: center;">
        		<input type="button" value="+" class="btn" onclick="eplus(&quot;ecount${e.count}&quot;,&quot;emoney${e.count}&quot;,&quot;ewon${e.count}&quot;)" style="padding: 3px 8px;"></li>
        	</ul>
        </div>
        <div style="float: left; width: 421px; padding: 20px; max-height: 99px;border-left:1px solid gray; float: left; ">
        	<ul>
        		<li style="margin-bottom: 15px;">
        		<span style="padding-bottom: 10px; font-weight: bold; margin-right: 140px;">총 상품금액</span>
        		<input type="text" name="sPayMoney" id="emoney${e.count}" value="${eList.storePrice}" style="border: 0px; width: 80px;text-align: right;">원</li>
        		<li><span style="padding-bottom: 10px; font-weight: bold;">*구매 전 사용가능 영화관을 <br> 꼭 확인해주세요.</span>
        		<input type="button" value="구매하기" class="btn" style="position:absolute; 
        		left: 770px; top: 547px; padding: 10px; background-color: black; color: white;" 
        		onclick="ePayment(&quot;eventPayment${e.count}&quot;,&quot;stid${e.count}&quot;)"></li>
        	</ul>
        </div>
        <div style="border-top: 1px solid gray; float: left;">
        	<h4 style="font-weight: bold; padding-top: 50px;">상품이용안내</h4>
        	<div style="border: 6px ridge;">
        		<ul>
        			<li>본 권은 카카오 알림톡을 통해 전송 됩니다. (카카오톡 미설치 또는 미수신 고객은 MMS로 발송)</li>
					<li>본 권은 메가박스 홈페이지, 어플에서만 예매 가능합니다. (전화예매, 현장매표소 및 무인발권기 예매 불가)</li>        		
					<li>어플 및 홈페이지 예매방법: 지점 > 영화명 > 시간 > 인원 > 결제수단 > 관람권 > 스토어 관람권 > 전송 받은 PIN번호 16자리 입력> 결제</li>
					<li>관람권 구매 건당 PIN 번호가 생성됩니다.</li>
					<li>본 권은 2D 일반관 전용관람권입니다.</li>
					<li>가격 정책에 따라 티켓금액이 변동 될 수 있으며 이에 대한 차액 환불이 불가합니다. (조조/심야/청소년/어린이/마티네/우대 등)</li>
					<li>메가박스 홈페이지 스토어 구매내역에서 PIN 번호 확인 가능하며, 본 권 구매 시 등록한 휴대폰 번호로만 재전송이 가능합니다.</li>
					<li>본 권의 예매 가능한 유효기간은 구매일로부터 2년입니다.</li>
					<li>구매 취소는 미사용 관람권에 한해 가능하며, 구매 후 7일 이내에 일괄 취소만 가능합니다. (부분 취소 불가)</li>
					<li>(ex 2매 이상 한번에 구매 시 모든 관람권을 일괄 취소해야 하며, 취소 가능 시점은 구매일자 기준입니다.)</li>
					<li>일부 극장 [센트럴점, 일산벨라시타점, 삼천포점, 아트나인점], 특별관 [더 부티크, 발코니, MX, 더 퍼스트 클럽, 키즈관] </li>
					<li>및 특별콘텐트 예매가 불가합니다. (차액 지불 여부 상관없이 예매 불가)</li>
					<li>본 권으로 영화 관람 시 메가박스 멤버십 포인트는 권면금액의 10%가 적립됩니다.</li>
				</ul>
        	</div>
        </div>
        </form>
      </div>
    </div>
  </div>
</div>	
		</c:forEach>

	</div>
	<div class="row" style="margin: 25px auto; padding-left: 350px; padding-right: 250px;">	
		<h1 style="margin-left: 35px;">악세사리</h1>	
		
		<c:forEach var="aList" items="${accessorisLists}" varStatus="a">
			<ul class="col-xs-2" style="display: inline; margin-left: 25px; width: 250px;">
				<li style="height: 360px; width: 250px; border: 1px solid #EAEAEA;">
					<img src="${aList.storeImg }" data-toggle="modal" data-target="#accessoriesModal${a.count }" style="height: 230px; width: 249px;">
					<div style="margin-top: 10px; margin-left: 10px; font-size: 20px; font-weight: bold;">${aList.storeName}</div>
					<div style="margin-top: 10px; margin-left: 10px;">${aList.storeInfo }</div>
					<div style="margin-top: 30px; margin-right:5px; text-align:right; font-size: 20px; font-weight: bold;">${aList.storePrice}원</div>
				</li>
			</ul>
			 
			<!-- 악세사리 모달 -->
<div class="modal fade" id="accessoriesModal${a.count }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="width: 900px;">
    <div class="modal-content">
            <div class="modal-body" style="padding-left: 25px; padding-right: 25px; height: 1000px;">
        <h3 style="border-bottom: 2px solid #FFBB00; padding-bottom: 10px; margin-bottom: 0px;">악세사리
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </h3>
        <form id="accessoriesPayment${a.count }" action="Payment.do">
        <input type="hidden" value="${aList.storeIdx}" name="storeIdx">
        <input type="hidden" value="${sessionScope.smdto.memberIdx}" id="atid${a.count}" name="mIdx">
        <div style="float: left; padding-right: 25px; padding-bottom: 45px; padding-top: 40px;">
        <h5 style="text-align: center; font-weight: bold;">판매기간:${aList.storeDate}</h5>
        	<img src="${aList.storeImg }" style="width: 400px;height: 400px;">
        </div>
        <div style="border-bottom:1px solid gray; float: left; width: 421px; padding: 20px;border-left:1px solid gray; float: left; ">
        	<h1>${aList.storeName}</h1>
        	<input type="hidden" name="storeName" value="${aList.storeName}">
        	<h5>${aList.storeInfo}</h5>
        </div>
        <div style="border-bottom:1px solid gray; float: left; width: 421px; padding: 20px;border-left:1px solid gray; float: left; ">
        	<ul>
        		<li><span style="padding-bottom: 10px; font-weight: bold;">사용가능 영화관 : </span>전체영화관</li>
        		<li><span style="padding-bottom: 10px; font-weight: bold;">유효기간 : </span>사용가능 유효기간은 구매일로부터 3개월 입니다.(일자기준)</li>
        		<li><span style="padding-bottom: 10px; font-weight: bold;">판매수량 : </span>1회 8개 구매가능</li>
        		<li><span style="padding-bottom: 10px; font-weight: bold;">구매 후 취소 : </span>구매한 관람권 일괄 환불만 가능하며, 부분 환불 불가하며, 구매 일로 일주일 이내에만 취소가 가능합니다.</li>
        	</ul>
        </div>
        <div style="border-bottom:1px solid gray; float: left; width: 421px; padding: 20px;border-left:1px solid gray; float: left; ">
        	<ul style="margin-bottom: 0px;">
        		<li style="margin-bottom: 10px;"><span style="padding-bottom: 10px; font-weight: bold; margin-right: 140px;">스토어 판매가</span>
        		<input type="text" id="awon${a.count}" value="${aList.storePrice}" readonly="readonly" style="width:90px; border: 0px; text-align: right;">원</li>
        		<li><span style="padding-bottom: 10px; font-weight: bold;">수량</span> 
        		<input type="button" value="-" class="btn" onclick="aminus(&quot;acount${a.count}&quot;,&quot;amoney${a.count}&quot;,&quot;awon${a.count}&quot;)" style="padding: 3px 8px; margin-left: 210px;">
        		<input type="text" name="sPayCount" id="acount${a.count }" value="1" style="width: 40px; text-align: center;">
        		<input type="button" value="+" class="btn" onclick="aplus(&quot;acount${a.count}&quot;,&quot;amoney${a.count}&quot;,&quot;awon${a.count}&quot;)" style="padding: 3px 8px;"></li>
        	</ul>
        </div>
        <div style="float: left; width: 421px; padding: 20px; max-height: 99px;border-left:1px solid gray; float: left; ">
        	<ul>
        		<li style="margin-bottom: 15px;">
        		<span style="padding-bottom: 10px; font-weight: bold; margin-right: 140px;">총 상품금액</span>
        		<input type="text" name="sPayMoney" id="amoney${a.count}" value="${aList.storePrice}" style="border: 0px; width: 80px;text-align: right;">원</li>
        		<li><span style="padding-bottom: 10px; font-weight: bold;">*구매 전 사용가능 영화관을 <br> 꼭 확인해주세요.</span>
        		<input type="button" value="구매하기" class="btn" style="position:absolute; 
        		left: 770px; top: 547px; padding: 10px; background-color: black; color: white;" 
        		onclick="aPayment(&quot;accessoriesPayment${a.count}&quot;,&quot;atid${a.count}&quot;)"></li>
        	</ul>
        </div>
        <div style="border-top: 1px solid gray; float: left;">
        	<h4 style="font-weight: bold; padding-top: 50px;">상품이용안내</h4>
        	<div style="border: 6px ridge;">
        		<ul>
        			<li>본 권은 카카오 알림톡을 통해 전송 됩니다. (카카오톡 미설치 또는 미수신 고객은 MMS로 발송)</li>
					<li>본 권은 메가박스 홈페이지, 어플에서만 예매 가능합니다. (전화예매, 현장매표소 및 무인발권기 예매 불가)</li>        		
					<li>어플 및 홈페이지 예매방법: 지점 > 영화명 > 시간 > 인원 > 결제수단 > 관람권 > 스토어 관람권 > 전송 받은 PIN번호 16자리 입력> 결제</li>
					<li>관람권 구매 건당 PIN 번호가 생성됩니다.</li>
					<li>본 권은 2D 일반관 전용관람권입니다.</li>
					<li>가격 정책에 따라 티켓금액이 변동 될 수 있으며 이에 대한 차액 환불이 불가합니다. (조조/심야/청소년/어린이/마티네/우대 등)</li>
					<li>메가박스 홈페이지 스토어 구매내역에서 PIN 번호 확인 가능하며, 본 권 구매 시 등록한 휴대폰 번호로만 재전송이 가능합니다.</li>
					<li>본 권의 예매 가능한 유효기간은 구매일로부터 2년입니다.</li>
					<li>구매 취소는 미사용 관람권에 한해 가능하며, 구매 후 7일 이내에 일괄 취소만 가능합니다. (부분 취소 불가)</li>
					<li>(ex 2매 이상 한번에 구매 시 모든 관람권을 일괄 취소해야 하며, 취소 가능 시점은 구매일자 기준입니다.)</li>
					<li>일부 극장 [센트럴점, 일산벨라시타점, 삼천포점, 아트나인점], 특별관 [더 부티크, 발코니, MX, 더 퍼스트 클럽, 키즈관] </li>
					<li>및 특별콘텐트 예매가 불가합니다. (차액 지불 여부 상관없이 예매 불가)</li>
					<li>본 권으로 영화 관람 시 메가박스 멤버십 포인트는 권면금액의 10%가 적립됩니다.</li>
				</ul>
        	</div>
        </div>
        </form>
      </div>
    </div>
  </div>
</div>	
		</c:forEach>
	</div>
	<div class="row" style="margin: 25px auto; padding-left: 350px; padding-right: 250px;">		
		<h1 style="margin-left: 35px;">팝콘/음료</h1>
		
		<c:forEach var="pList" items="${popcornLists}" varStatus="p">
			<ul class="col-xs-2" style="display: inline; margin-left: 25px; width: 250px;">
				<li style="height: 360px; width: 250px; border: 1px solid #EAEAEA;">
					<img src="${pList.storeImg }" data-toggle="modal" data-target="#popcornModal${p.count }" style="height: 230px; width: 249px;">
					<div style="margin-top: 10px; margin-left: 10px; font-size: 20px; font-weight: bold;">${pList.storeName}</div>
					<div style="margin-top: 10px; margin-left: 10px;">${pList.storeInfo }</div>
					<div style="margin-top: 30px; margin-right:5px; text-align:right; font-size: 20px; font-weight: bold;">${pList.storePrice}원</div>
				</li>
			</ul>
			
			<!-- 팝콘/음료 모달 -->
<div class="modal fade" id="popcornModal${p.count }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="width: 900px;">
    <div class="modal-content">
       <div class="modal-body" style="padding-left: 25px; padding-right: 25px; height: 1000px;">
        <h3 style="border-bottom: 2px solid #FFBB00; padding-bottom: 10px; margin-bottom: 0px;">팝콘/음료
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </h3>
        <form id="popcornPayment${p.count }" action="Payment.do">
        <input type="hidden" value="${pList.storeIdx}" name="storeIdx">
        <input type="hidden" value="${sessionScope.smdto.memberIdx}" id="ptid${p.count}" name="mIdx">
        <div style="float: left; padding-right: 25px; padding-bottom: 45px; padding-top: 40px;">
        <h5 style="text-align: center; font-weight: bold;">판매기간:${pList.storeDate}</h5>
        	<img src="${pList.storeImg }" style="width: 400px;height: 400px;">
        </div>
        <div style="border-bottom:1px solid gray; float: left; width: 421px; padding: 20px;border-left:1px solid gray; float: left; ">
        	<h1>${pList.storeName}</h1>
        	<input type="hidden" name="storeName" value="${pList.storeName}">
        	<h5>${pList.storeInfo}</h5>
        </div>
        <div style="border-bottom:1px solid gray; float: left; width: 421px; padding: 20px;border-left:1px solid gray; float: left; ">
        	<ul>
        		<li><span style="padding-bottom: 10px; font-weight: bold;">사용가능 영화관 : </span>전체영화관</li>
        		<li><span style="padding-bottom: 10px; font-weight: bold;">유효기간 : </span>사용가능 유효기간은 구매일로부터 3개월 입니다.(일자기준)</li>
        		<li><span style="padding-bottom: 10px; font-weight: bold;">판매수량 : </span>1회 8개 구매가능</li>
        		<li><span style="padding-bottom: 10px; font-weight: bold;">구매 후 취소 : </span>구매후 10일 이내</li>
        	</ul>
        </div>
        <div style="border-bottom:1px solid gray; float: left; width: 421px; padding: 20px;border-left:1px solid gray; float: left; ">
        	<ul style="margin-bottom: 0px;">
        		<li style="margin-bottom: 10px;"><span style="padding-bottom: 10px; font-weight: bold; margin-right: 140px;">스토어 판매가</span>
        		<input type="text" id="pwon${p.count}" value="${pList.storePrice}" readonly="readonly" style="width:90px; border: 0px; text-align: right;">원</li>
        		<li><span style="padding-bottom: 10px; font-weight: bold;">수량</span> 
        		<input type="button" value="-" class="btn" onclick="pminus(&quot;pcount${p.count}&quot;,&quot;pmoney${p.count}&quot;,&quot;pwon${p.count}&quot;)" style="padding: 3px 8px; margin-left: 210px;">
        		<input type="text" name="sPayCount" id="pcount${p.count }" value="1" style="width: 40px; text-align: center;">
        		<input type="button" value="+" class="btn" onclick="pplus(&quot;pcount${p.count}&quot;,&quot;pmoney${p.count}&quot;,&quot;pwon${p.count}&quot;)" style="padding: 3px 8px;"></li>
        	</ul>
        </div>
        <div style="float: left; width: 421px; padding: 20px; max-height: 99px;border-left:1px solid gray; float: left; ">
        	<ul>
        		<li style="margin-bottom: 15px;">
        		<span style="padding-bottom: 10px; font-weight: bold; margin-right: 140px;">총 상품금액</span>
        		<input type="text" name="sPayMoney" id="pmoney${p.count}" value="${pList.storePrice}" style="border: 0px; width: 80px;text-align: right;">원</li>
        		<li><span style="padding-bottom: 10px; font-weight: bold;">*구매 전 사용가능 영화관을 <br> 꼭 확인해주세요.</span>
        		<input type="button" value="구매하기" class="btn" style="position:absolute; 
        		left: 770px; top: 547px; padding: 10px; background-color: black; color: white;" 
        		onclick="pPayment(&quot;popcornPayment${p.count}&quot;,&quot;ptid${p.count}&quot;)"></li>
        	</ul>
        </div>
        <div style="border-top: 1px solid gray; float: left;">
        	<h4 style="font-weight: bold; padding-top: 50px;">상품이용안내</h4>
        	<div style="border: 6px ridge;">
        		<ul>
        			<li>본 권은 카카오 알림톡을 통해 전송 됩니다. (카카오톡 미설치 또는 미수신 고객은 MMS로 발송)</li>
					<li>본 권은 메가박스 홈페이지, 어플에서만 예매 가능합니다. (전화예매, 현장매표소 및 무인발권기 예매 불가)</li>        		
					<li>어플 및 홈페이지 예매방법: 지점 > 영화명 > 시간 > 인원 > 결제수단 > 관람권 > 스토어 관람권 > 전송 받은 PIN번호 16자리 입력> 결제</li>
					<li>관람권 구매 건당 PIN 번호가 생성됩니다.</li>
					<li>본 권은 2D 일반관 전용관람권입니다.</li>
					<li>가격 정책에 따라 티켓금액이 변동 될 수 있으며 이에 대한 차액 환불이 불가합니다. (조조/심야/청소년/어린이/마티네/우대 등)</li>
					<li>메가박스 홈페이지 스토어 구매내역에서 PIN 번호 확인 가능하며, 본 권 구매 시 등록한 휴대폰 번호로만 재전송이 가능합니다.</li>
					<li>본 권의 예매 가능한 유효기간은 구매일로부터 2년입니다.</li>
					<li>구매 취소는 미사용 관람권에 한해 가능하며, 구매 후 7일 이내에 일괄 취소만 가능합니다. (부분 취소 불가)</li>
					<li>(ex 2매 이상 한번에 구매 시 모든 관람권을 일괄 취소해야 하며, 취소 가능 시점은 구매일자 기준입니다.)</li>
					<li>일부 극장 [센트럴점, 일산벨라시타점, 삼천포점, 아트나인점], 특별관 [더 부티크, 발코니, MX, 더 퍼스트 클럽, 키즈관] </li>
					<li>및 특별콘텐트 예매가 불가합니다. (차액 지불 여부 상관없이 예매 불가)</li>
					<li>본 권으로 영화 관람 시 메가박스 멤버십 포인트는 권면금액의 10%가 적립됩니다.</li>
				</ul>
        	</div>
        </div>
        </form>
      </div>
    </div>
  </div>
</div>		 
		</c:forEach>
	</div>
	
	<%@include file="../commonsView/footer.jsp"%>
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

