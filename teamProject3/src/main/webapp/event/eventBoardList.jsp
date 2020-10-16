<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.btn{  /* 새로운재료 추가 버튼 css */
      text-decoration: none;
      font-size:2rem;
      color:white;
      padding:10px 20px 10px 20px;
      margin:20px;
      display:inline-block;
      border-radius: 10px;
      transition:all 0.1s;
      text-shadow: 0px -2px rgba(0, 0, 0, 0.44);
      font-family: 'Lobster', cursive; <!-- google font -->
    }
    .btn:active{
      transform: translateY(3px);
    }
    .btn.blue{
      background-color: #1f75d9;
      border-bottom:5px solid #165195;
    }
    .btn.blue:active{
      border-bottom:2px solid #165195;
    }
    .btn.red{
      background-color: #ff521e;
      border-bottom:5px solid #c1370e;
    }
    .btn.red:active{
      border-bottom:2px solid #c1370e;
    }
     .btn.green{
      background-color: #298A08;
      border-bottom:5px solid #165195;
    }
    .btn.green:active{
      border-bottom:2px solid #165195;
    }
	.btn.pink{
      background-color: #FE2E64;
      border-bottom:5px solid #165195;
    }
    .btn.pink:active{
      border-bottom:2px solid #165195;
    }
</style>

</head>
<body>
	<br><br>
	<div class="container">
	<table class="table table-striped" >
		<thead>
		
		</thead>
		<tbody>
		<c:forEach items="${list}" var="eventboard">
	
		<tr>
			<td>${eventboard.board_no}</td>
				<c:if test="${!empty eventboard.board_file}">
					<td>
					<a href="eventView.do?board_no=${eventboard.board_no}">
					<img src="/teamProject3/images/${ eventboard.member_name }" width="450" height="200">
					</a>
					</td>
				</c:if>
				
		<%-- 	<td><a href="eventView.do?board_no=${eventboard.board_no}">${eventboard.board_sub}</a></td>
			<!-- 제목 누르면 view페이지로 넘어감 --> --%>
			<td>${eventboard.board_date}</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<hr/>
	<a class = "btn red" href ="/teamProject3/event/eventInsert.jsp">이벤트 등록</a>
	<my:paging paging="${paging}" jsfunc="gopage" />
	
<script>
   function gopage(p) {         // 검색
      searchFrm.p.value = p;    // 페이지번호 받아와서 submit에 넘김
      searchFrm.submit();
      // location.href="deptSelectAll?p=" + p;  
      // 이동되는 주소가 달라서 여러사람이 쓰기위해서는 매개값 p로 해줌
   }
</script>
</div>
</body>
</html>