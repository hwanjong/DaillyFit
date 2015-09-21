<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="adminHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function delShop(shopNum){
	if(confirm("정말 삭제하시겠습니까?")==true){
		$("#"+shopNum).remove();
		showLoading();
		$.post("/dailyfit/check/delShop.ap",{
			shopNum : shopNum
		},function(data){
			hideLoading();
			alert("서버DB에서 삭제완료");
		},"json");
	}
}
$(document).ready(function() { // 해당 페이지 Loading 후,
	$("#search").click(function(){
		$("#searchList").html("");
		showLoading();
		var shopName = $("#shopName").val();
		$.post("/dailyfit/check/searchShop.ap",{
			shopName : shopName
		},function(data){
			hideLoading();
			var shopList = data.shopList;
			for (var i in shopList) {
				if(shopList[i]=="")continue;
				if(shopList[i].mainImgUrl==""){
					$("#searchList").append('<div id="'+shopList[i].shopNum+'"class="alert alert-success" role="alert"><button type="button" class="close" onclick="delShop('+shopList[i].shopNum+')"><span aria-hidden="true">&times;</span></button><strong>'+shopList[i].shopName+'</strong> '+shopList[i].address+' <span class="label label-warning">비제휴</span></div>');
				}else{
					$("#searchList").append('<div id="'+shopList[i].shopNum+'"class="alert alert-info" role="alert"><button type="button" class="close" onclick="delShop('+shopList[i].shopNum+')"><span aria-hidden="true">&times;</span></button><strong>'+shopList[i].shopName+'</strong> '+shopList[i].address+' <span class="label label-primary">제휴</span></div>');
				}
				
			}
		},"json");
		
	})
});
</script>
</head>
<body>
	<div id="contents">
	<h3>헬스장 삭제</h3>
		<div class="row">
		  <div class="col-lg-6">
		    <div class="input-group">
		      <input id="shopName" type="text" class="form-control" placeholder="헬스장이름입력..">
		      <span class="input-group-btn">
		        <button id="search" class="btn btn-default" type="button">Search</button>
		      </span>
		    </div><!-- /input-group -->
		  </div><!-- /.col-lg-6 -->
		</div><!-- /.row -->
		
		<div id="searchList" style="height: 600px; overflow: auto;">
		</div>
	</div>
</body>
</html>