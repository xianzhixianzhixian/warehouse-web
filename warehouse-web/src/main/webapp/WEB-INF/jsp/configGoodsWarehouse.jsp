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
		<link href="css/configGoodsWarehouse.css" rel="stylesheet" type="text/css"/>
	</head>
	<body>
		<div class="login">
			<div class="login_internal">
				<form class="form-horizontal">
					<h2 class="text-center">仓库配置</h2>
					<div class="form-group">
						<label for="selectGoodsNum">物资选择&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
						<select id="selectGoodsNum" name="goodsnum" class="selectpicker" onchange="changeGoodsName(this)"></select>
						<input type="text" class="form-control" id="goodsname" name="goods_name" placeholder="物资名称"  disabled="disabled">
					</div>
					<div class="form-group">
						<label for="selectWarehouseNum" class="form-label">仓库选择&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
						<select id="selectWarehouseNum" name="warehousenum" class="selectpicker" onchange="changeWarehouseName(this)"></select>
						<input type="text" class="form-control" id="warehousename" name="warehouse_name" placeholder="仓库名称" disabled="disabled">
					</div>
					<div class="form-group">
						<label for="bottomLine" class="form-label">最低库存预警值配置</label>
						<input type="text" class="form-control" id="bottomLine" name="bottomline" placeholder="最低库存预警值配置">
					</div>
					<div class="form-group">
						<label for="topLine" class="form-label">最高库存预警值配置</label>
						<input type="text" class="form-control" id="topLine" name="topline" placeholder="最高库存预警值配置" required>
					</div>
					<div class="col-sm-offset-1 col-sm-4" style="margin-top: 10px;">
				    	<button type="button" class="btn btn-primary btn-block" style="font-size:16px;font-weight: 700;" onclick="addConfig();">配置</button>
					</div>
					<div class="col-sm-offset-1 col-sm-4" style="margin-top: 10px;margin-left: 45px;">
					    <button type="reset" class="btn btn-default btn-block" style="font-size:16px;font-weight: 700;">取消</button>
					</div>
				</form>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		var warehouselist=null;
		var goodslist=null;
		
		$(document).ready(function(){ 
			$.ajax({
				url: "manage/selectGoodsAndWarehouse",
				type: "get",
				success: function(response){
					if(response.message=="success"){
						warehouselist=response.object.warehouselist;
						goodslist=response.object.goodslist;
						
						for(var i=0;i<goodslist.length;i++){
							$("#selectGoodsNum").append("<option id="+goodslist[i].num+" value="+goodslist[i].name+">"+goodslist[i].num+"</option>");
						}
						for(var i=0;i<warehouselist.length;i++){
							$("#selectWarehouseNum").append("<option id="+warehouselist[i].num+" value="+warehouselist[i].name+">"+warehouselist[i].num+"</option>");
						}
						$("#selectGoodsNum").selectpicker('refresh');
						$("#selectWarehouseNum").selectpicker('refresh');
						$("#goodsname").val(goodslist[0].name);
						$("#warehousename").val(warehouselist[0].name);
					}
				}
			});
		});
		
		function changeGoodsName(){
			$("#goodsname").val($("#selectGoodsNum").find("option:selected").val());
		}
		
		function changeWarehouseName(){
			$("#warehousename").val($("#selectWarehouseNum").find("option:selected").val());
		}
		
		function addConfig(){
			var goodsnum=$("#selectGoodsNum").find("option:selected").text();
			var goodsname=$("#goodsname").val().trim();
			var warehousenum=$("#selectWarehouseNum").find("option:selected").text();
			var warehousename=$("#warehousename").val().trim();
			var bottomline=$("#bottomLine").val().trim();
			var topline=$("#topLine").val().trim();
			if(bottomline=='' || bottomline==null
				|| topline=='' || topline==null)
			{
				alert("请输入完整信息");
				return false;
			}else if(bottomline<0 || topline<0){
				alert("库存数量配置不能低于0");
				return false;
			}else{
				$.ajax({
					url: "manage/addConfig",
					type: "post",
					data: {
						"goodsNum": goodsnum,
						"goodsName": goodsname,
						"warehouseNum": warehousenum,
						"warehouseName": warehousename,
						"bottommost": bottomline,
						"topmost": topline
					},
					success: function(response){
						if(response.message=="success"){
							alert("配置成功");
						}else if(response.message=="fail"){
							alert("配置失败");
							return;
						}
					}
				});
			}
		}
	</script>
</html>