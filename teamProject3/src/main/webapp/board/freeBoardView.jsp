<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/teamProject3/board/css/bootstrap.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<style>
tr:nth-child(even)
{ background-color:#f5F5f5;
}

table {
  border-width : 1px;
  border-style : solid;
  border-color : #F5F5F5;
  
}

h1,table {font-family: 'Noto Sans KR', sans-serif;}

	th {
		min-width: 50px
	}
	
	
	div {
        margin-top: 1px;
        margin-right: 1px;
        margin-bottom: 1px;
        margin-left: 1px;
      }
      
</style>


<title>Insert title here</title>


<script>
$(function(){
	$("#delbtn").on("click",function (){
	
		var result = confirm('정말로 삭제하시겠습니까?');
		if (result) {
		location.href="/teamProject3/freeBoardDelete.do?board_no=${board.board_no}"
		}
	})
	
	if (${id == board.member_id}){
		$(".btn").show();
	}
})

//댓글 script부분(userClient.jsp참고)
	$(function(){
		
	
		commentInsert()
	//삭제 버튼  이벤트
	function commentDelete() {
		//삭제 버튼 클릭
		$('body').on('click','#btnDelete',function(){
			var tr = $(this).closest('tr');
			var userId = $(this).closest('tr').find('#hidden_Id').val();
			var result = confirm(userId +" 사용자를 정말로 삭제하시겠습니까?");
			if(result) {
				$.ajax({
					url:'ajax/Commentdelete.do',
					data : {id : userId},
					dataType:'json',
					error:function(xhr,status,msg){
						console.log("상태값 :" + status + " Http에러메시지 :"+msg);						
					}, success:function(data) {
						tr.remove();   //userList();
						$('#btnInit').click();
					}
				});      }//if
		}); //삭제 버튼 클릭
	}//userDelete
	
	//사용자 조회 버튼 이벤트
	function commentSelect() {
		//조회 버튼 클릭
		$('body').on('click','#btnSelect',function(){
			var userId = $(this).closest('tr').find('#hidden_userId').val();
			//특정 사용자 조회
			$.ajax({
				url:'ajax/CommentSelect.do',
				data : {id : userId},
				dataType:'json',
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:commentSelectResult
			});
		}); //조회 버튼 클릭
	}//userSelect
	
	//사용자 조회 응답
	function commentSelectResult(user) {
		$('input:text[name="id"]').val(user.id);
		$('input:text[name="name"]').val(user.name);
		$('input:radio[name="gender"]').val([user.gender]);
		$('select[name="role"]').val(user.role).attr("selected", "selected");
	}//userSelectResult
	
	//사용자 수정 버튼 이벤트
	function commentUpdate() {
		//수정 버튼 클릭
		$('#btnUpdate').on('click',function(){
			var div = $(this).closest("tr");
			$.ajax({ 
			    url: "ajax/CommentUpdate.do", 
			    dataType: 'json', 
			    data: $("#form1").serialize(),
			    success: function(data) { 
			    	div.replaceWith( makeTr(data) );
			    },
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    }
			});
		});//수정 버튼 클릭
	}//userUpdate
	
	//사용자 등록 요청
	function commentInsert(){
		//등록 버튼 클릭
		$('#btnInsert').on('click',function(){
		var content = $('#commentcontent').val();
		
			$.ajax({ 
			    url: "/teamProject3/commentInsert.do",  
			    dataType: 'json', 
			    method : "POST",
			    data :  {content:content,post_no:${board.board_no}},
			    success: function(data) {
			    }, 
			    error:function(xhr, status, message) { 
			    } 
			 });  
		});//등록 버튼 클릭
	}//userInsert
	
	
	//사용자 목록 조회 요청
	function commentList() {
		$.ajax({
			url:'ajax/CommentList.do',
			type:'GET',
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:userListResult
		});
	}//commentList
	
	//사용자 목록 조회 응답
	function commentListResult(data) {
		$("tbody").empty();
		$.each(data,function(idx,item){
			$('tbody').append ( makeTr(item) );
		});//each
	}//userListResult
	
	function makeTr(item){
		return $('<tr>')
		.append($('<td>').html(item.id))
		.append($('<td>').html(item.name))
		.append($('<td>').html(item.gender))
		.append($('<td>').html(item.role))
		.append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
		.append($('<td>').html('<button id=\'btnDelete\'>삭제</button>'))
		.append($('<input type=\'hidden\' id=\'hidden_userId\'>').val(item.id));
		
	}//
	});
</script>

</head>
<body>
	<div align="center" class="container">
		<br><br>
		<h1 style="background-color:#dcdcdc; width:820px; font-size:20px;"><strong>글보기</strong></h1>
		<table style="width:820px">
		<tr>
		 <th>제목</th>
		  <td>${board.board_sub}</td>
		 </tr>
		 <tr>
		  <th>작성자</th>
		  <td>${board.member_name}</td>
		 </tr>
		 <tr>
		  <th>작성일</th>
		  <td>${board.board_date}</td>
		  </tr>
		  <tr>
		  <th>내용</th>
		  <td>${board.board_content}<br>
		  	<C:if test="${ !empty board.board_file}">
		  	<img src="/teamProject3/images/${ board.board_file }" style="max-width:500px">
		  	</C:if>
		  
		  </td>
		  </tr>			  
		 </table>
		 <br>
		 <button type="button" class="btn" onclick="location.href='/teamProject3/freeBoardList.do'">목록</button>
		 <!-- 게시물 목록이 안나옴 ?? -->
		 <button type="button" class="btn" style="display:none" onclick="location.href='/teamProject3/freeBoardUpdate.do?board_no=${board.board_no}'">수정</button>
		 <button type="button" class="btn" style="display:none" id="delbtn">삭제</button>
		 <a id="gg"></a>
		 <br><br>
		 
		 
		 <textarea cols="100" rows="3" id="commentcontent"></textarea>
		 <button type="button" id="btnInsert" style="width:100px; height:65px; vertical-align: top;" >등록</button>
		 <br><br><br><br><br>
		 
		 <!-- 댓글 리스트 -->
		 <div> 
			<table>
			<tbody id="freeboardReview">
				
			</tbody>
			</table> 
		</div>
		
	</div>
</html>