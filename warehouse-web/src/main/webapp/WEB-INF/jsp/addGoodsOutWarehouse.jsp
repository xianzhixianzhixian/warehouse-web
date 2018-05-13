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
		<%
			Integer level=(Integer)session.getAttribute("level");
		%>
		<div class="login">
			<div class="login_internal">
				<form class="form-horizontal">
					<h2 class="text-center">物资出库</h2>
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
						<label for="inNum" class="form-label">出库数量</label>
						<input type="text" class="form-control" id="inNum" name="innum" placeholder="入库数量">
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
						<button type="button" class="btn btn-primary btn-block" style="font-size:16px;font-weight: 700;" onclick="addGoods();">出库</button>
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
	</script>
	<%
		if(level==1){
	%>
		<script type="text/javascript">
			
		</script>
	<%
		}else{
	%>
		<script type="text/javascript">
			function addConfig(){
				var goodsnum=$("#selectGoodsNum").find("option:selected").val().trim();
				var goodsname=$("#goodsname").val().trim();
				var warehousenum=$("#selectWarehouseNum").find("option:selected").val().trim();
				var warehousename=$("#warehousename").val().trim();
				var bottomline=$("#bottomLine").val().trim();
				var topline=$("#topLine").val().trim();
				if(goodsnum=='' || goodsnum==null 
					|| goodsname=='' || goodsname==null
					|| extension=='' || extension==null
					|| price=='' || price==null)
				{
					alert("请输入完整信息，备注字段可以不填写");
					return false;
				}else{
					$.ajax({
						url: "manage/addConfig",
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
	<%
		}
	%>
</html>