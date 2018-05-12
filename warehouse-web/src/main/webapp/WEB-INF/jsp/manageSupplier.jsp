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
		<link href="../css/manageSupplier.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div style="width: 100%; text-align: center;"><h2>仓库员工管理</h2></div>
		<div class="div_table">
			<table id="usertable" class="table table-bordered table-hover">
				<tr>
					<th>供应商编号</th><th>供应商名称</th><th>对接人</th><th>对接人联系方式</th><th>负责人</th><th>负责人联系方式</th><th>操作人</th><th>操作时间</th><th>备注</th><th>操作</th>
				</tr>
				<c:forEach items="${supplierlist}" var="supplier">
					<tr>
						<td name="suppliernum">${supplier.num }</td>
						<td name="suppliername">${supplier.name }</td>
						<td name="receiver">${supplier.receiver }</td>
						<td name="receiverphone">${supplier.receiverPhone }</td>
						<td name="responser">${supplier.responser }</td>
						<td name="responserphone">${supplier.responserPhone }</td>
						<td name="operator">${supplier.operator }</td>
						<td name="operatetime">${supplier.updatetime }</td>
						<td name="remark">${supplier.remark }</td>
						<td>
							<button id="changeInfo">修 改</button> <button id="deleteInfo">删 除</button>
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
						if($(this).attr("name")=="receiver"
							|| $(this).attr("name")=="receiverphone"
							|| $(this).attr("name")=="responser"
							|| $(this).attr("name")=="responserphone"
							|| $(this).attr("name")=="remark"){
							$(this).html("<input type='text' class='form-control' value='"+$(this).text()+"' style='width:99%;' />");
		        		}
		        	}else{
		        		$(this).html(inner_text.val());
		        	}
		        });
		        
		        $(this).text(value); //更改按钮的值
		        if(value=="修 改"){
		        	if(confirm("确定输入的数据无误？")){
		        		var parent=$(this).parent().parent();
			        	var suppliernum=parent.find("td[name='suppliernum']").text().trim();
		    			var receiver=parent.find("td[name='receiver']").text().trim();
		    			var receiverphone=parent.find("td[name='receiverphone']").text().trim();
		    			var repsonser=parent.find("td[name='responser']").text().trim();
		    			var responserphone=parent.find("td[name='responserphone']").text().trim();
		    			var remark=parent.find("td[name='remark']").text().trim();
		    			$.ajax({
		        			type: "post",
			        		url: "updateSupplier",
		        			data: {
		        				"num": suppliernum,
			        			"receiver": receiver,
			        			"receiverPhone": receiverphone,
			        			"responser": repsonser,
			        			"responserPhone": responserphone,
			        			"remark": remark
			        		},
			        		success: function(response){
			        			if(response.message=="success"){
			        				alert("修改供应商信息成功");
			        			}else if(response.message=="fail"){
			        				alert("修改供应商信息错误");
			        			}
			        		}
			        	});
		        	}
		        }
			});
		});
		
		$(function(){
			$("[id='deleteInfo']").click(function(){
				if(confirm("确定删除该供应商？")){
					var parent=$(this).parent().parent();
		        	var suppliernum=parent.find("td[name='suppliernum']").text().trim();
		        	$.ajax({
		        		type: "post",
		        		url: "deleteSupplier",
		        		data: {
		        			"num": suppliernum
		        		},
		        		success: function(response){
		        			if(response.message=="success"){
		        				alert("删除供应商信息成功");
		        			}else if(response.message=="fail"){
		        				alert("删除供应商信息错误");
		        			}
		        		}
		        	});
					var rowindex=$(this).parent().parent().remove();
				}
			});
		});
	</script>
</html>