<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
    <div class="list-group" id="cinemaList">
        <a href="#" class="list-group-item"><strong style="color:purple;">영화관 보기</strong></a>
            <div class="row">
                <div id="cinemaSi"class="col-xs-6" style="background-color:white;">
					<c:forEach items="${cityLists}" var="cityLists">
						<a href="#" style="color:black;"class="list-group-item" onclick="findCinemaName('${cityLists.cinemaCity}')">${cityLists.cinemaCity}<span class="glyphicon glyphicon-menu-right"></span></a>
					</c:forEach>
                </div>
            <div id="cinemaNameList"class="col-xs-6 text-center">
               
            </div>
        </div>
    </div>
</div>