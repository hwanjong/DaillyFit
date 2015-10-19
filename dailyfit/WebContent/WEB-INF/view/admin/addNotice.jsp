<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="adminHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/dailyfit/css/addNotice.css" rel="stylesheet">
<title>Insert title here</title>
<script>
function regist(){
	if( $("#noticeTitle").val()=="" || $("#noticeContents").val()==""){
		alert("필수정보 누락");
	}else{
		$("#regist").submit();
	}
	
}
</script>
</head>
<body>
<div id="contents">
	<h3 style="margin-left:12%;margin-bottom:5%">공지사항 등록</h3>
	<form class="form-horizontal" id="regist" action="/dailyfit/admin/addNotice.ap" method="post">
		<div class="form-group">
			<label class="col-sm-2 control-label">제목</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" placeholder="[일반공지사항] 서버안정화를 위한 정기점검 실시 " id="noticeTitle" name="noticeTitle">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword" class="col-sm-2 control-label">내용</label>
			<div class="col-sm-10">
				<textarea class="form-control" style="height:30em" placeholder="서버 안정화를 위한 정기점검 실시 안내,
,
2015년 10월 10일 04:00 ~ 2015년 10월 10일 06:00 까지" id="noticeContents" name="noticeContents"></textarea>
			</div>
		</div>	
		
		<div id="btnDiv" style="text-align: center; padding: 30px 0px;">
			<button type="button" class="btn btn-lg" onclick="regist();">등록</button>
			<button type="button" class="btn btn-lg">취소</button>
		</div>
	</form>
	</div>
</body>
</html>