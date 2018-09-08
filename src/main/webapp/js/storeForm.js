
	/** 티켓 */
	function tminus(tcount,tmoney,twon){
		
		var minusbtn = document.getElementById(tcount);
		var	minuscount = Number(minusbtn.value);
		var twon = document.getElementById(twon);
		var won = Number(twon.value);
		var tmoney = document.getElementById(tmoney);
		var minusmoney = Number(tmoney.value);
		
		if(minusbtn.value<=1){
			alert('1보다 작을수 없습니다!');
			return;
		}else{
			minusbtn.value=minuscount-1;
			tmoney.value=minusmoney-won;
		}
		
	}
	function tplus(tcount,tmoney,twon){
		
		var plusbtn = document.getElementById(tcount);
		var pluscount = Number(plusbtn.value);
		var twon = document.getElementById(twon);
		var won = Number(twon.value);
		var tmoney = document.getElementById(tmoney);
		var plusmoney = Number(tmoney.value);
		
		if(pluscount>=8){
			alert('1회 8개 이상 구매 불가능합니다.');
		}else{
			plusbtn.value=pluscount+1;
			tmoney.value=plusmoney+won;
		}
		
	}
	function tPayment(payment,stid){
		var paymentId = document.getElementById(payment);
		var stid = document.getElementById(stid);
		if(stid.value==null || stid.value==''){
			alert('로그인 후 구매 가능합니다.');			
		}else{
			paymentId.submit();
		}
	}
	
	/** 이벤트 */
	function eminus(ecount,emoney,ewon){
		
		var minusbtn = document.getElementById(ecount);
		var	minuscount = Number(minusbtn.value);
		var ewon = document.getElementById(ewon);
		var won = Number(ewon.value);
		var emoney = document.getElementById(emoney);
		var minusmoney = Number(emoney.value);
		
		if(minusbtn.value<=1){
			alert('1보다 작을수 없습니다!');
			return;
		}else{
			minusbtn.value=minuscount-1;
			emoney.value=minusmoney-won;
		}
		
	}
	function eplus(ecount,emoney,ewon){
		
		var plusbtn = document.getElementById(ecount);
		var pluscount = Number(plusbtn.value);
		var ewon = document.getElementById(ewon);
		var won = Number(ewon.value);
		var emoney = document.getElementById(emoney);
		var plusmoney = Number(emoney.value);
		
		if(pluscount>=8){
			alert('1회 8개 이상 구매 불가능합니다.');
		}else{
			plusbtn.value=pluscount+1;
			emoney.value=plusmoney+won;
		}
		
	}
	function ePayment(payment,etid){
		var paymentId = document.getElementById(payment);
		var etid = document.getElementById(etid);
		if(etid.value==null || etid.value==''){
			alert('로그인 후 구매 가능합니다.');			
		}else{
			paymentId.submit();
		}
	}
	
	/** 악세사리 */
	function aminus(acount,amoney,awon){
		
		var minusbtn = document.getElementById(acount);
		var	minuscount = Number(minusbtn.value);
		var awon = document.getElementById(awon);
		var won = Number(awon.value);
		var amoney = document.getElementById(amoney);
		var minusmoney = Number(amoney.value);
		
		if(minusbtn.value<=1){
			alert('1보다 작을수 없습니다!');
			return;
		}else{
			minusbtn.value=minuscount-1;
			amoney.value=minusmoney-won;
		}
		
	}
	function aplus(acount,amoney,awon){
		
		var plusbtn = document.getElementById(acount);
		var pluscount = Number(plusbtn.value);
		var awon = document.getElementById(awon);
		var won = Number(awon.value);
		var amoney = document.getElementById(amoney);
		var plusmoney = Number(amoney.value);
		
		if(pluscount>=8){
			alert('1회 8개 이상 구매 불가능합니다.');
		}else{
			plusbtn.value=pluscount+1;
			amoney.value=plusmoney+won;
		}
		
	}
	function aPayment(payment,atid){
		var paymentId = document.getElementById(payment);
		var atid = document.getElementById(atid);
		if(atid.value==null || atid.value==''){
			alert('로그인 후 구매 가능합니다.');			
		}else{
			paymentId.submit();
		}
	}
	
	/** 팝콘 */
	function pminus(pcount,pmoney,pwon){
		
		var minusbtn = document.getElementById(pcount);
		var	minuscount = Number(minusbtn.value);
		var pwon = document.getElementById(pwon);
		var won = Number(pwon.value);
		var pmoney = document.getElementById(pmoney);
		var minusmoney = Number(pmoney.value);
		
		if(minusbtn.value<=1){
			alert('1보다 작을수 없습니다!');
			return;
		}else{
			minusbtn.value=minuscount-1;
			pmoney.value=minusmoney-won;
		}
		
	}
	function pplus(pcount,pmoney,pwon){
		
		var plusbtn = document.getElementById(pcount);
		var pluscount = Number(plusbtn.value);
		var pwon = document.getElementById(pwon);
		var won = Number(pwon.value);
		var pmoney = document.getElementById(pmoney);
		var plusmoney = Number(pmoney.value);
		
		if(pluscount>=8){
			alert('1회 8개 이상 구매 불가능합니다.');
		}else{
			plusbtn.value=pluscount+1;
			pmoney.value=plusmoney+won;
		}
		
	}
	function pPayment(payment,ptid){
		var paymentId = document.getElementById(payment);
		var ptid = document.getElementById(ptid);
		if(ptid.value==null || ptid.value==''){
			alert('로그인 후 구매 가능합니다.');			
		}else{
			paymentId.submit();
		}
	}