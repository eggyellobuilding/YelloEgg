<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>관리자 스토어</title>
<link href="/yelloMovie/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script>
</script>
</head>
<body>
<div class="tabbable"> <!-- Only required for left/right tabs -->
  <ul class="nav nav-tabs">
    <li class="active"><a href="#storeList" data-toggle="tab" id="tete">상품리스트</a></li>
    <li><a href="#storeAdd" data-toggle="tab">상품등록</a></li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane active" id="storeList">
      <p>I'm in Section 1.</p>
    </div> 
    <div class="tab-pane" id="storeAdd">
      <p>Howdy, I'm in Section 2.</p>
    </div>
  </div>
</div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>