<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="cache-control" content="no-cache" />
<link href="/dailyfit/css/editQuestion.css" rel="stylesheet">
<title>Insert title here</title>
<script>
function cancleEdit(){
	location.href="/dailyfit/mypage.ap"
}
function regist(){
	if( $("#noticeTitle").val()==""||$("#qContent").val()==""){
		alert("필수정보 누락");
	}else{
		$.post("/dailyfit/user/addQuesAD.ap",{
			title : $("#noticeTitle").val(),
			contents :$("#qContent").val() 
		},function(data){
			alert("등록하였습니다.");
			location.href="/dailyfit/mypage.ap"
		},"json");
	}
}
</script>
</head>
<body>
	<div id="headBar" data-role="header" data-position="fixed"
		data-tap-toggle="false" class="jqm-header font">
		<span class="glyphicon glyphicon-chevron-left left" aria-hidden="true"
			onclick="javascript:history.go(-1)"></span> <span id="title"
			style="margin-left: -50px;">DAYFIT</span> <span
			class="glyphicon glyphicon-option-horizontal right"
			aria-hidden="true" onclick="alert('거리순&가격순보기준비중입니다.')"></span>
	</div>
	<div id="content">
		<div id="questionLabel">광고 제휴 문의</div>
		<form class="form-horizontal" id="regist" action="/dailyfit/user/addQuesetionAD.ap" method="post">
		<div class="form-group">
			<label class="col-sm-2 control-label">제목</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" placeholder="문의제목을 남겨주세요" id="noticeTitle" name="noticeTitle">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword" class="col-sm-2 control-label">내용</label>
			<div class="col-sm-10">
				<textarea id="qContent"class="form-control" style="height:30em" placeholder="연락처를 남겨주시면 전화드리겠습니다."name="noticeContents"></textarea>
			</div>
		</div>	
		
		<div id="btnDiv" style="text-align: center; padding: 30px 0px;" align="center">
			<button type="button" class="btn btn-lg editformBtn" onclick="regist();">등록</button>
			<button type="button" class="btn btn-lg editformBtn" onclick="cancleEdit()">취소</button>
		</div>
	</form>
	</div>

</body>
</html>