<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
table,tr{
	vertical-align:middle;
}
</style>
<meta charset=UTF-8>
<title>관리자 페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <link href="/yelloMovie/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 	<link href="/yelloMovie/css/admin/header.css" type="text/css"rel="stylesheet">
	<script src="js/httpRequest.js" type="text/javascript"></script>
	
 	<script>
 		$(document).ready(function(){
 			$("#writeBtn").click(function(){
 				$("#writeNoticeModal").modal();
 			})
 			$(".noticeOpen").click(function(e){
 				var param = "noticeIdx=" + this.id;
 				sendRequest("noticeContent.do", param, function(){
 					if(XHR.readyState == 4){
 		    			if(XHR.status == 200){
 		    				var data = XHR.responseText;
 		    				var objData = eval('(' + data + ')');
 		    				var dto = objData.dto;
 		    				if(dto != null){
 		    					$("#oneTitle").html(dto.noticeTitle);
 	 		    				$("#oneContent").html(dto.noticeContent);
 	 		    				$("#oneReadnum").html(dto.noticeReadnum);
 	 		    				$("#oneWritedate").html(dto.noticeWriteDate);
 		    				}
 		    			}
 					}
 				},"GET");
 				$("#noticeContentModal").modal();
 			})
 			$(".updateNotice").click(function(e){
 				var noticeIdx = this.id.substring(3);
 				var param = "noticeIdx=" + noticeIdx;
 				sendRequest("noticeContent.do", param, function(){
 					if(XHR.readyState == 4){
 		    			if(XHR.status == 200){
 		    				var data = XHR.responseText;
 		    				var objData = eval('(' + data + ')');
 		    				var dto = objData.dto;
 		    				/* var temp = '';
 		    				temp += '<option value="-1" selected>영화관선택</option>';
 		    				for(var i = 0; i < 영화관리스트.length; i++){
 		    					if(dto.cinemaIdx == i){
 		    						temp += '<option value="' + i + 'selected>' + dto.cinemaName + '</option>';
 		    					}else{
 		    						temp += '<option value="' + i + '>' + dto.cinemaName + '</option>';
 		    					}
 		    				} */
 		    				var temp = '';
 		    				temp += '<input type="hidden" value="' + noticeIdx + '" name="noticeIdx">';
 		    				temp += '<select class="form-control" name="noticeCinemaIdx">';
    						temp += '<option value="' + 5 + '">' + dto.cinemaName + '</option>';
	    					temp += '</select>';
 		    				$("#updateTitle").val(dto.noticeTitle);
 		    				$("#updateContent").val(replaceAll(dto.noticeContent, "<br>", "\n"));
 		    				$("#selectCinemaNameUpdate").html(temp);
 		    			}
 					}
 					
 				}, "GET");
 				$("#updateNoticeModal").modal();
 			})
 		})
 		
 		function checkWriteNotice(){
 			if($("#selectCinemaName").val() == '-1'){
 				alert("영화관을 선택해주세요");
 				return false;
 			}
 			
 			return true;
 		}
 		function checkUpdateNotice(){
 			if($("#selectCinemaNameUpdate").val() == '-1'){
 				alert("영화관을 선택해주세요");
 				return false;
 			}
 			
 			return true;
 		}
 		
 		function replaceAll(str, searchStr, replaceStr) {
		  return str.split(searchStr).join(replaceStr);
		}
 	</script>
</head>
<body>
<div class="container">
<%@include file="../adminCommonsViews/adminHeader.jsp" %>
		<div class="container">
			<%@include file="../adminCommonsViews/adminNavi.jsp" %>
    			<div class="col-xs-10" style="padding:0px;padding-left:5px; border-left: 1px solid #E1E1E1;">
      				<ul class="nav nav-tabs" >
      					<li class="active"><a href="adminNotice.do">관리 & 목록</a></li>
					</ul>
					<div class="container">
						<div class="col-xs-6">
							<h2>공지사항 관리</h2>
								<select>
									<option>지역 선택</option>
								</select>
								<select>
									<option>영화관 선택</option>
								</select>
						<table class="table table-hover">
							<thead>
								<tr class="text-center">
									<th class="text-center">영화관</th>
									<th class="text-center">제  목</th>
									<th class="text-center">등록일</th>
									<th class="text-center">조회수</th>
									<th class="text-center">수정하기</th>
								</tr>
							</thead>
							<tbody>
							<c:if test="${empty arr}">
									<tr>
										<td>등록된 공지사항이 없습니다.</td>
									</tr>
								</c:if>
									<c:forEach var="ndto" items="${arr}">
										<input type="hidden" value="${ ndto.noticeIdx }" name="noticeIdx">
										<tr>
											<td>${ ndto.cinemaName }</td>
											<td><a class="noticeOpen" id="${ ndto.noticeIdx }">${ ndto.noticeTitle }</a></td>
											<td>${ ndto.noticeWriteDate }</td>
											<td align="center">${ ndto.noticeReadnum}</td>
											<td><input type="button" class="updateNotice" id="btn${ndto.noticeIdx}" value="수정"></td>
										</tr>
									</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="4">
										${ pageStr }
									</td>
									<td>
										<button id="writeBtn">글쓰기</button>
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
    			</div>
		</div>
</div>

	<div class="modal fade" id="writeNoticeModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h4 class="modal-title">공지사항 등록</h4>
                    <form role="form" action="insertNotice.do" method="POST" onsubmit="return checkWriteNotice();">
                    	<div class="form-group">
                    		<select class="form-control" name="noticeCinemaIdx" id="selectCinemaName">
                    			<option value="-1">영화관선택</option>
                    			<option value="5">광주 에그</option>
                    		</select>
                    	</div>
	                    <div class="form-group">
	                        <div class="clearfix">
	                            <label for="title">제목</label>
	                        </div>
	                        <input type="text" class="form-control" id="title" name="noticeTitle" placeholder="공지사항 제목" required="required">
	                    </div>
	                    <div class="form-group">
	                        <div class="clearfix">
	                            <label for="description">내용</label>
	                        </div>
	                        <textarea class="form-control" id="content" name="noticeContent" required="required"></textarea>
	                    </div>
                    	
	                    <div class="form-group">
	                        <button type="submit" class="btn btn-primary">작성</button>
	                        <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
	                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="noticeContentModal" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h4 class="modal-title">공지사항 내용</h4>
                    <form role="form" id="pjForm" action="createPj.do" method="POST">
	                    <div class="form-group">
	                        <div class="clearfix">
	                            <label for="oneTitle">제목</label>
	                        </div>
	                        <span id="oneTitle"></span>
	                    </div>
	                    <div class="form-group">
	                        <div class="clearfix">
	                            <label for="oneWritedate">작성날짜</label>
	                        </div>
	                        <span id="oneWritedate"></span>
	                    </div>
	                    <div class="form-group">
	                        <div class="clearfix">
	                            <label for="oneReadnum">조회수</label>
	                        </div>
	                        <span id="oneReadnum"></span>
	                    </div>
	                    <div class="form-group">
	                        <div class="clearfix">
	                            <label for="description">내용</label>
	                        </div>
	                        <span id="oneContent"></span>
	                    </div>
                    	
	                    <div class="form-group">
	                        <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
	                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="updateNoticeModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h4 class="modal-title">공지사항 수정</h4>
                    <form role="form" action="updateNotice.do" method="POST" onsubmit="return checkUpdateNotice();">
                    	
                    	<div class="form-group" id="selectCinemaNameUpdate">
                    	</div>
	                    <div class="form-group">
	                        <div class="clearfix">
	                            <label for="title">제목</label>
	                        </div>
	                        <input type="text" class="form-control" id="updateTitle" name="noticeTitle" placeholder="공지사항 제목" required="required">
	                    </div>
	                    <div class="form-group">
	                        <div class="clearfix">
	                            <label for="description">내용</label>
	                        </div>
	                        <textarea class="form-control" id="updateContent" name="noticeContent" required="required"></textarea>
	                    </div>
                    	
	                    <div class="form-group">
	                        <button type="submit" class="btn btn-primary">수정</button>
	                        <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
	                    </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
 	<script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
</html>