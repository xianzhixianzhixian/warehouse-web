<%@page import="java.util.ArrayList"%>
<%@page import="com.warehouse.bean.Userinfo"%>
<%@ page pageEncoding="utf-8"%>
<%@ page language="java" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<script src="../js/jquery-2.1.1.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<link href="../css/manageWarehouse.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div style="width: 100%; text-align: center;"><h2>仓库员工管理</h2></div>
		<div class="div_table">
			<table id="usertable" class="table table-bordered table-hover">
				<tr>
					<th>用 户 名</th><th>权 限</th><th>密 码</th><th>备 注</th><th>创 建 时 间</th><th>修 改 时 间</th><th>操 作</th>
				</tr>
			</table>
		</div>
	</body>
	<script type="text/javascript">
	</script>
</html>