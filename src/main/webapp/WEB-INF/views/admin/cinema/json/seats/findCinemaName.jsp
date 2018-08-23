<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<ul style="list-style: none;padding:0px;">
    <c:forEach items="${nameLists}" var="nameLists" >
       <li ><a href="#" style="display:inline-block;color:black;text-decoration: none;" onclick="selectCinemaName('${nameLists.cinemaName}','${nameLists.cinemaIdx}')"><strong>${nameLists.cinemaName}</strong></a></li>
     </c:forEach>
</ul>
          