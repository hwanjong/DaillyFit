<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBMuk4J8j5JNE1PC0UdEWpIMmze8UKMG_U&sensor=true">
</script>
<script type="text/javascript">
function searchClick(){
	location.href='registLocation.ap'
	/*
	$("tbody tr").each(function(){
		var address = $(this).find(".address").text();
		//var address = "경상북도 구미시 신평동 99";
		
		var latObj = $(this).find(".lat");
		var lngObj = $(this).find(".lng");
		
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({'address' : address}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				var len = results.length;
				var lat = results[0].geometry.location.lat();
				var lng = results[0].geometry.location.lng();
				$("#test").val(lat);
				latObj.text(lat);
				lngObj.text(lng);
			} else {
				latObj.text("error");
				lngObj.text("error");
			}
		});
		// Geocoding // *****************************************************
	});
	*/
	
}
</script>


</head>
<body>
<div id="contents">
	<div style="width: 100%;">
		<h3><span class="label label-danger">Danger</span> 대용량 좌표검색 쿼리주의</h3><h5 style="display: inline-block;">서버부하/허용쿼리초과 주의(${model.size}개 검색됨 )</h5><button type="button" class="btn btn-info pull-right" onclick="searchClick();">좌표값검색 및 등록요청</button><input style="display: inline-block;" class="pull-right" type="file"> 
	</div>

	<table class="table table-striped">
	<thead>
	<tr><th>고유번호</th><th>이름</th><th>위도</th><th>경도</th><th>주소</th><th>전화번호</th><th>제휴</th></tr>
	</thead>
	<tbody>
	<c:forEach var="shop" items="${model.shopList}">
		<tr>
			<td>${shop.shopNum}</td><td>${shop.shopName}</td><td class="lat">${shop.lat}</td><td class="lng">${shop.lng}</td><td class="address">${shop.address}</td><td>${shop.tel}</td>
			<td>
				X
			</td>
		</tr>
	</c:forEach>

	</tbody>
	</table>
</div>
</body>
</html>