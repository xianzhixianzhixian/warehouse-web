<%@ page pageEncoding="utf-8"%>
<%@ page language="java" import="com.warehouse.utils.*" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<script src="js/jquery-2.1.1.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<link href="css/addGoods.css" rel="stylesheet" type="text/css"/>
	</head>
	<body>
		<div style="margin: 0 20%;">
			<div class="login_internal">
				<form id="login_form">
					<h2 class="text-center">物资添加</h2>
					<div class="form-group">
						<label for="inputGoodsNum">物资编号</label>
						<input type="text" class="form-control" id="inputGoodsNum" name="goods_num" placeholder="物资编号"  required autofocus>
					</div>
					<div class="form-group">
						<label for="inputGoodsName">物资名称</label>
						<input type="text" class="form-control" id="inputGoodsName" name="goods_name" placeholder="物资名称"  required>
					</div>
					<div class="form-group" style="position:relative;">
						<label for="inputExtension">扩展配件</label>
						<input type='text' class="form-control" id="inputExtension" name="extension" placeholder="扩展配件" required>
					</div>
					<div class="form-group">
						<label for="inputPrice">单价（人名币/元）</label>
						<input type="text" class="form-control" id="inputPrice" name="price" placeholder="单价" required>
					</div>
					<div class="form-group">
						<label for="inputRemark">备注</label>
						<input type="text" class="form-control" id="inputRemark" name="password" placeholder="备注，该字段可以不填写"  required>
					</div>
					<div class="col-sm-offset-1 col-sm-4">
					    <button type="button" class="btn btn-primary btn-block"
					        style="font-size:16px;font-weight: 700;" onclick="addGoods();">添加</button>
					</div>
					<div class="col-sm-offset-2 col-sm-4">
					    <button type="reset" class="btn btn-default btn-block"
					        style="font-size:16px;font-weight: 700;">取消</button>
					</div>
				</form>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		function addGoods(){
			var goodsnum=$("#inputGoodsNum").val().trim();
			var goodsname=$("#inputGoodsName").val().trim();
			var extension=$("#inputExtension").val().trim();
			var price=$("#inputPrice").val().trim();
			var remark=$("#inputRemark").val().trim();
			if(goodsnum=='' || goodsnum==null 
				|| goodsname=='' || goodsname==null
				|| extension=='' || extension==null
				|| price=='' || price==null)
			{
				alert("请输入完整信息，备注字段可以不填写");
				return false;
			}else{
				$.ajax({
					url: "goods/addGoods",
					type: "post",
					data: {
						"num": goodsnum,
						"name": goodsname,
						"extendsParts": extension,
						"price": price,
						"remark": remark
					},
					success: function(response){
						if(response.message=="success"){
							alert("添加物资信息成功");
						}else if(response.message=="fail"){
							alert("添加物资信息失败");
							return;
						}else if(response.message=="goods_exists"){
							alert("该物资信息已存在，可以进入物资信息管理页面进行管理");
							return;
						}
					}
				});
			}
		}
	</script>
</html>