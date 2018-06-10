<%@page import="java.util.ArrayList"%>
<%@page import="com.warehouse.bean.Userinfo"%>
<%@ page pageEncoding="utf-8"%>
<%@ page language="java" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<script src="../js/jquery-2.1.1.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<link href="../css/systemLog.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div style="width: 100%; text-align: center;"><h2>系统日志</h2></div>
		<div class="div_table">
			<table id="usertable" class="table table-bordered table-hover">
				<tr>
					<th>操 作 人</th><th>操 作 时 间</th><th>操 作 类 型</th><th>操 作 细 节</th>
				</tr>
				<c:forEach items="${loglist}" var="log">
					<tr>
						<td>${log.operatorName }</td>
						<td><fmt:formatDate value="${log.opreatorTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${log.operationType }</td>
						<td>${log.operationDetail }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</body>
</html>