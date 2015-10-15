<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<!--  googleMap -->
<link href="/dailyfit/css/main.css" rel="stylesheet">
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
	<div id="contents" role="main" style="overflow: hidden;">

		<!--Tab area -->
		<div class="tabWrap">
			<div class="eachTab tripleTab one activeBar " onclick="pageChange('one')">보유이용권</div>
			<div class="eachTab tripleTab two" onclick="pageChange('two')">교환대기중</div>
			<div class="eachTab tripleTab three " onclick="pageChange('three')">완료이용권</div>
		</div>
		<div id="one" class="eachContents shopCustom">
		</div>
		<div id="two" class="eachContents font f15" style="display: none;">
		</div>
		<div id="three" class="eachContents font f12 b" style="display: none;">
		</div>
	</div>
</body>
</html>