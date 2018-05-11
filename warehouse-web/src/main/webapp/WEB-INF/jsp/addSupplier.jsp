<%@ page pageEncoding="utf-8"%>
<%@ page language="java" import="com.warehouse.utils.*" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<script src="js/jquery-2.1.1.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<link href="css/addSupplier.css" rel="stylesheet" type="text/css"/>
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
					<h2 class="text-center">供应商添加</h2>
					<div class="form-group">
						<label for="inputSupplierNum">供应商编号</label>
						<input type="text" class="form-control" id="inputSupplierNum" name="supplier_num" placeholder="供应商编号"  required autofocus>
					</div>
					<div class="form-group">
						<label for="inputSupplierName">供应商名称</label>
						<input type="text" class="form-control" id="inputSupplierName" name="supplier_name" placeholder="供应商名称"  required>
					</div>
					<div class="form-group" style="position:relative;">
						<label for="inputCompany">仓库所属公司</label>
						<input type='text' class="form-control" id="inputCompany" name="contract_date" placeholder="仓库所属公司" required>
					</div>
					<div class="form-group">
						<label for="inputReceiver">对接人</label>
						<input type="text" class="form-control" id="inputReceiver" name="receiver" placeholder="对接人" required>
					</div>
					<div class="form-group">
						<label for="inputReceiverPhone">对接人电话</label>
						<input type="text" class="form-control" id="inputReceiverPhone" name="receiver_phone" placeholder="对接人手机号" required>
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
			</div>
		</div>
	</body>
	<script type="text/javascript">
		function addWarehouse(){
			var suppliernum=$("#inputSupplierNum").val().trim();
			var suppliername=$("#inputSupplierName").val().trim();
			var receiver=$("#inputReceiver").val().trim();
			var receiverphone=$("#inputReceiverPhone").val().trim();
			var repsonser=$("#inputResponser").val().trim();
			var responserphone=$("#inputResponserPhone").val().trim();
			var remark=$("#inputRemark").val().trim();
			if(suppliernum=='' || suppliernum==null 
				|| suppliername=='' || suppliername==null
				|| receiver=='' || receiver==null
				|| receiverphone=='' || receiverphone==null
				|| repsonser=='' || repsonser==null
				|| responserphone=='' || responserphone==null)
			{
				alert("请输入完整信息，备注字段可以不填写");
				return false;
			}
			var pattern = /^1[34578]\d{9}$/;
			if(!pattern.test(responserphone) || !pattern.test(receiverphone)){
				alert("请输入正确的手机号码");
				return false;
			}else{
				$.ajax({
					url: "supplier/addSupplier",
					type: "post",
					data: {
						"num": suppliernum,
						"name": suppliername,
						"receiver": receiver,
						"receiverPhone": receiverphone,
						"responser": repsonser,
						"responserPhone": responserphone,
						"remark": remark
					},
					success: function(response){
						if(response.message=="success"){
							alert("添加供应商成功");
						}else if(response.message=="fail"){
							alert("添加供应商失败");
							return;
						}else if(response.message=="supplier_exists"){
							alert("该供应商信息已存在，可以进入供应商信息管理页面进行管理");
							return;
						}
					}
				});
			}
		}
	</script>
</html>