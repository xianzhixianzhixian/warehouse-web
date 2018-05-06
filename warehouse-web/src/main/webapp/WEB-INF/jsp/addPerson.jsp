<%@ page pageEncoding="utf-8"%>
<%@ page language="java" import="com.warehouse.utils.*" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<script src="js/jquery-2.1.1.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<link href="css/addPerson.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" src="js/login.js"></script>
	</head>
	<body>
		<div style="margin: 0 20%;">
			<div class="login_internal">
				<form id="login_form">
					<h2 class="text-center">仓库员工添加</h2>
					<div class="form-group">
						<label for="inputUsername">用户名</label>
						<input type="text" class="form-control" id="inputUsername" name="username" placeholder="用户名"  required autofocus>
					</div>
					<div class="form-group">
						<label for="inputPassword">密码</label>
						<input type="text" class="form-control" id="inputPassword" name="password" placeholder="密码"  required>
					</div>
					<div class="form-group">
						<label for="inlineRadioOptions">用户等级</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<label class="radio-inline">
						  <input type="radio" name="inlineRadioOptions" id="manager" value="2"> 管理员
						</label>
						<label class="radio-inline">
						  <input type="radio" name="inlineRadioOptions" id="user" value="3" checked="checked"> 普通用户
						</label>
					</div>
					<div class="form-group">
						<label for="inputRemark">备注</label>
						<input type="text" class="form-control" id="inputRemark" name="password" placeholder="备注，该字段可以不填写"  required>
					</div>
					<div class="col-sm-offset-1 col-sm-4">
					    <button type="button" class="btn btn-primary btn-block"
					        style="font-size:16px;font-weight: 700;" onclick="addPerson();">添加</button>
					</div>
					<div class="col-sm-offset-2 col-sm-4">
					    <button type="reset" class="btn btn-default btn-block"
					        style="font-size:16px;font-weight: 700;">取消</button>
					</div>
				</form>
				<label id="add_person_return_message" class="login_label" style=""></label>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		function addPerson(){
			var username=$("#inputUsername").val();
			var password=$("#inputPassword").val();
			var level=$("input[name='inlineRadioOptions']:checked").val();
			var remark=$("#inputRemark").val();
			if(username=='' || username==null 
				|| password=='' || password==null)
			{
				$("#add_person_return_message").text("请输入完整信息，备注字段可以不填写");
			}else{
				$.ajax({
					url: "person/addPerson",
					type: "post",
					data: {
						username: username,
						password: password,
						level: level,
						remark: remark
					},
					success: function(response){
						if(response.message=="success"){
							$("#add_person_return_message").text("     添加用户成功");
						}else if(response.message=="fail"){
							$("#add_person_return_message").text("     添加用户失败");
							return;
						}else if(response.message=="user_exists"){
							$("#add_person_return_message").text("该用户原来已存在，可以进入仓库员工管理页面进行管理");
						}
					}
				});
			}
		}
	</script>
</html>