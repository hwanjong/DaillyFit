<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<!--  googleMap -->
<link href="/dailyfit/css/main.css" rel="stylesheet">
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?signed_in=true&key=AIzaSyBMuk4J8j5JNE1PC0UdEWpIMmze8UKMG_U&sensor=true"></script>

<script type="text/javascript">

//나중에 분명히 자바스크립트 조작으로 정보수정결제가 일어날수있음!! 잊지말기
	function addOption(){
		var idVal = $("#selectOption").val();
		$("#buyList").find("."+idVal).show();
		recalculate();
	}
	
	function orderUp(){
		$("#orderBox").show();
		$("#fold").hide();
	}
	function orderDown(){
		$("#orderBox").hide();
		$("#fold").show();
	}
	
	function recalculate() {
		var sum = 0;
		$("#buyList tr").each(function() {
			if($(this).css("display")=="table-row"){
				var unit_price = parseInt($(this).find(".price").text());
				var qty = parseInt($(this).find(".amount option:selected").text());
				if (!isNaN(unit_price) && !isNaN(qty)) {
					var price = unit_price * qty;
					sum = sum + price;
				}
			}
		});
		$("#totalPrice").text(sum+" 원");
	}
	
	function buyRequest(){
		alert("주문이완료되었습니다.(결제대행사이동)");
		//window.location.reload(true);
		window.location.href='main.ap';
	}
		
	function pageChange(pageNum) {
		$(".eachTab").removeClass("activeBar");
		
		$(".eachContents").hide();
		$("#"+pageNum).fadeIn(200);
		if(pageNum=="two"){
			initialize();
		}

		$("."+pageNum).addClass("activeBar");
	}
	
	var map;
	var infoWindow;
	var markerList = [];
	var lat,lng;
	function initialize() {
		lat = '${model.shop.lat}';
		lng = '${model.shop.lng}';
		var mapOptions = {
			center : new google.maps.LatLng(lat, lng),
			zoom : 15,
			draggable : false,
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
			title : name,
		});
		marker.setAnimation(google.maps.Animation.BOUNCE);
	}
	
	$(document).ready(function() {
		//푸터부분을 넣었을경우 푸터위로 구매하기버튼
		/*
		var heightFooter = $("#footer").css("height");
		$("#cart").css("bottom", heightFooter);
		var voidArea = $("#cart").css("height");
		$("#void").css("margin-bottom", voidArea);
		*/
		$("#cart").css("bottom", 0);
		$("#footer").hide();
		
	});
</script>
</head>
<body>
<c:set var="shop" value="${model.shop}"/>
	<div id="headBar" data-role="header" data-position="fixed"
		data-tap-toggle="false" class="jqm-header font">
		<span class="glyphicon glyphicon-chevron-left left" aria-hidden="true"
			onclick="javascript:history.go(-1)"></span> <span> ${shop.shopName}</span> <span
			class="glyphicon glyphicon-search right" aria-hidden="true"
			onclick="search();"></span>

	</div>
	<div id="contents" role="main" style="overflow: hidden;">
		<div id="carousel-example-generic" class="carousel slide"
			style="height: 180px; top:-1px;" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" style="height: 100%;" role="listbox">
				<div class="item" style="height: 180px;">
					<img src="/dailyfit/img/shop3_2.png" height="180px" alt="...">
					<div class="carousel-caption"></div>
				</div>
				<div class="item active" style="height: 180px;">
					<img src="/dailyfit/img/shop3_1.png" height="180px" alt="...">
					<div class="carousel-caption"></div>
				</div>
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev" style="background-image: none; color: #fff;"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next" style="background-image: none; color: #fff;"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<div id="specialItem" style="padding: 10px; text-align: right; border-bottom : groove 1px;">
			<p class="font f19 b" style="margin-bottom: 3px; padding-left:5px; text-align: left;">[${shop.shopNicname }]</p>
			<p class="font f19 b" style="margin-bottom: 3px; text-align: right;">${shop.shopName }</p>
			<p style="clear: both; margin-bottom: 3px; "><span class="font f12 b" style="color: gray; padding-right: 5px;">1회 이용권</span> <span class="font f17 b" style="color: gray;">${shop.dprice } 원</span></p>
		</div>

		<!--Tab area -->
		<div class="tabWrap">
			<div class="eachTab tripleTab one activeBar " onclick="pageChange('one')">판매상품</div>
			<div class="eachTab tripleTab two" onclick="pageChange('two')">업체정보</div>
			<div class="eachTab tripleTab three " onclick="pageChange('three')">후기</div>
		</div>
		<div id="one" class="eachContents shopCustom">
		<b>* 최근 이용 고객</b><br/>
			<div style="width: 100%; padding:10px; overflow: auto; white-space: nowrap; ">
				<img style="display: inline; width: 80%;" src="/dailyfit/img/user_log.PNG">
				<img style="display: inline; width: 80%;" src="/dailyfit/img/user_log.PNG">
		</div>
		<b class="f15">* 상품 리스트</b><br/>
		<ul data-role="listview" style="margin : 0px 0px 10px 0px; ">
			<c:forEach var="product" items="${model.saleList }">
			<li>
				<b class="left f13">${product.saleName }</b>
				<b class="right f17">${product.salePrice } 원</b></li>
			</c:forEach>
		</ul>
		<b>* 유의사항</b><br/>
		<br>
		</div>
		<div id="two" class="eachContents font f15" style="display: none;">
			
						
			<b>* 주소 및 위치</b><br/>
			<div id="map_canvas" style="width: 100%; height: 150px;"></div>
			
			<p class="f14">
			주소 : ${shop.address }<br/>
			연락처 : ${shop.tel }<br/>
			</p>
		</div>
			
		<div id="three" class="eachContents font f12 b" style="display: none;">
			<div class="alert alert-success" role="alert">
				<div style="width: 20%; display: inline-block;">
	  				<img src="/dailyfit/img/sunny.png" width="100%;" class="img-circle">
	  			</div>
  				<div style="width: 75%; padding-left:10px; height:100%; vertical-align:middle; display: inline-block; color: black;">옆에서 런닝뛰던 훈훈제복남님 언제오시나요 &gt;_&lt; 보고싶어요♡</div> 
			</div>
			<div class="alert alert-info" role="alert">
				<div style="width: 20%; display: inline-block;">
	  				<img src="/dailyfit/img/channy.PNG" width="100%;" class="img-circle">
	  			</div>
  				<div style="width: 75%; padding-left:10px; height:100%; vertical-align:middle; display: inline-block; color: black;">피티쌤이 정말이쁩니다 헤헷 또가고싶은 헬스장!!!</div> 
			</div>
			
			<div class="alert alert-success" role="alert">
				<div style="width: 20%; display: inline-block;">
	  				<img src="/dailyfit/img/junny.png" width="100%;" class="img-circle">
	  			</div>
  				<div style="width: 75%; padding-left:10px; height:100%; vertical-align:middle; display: inline-block; color: black;">초콜릿 좋아요♥♥♥♥ (다욧트언제하지...)</div> 
			</div>
			
			<div class="alert alert-info" role="alert">
				<div style="width: 20%; display: inline-block;">
	  				<img src="/dailyfit/img/jinny.PNG" width="100%;" class="img-circle">
	  			</div>
  				<div style="width: 75%; padding-left:10px; height:100%; vertical-align:middle; display: inline-block; color: black;">어제 여기서 또 번호따였어....남자들아 제발 나좀 내버려둬ㅠㅠㅠㅠ</div> 
			</div>
			
		</div>
		<div id="void"></div>
	</div>
	<div id="cart">
		<div id="fold">
			<button class="btn b font" onclick="orderUp()">구매하기</button>
		</div>
		<div id="orderBox" style="display: none; ">
			<span class="glyphicon glyphicon-chevron-down"
				style="line-height: 2em; font-size: 15px; width: 100%; text-align: center; border-top: 1px groove; background-color: #fff;" onclick="orderDown()"></span>
				<select id="selectOption" onchange="addOption()">
				<c:forEach var="product" items="${model.saleList }">
					<option value="${product.saleId }">${product.saleName} ${product.salePrice} 원</option>
				</c:forEach>
				</select>
			<table class="table" id="buyTable" style="background-color: white; margin: 0px; width: 100%" >
				<tbody id="buyList">
				<c:forEach var="product" items="${model.saleList }">
					<tr class="${product.saleId }" style="display: none;"><td>${product.saleName } ${product.salePrice } 원</td><td><select class="amount" onchange="recalculate()"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option></select></td><td class="price" style="display:none; ">${product.salePrice }</td></tr>
				</c:forEach>
				</tbody>
				<tfoot>
				<tr>
					<th style="width: 70%">합계</th>
					<th id="totalPrice" colspan="2" style="width: 30%;"></th>		
				</tr>
				</tfoot>
			</table>
			<button class="btn left font" style="color:#6ECDE1; background-color: #fff; ">장바구니 담기</button>
			<button class="btn right font" onclick='alert("결제페이지로이동합니다.")'>즉시구매</button>				
		</div>
	</div>
</body>
</html>