<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 데이터테이블 -->
<link rel="stylesheet" href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<script src="//cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>

<title>inqList.jsp</title>
<script>
/* $(function() {
	$("#btnInq").on("click", function(){
		location.href = "inqSellerId.do";
	});
}); */
$(function(){
	
	   $("#task-table").DataTable({
		   "language": {
		        "emptyTable": "검색결과가 없습니다.",
		        "lengthMenu": "페이지당 _MENU_ 개씩 보기",
		        "info": "현재 _START_ - _END_ / _TOTAL_건",
		        "infoEmpty": "",
		        "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
		        "search": " 검색: ",
		        "zeroRecords": "일치하는 데이터가 없어요.",
		        "loadingRecords": "로딩중...",
		        "processing":     "잠시만 기다려 주세요...",
		        "paginate": {
		            "next": "다음",
		            "previous": "이전"
		        }
		    }, searching: false
		}); 
	   
});
</script>
</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="/teamProject3/img/KakaoTalk_20201015_173926849.jpg" style="background-image:url('/teamProject3/img/sd.jpg')"> <!-- 여기있는 이미지 경로를 바꾸시면 됩니다. -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2 >1:1문의 내역</h2>
                        <div class="breadcrumb__option">
                            <a href="/teamProject3/member/myPageMain.jsp">마이페이지</a>
                            <span >1:1문의</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
<br><br>
<div class="container">
   	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-success">
				<table class="table table-hover" id="task-table" style="text-align:center;">
					<thead>
						<tr>
							<th>제목</th>
							<th>날짜</th>
							<th>판매자</th>
							<th>답변여부</th>
						</tr>
					</thead>
					<tbody id="task-tbody">
					<c:forEach items="${list}" var="inq">
						<tr>
							<td style="width:300px; height:50px;">
								<a href="${pageContext.request.contextPath}/inqSelect.do?inq_no=${inq.inq_no}">
								${inq.inq_title}</a>
							</td>
							<td style="width:200px; height:50px;">
								<fmt:parseDate value="${inq.inq_regdate}" pattern="yyyy-MM-dd HH:mm:ss" var="parseDate"/>
								<fmt:formatDate value="${parseDate}" pattern="yyyy-MM-dd HH:mm"/>
							</td>
							<td style="width:200px; height:50px; text-align:left;">${inq.seller_id}</td>
							<td style="width:200px; height:50px;">
								<c:choose>
									<c:when test="${not empty inq.inq_answer}">
										<a href="${pageContext.request.contextPath}/inqSelect.do?inq_no=${inq.inq_no}">답변완료</a>
									</c:when>
									<c:when test="${empty inq.inq_answer}">
										처리중
									</c:when>
								</c:choose>
							</td>
						</tr>
					</c:forEach> 
					</tbody>
				</table>
			</div>
			<div style="text-align:center">
            	<button type="button" id="btnBack" class="site-btn" style="margin : 0 20px;">뒤로가기</button>
           	</div>
		</div>
	</div>
</div>
<script>
	btnBack.addEventListener("click", goBack);
	function goBack() {
		location.assign("/teamProject3/member/myPageMain.jsp");
	}
</script>
		
		
	<!-- <hr> 
	<form action="/teamProject3/inqSellerId.do" method="post">
		<button id="btnInq">1:1문의하기</button>
		<input type="text" name="member_id" value="user5"> 
	</form>
	<hr> --> <!-- 기능 다 구현 할때까지 문의하기 버튼 일단 살려두기, 테스트용으로 이 아이디로 보내기 -->
	
	
</body>
</html>