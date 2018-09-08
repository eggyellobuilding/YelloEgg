/** 별점 넣기 */
function starScore(score,mvIdx){
	var star = document.getElementById('score'+mvIdx);
	star.value=score;
}
/** 감상평 등록 및 가져오기 */
function repAdd(idx){
	var sidx = document.getElementById('smidx');
	if(sidx.value==null || sidx.value==""){
		alert('로그인 후 사용가능합니다.');
		return;
	}else{
		var content = document.getElementById('content'+idx);
		var score = document.getElementById('score'+idx);
		var member = document.getElementById('member'+idx);
		var movie = document.getElementById('movie'+idx);
		
		var repleAdd = 'repleContent='+content.value+'&reScore='+score.value+'&reMemberIdx='+member.value+'&reMovieIdx='+movie.value;
		content.value=null;
		sendRequest('movieReple.do',repleAdd,repResult,'GET');
	}
}
function repResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			var objData=eval('('+data+')');
			var lists=objData.repleLists;
			var mRep='';
			var mReple=document.getElementById('repList'+lists[0].repleMovieIdx);
			for(var i=0; i<lists.length;i++){
				mRep+='<div style=" width: 433px; float: left;"><span style="font-size: 19px; color:#FF5E00">'+lists[i].id+'</span>';
				mRep+='<br>'+lists[i].repleDate;
				for(var j = 0; j<5; j++){
					if(lists[i].repleScore>j){
						mRep+='<img src="img/star/star_1.png" style="width:18px; margin-left: 4px;">'
					}else if(lists[i].repleScore<=j){
						mRep+='<img src="img/star/star_2.png" style="width:18px; margin-left: 4px;">'
					}
				}
					mRep+='</span><br>'+lists[i].repleContent+'<hr></div>';
				}
			}
			mReple.innerHTML=mRep;
		}
	}