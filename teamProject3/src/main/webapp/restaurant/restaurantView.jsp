<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5459989244bc763dbd4ad7a7edf03cc0&libraries=services"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
<meta charset="UTF-8">
<style>
ul.inline {
	margin: 0;
	padding: 0;
	list-style: none;
}

li.inline {
	width: 237px;
	background-color: #f8f8f8;
	height: 250px;
	color: #444;
	line-height: 100px;
	text-align: center;
	font-size: 30px;
	text-transform: uppercase;
}

img.inimg {
	max-width: 237px;
	min-width: 237px;
	max-height: 250px;
	min-height: 250px;
}
</style>
<title>Insert title here</title>
<script type="text/javascript">
	var sel_files = [];
	$(function() {
		$("#input_imgs").on("change", handleImgFileSelect);
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
		function itemActive($el) {
			$el.siblings().removeClass('active');

		}
		var settings = {
			slideWidth : 235,
			slideMargin : 10,
			minSlides : 1,
			maxSlides : 5,
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
	});

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
</script>
</head>
<body>

	<div class="container" align="center">
		<ul class="bxslider">
			<c:forEach items="${res.res_picture}" var="res_pic">
				<li class="inline"><img class="inimg"
					src="/teamProject3/images/${res_pic }"></li>
			</c:forEach>
		</ul>




		<div class="row">
			<div class="col-sm-6" align="left">
				<h1>${res.res_name }</h1>

			</div>
			<div class="col-sm-6" align="right">
				<Small style="vertical-align: bottom;"> 마지막 업데이트 ${ res.res_date }
				</Small> <img src="/teamProject3/images/즐겨찾기.jpg"
					style="width: 100px; height: 100px; margin-left: 30px;">

			</div>
		</div>
		<hr>


		<div class="row">
			<div class="col-sm-8" align="left">
				<br> 주소 : ${res.res_si } <br> <br> 전화번호 : ${ res.res_tel}
				<br> <br> 영업 시간 : ${ res.res_time } <br> <br> 추가
				사항 : ${ res.res_extra }
			</div>
			<div class="col-sm-4" align="right">
				<div id="map" style="width: 350px; height: 350px;"></div>
			</div>
		</div>

		<p>
		<hr>
		<div class="row">
			<div class="col" align="center">
				<button id="review">리뷰 등록</button>
			</div>
		</div>
		<div class="row">
			<div class="col" align="center">
				<form action="" method="post">
					<div class="col-sm-8" align="center">
						<div align="left">
							<input type="file" id="input_imgs" multiple>
						</div>
					</div>
						
					<div class="col-sm-8" align="center">
						<div class="imgs_wrap">
							<img id="img" />
						</div>
					</div>
					<br>
					<textarea cols="100" rows="10"></textarea>
				</form>
			</div>
		</div>




		${res.res_no }<br> ${res.res_name }<br> ${res.res_content }<br>
		${res.res_si }<br> ${res.res_gu }<br> ${res.res_date }<br>




	</div>

</body>
</html>