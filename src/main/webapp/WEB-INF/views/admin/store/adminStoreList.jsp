<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.htag{
	margin-bottom: 60px;
	margin-left: 20px;
}
.storetable {
	width: 120px;
	padding-top:20px;
	padding-bottom: 20px;
	border-bottom:1px solid #A4A4A4;
	text-align: center;
}
.headtable{
	width:120px;
	border-bottom:1px solid #A4A4A4;
	border-top:1px solid #A4A4A4;
	padding-top:20px;
	padding-bottom: 20px;
	text-align: center;
}
.fronttable{
	width:60px;
}
.formstoretable{
	margin-left: 30px;
}
.firsttable{
	border-left: 1px solid #A4A4A4;
}
.deletetable{
	border-right: 1px solid #A4A4A4;
}
.storeout{
	text-align: center; 
	font-size: 20px;
}
.storein{
	width: 50%; 
	display:inline-block;
}
</style>

<script>
	function show(){
		window.alert('삭제가 되었습니다.');
	}
</script>
<link href="/yelloMovie/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/yelloMovie/css/admin/header.css" type="text/css" rel="stylesheet">
</head>
<body>

	<div class="container">
		<%@include file="../adminCommonsViews/adminHeader.jsp"%>
		<div class="container">
			<%@include file="../adminCommonsViews/adminNavi.jsp"%>
			<div class="col-xs-10"
				style="padding: 0px; padding-left: 5px; border-left: 1px solid #E1E1E1;">
				<ul class="nav nav-tabs">
					<li class="active"><a href="adminStoreList.do" data-toggle="tab">상품목록</a></li>
					<li><a href="adminStoreAdd.do" data-toggle="tab">상품등록</a></li>
				</ul>
				<h1 class="htag">상품 리스트</h1>
				
				<div class="container">
					<div class="row">
						<div class="col-xs-12">
							<table class="formstoretable">
								<tr>
									<th class="fronttable"></th>
									<th class="headtable firsttable">상품번호</th>
									<th class="headtable">카테고리</th>
									<th class="headtable">상품명</th>
									<th class="headtable">총 갯수</th>
									<th class="headtable">가격</th>
									<th class="headtable">상태</th>
									<th class="headtable deletetable">삭제</th>
								</tr>
								<c:if test="${empty list}">
									<tr>
										<th colspan="7" class="storetable">등록된 리스트가 없습니다</th>
									</tr>
								</c:if>

								<c:forEach var="dto" items="${list}">
									<tr>
										<th class="fronttable"></th>
										<td class="storetable firsttable">${dto.storeIdx}</td>
										<td class="storetable">${dto.storectg}</td>
										<td class="storetable">${dto.storeName}</td>
										<td class="storetable">${dto.storeCount}</td>
										<td class="storetable">${dto.storePrice}</td>
										<c:choose>
												<c:when test="${dto.storestate=='Y'}">
											<td class="storetable">진행중</td>
												</c:when>
												<c:otherwise>
											<td class="storetable">삭제됨</td>
												</c:otherwise>
										</c:choose>
										<c:url var="storeDelete" value="adminStoreDelete.do">
											<c:param name="storeIdx">${dto.storeIdx}</c:param>
										</c:url> 
										<c:choose>
											<c:when test="${dto.storestate=='N'}">
												<td class="storetable deletetable"><input type="button" class="btn btn-primary btn-sm" value="삭제" onclick="show()"></td>
											</c:when>
											<c:otherwise>
												<td class="storetable deletetable"><a href="${storeDelete}"><input type="button" class="btn btn-primary btn-sm" value="삭제"></a></td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<div class="storeout">
					<div class="disabled storein">
						<span aria-hidden="true">&laquo;</span>${pagestr}<span class="sr-only">(current)</span>
					</div>
				</div>
			</div>
		</div>
	</div>