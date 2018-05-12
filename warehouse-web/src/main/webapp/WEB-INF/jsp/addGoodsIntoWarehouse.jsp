<%@ page pageEncoding="utf-8"%>
<%@ page language="java" import="com.warehouse.utils.*" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<script src="js/jquery-2.1.1.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/bootstrap-select.min.js"></script>
		<link href="css/bootstrap-select.min.css" rel="stylesheet" type="text/css"/>
		<link href="css/addGoodsIntoWarehouse.css" rel="stylesheet" type="text/css"/>
	</head>
	<body>
		<div class="login">
			<div class="login_internal">
				<form class="form-horizontal">
					<h2 class="text-center">物资入库</h2>
					<div class="form-group">
						<label for="inputGoodsNum">物资选择： </label>
						<select id="goodsnum" name="goodsnum" class="selectpicker"></select>
						<input type="text" class="form-control" id="inputGoodsName" name="goods_name" placeholder="物资名称"  disabled="disabled">
					</div>
					<div class="form-group">
						<label for="inputExtension" class="form-label">仓库选择： </label>
						<select id="warehousenum" name="warehousenum" class="selectpicker"></select>
						<input type="text" class="form-control" id="inputPrice" name="price" placeholder="仓库名称" disabled="disabled">
					</div>
					<div class="form-group">
						<label for="inputRemark" class="form-label">最低库存预警： </label>
						<input type="text" class="form-control" id="inputRemark" name="password" placeholder="最低库存预警值" disabled="disabled">
					</div>
					<div class="form-group">
						<label for="inputRemark" class="form-label">最高库存预警： </label>
						<input type="text" class="form-control" id="inputRemark" name="password" placeholder="最高库存预警值"  required>
					</div>
					<div class="form-group">	
						<label for="inputPrice" class="form-label">已存该种物资数量： </label>
						<input type="text" class="form-control" id="inputPrice" name="price" placeholder="已存该种商品数量" disabled="disabled">
					</div>
					<div class="form-group">
						<label for="inputPrice" class="form-label">可存该种物资数量： </label>
						<input type="text" class="form-control" id="inputPrice" name="price" placeholder="剩余可存该种商品数量" disabled="disabled">
					</div>
					<div class="col-sm-offset-1 col-sm-5">
				    	<button type="button" class="btn btn-primary btn-block" style="font-size:16px;font-weight: 700;" onclick="addGoods();">入库</button>
					</div>
					<div class="col-sm-offset-1 col-sm-5">
					    <button type="reset" class="btn btn-default btn-block" style="font-size:16px;font-weight: 700;">取消</button>
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