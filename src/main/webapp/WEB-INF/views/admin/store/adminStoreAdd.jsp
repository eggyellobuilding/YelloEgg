<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="/yelloMovie/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/yelloMovie/css/admin/header.css" type="text/css"
	rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<style>
#View_area {
	position: relative;
	margin-top: 40px;
	margin-left:40px;
	dispaly: inline;
	border: 1px solid #A4A4A4;
	width: 200px;
	height:350px;
}
.storeimg{
	border-bottom: 1px solid #A4A4A4;
}
.storecontent {
	margin-left: 250px;
	margin-top: 40px;
}
.firstcl{
	width:100px;
	border-left: 1px solid #A4A4A4;
}
.tablecontent{
	padding-top: 10px;
	padding-bottom: 10px;
	margin-top:20px;
	border-right: 1px solid #A4A4A4;
}
.contentbutton{
	padding-top: 30px;
	padding-left: 250px;
}
.storefile{
	padding-top: 10px;
	padding-bottom: 10px;
}
</style>
<script>
	function previewImage(targetObj, View_area) {
		var preview = document.getElementById(View_area);
		var ua = window.navigator.userAgent;
		if (ua.indexOf("MSIE") > -1) {
			targetObj.select();
			try {
				var src = document.selection.createRange().text;
				var ie_preview_error = document
						.getElementById("ie_preview_error_" + View_area);

				if (ie_preview_error) {
					preview.removeChild(ie_preview_error);
				}
				var img = document.getElementById(View_area);
				img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
						+ src + "', sizingMethod='scale')";
			} catch (e) {
				if (!document.getElementById("ie_preview_error_" + View_area)) {
					var info = document.createElement("<p>");
					info.id = "ie_preview_error_" + View_area;
					info.innerHTML = e.name;
					preview.insertBefore(info, null);
				}
			}
		} else {
			var files = targetObj.files;
			for (var i = 0; i < files.length; i++) {
				var file = files[i];
				var imageType = /image.*/;
				if (!file.type.match(imageType))
					continue;
				var prevImg = document.getElementById("prev_" + View_area);
				if (prevImg) {
					preview.removeChild(prevImg);
				}
				var img = document.createElement("img");
				img.id = "prev_" + View_area;
				img.classList.add("obj");
				img.file = file;
				img.style.width = '200px';
				img.style.height = '350px';
				preview.appendChild(img);
				if (window.FileReader) {
					var reader = new FileReader();
					reader.onloadend = (function(aImg) {
						return function(e) {
							aImg.src = e.target.result;
						};
					})(img);
					reader.readAsDataURL(file);
				} else {

					if (!document.getElementById("sfr_preview_error_"
							+ View_area)) {
						var info = document.createElement("p");
						info.id = "sfr_preview_error_" + View_area;
						info.innerHTML = "not supported FileReader";
						preview.insertBefore(info, null);
					}
				}
			}
		}
	}
</script>


<div class="container">
	<%@include file="../adminCommonsViews/adminHeader.jsp"%>
	<div class="container">
		<%@include file="../adminCommonsViews/adminNavi.jsp"%>
		<div class="col-xs-10"
			style="padding: 0px; padding-left: 5px; border-left: 1px solid #E1E1E1;">
			<ul class="nav nav-tabs">
				<li><a href="adminStoreList.do" data-toggle="tab">상품 리스트</a></li>
				<li class="active"><a href="adminStoreAdd.do" data-toggle="tab">상품
						등록</a></li>
			</ul>

			<form name="storeimg" action="adminStoreAdd.do" method="post" enctype="multipart/form-data">
				<div class="container-fulid tab-content">
					<h1>상품등록</h1>
					<div class="row">
						<div class="col-xs-5 offset4" id="storecontent">
							<table class="storecontent">
								<tr>
									<td colspan="2" class="storeimg">	
										<div class="col-xs-3" id="storeimg">
											<div id="View_area"></div>
											<input type="file" name="storeTitleImg" id="profile_pt" class="storefile" onchange="previewImage(this,'View_area')">
										</div>
									</td>
								</tr>
								<tr>
									<th class="firstcl">카테고리:</th>
									<td class="tablecontent"><select name="storectg">
											<option value="티켓">티켓</option>
											<option value="이벤트">이벤트</option>
											<option value="악세사리">악세사리</option>
											<option value="팝콘/음료수">팝콘/음료수</option>
									</select></td>

								</tr>
								<tr>
									<th class="firstcl">상품명:</th>
									<td class="tablecontent"><input type="text" name="storename" required></td>
								</tr>
								<tr>
									<th class="firstcl">총갯수:</th>
									<td class="tablecontent"><input type="text" name="storecount" required>개</td>
								</tr>
								<tr>
									<th class="firstcl">가격:</th>
									<td class="tablecontent"><input type="text" name="storeprice" required>원</td>
								</tr>
								<tr>
									<th colspan="2">상품 설명: </th>
								</tr>
								<tr>
									<td colspan="2"><textarea rows="10" cols="40"style="resize: none" name="storeinfo" required>
									
									</textarea></td>
								</tr>
								<tr>
									<td colspan="2" class="contentbutton"><input type="submit"
										class="btn btn-primary btn-lg" value="등록하기"></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
