<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="adminHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function regist(){
	alert("등록만하면되는데 졸려서 더이상못하겠어 낼이어서할거야\n(사진 서버에 디렉토링하는거때매 빨리할수있는 작업은아냐ㅠㅠ)")
}
</script>
</head>
<body>
	<div id="contents">
	<h3>헬스장 등록</h3>
	<form class="form-horizontal">
		<div class="form-group">
			<label class="col-sm-2 control-label">헬스장이름</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" placeholder="트레보">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword" class="col-sm-2 control-label">헬스장별명</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" placeholder="젊은이가많은헬스장">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword" class="col-sm-2 control-label">전화번호</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" placeholder="02-526-4575">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword" class="col-sm-2 control-label">헬스장
				주소</label>
			<div class="col-sm-10">
				<input type="text" class="form-control"
					placeholder="경기도 수원시 팔달구 인계동 1125">
			</div>
		</div>
		
		
		<div class="form-group">
			<label for="inputPassword" class="col-sm-2 control-label">좌표요청</label>
			<div class="col-sm-10">
				<div class="form-inline">
					<input type="text" class="form-control" 
						placeholder="위도" readonly>
					<input type="text" class="form-control"
						placeholder="경도" readonly>
					<button type="button" class="btn btn-default">좌표 요청</button>
				</div>
			</div>
		</div>
		
		
		<div class="form-group">
			<label for="inputPassword" class="col-sm-2 control-label">판매상품</label>
			<div class="col-sm-10">
				<div class="checkbox">
					<label> <input type="checkbox" value="option2" checked disabled> 
						일일권(필수)
					</label>
				</div>
				<div class="checkbox">
					<div class="form-inline">
						<label> <input type="checkbox" value="option2" checked> 
							<input type="text" class="form-control">회 이용권
						</label>
					</div>
				</div>
				<div class="checkbox">
					<div class="form-inline">
						<label> <input type="checkbox" value="option3" checked> 
							<input type="text" class="form-control">개월 이용권
						</label>
					</div>
				</div>
				<div class="checkbox">
					<div class="form-inline">
						<label> <input type="checkbox" value="option4" checked> 
							<input type="text" class="form-control">회 피티권
						</label>
					</div>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label">대표상품</label>
			<div class="col-sm-10">
				<div class="radio">
					<label> <input type="radio" name="optionsRadios"
						id="optionsRadios1" value="option1" checked> 일일권
					</label>
				</div>
				<div class="radio">
					<label> <input type="radio" name="optionsRadios"
						id="optionsRadios2" value="option2"> 0 회권
					</label>
				</div>
				<div class="radio">
					<label> <input type="radio" name="optionsRadios"
						id="optionsRadios2" value="option2"> 0 개월권
					</label>
				</div>
				<div class="radio">
					<label> <input type="radio" name="optionsRadios"
						id="optionsRadios2" value="option2"> 0 회 피티권
					</label>
				</div>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label">대표 사진</label>
			<div class="col-sm-10">
				<input type="file"  placeholder="트레보">
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label">슬라이드 사진</label>
			<div class="col-sm-10">
				<input type="file" style="padding-bottom: 10px;">
				<input type="file" style="padding-bottom: 10px;">
				<input type="file" style="padding-bottom: 10px;">
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