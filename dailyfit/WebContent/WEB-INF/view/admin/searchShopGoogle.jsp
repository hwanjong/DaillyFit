<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<!-- meta name="viewport" content="initial-scale=1.0, user-scalable=no" -->
<meta charset="utf-8">
<link href="/dailyfit/css/searchGoogle.css" rel="stylesheet">
<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places"></script>
<script>
	function initialize(lat, lng) {

		var markers = [];
		var map = new google.maps.Map(document.getElementById('map-canvas'), {
			mapTypeId : google.maps.MapTypeId.ROADMAP,
			center : new google.maps.LatLng(lat, lng),
			zoom : 15
		});

		// Create the search box and link it to the UI element.
		var input = /** @type {HTMLInputElement} */
		(document.getElementById('pac-input')); //다른직종을찍고싶으면 여기를 수정

		map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

		var searchBox = new google.maps.places.SearchBox((input));

		// [START region_getplaces]
		// Listen for the event fired when the user selects an item from the
		// pick list. Retrieve the matching places for that item.
		google.maps.event
				.addListener(
						searchBox,
						'places_changed',
						function() {
							var places = searchBox.getPlaces();

							if (places.length == 0) {
								return;
							}
							for ( var i = 0, marker; marker = markers[i]; i++) {
								marker.setMap(null);
							}

							// For each place, get the icon, place name, and location.
							markers = [];
							var bounds = new google.maps.LatLngBounds();
							for ( var i = 0, place; place = places[i]; i++) {
								var image = {
									url : place.icon,
									size : new google.maps.Size(71, 71),
									origin : new google.maps.Point(0, 0),
									anchor : new google.maps.Point(17, 34),
									scaledSize : new google.maps.Size(25, 25)
								};

								// Create a marker for each place.
								var marker = new google.maps.Marker({
									map : map,
									icon : image,
									title : place.name,
									position : place.geometry.location
								});

								var name = place.name;
								var latt = place.geometry.location.lat();
								var lngg = place.geometry.location.lng();
								var address = place.formatted_address;
								var phone = place.formatted_phone_number;
								$("#wrap")
										.append(
												'<input type="text" name="shopName" value="'+name+'">'
														+ '<input type="text" name="shopLat" size="6" value="'+latt+'">'
														+ '<input type="text" name="shopLng" size="6" value="'+lngg+'">'
														+ '<input type="text" name="shopAddress" size= "40" value="'+address+'"><br>');

								markers.push(marker);

								bounds.extend(place.geometry.location);
							}

							map.fitBounds(bounds);
						});
		// [END region_getplaces]

		// Bias the SearchBox results towards places that are within the bounds of the
		// current map's viewport.
		google.maps.event.addListener(map, 'bounds_changed', function() {
			var bounds = map.getBounds();
			searchBox.setBounds(bounds);
		});
	}

	function buttonClick() {
		$("#map-canvas").animate({
			height : '300px'
		});
		var address = $("#address").val();
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({
			'address' : address
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				var lat = results[0].geometry.location.lat();
				var lng = results[0].geometry.location.lng();
				google.maps.event.addDomListener(window, 'load', initialize(
						lat, lng));
			} else {
				alert("위치값을 찾을수 없음 (에러코드 : " + status + ")");
			}
		});
	}
</script>
<style>
#target {
	width: 345px;
}
</style>
</head>
<body>
<div id="contents">
	<h3>미제휴 헬스장 등록 페이지</h3>
	찾을 지역
	<input id="address" type="text"  placeholder="address Box">
	<button type="button" class="btn" onclick='buttonClick();'>검색</button>
	<input id="pac-input" class="controls" type="text"
		placeholder="Search Box">
	<div id="map-canvas"></div>
	<form action="searchGoogle.ap" method="post">
		<div id="wrap" style="overflow: auto;">
			<i class="icon-ok"></i> <span style="font-size: 15pt;"> 검색된 헬스장</span>
			<button type="submit">구글데이터를 데일리핏헬스장으로 등록</button>
			<hr style="border: 1px solid;">
		</div>
	</form>
</div>
</body>
</html>