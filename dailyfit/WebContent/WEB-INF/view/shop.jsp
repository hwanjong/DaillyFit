<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!--  JQuery UI_Mobile  BootStrap에 JQuery가 필요하므로 먼저호출-->
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

<!--  Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="/dailyfit/css/main.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>

<title>Dailyfit</title>

<script type="text/javascript">

//나중에 분명히 자바스크립트 조작으로 정보수정결제가 일어날수있음!! 잊지말기
	function addBuy(name, price) {
		var tr = '<tr><td>'+name+'</td><td class="unitPrice">'+price+'</td><td><select class="form-controler amount" onchange="recalculate()"><option>1</option><option>2</option><option>3</option></select></td></tr>';
		$("#buyList").append(tr);
		$("#buyTable").show();
		$("#foldImg").attr("class","glyphicon glyphicon-chevron-down");
		recalculate();
	}
	
	function fold(){
		if($("#buyTable").css("display")=='none'){
			$("#buyTable").show();
			$("#foldImg").attr("class","glyphicon glyphicon-chevron-down");
		}else{
			$("#buyTable").hide();
			$("#foldImg").attr("class","glyphicon glyphicon-chevron-up");
		}
	}
	
	function recalculate() {
		var sum = 0;
		$("#buyTable tbody tr").each(function() {
			var unit_price = parseInt($(this).find(".unitPrice").text());
			var qty = parseInt($(this).find(".amount").val());
			if (!isNaN(unit_price) && !isNaN(qty)) {
				var price = unit_price * qty;
				sum = sum + price;
			}
		});
		$("#totalPrice").text(sum);
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

		$("."+pageNum).addClass("activeBar");
	}
	$(document).ready(function() {
		var heightFooter = $("#footer").css("height");
		$("#cart").css("bottom", heightFooter);

		var voidArea = $("#cart").css("height");
		$("#void").css("margin-bottom", voidArea);

	});
</script>
</head>
<body>
	<div id="headBar" data-role="header" data-position="fixed"
		data-tap-toggle="false" class="jqm-header">
		<span class="glyphicon glyphicon-chevron-left left" aria-hidden="true"
			onclick="javascript:history.go(-1)"></span> <span> 스포애니(잠실점)</span> <span
			class="glyphicon glyphicon-search right" aria-hidden="true"
			onclick="search();"></span>

	</div>
	<div id="contents" role="main" style="overflow: auto;">
		<div id="carousel-example-generic" class="carousel slide"
			style="height: 250px;" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" style="height: 100%;" role="listbox">
				<div class="item" style="height: 100%;">
					<img src="/dailyfit/img/shop3_2.png" height="100%" alt="...">
					<div class="carousel-caption">(설명없음 이미지고정할것)</div>
				</div>
				<div class="item active" style="height: 100%;">
					<img src="/dailyfit/img/shop3_1.jpg" height="100%" alt="...">
					<div class="carousel-caption">(설명업슴슴슴)</div>
				</div>
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<!--Tab area -->
	<div class="tabWrap">
		<div class="eachTab tripleTab one activeBar " onclick="pageChange('one')">판매상품</div>
		<div class="eachTab tripleTab two" onclick="pageChange('two')">업체정보</div>
		<div class="eachTab tripleTab three " onclick="pageChange('three')">Q&A</div>
	</div>
	<div id="contents">
		<div id="one" class="eachContents">
			<ul class="saleList">
				<li class="saleItem" onclick="addBuy('Premium 1회 이용권','7900')">Premium
					1회 이용권<span class="glyphicon glyphicon-chevron-right right lh45"></span><span class="right lh45">원</span><span
					class="right lh45">7900</span>
				</li>
				<li class="saleItem" onclick="addBuy('Normal 1일권','5500')">Normal
					1일권<span class="glyphicon glyphicon-chevron-right right lh45"></span><span class="right lh45">원</span><span
					class="right lh45">5500</span>
				</li>
				<li class="saleItem" onclick="addBuy('월 등록권','120000')">월 등록권<span
					class="glyphicon glyphicon-chevron-right right lh45"></span><span class="right lh45">원</span><span
					class="right lh45">120000</span></li>

			</ul>

			<p style="font-size: 16px; padding: 0em 2em 0em 2em;">유의사항</p>
			<p class="line"></p>

			<p style="padding: 0em 3em;">
				유효기간 : 구매일로 부터 90일 이내 이용<br /> 제공 사항 : 수건, 운동복, 일일락카<br /> <br />
				- 사용 승인 이전 취소시 데일리핏 캐쉬로 환급됩니다.<br /> - 유효기간 내 사용하지 못한 이용권은 기간 만료 후,
				구매 금액의 85%가 캐시로 환급됩니다<br /> - 사용 중 불편한 사항은 데일리핏 고객센터로 문의주세요<br />
			</p>
		</div>
		<div id="two" class="eachContents" style="display: none;">
		작업중입니다.<br/>
			*운영시간 및 제공사항<br/>
			(지도View)<br/>
			주소:*****************<br/>
			연락처:112-112<br/></div>
		<div id="three" class="eachContents" style="display: none;">
			준비중입니다.<br/>
		</div>
		<div id="void"></div>
	</div>
	<div id="cart">
		<div id="fold" onclick="fold();">
			<span id ="foldImg" class="glyphicon glyphicon-chevron-up"
				style="line-height: 3em; font-size: 16px;"></span>
		</div>
		<table class="table" id="buyTable" style="background-color: white; margin: 0px; display: none; width: 100%" >
			<thead style="width: 100%;">
			<tr style="width: 100%;">
				<th style="text-align: center;">상품</th>
				<th style="text-align: center;">단가</th>
				<th style="text-align: center;">수량</th>
			</tr>
			</thead>
			<tbody id="buyList">

			</tbody>
			<tfoot>
			<tr>
				<th style="width: 50%">합계</th>
				<th id="totalPrice" style="width: 30%"></th>	
				<th style="width: 20%;">원</th>		
			</tr>
			<tr>
			<td><button type="button" style="background-color:rgb(164, 165, 166); color: #fff; text-shadow: none;">장바구니</button> </td>
			<td colspan="2"><button type="button" style="background-color:rgb(52, 152, 219); color: #fff; text-shadow: none;" onclick="buyRequest()">구매하기</button></td>
			</tr>
			</tfoot>
		</table>
	</div>
	<div data-role="footer" id="footer" data-position="fixed"
		data-tap-toggle="false" class="jqm-footer">

		<img src="/dailyfit/img/icon_1_active.png"> <img
			src="/dailyfit/img/icon_2.png"> <img
			src="/dailyfit/img/icon_3.png"> <img
			src="/dailyfit/img/icon_4.png">
	</div>
</body>
</html>