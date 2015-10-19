<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<!--  googleMap -->
<link href="/dailyfit/css/ticket.css" rel="stylesheet">
<script type="text/javascript">

//나중에 분명히 자바스크립트 조작으로 정보수정결제가 일어날수있음!! 잊지말기
	
		
	function pageChange(pageNum) {
		$(".eachTab").removeClass("activeBar");
		$(".eachContents").hide();
		$("#"+pageNum).fadeIn(200);
		$("."+pageNum).addClass("activeBar");
	}
	
	
	$(document).ready(function() {
	});
</script>
</head>
<body>
<c:set var="shop" value="${model.shop}"/>
	<div id="headBar" data-role="header" data-position="fixed"
		data-tap-toggle="false" class="jqm-header font">
		<span class="glyphicon glyphicon-chevron-left left" aria-hidden="true"
			onclick="javascript:history.go(-1)"></span> <span>내 이용권</span> <span
			class="glyphicon glyphicon-search right" aria-hidden="true"
			onclick="search();"></span>

	</div>
	<div id="contents" role="main" style="overflow: hidden; margin: 3%;">

		<!--Tab area -->
		<div class="tabWrap" style="border: 1px groove #F5F5F5;">
			<div class="eachTab one activeBar " onclick="pageChange('one')">보유이용권</div>
			<div class="eachTab two" onclick="pageChange('two')">교환대기중</div>
			<div class="eachTab three " onclick="pageChange('three')">완료이용권</div>
		</div>
		<div id="one" class="eachContents shopCustom font f12 b">
			<div class="ticket">
				<div class="day">
					<span> 2015. 06. 08 </span>
					<span style="float: right;"><a>주문정보>></a></span>
				</div>
				<div class="sale">
					<p><span class="glyphicon glyphicon-home"></span> 트레보 스포츠</p>
					<p><img src="/dailyfit/img/shop3_1.png" width="100px;"> <span style="vertical-align:top; ">일일권  6700원</span></p>
					
				</div>
				<div class="amount">
					<span class="left"><span style="color: red;">사용가능</span> <span style="color: #059;">2개</span></span>
					<button class="btn">사용신청</button>
					<button class="btn">환불신청</button>
				</div>
			</div>
			<div class="ticket">
				<div class="day">
					<span> 2015. 06. 06 </span>
					<span style="float: right;"><a>주문정보>></a></span>
				</div>
				<div class="sale">
					<p><span class="glyphicon glyphicon-home"></span> 헬스대통령</p>
					<p><img src="/dailyfit/img/shop3_1.png" width="100px;"> <span style="vertical-align:top; ">3개월 이용권  120000원</span></p>
					
				</div>
				<div class="amount">
					<span class="left"><span style="color: red;">사용가능</span> <span style="color: #059;">1개</span></span>
					<button class="btn">사용신청</button>
					<button class="btn">환불신청</button>
				</div>
			</div>
		</div>
		<div id="two" class="eachContents font f12 b" style="display: none;">
		<p style="margin-top: 0.5em; text-align: center;">헬스장에 방문하여 자신의 <a>PASS CODE</a>를 알려주세요 </p>
			<div class="ticket">
				<div class="day">
					<span> 2015. 06. 06 </span>
					<span style="float: right;"><a>주문정보>></a></span>
				</div>
				<div class="sale">
					<p><span class="glyphicon glyphicon-home"></span> 헬스대통령</p>
					<p><img src="/dailyfit/img/shop3_1.png" width="100px;"> <span style="vertical-align:top; ">3개월 이용권  120000원</span></p>
					
				</div>
				<div class="amount">
					<span class="left"><span style="color: red;">신청수량</span> <span style="color: #059;">1개 대기중</span></span>
					<button class="btn">쿠폰회수</button>
				</div>
			</div>
		</div>
		<div id="three" class="eachContents font f12 b" style="display: none;">
			<div class="ticket">
				<div class="day">
					<span> 2015. 06. 06 </span>
					<span style="float: right;"><a>주문정보>></a></span>
				</div>
				<div class="sale">
					<p><span class="glyphicon glyphicon-home"></span> 헬스대통령</p>
					<p><img src="/dailyfit/img/shop3_1.png" width="100px;"> <span style="vertical-align:top; ">3개월 이용권  120000원</span></p>
					
				</div>
				<div class="amount">
					<button class="btn" style="width: 100%;">후기등록</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>