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
    <link href="/yelloMovie/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/yelloMovie/bootstrap/js/bootstrap.min.js"></script>
 	    
 	    <!-- mypage css -->
    <link href="/yelloMovie/css/mypage/mypage.css" rel="stylesheet">
 
  </head>

  <script type="text/javascript">
  function mypageInquiryWrite() {
	location.href='mypageInquiryWriteForm.do';
}
  
  function qaboardModalOpen(cinemaName,qaCate,qaTitle,qaContent){
	  $('#qaboardModal').modal();

	  $('#cinemaName').val(cinemaName);
	  $('#qaCate').val(qaCate);
	  $('#qaTitle').val(qaTitle);
	  $('#qaContent').val(qaContent);
  }
  
  function answerModalOpen(cinemaName,qaCate,qaTitle,qaContent,answerAnswer){
	  $('#answerModal').modal();
	
	  $('#afterCinemaName').val(cinemaName);
	  $('#afterQaCate').val(qaCate);
	  $('#afterQaTitle').val(qaTitle);
	  $('#afterQaContent').val(qaContent);
	  $('#answerAnswer').val(answerAnswer);
  }
  
  function goModal(){
	  var qaItem = document.getElementsByClassName('qaListItem');
		
			  var qaCate = qaItem[0].firstChild.nodeValue;
			  var cinemaName = qaItem[1].firstChild.nodeValue;
			  var qaTitle = qaItem[2].firstChild.nodeValue;
			  var qaContent = qaItem[3].firstChild.nodeValue;

			  $('#cinemaName').val(cinemaName);
			  $('#qaCate').val(qaCate);
			  $('#qaTitle').val(qaTitle);
			  $('#qaContent').val(qaContent);
			
  }
  
function goModal2(){
	 var qaItem = document.getElementsByClassName('qaAfterItem');
	 
	 var qaCate = qaItem[0].firstChild.nodeValue;
	  var cinemaName = qaItem[1].firstChild.nodeValue;
	  var qaTitle = qaItem[2].firstChild.nodeValue;
	  var qaContent = qaItem[3].firstChild.nodeValue;
	  var qaAnswer = qaItem[4].firstChild.nodeValue;
	  
	  $('#afterCinemaName').val(cinemaName);
	  $('#afterQaCate').val(qaCate);
	  $('#afterQaTitle').val(qaTitle);
	  $('#afterQaContent').val(qaContent);
	  $('#answerAnswer').val(qaAnswer);
	  
}
  </script>
  <body>
    <%@include file="../commonsView/header.jsp" %>
	<c:if test="${empty sessionScope.smdto.memberIdx}">
		<script type="text/javascript">
			window.alert('로그인후 사용하시기를 바랍니다.');
			location.href = 'main.do';
		</script>
	</c:if>
<div class="container" id="divMypageContainer">
 	<div class="mypageHeader"><h2><b>My YelloMovie</b></h2></div>
 		<div class="row" id="mypageNav">
			<div class="col-xs-2" id="mypageCol">
				<p><a href="mypageQaboardList.do?memberIdx=${sessionScope.smdto.memberIdx}">
				<img src="/yelloMovie/img/mypage/mypageQaboard.png"
					style="margin-left: 7px;" width="50px" height="50px"
					alt="myYelloMovie" class="img-rounded"></a>
				</p>
				<span style="color:#A4A4A4;"><strong>나의 문의내역</strong></span>
			</div>
			<div class="col-xs-2" id="mypageCol">
				<p><a href="mypageUpdateMemberForm.do?memberIdx=${sessionScope.smdto.memberIdx}"><img
					src="/yelloMovie/img/mypage/mypageUpdate.png" width="50px" height="50px"
					alt="updateMember" class="img-rounded"></a>
				</p>
				<span style="color:#A4A4A4;"><strong>개인정보수정</strong></span>
			</div>
			<div class="col-xs-2" id="mypageCol">
				<p><a href="mypageReservationList.do?memberIdx=${sessionScope.smdto.memberIdx}"><img
					src="/yelloMovie/img/mypage/mypageReservation.png" width="61px" height="50px"
					alt="reservationImfo" class="img-rounded"></a>
				</p>
				<span style="color:#A4A4A4;"><strong>예매확인/취소</strong></span>
			</div>
			<div class="col-xs-2" id="mypageCol">
				<p><a href="mypageStoreBuyList.do?memberIdx=${sessionScope.smdto.memberIdx}">
				<img src="/yelloMovie/img/mypage/mypageStore.png"
					width="50px" height="50px" alt="storeImfo" class="img-rounded"></a>
				</p>
				<span style="color:#A4A4A4;"><strong>스토어 구매내역</strong></span>
			</div>
		</div>
		<div id="divList">
		<form action="mypageQaboardWriteForm.do" method="post">
		<div style="margin-top: 80px; margin-left: 10px;"><h3><strong>나의 문의내역</strong></h3></div>
		<div style="margin-top: 20px;margin-left: 10px;"><button type="submit" class="btn btn-primary" style="width:100px;">1:1문의</button></div>
		<div style="text-align: center; margin-top: 15px;">
				<table class="table table-hover">
				
						<thead>
							<tr class="active">
								<th width="10%" class="text-center">NO.</th>
								<th width="10%" class="text-center">문의 유형</th>
								<th width="20%" class="text-center">문의 지점</th>
								<th width="20%" class="text-center">제목</th>
								<th width="10%" class="text-center">답변상태</th>
								<th width="20%" class="text-center">등록일</th>
								<th width="50%" class="text-center">답변 날짜</th>
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
							<tr data-toggle="modal" data-target="#answerModal" onclick="goModal2()">
								<td>${qadto.qaIdx}</td>
								<td class="qaAfterItem">${qadto.qaCate}</td>
								<td class="qaAfterItem">${qadto.cinemaName}</td>
								<td class="qaAfterItem">${qadto.qaTitle}</td>
								<td>답변완료</td>
								<td>${qadto.qaWriteDate}</td>
								<td>${qadto.answerDate}</td>
								<td style="display:none;"  class="qaAfterItem">${qadto.qaContent}</td>
								<td style="display:none;"  class="qaAfterItem">${qadto.answerAnswer}</td>
							</tr>
							</c:if>
						<c:if test="${'N' eq qadto.qaAnswer}">
							<tr data-toggle="modal" data-target="#qaboardModal" onclick="goModal()">
								<td>${qadto.qaIdx}</td>
								<td class="qaListItem">${qadto.qaCate}</td>
								<td class="qaListItem">${qadto.cinemaName}</td>
								<td class="qaListItem">${qadto.qaTitle}</td>
								<td style="display:none;"  class="qaListItem">${qadto.qaContent}</td>
								<td>답변대기</td>
								<td>${qadto.qaWriteDate}</td>
								<td>-</td>
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
			</div>
		</form>
	</div>		
</div>	
<!-- Modal -->
<div class="modal fade" id="qaboardModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">문의글 보기</h4>
      </div>
      <div class="modal-body">
      	<div style="border-top: 4px solid #F4FA58; margin-top: 20px;">
			<form class="form-group"  action="mypageQaboardWrite.do" method="post">
				<input type="hidden" id="qaIdx" value="${qadto.qaIdx}"/>
				<table class="table table-striped">
					<tr>
						<th id="inquiryCol"> 문의지점</th>
						<td>
						<input type="text" id="cinemaName" class="form-control" value="${qadto.cinemaName}" readonly style="width: 150px;"/> 
						</td>
						<th id="inquiryCol"> 문의유형</th>
						<td><input type="email" id="qaCate" class="form-control" value="${qadto.qaCate}"readonly style="width: 200px;"></input>
						</td>
					</tr>
					<tr>
						<th id="inquiryCol"> 제목</th>
						<td colspan="3">
						<input type="text" id="qaTitle" readonly="readonly" value="${qadto.qaTitle}"class="form-control">
						</td>
					</tr>
					<tr>
						<th id="inquiryCol" style="vertical-align: middle;"> 내용</th>
						<td colspan="3">
						<textarea class="form-control" id="qaContent" value="${qadto.qaContent}"rows="5" cols="15" readonly="readonly"></textarea>
						</td>
					</tr>
				</table>
			</form>
      		<div class="modal-footer">
       		 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      		</div>			
		</div>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->
<div class="modal fade" id="answerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">문의글 보기</h4>
      </div>
      <div class="modal-body">
      	<div style="border-top: 4px solid #F4FA58; margin-top: 20px;">
			<form class="form-group"  action="mypageQaboardWrite.do" method="post">
				<table class="table table-striped">
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
						<textarea class="form-control" id="answerAnswer" rows="5" cols="15" readonly="readonly"></textarea>
						</td>
					</tr>
				</table>
			</form>
		     <div class="modal-footer">
        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      		</div>
		</div>
      </div>
    </div>
  </div>
</div>
<%@include file="../commonsView/footer.jsp" %>
  </body>
</html>