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
		columnDefs: [
			{ targets: 1 , render: $.fn.dataTable.render.number( ',' , '.' , 0 , '' , '원' ) }]
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
					<c:when test="${not empty listRs}">
						<table class="table table-hover" id="task-table" style="text-align:center;"> <!-- style="table-layout:fixed; word-break:break-all;" -->
							<thead>
								<tr>
									<th>식당번호</th>
									<th>식당이름</th>
									<th>식당내용</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody id="task-tbody">
							<c:forEach items="${listRs}" var="list">
								<tr>
									<td style="width:100px; height:100px;">${list.res_no}</td>
									<td style="width:200px; height:100px;">${list.res_name}</td>
									<td style="width:500px; height:100px; text-align:left;">${list.res_content}</td>
									<td style="width:300px; height:100px;">${list.res_date}</td>
								</tr>
							</c:forEach> 
							</tbody>
						</table>
					</c:when>
					<c:when test="${not empty listRc}">
						<table class="table table-hover" id="task-table">
							<thead>
								<tr>
									<th>레시피번호</th>
									<th>레시피이름</th>
									<th>레시피내용</th>
									<th>작성일</th>
									<th>작성자</th>
								</tr>
							</thead>
							<tbody id="task-tbody">
							<c:forEach items="${listRc}" var="list">
								<tr>
									<td>${list.recipe_number}</td>
									<td>${list.recipe_name}</td>
									<td>${list.recipe_content}</td>
									<td>${list.recipe_date}</td>
									<td>${list.member_id}</td>
								</tr>
							</c:forEach> 
							</tbody>
						</table>
					</c:when>
					<c:when test="${not empty listRsc}">
						<table class="table table-hover" id="task-table">
							<thead>
								<tr>
									<th>식당번호</th>
									<th>식당이름</th>
									<th>식당내용</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody id="task-tbody">
							<c:forEach items="${listRsc}" var="list">
								<tr>
									<td>${list.res_no}</td>
									<td>${list.res_name}</td>
									<td>${list.res_content}</td>
									<td>${list.res_date}</td>
								</tr>
							</c:forEach> 
							</tbody>
						</table>
					</c:when>
					<c:when test="${not empty listRcc}">
						<table class="table table-hover" id="task-table">
							<thead>
								<tr>
									<th>레시피번호</th>
									<th>레시피이름</th>
									<th>레시피내용</th>
									<th>작성일</th>
									<th>작성자</th>
								</tr>
							</thead>
							<tbody id="task-tbody">
							<c:forEach items="${listRcc}" var="list">
								<tr>
									<td>${list.recipe_number}</td>
									<td>${list.recipe_name}</td>
									<td>${list.recipe_content}</td>
									<td>${list.recipe_date}</td>
									<td>${list.member_id}</td>
								</tr>
							</c:forEach> 
							</tbody>
						</table>
					</c:when>
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
									<td>${list.product_name}</td>
									<td>${list.recipe_number}</td>
									<td>${list.recipe_name}</td>
								</tr>
							</c:forEach> 
							</tbody>
						</table>
					</c:when>
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