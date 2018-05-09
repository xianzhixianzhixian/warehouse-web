<%@ page pageEncoding="utf-8"%>
<%@ page language="java" import="com.warehouse.utils.*" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<script src="js/jquery-2.1.1.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<link href="css/addWarehouse.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" src="js/login.js"></script>
		<!-- <script src="js/moment-with-locales.min.js"></script>    
		<link href="css/bootstrap-datetimepicker.css" rel="stylesheet" />    
		<script src="js/bootstrap-datetimepicker.js"></script> -->
		<script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>  
    <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"  rel="stylesheet">  
    <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
	</head>
	<body>
		<div style="margin: 0 20%;">
			<div class="login_internal">
				<form id="login_form">
					<h2 class="text-center">仓库添加</h2>
					<div class="form-group">
						<label for="inputWarehouseNum">仓库编号</label>
						<input type="text" class="form-control" id="inputWarehouseNum" name="warehouse_num" placeholder="仓库编号"  required autofocus>
					</div>
					<div class="form-group">
						<label for="inputWarehouseName">仓库名</label>
						<input type="text" class="form-control" id="inputWarehouseName" name="warehouse_name" placeholder="仓库名"  required>
					</div>
					<div class="form-group" style="position:relative;">
						<label for="inputCompany">仓库所属公司</label>
						<input type='text' class="form-control" id="inputCompany" name="contract_date" placeholder="仓库所属公司" required>
					</div>
					<div class="form-group" style="position:relative;">
						<label for="selectContractDate">合同签订日期</label>
						<input type='text' class="form-control" id="selectContractDate" name="contract_date" placeholder="合同签订日期" required>
					</div>
					<div class="form-group">
						<label for="inputResponser">仓库负责人</label>
						<input type="text" class="form-control" id="inputResponser" name="responser" placeholder="仓库负责人" required>
					</div>
					<div class="form-group">
						<label for="inputResponserPhone">负责人电话</label>
						<input type="text" class="form-control" id="inputResponserPhone" name="responser_phone" placeholder="负责人手机号" required>
					</div>
					<div class="form-group">
						<label for="inputRemark">备注</label>
						<input type="text" class="form-control" id="inputRemark" name="password" placeholder="备注，该字段可以不填写"  required>
					</div>
					<div class="col-sm-offset-1 col-sm-4">
					    <button type="button" class="btn btn-primary btn-block"
					        style="font-size:16px;font-weight: 700;" onclick="addWarehouse();">添加</button>
					</div>
					<div class="col-sm-offset-2 col-sm-4">
					    <button type="reset" class="btn btn-default btn-block"
					        style="font-size:16px;font-weight: 700;">取消</button>
					</div>
				</form>
				<label id="add_warehouse_return_message" class="login_label" style=""></label>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		function addWarehouse(){
			var warehousenum=$("#inputWarehouseNum").val().trim();
			var warehousename=$("#inputWarehouseName").val().trim();
			var company=$("#inputCompany").val().trim();
			var contractdate=$("#selectContractDate").val().trim();
			var repsonser=$("#inputResponser").val().trim();
			var responserphone=$("#inputResponserPhone").val().trim();
			var remark=$("#inputRemark").val().trim();
			if(warehousenum=='' || warehousenum==null 
				|| warehousename=='' || warehousename==null
				|| company=='' || company==null
				|| repsonser=='' || repsonser==null
				|| responserphone=='' || responserphone==null)
			{
				alert("请输入完整信息，备注字段可以不填写");
				return false;
			}
			var pattern = /^1[34578]\d{9}$/;
			if(!pattern.test(responserphone)){
				alert("请输入正确的电话号码");
				return false;
			}else{
				$.ajax({
					url: "warehouse/addWarehouse",
					type: "post",
					data: {
						"num": warehousenum,
						"name": warehousename,
						"responser": repsonser,
						"responserPhone": responserphone,
						"company": company,
						"contract_date": contractdate,
						"remark": remark
					},
					success: function(response){
						if(response.message=="success"){
							alert("添加仓库成功");
						}else if(response.message=="fail"){
							alert("添加仓库失败");
							return;
						}else if(response.message=="warehouse_exists"){
							alert("该仓库信息已存在，可以进入仓库管理页面进行管理");
							return;
						}
					}
				});
			}
		}
		
        $("#selectContractDate").datetimepicker({
        	format: 'YYYY-MM-DD',    
            locale: moment.locale('zh-cn')
        });
	</script>
</html>