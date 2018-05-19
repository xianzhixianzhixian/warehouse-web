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
		<link href="../css/goodsAnalyse.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div style="width: 100%; text-align: center;"><h2>物资信息统计</h2></div>
		<div class="div_table">
			<table id="usertable" class="table table-bordered table-hover">
				<tr>
					<th>物资编号</th><th>物资名称</th><th>存放仓库编号</th><th>仓库名称</th><th>已存数量</th>
				</tr>
				<c:forEach items="${warehousegoodslist }" var="warehousegoods">
					<tr>
						<td name="goodsnum">${warehousegoods.goodsNum }</td>
						<td name="goodsname">${warehousegoods.goodsName }</td>
						<td name="extension">${warehousegoods.warehouseNum }</td>
						<td name="price">${warehousegoods.warehouseName }</td>
						<td name="operator">${warehousegoods.containNumber }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</body>
</html>