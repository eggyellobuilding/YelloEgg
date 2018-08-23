<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach begin="1" end="${x}" var="btnX">
	<input type="button" class="columnLeft" id="column${btnX}" onclick="columnLeftBtn(${btnX},${x},${y})" style="display:inline-block;width:16px;height:16px;position:absolute;left:${17*btnX}px;background-color:red;margin-left:1px;">
</c:forEach>

<c:forEach begin="1" end="${y}" var="row">
		<span class="rowTop row${row}" id="row${row}" onclick="rowTopBtn(${row},${x},${y})"style="border:1px solid black;background-color: lightgray;position:absolute;top:${17*row}px;margin-left:1px;width:16px;height:16px;">${alt[row-1]}</span>
	
	<c:forEach begin="1" end="${x}" var="column">
		<input type="checkbox" class="column${column} row${row} seatsInfo" name="${alt[row-1]}${column}" style="display:inline-block;width:16px;height:16px;position:absolute;left:${17*column}px;top:${17*row}px;margin-left:1px;" checked>
	</c:forEach>
</c:forEach>
