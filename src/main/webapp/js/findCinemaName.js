	function showCinema(){
			sendRequest("adminCinemaFind.do",null,showTheater,'GET');
		}
		
		function showTheater(){
			if(XHR.readyState==4){
				if(XHR.status==200){
					var data=XHR.responseText;
					var findCinema = document.getElementById('div');
					if(findCinema.hasChildNodes()){
						while(findCinema.hasChildNodes()){
							findCinema.removeChild(findCinema.firstChild)
						}
					}else{
						findCinema.style.position='absolute';
					    findCinema.style.left=-16+'px';
						findCinema.style.top=32+'px'; 
						findCinema.innerHTML=data;
					}
				}
			}
		}
		function findCinemaName(cinemaCity){
		var params = 'cinemaCity='+cinemaCity;
		sendRequest("adminCinemaFindName.do",params,changeCity,'GET');
		}
		
		function changeCity(){
			if(XHR.readyState==4){
				if(XHR.status==200){
					var data = XHR.responseText;
					var cinemaNameList = document.getElementById("cinemaNameList");
					cinemaNameList.innerHTML=data;
				}
			}
		}

