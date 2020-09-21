<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5459989244bc763dbd4ad7a7edf03cc0&libraries=services"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch("${res.res_si }", function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
             content: '<div style="width:150px;text-align:center;padding:6px 0;">${res.res_name}</div>' 
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
	
});
</script>
</head>
<body>
<div align="center" style="min-width:600px;">
<p style="margin-top:-12px">
    
</p>
<div align="right">
<div id="map" style="width:350px;height:350px;"></div>
</div>


${res.res_no }<br>
${res.res_name }<br>
${res.res_content }<br>
${res.res_si }<br>
${res.res_gu }<br>
${res.res_date }<br>


<c:forEach items="${res.res_picture}" var="res_pic">
그림 이름 : ${res_pic } <br>
</c:forEach>
</div>
</body>
</html>