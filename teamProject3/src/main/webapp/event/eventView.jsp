<%@page import="model.EventDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
 table {font-size: 20pt;}
 
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
    
    #title{
            height : 16;
            font-family :'돋움';
            font-size : 12;
            text-align :center;
        }
</style>
   <script>   //삭제~~~~!!!!!!!!!!
   $(function(){
		$("#eventdele").on("click",function (){
			var result = confirm('??지울라고???왜????');
			if (result) {
			location.href="/teamProject3/eventDelete.do?board_no=${board.board_no}"
			}
		})
		if (${id == board.member_id}){
			$(".btn").show();
		}
	})

   </script>

</head>
<body>
 <%@include file="/common/header.jsp" %>
<form>
	<table style="width:820px" align = "center">
		<%--  <tr align = "center">
		 	 <td>${board.board_sub}</td>
		 </tr> --%>
		
		<tr>
		 <th>작성날짜</th>
		 	 <td>${board.board_date}</td>
		 </tr>
		
		  <tr>
		  <th></th>
		  <td>
		  
		  	<C:if>
		  		<img src="/teamProject3/images/${board.board_file}" style="max-width:500px"><br>
		  	</C:if>
		  	${board.board_content}
		  </td>
		  </tr>			  
		 </table>
		 
		 <br>
            <hr>
            <c:if test="${sessionScope.id == 'vegan'}">
            <div align = "center">
			<a href="eventViewUpdate.do?board_no=${board.board_no}">
				<button class = "btn pink" type="button">수정</button>
			</a>
			   
            <button type="button" class = "btn green" 
            		id = "eventdele">삭제</button>
            </div>
            </c:if>
	</form>	
</body>
</html>