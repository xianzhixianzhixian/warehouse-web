<%@ page pageEncoding="utf-8"%>
<%@ page language="java" import="com.warehouse.utils.*" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<script src="js/jquery-2.1.1.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<link href="css/managePerson.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" src="js/login.js"></script>
	</head>
	<body>
		<div style="margin: 0px 35%;"><h2>仓库员工管理</h2></div>
		<div class="div_button">
			<button type="button" class="btn btn-default" onclick="add();">添加</button>
			<button type="button" class="btn btn-default">修改</button>
			<button type="button" class="btn btn-default">删除</button>
		</div>
		<div class="div_table">
			<table id="usertable" class="table table-bordered table-hover">
				<tr>
					<th>用户名</th><th>权限</th><th>密码</th><th>备注</th><th>创建时间</th><th>修改时间</th>
				</tr>
			</table>
		</div>
	</body>
	<script type="text/javascript">
		function add(){
			var table=$("#usertable");
			var addline="<tr><td></td><td></td><td></td><td></td><td></td><td></td></</tr>";
			addline.appendTo(table);
		}
	</script>
</html>