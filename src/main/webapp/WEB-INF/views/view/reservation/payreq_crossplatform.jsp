<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>통합LG유플러스 전자결서비스 결제테스트</title>

<!-- test일 경우 -->
<script language="javascript" src="https://pretest.uplus.co.kr:9443/xpay/js/xpay_crossplatform.js" type="text/javascript"></script>
<!-- 
  service일 경우 아래 URL을 사용 
<script language="javascript" src="https://xpay.uplus.co.kr/xpay/js/xpay_crossplatform.js" type="text/javascript"></script>
 -->
<script>
/*
* 수정불가.
*/
	var LGD_window_type = document.getElementById('LGD_WINDOW_TYPE').value;
	alert(LGD_window_type);
/*
* 수정불가
*/
	function launchCrossPlatform(){
	var CST_PLATFORM = document.getElementById('CST_PLATFORM').value;
	lgdwin = openXpay(document.getElementById('LGD_PAYINFO'),CST_PLATFORM, LGD_window_type, null, "", "");
	/* history.back(-1); */
}
/*
* FORM 명만  수정 가능
*/
function getFormObject() {
        return document.getElementById("LGD_PAYINFO");
}

/*
 * 인증결과 처리
 */
function payment_return() {
	alert('결제완료');
	var fDoc;
	
		fDoc = lgdwin.contentWindow || lgdwin.contentDocument;
	
		
	if (fDoc.document.getElementById('LGD_RESPCODE').value == "0000") {
		
			document.getElementById("LGD_PAYKEY").value = fDoc.document.getElementById('LGD_PAYKEY').value;
			document.getElementById("LGD_PAYINFO").target = "_self";
			document.getElementById("LGD_PAYINFO").action = "payres.jsp";
			document.getElementById("LGD_PAYINFO").submit();
	} else {
		alert("LGD_RESPCODE (결과코드) : " + fDoc.document.getElementById('LGD_RESPCODE').value + "\n" + "LGD_RESPMSG (결과메시지): " + fDoc.document.getElementById('LGD_RESPMSG').value);
		closeIframe();
	}
}
</script>
</head>
<body onload="launchCrossPlatform()">

<input type="hidden" id="LGD_WINDOW_TYPE" value="${dtos.LGD_WINDOW_TYPE}">
<input type="hidden" id="CST_PLATFORM" value="${dtos.CST_PLATFORM}">
<input type="hidden" id="LGD_BUYER" value="${dtos.LGD_BUYER }">
<input type="hidden" id="LGD_PRODUCTINFO" value="${dtos.LGD_PRODUCTINFO }">
<input type="hidden" id="LGD_AMOUNT" value="${dtos.LGD_AMOUNT }">
<input type="hidden" id="LGD_BUYEREMAIL" value="${dtos.LGD_BUYEREMAIL }">
<input type="hidden" id="LGD_OID" value="${dtos.LGD_OID }">

<form method="post" name="LGD_PAYINFO" id="LGD_PAYINFO" action="payres.jsp">
<c:forEach var="payreq" items="${pmap}" varStatus="p">
<input type="hidden" name="${payreq.key}" id="${payreq.key}" value="${payreq.value}">
</c:forEach>

</form>

</body>
</html>
