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
						<label for="inNum" class="form-label">入库数量</label>
						<input type="text" class="form-control" id="inNum" name="innum" onclick="getWarehouseGoodsNumInfo();" placeholder="入库数量">
					</div>
					<div class="form-group">	
						<label for="savedNum" class="form-label">已存该种物资数量</label>
						<input type="text" class="form-control" id="savedNum" name="savednum" placeholder="已存该种商品数量" disabled="disabled">
					</div>
					<div class="form-group">
						<label for="canSaveNum" class="form-label">可存该种物资数量</label>
						<input type="text" class="form-control" id="canSaveNum" name="cansavenum" placeholder="剩余可存该种物资量" disabled="disabled">
					</div>
					<div class="form-group">
						<label for="bottomLine" class="form-label">最低库存预警值</label>
						<input type="text" class="form-control" id="bottomLine" name="bottomline" placeholder="最低库存预警值" disabled="disabled">
					</div>
					<div class="form-group">
						<label for="topLine" class="form-label">最高库存预警值</label>
						<input type="text" class="form-control" id="topLine" name="topline" placeholder="最高库存预警值" disabled="disabled">
					</div>
					<div class="col-sm-offset-1 col-sm-4" style="margin-top: 10px;">
						<button type="button" class="btn btn-primary btn-block" style="font-size:16px;font-weight: 700;" onclick="addGoodsIntoWarehouse();">入库</button>
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
		
		function getWarehouseGoodsNumInfo(){
			var goodsnum=$("#selectGoodsNum").find("option:selected").text();
			var warehousenum=$("#selectWarehouseNum").find("option:selected").text();
			$.ajax({
				url: "manage/getWarehouseGoodsNumInfo",
				type: "get",
				data: {
					"goodsNum": goodsnum,
					"warehouseNum": warehousenum
				},
				success: function(response){
					if(response.message=="success"){
						var info=response.object;
						$("#savedNum").val(info.containNumber);
						$("#canSaveNum").val(info.topmost-info.containNumber);
						$("#bottomLine").val(info.bottommost);
						$("#topLine").val(info.topmost);
					}else if(response.message=="fail"){
						alert("该仓库和商品的关联信息未配置，请管理员进行配置之后再进行入库或出库操作");
					}
				}
			});
		}
		
		function addGoodsIntoWarehouse(){
			var goodsnum=$("#selectGoodsNum").find("option:selected").text();
			var warehousenum=$("#selectWarehouseNum").find("option:selected").text();
			var innum=Number($("#inNum").val().trim());
			var leftcontain=Number($("#canSaveNum").val().trim());
			if(goodsnum=='' || goodsnum==null 
				|| warehousenum=='' || warehousenum==null
				|| innum=='' || innum==null)
			{
				alert("请输入完整信息");
				return false;
			}else if(leftcontain<innum){
				alert("入库数量不能高于剩余容量");
				return false;
			}else{
				innum=innum+Number($("#savedNum").val().trim());
				$.ajax({
					url: "manage/addRecord",
					type: "post",
					data: {
						"goodsNum": goodsnum,
						"warehouseNum": warehousenum,
						"containNumber": innum,
						"operation": "add"
					},
					success: function(response){
						if(response.message=="success"){
							alert("物资入库成功");
						}else if(response.message=="fail"){
							alert("物资入库失败");
							return;
						}
					}
				});
			}
		}
	</script>
</html>