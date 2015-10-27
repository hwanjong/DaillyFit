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
			<c:forEach var="buy" items="${buyList}">
				<c:if test="${buy.useCount != 0}">
					<div class="ticket">
						<div class="day">
							<span> ${buy.buyTime }  </span>
						<span style="float: right;"><a>주문정보>></a></span>
						</div>
						<div class="sale">
							<p><span class="glyphicon glyphicon-home"></span> ${buy.shopName }</p>
							<p><img src="${buy.mainImgUrl }" width="100px;"> <span style="vertical-align:top; ">${buy.saleName } ${buy.salePrice }원</span></p>
						</div>
						<div class="amount">
							<div style="text-align: left;"><input id="${buy.buyId }" class="input" type="text" placeholder="후기입력" lang="20"></div>
							<span class="left"><span style="color: red;">완료수량</span> <span style="color: #059;">${buy.useCount }개</span></span>
							<span style="text-align: right; padding: 10px;"><button class="btn" style="width: 50%;" onclick="updateReport('${buy.buyId}')">후기등록</button></span>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
</body>
</html>