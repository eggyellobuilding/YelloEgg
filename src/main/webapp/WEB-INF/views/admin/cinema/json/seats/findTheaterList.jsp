<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${!empty theaterLists}">
	
<c:forEach items="${theaterLists}" var="theater">
	 <li><a href="#" onclick="selectTheaterName('${theater.theaterName}','${theater.theaterIdx}')">${theater.theaterName}</a></li>
</c:forEach>
</c:if>
<c:if test="${empty theaterLists}">
	<li><a href="#">등록된 상영관이 없습니다.</a></li>
</c:if>