<%@page import="com.warehouse.bean.Userinfo"%>
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
		<div class="div_table">
			<table id="usertable" class="table table-bordered table-hover">
				<tr>
					<th>用户名</th><th>权限</th><th>密码</th><th>备注</th><th>创建时间</th><th>修改时间</th><th>操作</th>
<%-- 					<%
						for(Userinfo user : ){
					%>
					<%
						}
					%> --%>
				</tr>
			</table>
		</div>
	</body>
	<script type="text/javascript">
		function deletePerson(){
			var table=$("#usertable");
			addline.appendTo(table);
		}
	</script>
</html>