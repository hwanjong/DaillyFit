<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?signed_in=true&key=AIzaSyBMuk4J8j5JNE1PC0UdEWpIMmze8UKMG_U&sensor=true"></script>
<link href="/dailyfit/css/main.css" rel="stylesheet">
<script type="text/javascript">
var map;
var infoWindow;
var markerList = [];
var lat = '${model.shop.lat}';
var lng = '${model.shop.lng}';
var shopName ='${model.shop.shopName}'; 
function initialize() {
	var mapOptions = {
		center : new google.maps.LatLng(lat, lng),
		zoom : 15,
		mapTypeId : google.maps.MapTypeId.ROADMAP
	};
	map = new google.maps.Map(document.getElementById("map_canvas"),
			mapOptions);

	setMarkers(map);
}
function setMarkers(map) {
	//var image='/dailyfit/img/icon_1_active.png';
	
	var image = {
		url : '/dailyfit/img/marker.png',
		// This marker is 20 pixels wide by 32 pixels tall.
		size : new google.maps.Size(25, 32),
		// The origin for this image is 0,0.
		origin : new google.maps.Point(0, 0),
		// The anchor for this image is the base of the flagpole at 0,32.
		anchor : new google.maps.Point(16, 32)
	};
	
	var myLatLng = new google.maps.LatLng(lat,
			lng);

	var marker = new google.maps.Marker({
		position : myLatLng,
		map : map,
		icon : image,
		//shape: shape,
		title : shopName,
	});
}
$(document).ready(function() {
	initialize();
});
</script>
</head>
<body>
	<div id="headBar" data-role="header" data-position="fixed"
		data-tap-toggle="false" class="jqm-header font">
		<span class="glyphicon glyphicon-chevron-left left" aria-hidden="true"
			onclick="javascript:history.go(-1)"></span> <span> ${model.shop.shopName }</span> <span
			class="glyphicon glyphicon-search right" aria-hidden="true"
			onclick="search();"></span>

	</div>
	<div id="page">
		<img src= "/dailyfit/img/shop3_2.png" style="width: 100%;">
		<ul class="font" style="margin-top: 30px;" >
		<li>
			주소 : ${model.shop.address }
		</li>
		<li>
			연락처 : ${model.shop.tel }
		</li>
		<li>
			위치
		</li>
		</ul>
		<div id="map_canvas" style="width: 80%; height: 200px; margin : 0 40px;" ></div>
	</div>

</body>
</html>