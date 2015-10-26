<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="adminHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function regist(){
	if( $("#shopName").val()=="" || $("#shopNicname").val()==""|| $("#tel").val()=="" || $("#address").val()=="" || $("#lat").val()==""||$("#dPrice").val()=="" ){
		alert("필수정보 누락");
	}else{
		$("#regist").submit();
	}
	
}

function getLocation(){
	showLoading();
	var address = $("#address").val();
	$.post("/dailyfit/admin/requestLoaction.ap",{
		address:address
	},function(data){
		if(data.lat){
			$("#lat").val(data.lat);
			$("#lng").val(data.lng);
		}else{
			alert("잘못된 주소");
		}
		hideLoading();
		
	},"json");
}
</script>
</head>
<body>
	<div id="contents">
	<h3>헬스장 등록</h3>
	<form class="form-horizontal" id="regist" action="/dailyfit/admin/addShop.ap" method="post">
		<div class="form-group">
			<label class="col-sm-2 control-label">헬스장이름</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" placeholder="트레보" id="shopName" name="shopName">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword" class="col-sm-2 control-label">헬스장별명</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" placeholder="젊은이가많은헬스장" id="shopNicname" name="shopNicname">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword" class="col-sm-2 control-label">전화번호</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" placeholder="02-526-4575" id="tel" name="tel">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword" class="col-sm-2 control-label">헬스장
				주소</label>
			<div class="col-sm-10">
				<input id="address" type="text" class="form-control"
					placeholder="경기도 수원시 팔달구 인계동 1125" name="address">
			</div>
		</div>
		
		
		<div class="form-group">
			<label for="inputPassword" class="col-sm-2 control-label">좌표요청</label>
			<div class="col-sm-10">
				<div class="form-inline">
					<input type="text" class="form-control" id="lat" name="lat" 
						placeholder="위도" readonly>
					<input type="text" class="form-control" id="lng" name="lng"
						placeholder="경도" readonly>
					<button type="button" class="btn btn-default" onclick="getLocation()">좌표 요청</button>
				</div>
			</div>
		</div>
		
		
		<div class="form-group">
			<label for="inputPassword" class="col-sm-2 control-label">판매상품</label>
			<div class="col-sm-10">
				<div class="checkbox">
					<div class="form-inline">
						<label> <input type="checkbox" value="option1" checked name="checked"> 
							일일권(필수) <input type="text" class="form-control" name="dprice">원
						</label>
					</div>
				</div>
				<div class="checkbox">
					<div class="form-inline">
						<label> <input type="checkbox" value="option2" checked name="checked"> 
							<input type="text" class="form-control" name="c">회 이용권 <input type="text" class="form-control" name="cprice">원
						</label>
					</div>
				</div>
				<div class="checkbox">
					<div class="form-inline">
						<label> <input type="checkbox" value="option3" checked name="checked"> 
							<input type="text" class="form-control" name="m">개월 이용권 <input type="text" class="form-control" name="mprice">원
						</label>
					</div>
				</div>
				<div class="checkbox">
					<div class="form-inline">
						<label> <input type="checkbox" value="option4" checked name="checked"> 
							<input type="text" class="form-control" name="p">회 피티권 <input type="text" class="form-control" name="pprice">원
						</label>
					</div>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label">대표상품</label>
			<div class="col-sm-10">
				<div class="radio">
					<label> <input type="radio" name="special"
						id="optionsRadios1" value="D" checked> 일일권
					</label>
				</div>
				<div class="radio">
					<label> <input type="radio" name="special"
						id="optionsRadios2" value="C"> 0 회권
					</label>
				</div>
				<div class="radio">
					<label> <input type="radio" name="special"
						id="optionsRadios2" value="M"> 0 개월권
					</label>
				</div>
				<div class="radio">
					<label> <input type="radio" name="special"
						id="optionsRadios2" value="P"> 0 회 피티권
					</label>
				</div>
			</div>
		</div>
		
		<!-- <div class="form-group">
			<label class="col-sm-2 control-label">대표 사진</label>
			<div class="col-sm-10">
				<input type="text" name="mainImgUrl" value="o" style="display: none;" >
				<input type="file"  placeholder="트레보" accept="image/*">
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label">슬라이드 사진</label>
			<div class="col-sm-10">
				<input type="file" style="padding-bottom: 10px;" accept="image/*">
				<input type="file" style="padding-bottom: 10px;" accept="image/*">
				<input type="file" style="padding-bottom: 10px;" accept="image/*">
			</div>
		</div>
		 -->
		<div id="btnDiv" style="text-align: center; padding: 30px 0px;">
			<button type="button" class="btn btn-lg" onclick="regist();">등록</button>
			<button type="button" class="btn btn-lg">취소</button>
		</div>
	</form>
	</div>
</body>
</html>