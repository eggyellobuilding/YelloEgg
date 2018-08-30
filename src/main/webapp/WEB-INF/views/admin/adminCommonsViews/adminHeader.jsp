<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
function adminLogout() {
	location.href='memberLogout.do';
}
</script>
<div class="row-fulid" style="height: 80px; margin-top: 20px;">

	<div class="col-xs-3">
		<img src="/yelloMovie/img/log.PNG" class="img-responsive">
	</div>

	<div class="col-xs-9">
		<h1>관리자 페이지</h1>
	</div>
	<c:if test="${!empty saddto}">
		<div class="col-xs-1">
			<input type="button" value="로그아웃" class="btn btn-info" onclick="adminLogout()" style="position:absolute;left:900px;">
		</div>
	</c:if>
</div>





