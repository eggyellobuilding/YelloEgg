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
<script>
	/** 화면에 상영관 좌석정보 뿌리기 */
	window.onload = function() {
		var xLists = document.getElementsByClassName('xLists');
		var seats = document.getElementsByClassName('seats');
		for (var i = 0; i < xLists.length; i++) {
			var xValue = xLists[i].style.left;
			var seatAscii = 64;
			for (j = 0; j < seats.length; j++) {
				var seatsValue = seats[j].style.left;
				if (xValue == seatsValue) {
					seatAscii = seatAscii + 1;
					var seatId = String.fromCharCode(seatAscii);
					seats[j].firstChild.nodeValue = i + 1;
					seats[j].setAttribute('id', seatId + (i + 1));
					seats[j].setAttribute('onclick', 'seatRevationInfo("'
							+ seatId + (i + 1) + '",' + 1 + ')');
				}
			}
		}
	}
	
	var seatNumberCount = 0;
	var generalNum = 0;
	var teenagerNum = 0;
	var childrenNum = 0;
	
	/** 인원 정보 */
	function inone(){
		var general = document.getElementById('general');
		var teenager = document.getElementById('teenager');
		var children = document.getElementById('children');
		
		if(generalNum<=general.value){
			generalNum = general.value;
		}else if(general.value<generalNum){
			alert('초기화 해주세요!!!');
			general.value=generalNum;
		}
		if(teenagerNum<=teenager.value){
			teenagerNum = teenager.value;
		}else if(teenager.value<teenagerNum){
			alert('초기화 해주세요!!!');
			teenager.value=teenagerNum;
		}
		if(childrenNum<=children.value){
			childrenNum = children.value;
		}else if(children.value<childrenNum){
			alert('초기화 해주세요!!!');
			children.value=childrenNum;
		}
		seatNumberCount = Number(generalNum) + Number(teenagerNum) + Number(childrenNum);
	}
	
	/** 좌석 선택 */
	
	var seatSelect = 0;
	var seatName = "";
	var seatMoney = 0;
	
	function seatRevationInfo(seatid, snum) {
		var general = document.getElementById('general').value;
		var teenager = document.getElementById('teenager').value;
		var children = document.getElementById('children').value;
		var sidClass = document.getElementById(seatid).getAttribute('class');
		var sInfo = document.getElementById('seatInfo');
		var mInfo = document.getElementById('moneyInfo');

		seatMoney = Number(11000) * general + Number(6500) * teenager
				+ Number(7000) * children;
		if (general == 0 && teenager == 0 && children == 0) {
			alert('인원을 선택해주세요');
		} else if (seatSelect < seatNumberCount) {
			if (sidClass == "seats select") {
				alert('중복!');
			} else if (seatName == "") {
				seatSelect += Number(snum);
				seatName = seatName + seatid;
				sInfo.innerHTML = "좌석번호 : " + seatName;
				if (seatSelect == 1 && seatNumberCount == 1) {
					mInfo.innerHTML = "총 금액 : " + seatMoney;
				}
			} else {
				seatSelect += Number(snum);
				seatName = seatName + ',' + seatid;
				sInfo.innerHTML = "좌석번호 : " + seatName;
				if (seatSelect == seatNumberCount) {
					mInfo.innerHTML = "총 금액 : " + seatMoney;
				}
			}
			$('#' + seatid).css('background-color', 'red').attr('class',
					'seats select');
		}
	}

	/** 좌석 정보리셋 */
	function seatReset() {
		var general = document.getElementById('general').value = 0;
		var teenager = document.getElementById('teenager').value = 0;
		var children = document.getElementById('children').value = 0;
		var sInfo = document.getElementById('seatInfo').innerHTML = "좌석번호 : ";
		var mInfo = document.getElementById('moneyInfo').innerHTML = "총 금액 : ";
		seatNumberCount = 0;
		seatSelect = 0;
		seatMoney = 0;
		seatName = "";
		generalNum = 0;
		teenagerNum = 0;
		childrenNum = 0;
		$('.seats').css('background-color', '#997000').attr('class', 'seats');	
	}
	
	/** 결제 버튼클릭 */
	function paymentBtn(){
		if(seatNumberCount > 0 && seatSelect == seatNumberCount){
			/* $('#LGD_AMOUNT').attr('value',''+seatMoney); */
			$('#LGD_PRODUCTINFO').attr('value',''+seatName);
			$('#paymentSelect').attr('data-toggle','modal');
		}else{
			alert('좌석 수 및 인원을 확인해주세요');
		}
	}
	
	
	/** 결제 부분 */
	function LPad(digit, size, attatch) {
	    var add = "";
	    digit = digit.toString();

	    if (digit.length < size) {
	        var len = size - digit.length;
	        for (i = 0; i < len; i++) {
	            add += attatch;
	        }
	    }
	    return add + digit;
	}
	
	function makeoid() {
		var now = new Date();
		var years = now.getFullYear();
		var months = LPad(now.getMonth() + 1, 2, "0");
		var dates = LPad(now.getDate(), 2, "0");
		var hours = LPad(now.getHours(), 2, "0");
		var minutes = LPad(now.getMinutes(), 2, "0");
		var seconds = LPad(now.getSeconds(), 2, "0");
		var timeValue = years + months + dates + hours + minutes + seconds; 
		document.getElementById("LGD_OID").value = "test_" + timeValue;
		document.getElementById("LGD_TIMESTAMP").value = timeValue;
	}
	
	/** 결제 인증요청 처리 */
	function doPay(){
		// OID, TIMESTAMP 생성
		makeoid();
		// 결제창 호출
		document.getElementById("LGD_PAYINFO").submit();
	}		
	
	
</script>
<style>
ul {
	padding-left: 0px;
	border-left: 1px solid black;
	border-right: 1px solid black;
}

li {
	list-style-type: none;
	text-align: left;
}

.col-xs {
	padding: 0px;
}

#exitPosition {
	position: relative;
	margin: 0 auto;
}

.card {
	width: 60px;
}
</style>
</head>
<body>
	<%@include file="../commonsView/header.jsp"%>

	<div class="container" style="margin-top: 120px;">
		<div class="col-xs-12" style="border: 1px solid red;">
			<div class="col-xs-4"
				style="text-align: center; padding: 0px; padding-top: 10px; padding-bottom: 10px;">
				일반<select id="general" onchange="inone()">
					<c:forEach var="g" begin="0" end="8" varStatus="1">
						<option value="${g}">${g}</option>
					</c:forEach>
				</select> 청소년<select id="teenager" onchange="inone()">
					<c:forEach var="t" begin="0" end="8" varStatus="1">
						<option value="${t}">${t}</option>
					</c:forEach>
				</select> 어린이<select id="children" onchange="inone()">
					<c:forEach var="c" begin="0" end="8" varStatus="1">
						<option value="${c}">${c}</option>
					</c:forEach>
				</select>
			</div>
			<input type="button" value="좌석 초기화" onclick="seatReset()">
		</div>
		<div class="container">
			<div class="container seatsPosition" style="margin-top: 20px;">

				<div class="row" style="width: 94%;">
					<div id="exitSeatPosition"
						style="height: ${80+ySize+17}px;position:relative;">
						<p class="screen"
							style="background-color: gray; color: white; text-align: center; height: 20px; margin-top: 40px; margin-left: 200px; width: 700px;">screen</p>

						<div id="exitPosition"
							style="width: ${xSize+17}px; height: ${ySize+17}px;z-index:1;">
							<%-- <c:forEach items="${exitsList}" var="exit">
										<img src="${exitList.exit}" style="z-index:3;position:absolute;left:${exit.exitx};top:${exit.exity};width:16px;height:16px;">
									</c:forEach> --%>

							<c:forEach items="${seatY}" var="yList" varStatus="y">
								<span
									style="z-index:2;text-align:center;width:16px;height:16px;position:absolute;top:${yList.seatY}px;background-color:lightgray;margin-left:1px;font-size: 13px;">${alt[y.index]}</span>
							</c:forEach>

							<c:forEach items="${seatX}" var="xList" varStatus="x">
								<span class="xLists"
									style="z-index:2;text-align:center;display:none;width:16px;height:16px;position:absolute;left:${xList.seatX}px;background-color:lightgray;margin-left:1px;">${x.count}</span>
							</c:forEach>

							<c:set var="sNumList" value="${seatNumList}" />
							<c:forEach items="${seatsList}" var="list" varStatus="stl">
								<a id="" class="seats" onclick=""
									style="z-index:2;text-align:center;display:inline-block;width:16px;height:16px;position:absolute;left:${list.seatX}px;
											top:${list.seatY}px;background-color:#997000; color:white ;margin-left:1px;font-size: 11px;text-decoration: none;">
								</a>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<form id="movieAndPayment">
		<div class="container" style="background-color: skyblue">
			<div class="col-xs-2">
				<input type="button" value="영화선택" id="movieSelect"
					style="width: 100px; height: 100px;">
			</div>
			<div class="col-xs-2">
				<span id="movieInfo">영화정보</span>
			</div>
			<div class="col-xs-2">
				<span id="theaterInfo">상영관정보</span>
			</div>
			<div class="col-xs-2">
				<span id="seatInfo">좌석정보</span>
			</div>
			<div class="col-xs-2">s
				<span id="moneyInfo">금액정보</span>
			</div>
			<div class="col-xs-2">

				<!-- 결제화면 모달 버튼 -->
				<input type="button" value="결제선택" id="paymentSelect"
					class="btn btn-primary btn-lg" data-target="#paymentSelectModal"
					style="width: 100px; height: 100px;" onclick="paymentBtn();">
			</div>
		</div>
	</form>


	<!-- 결제화면 모달 정보 -->
	<div class="modal fade" id="paymentSelectModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 800px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">결제선택</h4>
				</div>
				<div class="modal-body">
					<!-- XPAY 테스트 폼 -->
					<form method="post" id="LGD_PAYINFO" action="payreq_crossplatform.do">
						<input type="hidden" name="CST_MID" id="CST_MID" value="lgdacomxpay">	<!-- 상점 ID -->
						<input type="hidden" name="CST_PLATFORM" id="CST_PLATFORM" value="test">	<!-- 결제상태(테스트) -->
						<input type="hidden" name="LGD_BUYEREMAIL" id="LGD_BUYEREMAIL" value="" > 	<!-- 구매자 이메일 주소 -->
						<input type="hidden" name="LGD_OID" id="LGD_OID" value="test_1234567890020">	<!-- 주문번호 -->
						<input type="hidden" name="LGD_TIMESTAMP" id="LGD_TIMESTAMP" value="1234567890">	<!-- 타임스탬프 -->
						<input type="hidden" name="LGD_WINDOW_TYPE" id="LGD_WINDOW_TYPE" value="iframe">	<!-- 결제창 호출방식 -->
						<input type="hidden" name="LGD_CUSTOM_SWITCHINGTYPE" id="LGD_CUSTOM_SWITCHINGTYPE" value="IFRAME">	<!-- 신용카드 카드사 인증 페이지 연동 방식 -->
						
						<div>
							<table>
								<tr>
									<td>구매자 ID</td>
									<td><input type="text" name="LGD_BUYER" id="LGD_BUYER" value="홍길동" readonly="readonly" /></td>
								</tr>
								<tr>
									<td>상품정보</td>
									<td><input type="text" name="LGD_PRODUCTINFO" id="LGD_PRODUCTINFO" value="" readonly="readonly" /></td>
								</tr>
								<tr>
									<td>마일리지</td>
									<td>내 마일리지 금액 보여주는 공간</td>
								</tr>
								<tr>
									<td>마일리지 사용하기</td>
									<td></td>
								</tr>
								<tr>
									<td>결제금액</td>
									<td><input type="text" name="LGD_AMOUNT" id="LGD_AMOUNT" value="1" readonly="readonly"/></td>
								</tr>
								<tr>

								</tr>
								<tr>
									<td>초기결제수단</td>
									<td><select name="LGD_CUSTOM_USABLEPAY"
										id="LGD_CUSTOM_USABLEPAY">
											<option value="SC0010">신용카드</option>
											<option value="SC0030">계좌이체</option>
											<option value="SC0040">무통장입금</option>
											<option value="SC0060">휴대폰</option>
											<option value="SC0070">유선전화결제</option>
											<option value="SC0090">OK캐쉬백</option>
											<option value="SC0111">문화상품권</option>
											<option value="SC0112">게임문화상품권</option>
									</select></td>
								</tr>
							</table>
						</div>
					</form>
<!-- 
					<span
						style="width: 150px; height: 150px; position: absolute; left: 600px; top: 20px; background-color: hotpink">a</span>
					<span
						style="width: 150px; height: 150px; position: absolute; left: 600px; top: 180px; background-color: hotpink">a</span>
					<span
						style="width: 150px; height: 150px; position: absolute; left: 600px; top: 340px; background-color: hotpink">a</span> -->
				</div>

				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="결제취소">
					<input type="button" class="btn btn-primary" id="moviePayment" value="결제하기" onclick="doPay();">
				</div>
			</div>
		</div>
	</div>
<%@include file="../commonsView/footer.jsp"%>
<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
<script>
$('#movieSelect').click(function() {
	$('#movieAndPayment').attr('action', 'movieReservation.do').submit();
});
</script>
</body>
</html>