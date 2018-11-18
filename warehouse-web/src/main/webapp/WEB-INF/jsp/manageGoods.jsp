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
		<link href="../css/manageGoods.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div style="width: 100%; text-align: center;"><h2>物资信息管理</h2></div>
		<div class="div_table">
			<table id="usertable" class="table table-bordered table-hover">
				<tr>
					<th>物资编号</th><th>物资名称</th><th>扩展配件</th><th>单价（人名币/元）</th><th>操作人</th><th>操作时间</th><th>备注</th><th>操作</th>
				</tr>
				<c:forEach items="${goodslist}" var="goods">
					<tr>
						<td name="goodsnum">${goods.num }</td>
						<td name="goodsname">${goods.name }</td>
						<td name="extension">${goods.extendsParts }</td>
						<td name="price">${goods.price }</td>
						<td name="operator">${goods.operator }</td>
						<td name="operationdate"><fmt:formatDate value="${goods.updatedAt }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td name="remark">${goods.remark }</td>
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
						if($(this).attr("name")=="extension"
							|| $(this).attr("name")=="price"
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
			        	var goodsnum=parent.find("td[name='goodsnum']").text().trim();
		    			var extension=parent.find("td[name='extension']").text().trim();
		    			var price=parent.find("td[name='price']").text().trim();
		    			var remark=parent.find("td[name='remark']").text().trim();
		    			$.ajax({
		        			type: "post",
			        		url: "updateGoods",
		        			data: {
		        				"num": goodsnum,
			        			"extendsParts": extension,
			        			"price": price,
			        			"remark": remark
			        		},
			        		success: function(response){
			        			if(response.message=="success"){
			        				alert("修改商品信息成功");
			        			}else if(response.message=="fail"){
			        				alert("修改商品信息错误");
			        			}
			        		}
			        	});
		        	}
		        }
			});
		});
	</script>
</html>