<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<div id="map" style="width:500px;height:400px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4eeebc573cb6c8b6d05d232c6bf107d1"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<script>
const container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
let options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(35.15, 129.07), //지도의 중심좌표.
	level: 9 //지도의 레벨(확대, 축소 정도)
};
let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴



//지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
 // 지도 중심좌표에 마커를 생성합니다 
 position: map.getCenter() 
}); 
//지도에 마커를 표시합니다
marker.setMap(map);

//지도에 클릭 이벤트를 등록합니다
//지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
 
 // 클릭한 위도, 경도 정보를 가져옵니다 
 var latlng = mouseEvent.latLng; 
 
 // 마커 위치를 클릭한 위치로 옮깁니다
 marker.setPosition(latlng);
 
 var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
 message += '경도는 ' + latlng.getLng() + ' 입니다';
 
 var resultDiv = document.getElementById('clickLatlng'); 
 resultDiv.innerHTML = message;
 
});
</script>