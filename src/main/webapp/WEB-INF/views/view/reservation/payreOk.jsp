<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Yello egg</title>
<!-- 부트스트랩 -->
<link href="/yelloMovie/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script>
	alert('결제완료!');
	window.opener.location.href = 'movieBoxOffice.do';
	window.self.close();
</script>
</head>
<body>
	
	<table>
		<tr>
			<td>사용자 ID</td>
		</tr>
		<tr>
			<td>영화 정보</td>
		</tr>
		<tr>
			<td>상영관 정보</td>
		</tr>
		<tr>
			<td>좌석 정보</td>
		</tr>
		<tr>
			<td>금액 정보</td>
			${dtos.LGD_AMOUNT}
		</tr>
	</table>
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>