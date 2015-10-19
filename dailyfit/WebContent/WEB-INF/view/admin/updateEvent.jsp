<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="adminHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">

function regist(){
	showLoading();
	var title = $("#title").val();
	var contents = $("#inputText").val();
	$.post("/dailyfit/admin/changeEvent.ap",{
		title:title,
		contents:contents
	},function(data){
		
		hideLoading();
		
	},"json");
}
</script>
</head>
<body>
	<div id="contents">
	<h3>한줄 이벤트 수정</h3>
	<form method="post" class="form-horizontal">
		<div class="form-group">
			<label class="col-sm-2 control-label">이벤트 제목</label>
			<div class="col-sm-10">
				<input type="text" id="title" name="title" value="${model.board.title}">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">이벤트 내용</label>
			<div class="col-sm-10">
				<textarea rows="3" cols="50" id="inputText" name="contents">${model.board.contents}</textarea>
			</div>
		</div>
		<div id="btnDiv" style="text-align: center; padding: 30px 0px;">
			<button type="button" class="btn btn-lg" onclick="regist();">업데이트</button>
		</div>
	</form>
	</div>
</body>
</html>