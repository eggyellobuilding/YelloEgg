<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>관리자 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <link href="/yelloMovie/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 	<link href="/yelloMovie/css/admin/header.css" type="text/css"rel="stylesheet">
 	    <link href="/yelloMovie/css/mypage/mypage.css" rel="stylesheet">
</head>
<style>
h2{
	margin-top: 40px;
}
#adminQaboardTable th{
	text-align: center;
}

#adminQaboardTable td{
	text-align: center;
	
}
</style>
<script type="text/javascript">
function qaboardModalOpen(qaIdx,qaWriteDate,name,gradeName,tel,email,cinemaName,qaCate,qaTitle,qaContent){
	  $('#qaboardModal').modal();
	  
	  $('#qaIdx').val(qaIdx);
	  $('#qaWriteDate').val(qaWriteDate);
	  $('#name').val(name);
	  $('#gradeName').val(gradeName);
	  $('#tel').val(tel);
	  $('#email').val(email);
	  $('#cinemaName').val(cinemaName);
	  $('#qaCate').val(qaCate);
	  $('#qaTitle').val(qaTitle);
	  $('#qaContent').val(qaContent);
}

function answerModalOpen(qaIdx,qaWriteDate,name,gradeName,tel,email,cinemaName,qaCate,qaTitle,qaContent,answerAnswer){
	  $('#answerModal').modal();
	
	  $('#afterQaIdx').val(qaIdx);
	  $('#afterQaWriteDate').val(qaWriteDate);
	  $('#afterName').val(name);
	  $('#afterGradeName').val(gradeName);
	  $('#afterTel').val(tel);
	  $('#afterEmail').val(email);
	  $('#afterCinemaName').val(cinemaName);
	  $('#afterQaCate').val(qaCate);
	  $('#afterQaTitle').val(qaTitle);
	  $('#afterQaContent').val(qaContent);
	  $('#afterAnswerAnswer').val(answerAnswer);
}

function checkBlank() {
	var answerAnswer=document.getElementById('answerAnswer').value;
	if(answerAnswer==''){
		alert('답변을 입력해주세요.');
		return false;
	}
}
</script>
<body>
<div class="container">
	<c:if test="${empty sessionScope.saddto.adminIdx}">
		<script type="text/javascript">
			window.alert('로그인후 사용하시기를 바랍니다.');
			location.href = 'main.do';
		</script>
	</c:if>
<%@include file="../adminCommonsViews/adminHeader.jsp" %>
		
		<div class="container">
			<%@include file="../adminCommonsViews/adminNavi.jsp" %>
    			<div class="col-xs-10" style="padding:0px;padding-left:5px; border-left: 1px solid #E1E1E1; height:1900px; ">
      				<ul class="nav nav-tabs" >
      					<li class="active"><a href="adminQaboardList.do" >1:1문의 관리</a></li>
					</ul>
					<div class="container">
						<h2>1:1문의게시판 목록</h2>
						<form style="margin-top: 35px; overflow: auto; width: 95%;">
						<table id="adminQaboardTable" class="table table-hover">
							<thead>
								<tr class="active">
									<th width="10%" class="text-center">NO.</th>
									<th width="10%" class="text-center">문의 유형</th>
									<th width="10%" class="text-center">문의 지점</th>
									<th width="35%" class="text-center">제목</th>
									<th width="10%" class="text-center">답변상태</th>
									<th width="10%" class="text-center">등록날짜</th>
									<th width="45%" class="text-center">비고&답변날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty lists}">
									<tr>
										<td colspan="7" align="center">문의게시글 내역이 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach var="qadto" items="${lists}">
									<c:if test="${'Y' eq qadto.qaAnswer}">
										<tr onclick="answerModalOpen('${qadto.qaIdx}','${qadto.qaWriteDate}','${qadto.name}','${qadto.gradeName}',
													'${qadto.tel}','${qadto.email}','${qadto.cinemaName}',
													'${qadto.qaCate}','${qadto.qaTitle}','${qadto.qaContent}','${qadto.answerAnswer}')">
											<td>${qadto.qaIdx}</td>
											<td>${qadto.qaCate}</td>
											<td>${qadto.cinemaName}</td>
											<td>${qadto.qaTitle}</td>
											<td>답변완료</td>
											<td>${qadto.qaWriteDate}</td>
											<td>${qadto.answerDate}</td>
										</tr>
									</c:if>	
									<c:if test="${'N' eq qadto.qaAnswer}">
										<tr>
											<td>${qadto.qaIdx}</td>
											<td>${qadto.qaCate}</td>
											<td>${qadto.cinemaName}</td>
											<td>${qadto.qaTitle}</td>
											<td>답변대기중</td>
											<td>${qadto.qaWriteDate}</td>
											<td><button type="button" class="btn btn-primary" onclick="qaboardModalOpen('${qadto.qaIdx}','${qadto.qaWriteDate}','${qadto.name}','${qadto.gradeName}',
													'${qadto.tel}','${qadto.email}','${qadto.cinemaName}','${qadto.qaCate}','${qadto.qaTitle}','${qadto.qaContent}')">답변작성
											</button></td>
										</tr>
										</c:if>	
									</c:forEach>	
							</tbody>
							<tfoot>
								<tr>
									<td colspan="7">
										<nav style="text-align: center">
											<ul class="pagination">
											${pageStr}
											</ul>
										</nav>
									</td>
								</tr>
							</tfoot>
						</table>
					</form>
				</div>
    		</div>
		</div>
</div>
<!-- qaboardModal -->
<div class="modal fade" id="qaboardModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
     
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">문의글 보기</h4>
      </div>
       <form action="adminQaboardAnswer.do" method="post" onsubmit="return checkBlank()">
      <div class="modal-body">
      	<div style="border-top: 4px solid #F4FA58; margin-top: 20px;">
			<input type="hidden" name ="answerAdminIdx" value="${sessionScope.saddto.adminIdx}">
				<table class="table table-striped">
					<tr>
						<th id="inquiryCol">문의글 번호</th>
						<td><input type="text" name ="answerQaIdx" id="qaIdx" class="form-control" style="width: 50px;" readonly ></input></td>
						<th id="inquiryCol">작성 날짜</th>
						<td><input type="text" id="qaWriteDate" class="form-control" style="width: 140px;" readonly ></input></td>
					</tr>
					<tr>
						<th id="inquiryCol"> 작성자</th>
						<td><input type="text" id="name" class="form-control" style="width: 140px;" readonly ></input></td>
						<th id="inquiryCol"> 작성자 등급</th>
						<td><input type="text" id="gradeName" class="form-control" readonly style="width: 150px;"/> 
						</td>
					</tr>
					<tr>
						<th id="inquiryCol"> 연락처</th>
						<td>
						<input type="text" id="tel" class="form-control" readonly style="width: 150px;"/> 
						</td>
						<th id="inquiryCol"> 이메일</th>
						<td><input type="email" id="email" class="form-control" readonly style="width: 200px;"></input></td>
					</tr>
					<tr>
						<th id="inquiryCol"> 문의지점</th>
						<td>
						<input type="text" id="cinemaName" class="form-control" readonly style="width: 150px;"/> 
						</td>
						<th id="inquiryCol"> 문의유형</th>
						<td><input type="email" id="qaCate" class="form-control" readonly style="width: 200px;"></input>
						</td>
					</tr>
					<tr>
						<th id="inquiryCol"> 제목</th>
						<td colspan="3">
						<input type="text" id="qaTitle" readonly="readonly" class="form-control">
						</td>
					</tr>
					<tr>
						<th id="inquiryCol" style="vertical-align: middle;"> 내용</th>
						<td colspan="3">
						<textarea class="form-control" id="qaContent" rows="5" cols="15" readonly="readonly"></textarea>
						</td>
					</tr>
					<tr>
						<th id="inquiryCol" style="vertical-align: middle;"> 관리자 답변</th>
						<td colspan="3">
						<textarea class="form-control" name="answerAnswer" id="answerAnswer" rows="5" cols="15"></textarea>
						</td>
					</tr>
				</table>
			</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="submit" class="btn btn-primary">글작성</button>
      </div>
    </form>  
    </div>
  </div>
</div>

<!-- answerModal -->
<div class="modal fade" id="answerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
     
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">문의글 보기</h4>
      </div>
       <form method="post">
      <div class="modal-body">
      	<div style="border-top: 4px solid #F4FA58; margin-top: 20px;">
			<table class="table table-striped">
					<tr>
						<th id="inquiryCol">문의글 번호</th>
						<td><input type="text" id="afterQaIdx" class="form-control" style="width: 50px;" readonly ></input></td>
						<th id="inquiryCol">작성 날짜</th>
						<td><input type="text" id="afterQaWriteDate" class="form-control" style="width: 140px;" readonly ></input></td>
					</tr>
					<tr>
						<th id="inquiryCol"> 작성자</th>
						<td><input type="text" id="afterName" class="form-control" style="width: 140px;" readonly ></input></td>
						<th id="inquiryCol"> 작성자 등급</th>
						<td><input type="text" id="afterGradeName" class="form-control" readonly style="width: 150px;"/> 
						</td>
					</tr>
					<tr>
						<th id="inquiryCol"> 연락처</th>
						<td>
						<input type="text" id="afterTel" class="form-control" readonly style="width: 150px;"/> 
						</td>
						<th id="inquiryCol"> 이메일</th>
						<td><input type="email" id="afterEmail" class="form-control" readonly style="width: 200px;"></input></td>
					</tr>
					<tr>
						<th id="inquiryCol"> 문의지점</th>
						<td>
						<input type="text" id="afterCinemaName" class="form-control" readonly style="width: 150px;"/> 
						</td>
						<th id="inquiryCol"> 문의유형</th>
						<td><input type="email" id="afterQaCate" class="form-control" readonly style="width: 200px;"></input>
						</td>
					</tr>
					<tr>
						<th id="inquiryCol"> 제목</th>
						<td colspan="3">
						<input type="text" id="afterQaTitle" readonly="readonly" class="form-control">
						</td>
					</tr>
					<tr>
						<th id="inquiryCol" style="vertical-align: middle;"> 내용</th>
						<td colspan="3">
						<textarea class="form-control" id="afterQaContent" rows="5" cols="15" readonly="readonly"></textarea>
						</td>
					</tr>
					<tr>
						<th id="inquiryCol" style="vertical-align: middle;"> 관리자 답변</th>
						<td colspan="3">
						<textarea class="form-control" id="afterAnswerAnswer" rows="5" cols="15" readonly="readonly"></textarea>
						</td>
					</tr>
				</table>
			</div>
     	 </div>
   		</form> 
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div> 
    </div>
  </div>
</div>
</body>
    
    <script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
</html>