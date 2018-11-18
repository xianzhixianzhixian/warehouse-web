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
		<link href="../css/containWarning.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div style="width: 100%; text-align: center;"><h2>库存预警</h2></div>
		<div class="div_table">
			<table id="usertable" class="table table-bordered table-hover">
				<tr>
					<th>物资编号</th><th>物资名称</th><th>存放仓库编号</th><th>仓库名称</th><th>已存数量</th><th>可出库数量</th><th>可入库数量</th><th>仓库总容量</th>
				</tr>
				<c:forEach items="${warehousegoodslist }" var="warehousegoods">
					<tr>
						<td>${warehousegoods.goodsNum }</td>
						<td>${warehousegoods.goodsName }</td>
						<td>${warehousegoods.warehouseNum }</td>
						<td>${warehousegoods.warehouseName }</td>
						<td>${warehousegoods.containNumber }</td>
						<c:if test="${warehousegoods.containNumber > 0}">
							<td>${warehousegoods.containNumber }</td>
						</c:if>
						<c:if test="${warehousegoods.containNumber == 0 }">
							<td style="color: red;">${warehousegoods.containNumber }</td>
						</c:if>
						<c:if test="${warehousegoods.topmost - warehousegoods.containNumber > 0 }">
							<td>${warehousegoods.topmost - warehousegoods.containNumber }</td>
						</c:if>
						<c:if test="${warehousegoods.topmost - warehousegoods.containNumber == 0 }">
							<td style="color: red;">${warehousegoods.topmost - warehousegoods.containNumber }</td>
						</c:if>
						<td>${warehousegoods.topmost }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</body>
</html>