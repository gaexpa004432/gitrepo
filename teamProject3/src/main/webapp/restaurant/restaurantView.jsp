<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="/teamProject3/css/userImage.css">	
    <script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
   
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5459989244bc763dbd4ad7a7edf03cc0&libraries=services"></script>

<meta charset="UTF-8">
<style>
	textarea {
	width: 100%;
	height: 150px;
	font-size: 16px;
	color: #6f6f6f;
	padding-left: 20px;
	margin-bottom: 24px;
	border: 1px solid #ebebeb;
	border-radius: 4px;
	padding-top: 12px;
	resize: none;
}
	.col-sm-2{
	    width: 110px;
    font-size: .9rem;
    color: rgba(79,79,79,0.6);
    line-height: 1.7;
    text-align: left;
    vertical-align: top;
    padding-right: 10px;
    padding-bottom: 5px;
	}
	
	.col-sm-9{
	    font-size: .9rem;
    color: #4f4f4f;
    line-height: 1.7;
    text-align: left;
    vertical-align: middle;
    padding-bottom: 5px;
	}
	#divPaging {
          clear:both; 
        margin:0 auto; 
        width:220px; 
        height:50px;
}

    #divPaging > div {
        float:left;
        width: 30px;
        margin:0 auto;
        text-align:center;
}
#over:hover{
	background-color: #f2f2f2;
}

ul.inline {
	margin: 0;
	padding: 0;
	list-style: none;
}

li.inline {
	background-color: #f8f8f8;
	height: 340px;
	color: #444;
	line-height: 100px;
	text-align: center;
	font-size: 30px;
	text-transform: uppercase;
}

img.inimg {
	width: 100%;
	height: 340px;
}

</style>
<title>Insert title here</title>
<script type="text/javascript">
	var sel_files = [];
	function inputCheck(){
		if(${empty sessionScope.login}){
			alert("로그인이 필요합니다.")
			location.href="/teamProject3/member/memberLogin.jsp";
		}
		
		
		if($("#res_reivew_content").val() == ''){
			alert("내용을 입력해주세요.")
			return false;
		}
		
		return true;
	}
	$(function() {
		
		
		
		$.contextMenu({
		    selector: '#user',
		    trigger: 'left',
		    callback: function(key, options) {
		    	console.log($(this).data("member"));
		    	location.href="/teamProject3/inqSellerId.do?member_id="+$(this).data("member");
		        var m = key;
		      
		    },
		    items: {
		        "edit": {name: "1:1 문의하기"},
		        "quit": {name: "Quit", icon: function($element, key, item){ return 'context-menu-icon context-menu-icon-quit'; }}
		    }
		});
		
		if(${!empty focus}){
			document.getElementById('review').focus();
		}
		var favorite = "${favorite}";
		if(favorite == "true"){
			$("#bookmark").html("<img src='/teamProject3/images/bookmark.png' style='width: 100px; height: 100px; margin-left: 30px;'>");
			
		} else{
			$("#bookmark").html("<img src='/teamProject3/images/bookmark (1).png'style='width: 100px; height: 100px; margin-left: 30px;'>");
		}
		$("#input_imgs").on("change", handleImgFileSelect);
		
		
		var settings = {
				slideWidth : 380,
				slideMargin : 5,
				minSlides : 1,
				maxSlides : 10,
				infiniteLoop : true,
				responsive : true,
				controls : true,
				pager : false,
				moveSlides : 1,
				hideControlOnEnd : true,
				onSlideNext : function($slideElement, oldIndex, newIndex) {
					itemActive($slideElement);
				},
				onSlidePrev : function($slideElement, oldIndex, newIndex) {
					itemActive($slideElement);
				}
			}

			var bxSlider = $('.bxslider').bxSlider(settings);

			$('.bxslider li.inline').click(function() {
				$(this).siblings('li').removeClass('active');
				$(this).addClass('active');
				bxSlider.goToSlide($(this).index());

			})

		$("#review").on("click", function() {
			console.log($("#res_reivew_content").val())
			var x = document.getElementById("input_imgs");
			if (x.style.display === "none") {
				$(".selProductFile").show();
				$("#res_reivew_content").show();
				$("#input_imgs").show();
				$("#insert").show();
			} else {
				$(".selProductFile").hide();
				$("#res_reivew_content").hide();
				$("#input_imgs").hide();
				$("#insert").hide();
			}

		})
		
		$("#bookmark").on("click",function(){
			if(${!empty sessionScope.login}){
			var no = "${res.res_no}";
			var code = "fs";
			if(favorite === "false"){
					$("#bookmark").html("<img src='/teamProject3/images/bookmark.png' style='width: 100px; height: 100px; margin-left: 30px;'>");
					favorite = "true";
			$.ajax("bookMark.do", {
				method : "get",
				dataType : "json",					// 서버에서 넘겨주는 데이터타입. text, html, json 등 타입을 적어줌
				data : {no:no,code:code,bookmark:"insert"},						// 보낼 파라미터. 아작스함수가 값을 쿼리 문자형태(no=)로 바꿔서 넘겨줌
				success : function(data) {
				}
			});
			}else{
						$("#bookmark").html("<img src='/teamProject3/images/bookmark (1).png' style='width: 100px; height: 100px; margin-left: 30px;'>");
						favorite = "false";
				$.ajax("bookMark.do", {
					method : "get",
					dataType : "json",					// 서버에서 넘겨주는 데이터타입. text, html, json 등 타입을 적어줌
					data : {no:no,code:code,bookmark:"delete"},						// 보낼 파라미터. 아작스함수가 값을 쿼리 문자형태(no=)로 바꿔서 넘겨줌
					success : function(data) {
					}
				});
			}
			}else{
				alert("로그인이 필요합니다.")
			}
		})
		
		$(".reviewDel").on("click",function(){
			var result = confirm("정말 삭제 하시겠습니까?");
			if(result){
				var reviewNo = $(this).data("no");
				 location.href="/teamProject3/reviewDelete.do?res_review_no="+reviewNo+"&res_no=${ res.res_no }";
			}
		})
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		 var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder
				.addressSearch(
						"${res.res_si }",
						function(result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">${res.res_name}</div>'
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
		
	}); // end of onload

	function fileUploadAction() {
		console.log("fileUploadAction");
		$("#input_imgs").trigger('click');
	}

	function handleImgFileSelect(e) {

		// 이미지 정보들을 초기화
		sel_files = [];
		$(".imgs_wrap").empty();

		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		var index = 0;
		filesArr
				.forEach(function(f) {
					if (!f.type.match("image.*")) {
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}

					sel_files.push(f);

					var reader = new FileReader();
					reader.onload = function(e) {
						var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("
								+ index
								+ ")\" id=\"img_id_"
								+ index
								+ "\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove' style='width:100px; height:100px;'></a>";
						$(".imgs_wrap").append(html);
						index++;

					}
					reader.readAsDataURL(f);

				});
	}

	function deleteImageAction(index) {
		console.log("index : " + index);
		console.log("sel length : " + sel_files.length);
		var a = $("#input_imgs");
		console.log(a);
		sel_files.splice(index, 1);

		var img_id = "#img_id_" + index;
		$(img_id).remove();
	}

	function fileUploadAction() {
		console.log("fileUploadAction");
		$("#input_imgs").trigger('click');
	}

	function submitAction() {
		console.log("업로드 파일 갯수 : " + sel_files.length);
		var data = new FormData();

		for (var i = 0, len = sel_files.length; i < len; i++) {
			var name = "image_" + i;
			data.append(name, sel_files[i]);
		}
		data.append("image_count", sel_files.length);

		if (sel_files.length < 1) {
			alert("한개이상의 파일을 선택해주세요.");
			return;
		}

		var xhr = new XMLHttpRequest();
		xhr.open("POST", "./study01_af.php");
		xhr.onload = function(e) {
			if (this.status == 200) {
				console.log("Result : " + e.currentTarget.responseText);
			}
		}
		
		xhr.send(data);

	}
	function itemActive($el) {
		$el.siblings().removeClass('active');

	}
</script>
</head>
<body>
<%@include  file="/common/restaurant.jsp" %>
		<ul class="bxslider" >
			<c:forEach items="${res.res_picture}" var="res_pic">
				<li class="inline"><img class="inimg"
					src="/teamProject3/images/${res_pic }"></li>
			</c:forEach>
		</ul>
<div class="container" align="center">




		<div class="row">
			<div class="col-sm-6" align="left" >
			<br>
				<h2><b style="color:#003300">${res.res_name }</b></h2>

			</div>
			<div class="col-sm-6" align="right">
				<Small style="vertical-align: bottom;"> 마지막 업데이트 ${ res.res_date }
				</Small> <a href="javascript:void(0);" id="bookmark"><img src="/teamProject3/images/"
					style="width: 100px; height: 60px; margin-left: 30px;">
					</a>

			</div>
		</div>
		<hr>


		<div class="row">
			<div class="col-sm-8" >
				<div class="row">
				<div class="col-sm-2" align="left">
				<br>
				주소
				<br> 
				</div>
				<div class="col-sm-9" align="left">
				<br>
				${res.res_si }
				<br>
				</div>
				<div class="col-sm-2" align="left">
				<br>
				전화번호
				<br> 
				</div>
				<div class="col-sm-9" align="left">
				<br>
				${ res.res_tel}
				<br> 
				</div>
				<div class="col-sm-2" align="left">
				<br>
				영업 시간
				<br> 
				</div>
				<div class="col-sm-9" align="left">
				<br>
				${ res.res_time }
				<br> 
				</div>
				<div class="col-sm-2" align="left">
				<br>
				추가 사항
				<br> 
				</div>
				<div class="col-sm-9" align="left">
				<br>
				 ${ res.res_extra }
				<br>
				</div>
				</div>
			</div>
			<div class="col-sm-4" align="right">
				<div id="map" style="width: 350px; height: 350px;"></div>
			</div>
		</div>


		<p>
		<hr>
		<p style="height: 100px"></p>
		<div class="row">
			<div class="col" align="left">${res.res_content }</div>
		</div>
		<p style="height: 100px"></p>
		<hr>

		<div class="row">
			<div class="col" align="center" style="position: static">
				<button id="review"  class="site-btn">리뷰 등록</button>
			</div>
		</div>
			<br>
			<br>
		<div class="row">
			<div class="col" align="center" style="position: static">
				<form action="/teamProject3/reviewInsert.do" method="post" enctype='multipart/form-data' onsubmit="return inputCheck()">
				<div class="checkout__input">
					<div class="col-sm-8" align="center">
						<div align="left">
							<input type="file" id="input_imgs" name="pic_img"
								 style="display: none;padding:8px;width:80%" multiple>
						</div>
						<br>
					</div>

					<div class="col-sm-8" align="center">
						<div class="imgs_wrap">
							<img id="img" />
						</div>
					</div>
					<br> <input value="${ res.res_no }" name="res_no" hidden="hidden">
					<div class="row">
					<div class="col-sm-10">
					<textarea cols="100" rows="10" id="res_reivew_content" name="res_review_content" style="display: none;"></textarea>
					</div>
					<div class="col-sm-2">
					<button type="submit" id="insert" style="vertical-align: top; display: none;width:80%;height:85%;padding:0px"  class="site-btn">리뷰 쓰기</button>
					<div>
					</div>
				</div>
				</div>
				</div>
				</form>
				<br>
				<br>
				<br>
			</div>
		</div>
		<!-- 리뷰 공간  -->


		<c:if test="${ empty review }">
			<div class="row"> <div class="col-sm-12" align="center">아직 리뷰가 없어요! </div></div>
			<hr>
		</c:if>
			<c:forEach items="${ review }" var="list">
		<div class="row" id="over" style="border-top-width:1px;border-top-style:solid;padding:20px; border-top-color : #f0f0f5;">

				<div class="col-sm-1" >
					<img class="userImage" src="/teamProject3/images/${list.member_image}">
					<br><a href="javascript:void(0);" id="user" data-member="${ list.member_id }">${ list.member_id }</a><br>
				</div>
				<div class="col-sm-10" align="left">
				<small>${ list.res_review_date }</small><br> ${ list.res_review_content }<br>
					<br><br>
					<c:forEach items="${list.res_review_picture }" var="reviewImg">
						<img style="width: 100px; height: 100px;"
							src="/teamProject3/images/${reviewImg }">
					</c:forEach>
				</div>
				<div class="col-sm-1" align="right">
				 	<c:if test="${ list.member_id == sessionScope.id }"> 
						<a class="reviewDel" href="javascript:void(0);" data-no="${ list.res_review_no }"><img src="/teamProject3/images/clear.png" style="width: 25px; height: 25px;"></a>
					</c:if>
				</div>

		</div>
			</c:forEach>
<div align="center">
 <my:paging paging="${paging}" jsfunc="gopage" />
</div>
   <form name="searchFrm" action="/teamProject3/restaurantView.do">
	<input type="hidden" name="p" value="1">
	<input type="hidden" name="res_no" value="${ res.res_no }">

</form>



<script>
	function gopage(p) {			// 검색 function
		searchFrm.p.value = p;		// 페이지번호 받아와서 submit에 넘김
		searchFrm.submit();
		
		// location.href="deptSelectAll?p=" + p;	// 이동되는 주소가 달라서 여러사람이 쓰기위해서는 매개값 p로 해줌
	}
</script> 






	</div>

</body>
</html>