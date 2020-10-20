<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 데이터테이블 -->
<link rel="stylesheet" href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<script src="//cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>

<title>searchOutput.jsp</title>
<script>
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
                        <h2 >검색결과</h2>
                        <div class="breadcrumb__option">
                            <a href="/teamProject3/" >Home</a>
                            <span >검색결과</span>
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
				<c:choose>
					<c:when test="${not empty listP}">
						<table class="table table-hover" id="task-table">
							<thead>
								<tr>
									<th>재료이름</th>
									<th>레시피번호</th>
									<th>레시피이름</th>
								</tr>
							</thead>
							<tbody id="task-tbody">
							<c:forEach items="${listP}" var="list">
								<tr>
									<td style="width:200px; height:100px;">${list.product_name}</td>
									<td style="width:200px; height:100px;">${list.recipe_number}</td>
									<td style="width:200px; height:100px;"><a href="${pageContext.request.contextPath}/recipeView.do?recipe_number=${list.recipe_number}">
																			${list.recipe_name}</a></td>
								</tr>
							</c:forEach> 
							</tbody>
						</table>
					</c:when>
					<c:when test="${empty listP}">
						<table class="table table-hover" id="task-table">
							<thead>
								<tr>
									<th>재료이름</th>
									<th>레시피번호</th>
									<th>레시피이름</th>
								</tr>
							</thead>
							<tbody id="task-tbody">
							<c:forEach items="${listP}" var="list">
								<tr>
									<td>${list.product_name}</td>
									<td>${list.recipe_number}</td>
									<td>${list.recipe_name}</td>
								</tr>
							</c:forEach> 
							</tbody>
						</table>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
</div>
</body>
</html>