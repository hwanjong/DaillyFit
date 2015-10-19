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
			onclick="javascript:history.go(-1)"></span> <span>완료쿠폰</span> <span
			class="glyphicon glyphicon-search right" aria-hidden="true"
			onclick="search();"></span>

	</div>
	<div id="contents" role="main" style="overflow: hidden; margin: 3%;">
		<div class="font f12 b">
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