var XHR = null;

function getXHR(){
	//인터넷 익스프로러
	if(window.ActiveXObject){
		return new ActiveXObject("Msxml2.XMLHTTP");
		//크롬 파이어폭스 오페라
	}else if(window.XMLHttpRequest){
		return new XMLHttpRequest();
	}else{
		return null;
	}
}

function sendRequest(url,params,callback,method){
	XHR = getXHR();
	//1차 검증
	var httpMethod = method?method:'GET';
	//2차 검증
	if(httpMethod!='GET'&&httpMethod!='POST'){
		httpMethod = 'GET';
	}
	//3차 검증 파라미터 유무
	var httpParams = (params==null||params=='')?null:params;
	
	var httpUrl = url;
	if(httpMethod=='GET'&&httpParams!=null){
		httpUrl=httpUrl+'?'+httpParams;
	}
	
	XHR.onreadystatechange=callback;
	XHR.open(httpMethod,httpUrl,true);
	//post방식을 위함
	XHR.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	XHR.send(httpMethod=='POST'?httpParams:null);
}






