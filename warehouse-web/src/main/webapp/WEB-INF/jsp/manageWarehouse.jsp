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
		<div style="width: 100%; text-align: center;"><h2>仓库管理</h2></div>
		<div class="div_table">
			<table id="usertable" class="table table-bordered table-hover">
				<tr>
					<th>编号</th><th>仓库名</th><th>负责人</th><th>负责人联系方式</th><th>所属公司</th><th>合同签订日期</th><th>操作人</th><th>操作时间</th><th>备注</th><th>操作</th>
				</tr>
				<c:forEach items="${warehouselist}" var="warehouse">
					<tr>
						<td name="warehousenum">${warehouse.num }</td>
						<td name="warehousename">${warehouse.name }</td>
						<td name="responser">${warehouse.responser }</td>
						<td name="responserphone">${warehouse.responserPhone }</td>
						<td name="company">${warehouse.company }</td>
						<td name="contractdate">${warehouse.contractDate }</td>
						<td name="operator">${warehouse.operator }</td>
						<td name="operatetime">${warehouse.updateedAt }</td>
						<td name="remark">${warehouse.remark }</td>
						<td>
							<button id="changeInfo">修 改</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</body>
	<script type="text/javascript">
		//动态表格实现
		$(function(){
			$("[id='changeInfo']").click(function(){
				var value = $(this).text()=="修 改"?"确 认":"修 改";
		        
		        $(this).parent().siblings("td").each(function(){ //获取当前其它单元格
		        	inner_text=$(this).find("input:text"); //判断单元格中是否有文本框
		        	if(!inner_text.length){ //沒有文本框则生成一个文本框
						if($(this).attr("name")=="responser"
							|| $(this).attr("name")=="responserphone"
							|| $(this).attr("name")=="remark"){
							$(this).html("<input type='text' class='form-control' value='"+$(this).text()+"' style='width:99%;' />");;
		        		}
		        	}else{
		        		$(this).html(inner_text.val());
		        	}
		        });
		        
		        $(this).text(value); //更改按钮的值
		        if(value=="修 改"){
		        	if(confirm("确定输入的数据无误？")){
			        	
		        		var parent=$(this).parent().parent();
			        	var warehousenum=parent.find("td[name='warehousenum']").text().trim();
			        	var responser=parent.find("td[name='responser']").text().trim();
			        	var responserphone=parent.find("td[name='responserphone']").text();
			        	var remark=parent.find("td[name='remark']").text().trim();
		        		
		        		$.ajax({
		        			type: "post",
			        		url: "updateWarehouse",
		        			data: {
		        				"num": warehousenum,
		        				"responser": responser,
		        				"responserPhone": responserphone,
		        				"remark": remark
			        		},
			        		success: function(response){
			        			if(response.message=="success"){
			        				alert("修改用仓库息成功");
			        			}else if(response.message=="fail"){
			        				alert("修改仓库信息错误");
			        			}
			        		}
			        	});
		        	}
		        }
			});
		});
	</script>
</html>