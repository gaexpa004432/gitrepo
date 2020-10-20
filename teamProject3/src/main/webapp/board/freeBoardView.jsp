<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/teamProject3/board/css/bootstrap.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
	<link rel="stylesheet" href="/teamProject3/css/userImage.css">	
<style>



tr:nth-child(even) {
	background-color: #f5F5f5;
}

table {
	border-width: 1px;
	border-style: solid;
	border-color: #F5F5F5;
}

h1, table {
	font-family: 'Noto Sans KR', sans-serif;
}

th {
	min-width: 50px
}


#review:hover {
	background-color: #f2f2f2;
}


td, th {
	padding: 0.5em;
	padding-top: 0.5em;
	padding-right: 1em;
	padding-left: 1em;
}


h1 {
	padding: 0.1em;
	padding-top: 0.1em;
	padding-right: 0.1em;
	padding-left: 0.1em;
}


</style>


<title>Insert title here</title>


<script>
$(function(){
	commentList();
	
console.log("${sessionScope.id}");
console.log("${sessionScope.login}");
	
	function updateOne(){
		var content = $(this).data("comment_content");
		var no = $(this).parent().children().eq(3).data("comment_no");
	var con1 =	$(this).parent().parent().children().eq(1);
	var con2 = con1.children().eq(2);
		
	con1.hide();
	var btn1 =	$(this).parent();
	btn1.hide();
		$(this).parent().parent().append($("<div>").attr("class","col-sm-9").append($("<input>").css("width","850px").css("height","64px").val(content)));
		$(this).parent().parent().append($("<div>").attr("class","col-sm-1").append($("<button>").text("등록").on("click",function(){
			var update = $(this).parent().parent().children().eq(3).children().val();
			console.log(update);
			$.ajax({
			    url: "ajaxCommentUpdate.do", 
			    data: {update:update,comment_no:no},
			    success: function() { 
			    	con1.show();
					btn1.show();
			    	con2.text(update);
			    	con1.parent().children().eq(3).remove();
			    	con1.parent().children().eq(3).remove();
			    },
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    }
			});
		})).append($("<br>")).append($("<br>")).
				append($("<button>").text("취소").on("click",function(){
					con1.show();
					btn1.show();
					$(this).parent().parent().children().eq(3).remove();
					$(this).parent().remove();
				})))
		
	}
	
	$("#delbtn").on("click",function (){
	
		var result = confirm('정말로 삭제하시겠습니까?');
		if (result) {
		location.href="/teamProject3/freeBoardDelete.do?board_no=${board.board_no}"
		}
	})
	
	if (${id == board.member_id || id == "vegan"}){
		$(".btn").show();
	}


//댓글 script부분(userClient.jsp참고)
	
		
	//삭제 버튼  이벤트
	
		//삭제 버튼 클릭
		
		

	
	//사용자 조회 버튼 이벤트
	
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

	
	//사용자 조회 응답
	function commentSelectResult(user) {
		$('input:text[name="id"]').val(user.id);
		$('input:text[name="name"]').val(user.name);
		$('input:radio[name="gender"]').val([user.gender]);
		$('select[name="role"]').val(user.role).attr("selected", "selected");
	}//userSelectResult
	
	//사용자 수정 버튼 이벤트

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
	
	
	//사용자 등록 요청
	
		//등록 버튼 클릭  
		$('#btnInsert').on('click',function(){
		var content = $('#commentcontent').val();
		if(${!empty sessionScope.login}){
			
		
			$.ajax({ 
			    url: "/teamProject3/ajaxcommentInsert.do",  
			    dataType: 'json', 
			    method : "POST",
			    data :  {content:content,post_no:${board.board_no}},
			    success: function(datas) {
			    	$(".re").append($("<div>").attr("class","row").attr("id","review").css("border-top-width","1px").css("border-top-style","solid")
							.css("padding","20px").css("border-top-color","#f0f0f5")
							.append($("<div>").attr("class","col-sm-3").append($("<img>").attr("src","/teamProject3/images/${sessionScope.login.member_image}").attr("class","userImage")).append($("<br>")).append($("<div>").text(datas.member_id)))
							.append($("<div>").attr("class","col-sm-5").attr("align","left").html("<small style='vertical-align:top'>"+datas.comment_date +"</small>"+"<br><div>"+datas.comment_content+"</div>"))
							.append($("<div>").attr("class","col-sm-3")
							.append($("<button>").text("수정").attr("class","update").on("click",updateOne).data("comment_content",datas.comment_content))
							.append($("<br>"))
							.append($("<br>"))
							.append($("<button>").text("삭제").data("comment_no",datas.comment_no).on("click",
									function(){
								var tag = $(this).parent().parent();
								var no = $(this).data("comment_no");
								var result = confirm(" 사용자를 정말로 삭제하시겠습니까?");
								if(result) {
									  $.ajax({
										url:'ajaxCommentdelete.do',
										data : {comment_no : no},
										
										error:function(xhr,status,msg){
											console.log("상태값 :" + status + " Http에러메시지 :"+msg);						
										}, success:function() {
											tag.remove();   //userList();
											
										} 
									});       }//if
							} //삭제 버튼 클릭
							))))
			    }, 
			    error:function(xhr, status, message) { 
			    } 
			 });  
		
		} else {
			alert("로그인이 필요합니다.")
		}
		
		});//등록 버튼 클릭

	
	
	//사용자 목록 조회 요청
	function commentList() {
		$.ajax({
			url:'/teamProject3/ajaxcommentList.do',
			type:'post',
			dataType:'json',
			data : { post_no:"${board.board_no}"},
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:function(datas) {
				for (i=0; i<datas.length; i++) {
					
					
					var btn = "";
					
					if(datas[i].member_id == "${id}" || ${sessionScope.id == 'vegan'}){
					//세션 아이디와 멤버 아이디 비교
						btn = $("<div>")
						  .attr("class","col-sm-3")
				          .append($("<button>").text("수정").attr("class","update").on("click",updateOne).data("comment_content",datas[i].comment_content))
				          .append($("<br>"))
				          .append($("<br>"))
				          .append($("<button>").text("삭제").data("comment_no",datas[i].comment_no).on("click",
						      function(){
									var tag = $(this).parent().parent();
									var no = $(this).data("comment_no");
									var result = confirm(" 사용자를 정말로 삭제하시겠습니까?");
									if(result) {
										  $.ajax({
											url:'ajaxCommentdelete.do',
											data : {comment_no : no},
											
											error:function(xhr,status,msg){
												console.log("상태값 :" + status + " Http에러메시지 :"+msg);						
											}, success:function() {
												tag.remove();   //userList();
												
											} 
										}); 
									}//if
							}) //삭제 버튼 클릭
						)
						
					}
					$(".re").append(
						$("<div>")
							.attr("class","row").attr("id","review").css("border-top-width","1px").css("border-top-style","solid")
						    .css("padding","20px").css("border-top-color","#f0f0f5")
						  							.append($("<div>").attr("class","col-sm-3").append($("<img>").attr("src","/teamProject3/images/"+datas[i].member_image).attr("class","userImage")).append($("<br>")).append($("<div>").text(datas[i].member_id)))
							.append($("<div>").attr("class","col-sm-5").attr("align","left").html("<small style='vertical-align:top'>"+datas[i].comment_date +"</small>"+"<br><div>"+datas[i].comment_content+"</div>"))
							.append(btn) // div append 끝
						)  //  .re append 끝
							  
				}  //for문 끝
			}  //success 끝
		}); // ajax 끝
	}//commentList
	
	//사용자 목록 조회 응답
	function commentListResult(data) {
		$("tbody").empty();
		$.each(data,function(idx,item){
			$('tbody').append ( makeTr(item) );
		});//each
	}//userListResult
	

	});
</script>

</head>
<body>
	<div align="center" class="container">
		<br> <br>
		<h1 style="background-color: #a7cd80; width: 820px; font-size: 20px;">
			<strong>글보기</strong>
		</h1>
		<table style="width: 820px">
			<tr>
				<th style="width: 100px">제목</th>
				<td>${board.board_sub}</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${board.member_id}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${board.board_date}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><C:if
						test="${ !empty board.board_file}">
						<img src="/teamProject3/images/${ board.board_file }"
							style="max-width: 500px"><br>
							<br>${board.board_content}<br> 
					</C:if>

				</td>
			</tr>
		</table>
		<br>
		<button type="button" class="btn"
			onclick="location.href='/teamProject3/freeBoardList.do'">목록</button>
		<!-- 게시물 목록이 안나옴 ?? -->
		<button type="button" class="btn" style="display: none"
			onclick="location.href='/teamProject3/freeBoardUpdate.do?board_no=${board.board_no}'">수정</button>
		
		<button type="button" class="btn" style="display: none" id="delbtn">삭제</button>
		<a id="gg"></a> <br> <br> <br>
		<!-- 댓글 리스트 -->
		<div class="re"></div>
		<br>
		<textarea cols="100" rows="3" id="commentcontent"></textarea>
		<button type="button" id="btnInsert"
			style="width: 60px; border: 0px; height: 65px; vertical-align: top; background-color: #a7cd80;">등록</button>
		<br> <br> <br> <br> <br>



	</div>
</html>