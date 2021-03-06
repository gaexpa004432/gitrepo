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
					<c:when test="${not empty listA}">
						<table class="table table-hover" id="task-table">
							<thead>
								<tr>
									<th>식당번호</th>
									<th>식당이름</th>
									<th>도로명주소</th>
									<th>지번주소</th>
								</tr>
							</thead>
							<tbody id="task-tbody">
							<c:forEach items="${listA}" var="list">
								<tr>
									<td style="width:100px; height:100px;">${list.res_no}</td>
									<td style="width:200px; height:100px;"><a href="${pageContext.request.contextPath}/restaurantView.do?res_no=${list.res_no}">
																			${list.res_name}</a></td>
									<td style="width:400px; height:100px; text-align:left;">${list.res_si}</td>
									<td style="width:400px; height:100px;">${list.res_gu}</td>
								</tr>
							</c:forEach> 
							</tbody>
						</table>
					</c:when> 
					<c:when test="${empty listA}">
						<table class="table table-hover" id="task-table">
							<thead>
								<tr>
									<th>식당번호</th>
									<th>식당이름</th>
									<th>도로명주소</th>
									<th>지번주소</th>
								</tr>
							</thead>
							<tbody id="task-tbody">
							<c:forEach items="${listA}" var="list">
								<tr>
									<td>${list.res_no}</td>
									<td>${list.res_name}</td>
									<td>${list.res_si}</td>
									<td>${list.res_gu}</td>
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