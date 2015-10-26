<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="/dailyfit/css/question.css" rel="stylesheet">
<script>
	$(document).ready(
			function() {
				$('.collapse').on(
						'shown.bs.collapse',
						function() {
							$(this).parent().find(".glyphicon-menu-right")
									.removeClass("glyphicon-menu-right")
									.addClass("glyphicon-menu-down");
						}).on(
						'hidden.bs.collapse',
						function() {
							$(this).parent().find(".glyphicon-menu-down")
									.removeClass("glyphicon-menu-down")
									.addClass("glyphicon-menu-right");
						});
			});
	function editQ(){
		location.href="editQuestion.ap";
	}
</script>
</head>
<body>
	<div id="headBar" data-role="header" data-position="fixed" data-tap-toggle="false" class="jqm-header font">
		<span class="glyphicon glyphicon-chevron-left left" aria-hidden="true"
			onclick="javascript:history.go(-1)"></span> <span id="title"
			style="margin-left: -50px;">DAILY FIT</span> <span
			class="glyphicon glyphicon-option-horizontal right"
			aria-hidden="true" onclick="alert('거리순&가격순보기준비중입니다.')"></span>
	</div>
	
	<button id="editQuestion" onclick="editQ()">글쓰기</button>
	<div id="questionLabel">1:1 문의</div>
	
	<div class="panel-group" id="accordion">		
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							aria-hidden="false" href="#1" class="collapsed">
							<span class="glyphicon glyphicon-menu-right"></span>왜 아무것도 안되나요?
						</a>
					</h4>
				</div>
				<div id="1" class="panel-collapse collapse">
					<div class="panel-body">정말 아무것도 안되요...</div>
				</div>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							aria-hidden="false" href="#2" class="collapsed">
							<span class="glyphicon glyphicon-menu-right"></span>답변이 달렸어요..
						</a>
					</h4>
				</div>
				<div id="2" class="panel-collapse collapse">
					<div class="panel-body">
						<div>답변이 달렸어요</div>
						<div>reply --> 오예 </div>
					</div>
				</div>
			</div>		
	</div>
</body>
</html>