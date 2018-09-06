<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:if test="${!empty theaterLists}">
<c:forEach items="${theaterLists}" var="cdto">
	<a class="list-group-item" onclick="openSeatModal(this);" id="${ cdto.theaterIdx }">${cdto.theaterName}</a>
</c:forEach>
</c:if>
<c:if test="${empty theaterLists}">
	<div class="container">
		등록된 상영관이 없습니다.
	</div>
</c:if>