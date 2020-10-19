<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
<script language="javascript">
	
</script>
<title>주소 입력 샘플</title>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/teamProject3/api/addressApi.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	</style>
<script type="text/javascript">
	// 이미지 정보들을 담을 배열
	var sel_files = [];

	$(document).ready(function() {
		$("#input_imgs").on("change", handleImgFileSelect);
	});
	console.log(${sessionScope.login})
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
<%@include  file="/common/restaurant.jsp" %>
<div style="margin:100px"></div>

	<div class="container" align="center">
<h1>Restaurant Register</h1>
<div style="margin:100px"></div>
		<form name="form" id="form" method="post" align="center" onsubmit="return inputCheck()" 
			enctype='multipart/form-data'
			action="/teamProject3/restaurantWrite.do">
			<div class="checkout__input">
			<div class="row">
			<div class="col-sm-6" align="left" style="margin-top:100px">
			<br>
				<p> Restaurant Name<span>*</span></p>
					<input name="res_name" style="width:80%" placeholder="식당명 입력" required>
			</div>
			<div class="col-sm-6" align="left" style="margin-top:100px">
			<br>
				<p> Restaurant Tel<span>*</span></p>
				<input  type="text" pattern="[0-9]+" name="res_tel" style="width:80%" placeholder=" '-' 없이 전화번호 등록" minlength="10" maxlength="11">
			</div>
				<br>
				<br>
				<br>
				
			<div class="col-sm-12" align="left" style="margin-top:60px">
			<br>
				<p> Restaurant Adress<span>*</span></p>
				
				<button type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="site-btn">우편번호 찾기</button><br><br>
				<input type="text" id="sample4_postcode" placeholder="우편번호" required style="width: 200px"> 
				<input type="text" id="sample4_roadAddress" name="res_si" required placeholder="도로명주소" style="width: 36%"> 
				<input type="text" id="sample4_jibunAddress" name="res_gu" placeholder="지번주소" style="width: 36%"> 
				<span id="guide" style="color: #999; display: none"></span> 
				<input type="text" id="sample4_detailAddress" placeholder="상세주소" hidden> 
				<input type="text" id="sample4_extraAddress" placeholder="참고항목" hidden>
			</div>
			<div class="col-sm-12" align="left" style="margin-top:60px">
			<br>
			<p> opening Hours<span>*</span></p>
				<input type="time" class="sh" name=startH style="width: 240px" required> 
			~
				<input type="time" class="eh" name=endH style="width: 240px" required>
				
			</div>
			
			
			<div class="col-sm-12" align="left" style="margin-top:60px">
			<br>
			<p> More Detail</p>
			<textarea cols="45" rows="5" name="extra" placeholder="추가 사항"></textarea>
			</div>
			<div class="col-sm-12" align="left" style="margin-top:60px">
			<p> Picture</p>
			
				<input type="file" id="input_imgs" name="res_picture"
					accept=".jpg,.jpeg,.png,.gif,.bmp" style="padding:8px;width:80%" multiple />
			</div>
			</div>
			<br>
				<div class="imgs_wrap" >
					<img id="img" />
				</div>
			</div>
			<br>
			<div align="left">
				<br>
				<p> Content </p>
				<textarea style="width:100%;height:500px" name="res_content" placeholder="내용을 입력해 주세요" required></textarea>
			</div>

			<div  style="margin-bottom:200px">
				<button class="site-btn">등록</button>
			</div>

		</form>
	</div>
</body>
</html>