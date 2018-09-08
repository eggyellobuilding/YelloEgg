<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 공지사항 페이지</title>
<script src="js/httpRequest.js" type="text/javascript"></script>
<style>
#Notice th,td,tr{
	text-align: center;
}
.noticeform{
	margin-top: 80px; 
}	
</style>
<script>
		$(".noticeContent").click(function(e){
			var param = "noticeIdx=" + this.id;
			sendRequest("nContent.do", param, function(){
				if(XHR.readyState == 4){
	    			if(XHR.status == 200){
	    				var data = XHR.responseText;
	    				var objData = eval('(' + data + ')');
	    				var dto = objData.dto;
	    				if(dto != null){
	    					$("#commonsTitle").html(dto.noticeTitle);
		    				$("#commonsContent").html(dto.noticeContent);
		    				$("#commonsReadnum").html(dto.noticeReadnum);
		    				$("#commonsWritedate").html(dto.noticeWriteDate);
	    				}
	    			}
				}
			},"POST");
			$("#noticeContentModal").modal();
		})
</script> 
</head>
<body>
<%@include file="../commonsView/header.jsp" %>
	<div class="container noticeform">
	
		<h2>공지사항</h2>
		<a href="adminNotice.do">관리자모드</a>
			<table class="table table-striped">
				<thead>
					<tr id="Notice">
					<!-- 5 -->
						<th>영화관</th>
						<th>제 목</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${ empty arr }">
						<tr>
							<td colspan="5" align="center">등록된 공지사항이 없습니다.</td>
						</tr>
					</c:if>
						<c:forEach var="ndto" items="${arr}">
						<input type="hidden" value="${ ndto.noticeIdx }" name="noticeIdx">
						<tr>
							<td>${ ndto.cinemaName }</td>
							<td><a class="noticeContent" id="${ ndto.noticeIdx }">${ ndto.noticeTitle }</a></td>
							<td>${ ndto.noticeWriteDate }</td>
							<td align="center">${ndto.noticeReadnum}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
				<tr>
					<td colspan="4">${pageStr}</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<div class="model fade" id="noticeCententModel" role="dialog">
		<div class="model-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">x</button>
					<h4 class="modal-title">본문</h4>
			</div>
				<form role="form" id="mainForm" action="createPj.do" method="POST">
	                    <div class="form-group">
	                        <div class="clearfix">
	                            <label for="commonsTitle">제목</label>
	                        </div>
	                        <span id="commonsTitle"></span>
	                    </div>
	                    <div class="form-group">
	                        <div class="clearfix">
	                            <label for="commonsWritedate">작성날짜</label>
	                        </div>
	                        <span id="commonsWritedate"></span>
	                    </div>
	                    <div class="form-group">
	                        <div class="clearfix">
	                            <label for="commonsReadnum">조회수</label>
	                        </div>
	                        <span id="commonsReadnum"></span>
	                    </div>
	                    <div class="form-group">
	                        <div class="clearfix">
	                            <label for="commonsContent">내용</label>
	                        </div>
	                        <span id="commonsContent"></span>
	                    </div>
                    	
	                    <div class="form-group">
	                        <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
	                    </div>
                    </form>
			</div>
		</div>
	</div>
	<%@include file="../commonsView/footer.jsp" %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>