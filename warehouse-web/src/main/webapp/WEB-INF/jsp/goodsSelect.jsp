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
		<link href="../css/goodsSelect.css" rel="stylesheet" type="text/css">
		<script src="../js/bootstrap-select.min.js"></script>
		<link href="../css/bootstrap-select.min.css" rel="stylesheet" type="text/css"/>
		<link href="../css/addGoodsIntoWarehouse.css" rel="stylesheet" type="text"/>
	</head>
	<body>
		<div style="width: 100%; text-align: center;"><h2>物资查询</h2></div>
		<div class="div_select">
			<form>
				<div class="form-group">
					<div class="input-group col-md-3" style="margin-top:10px positon:relative">
						<input id="words" type="text" class="form-control" placeholder="请输入关键字">
						<span class="input-group-btn">
							<select id="selectType" name="selecttype" class="selectpicker">
								<option value="specific">精确查找</option>
								<option value="approximate">模糊查找</option>
							</select>
						</span> 
						<span class="input-group-btn">
						   <button type="button" class="btn btn-primary" onclick="selectGoods();">查找</button>  
						   <button type="reset" class="btn btn-primary" style="margin-left:3px">重置</button>  
						</span>  
					</div>
				</div>
			</form>
		</div>
		<div class="div_table">
			<table id="goodstable" class="table table-bordered table-hover">
				<tr>
					<th>编号</th><th>名称</th><th>扩展配件</th><th>单价</th><th>备注</th>
				</tr>
				<c:forEach items="${goodslist}" var="goods">
					<tr>
						<td>${goods.num }</td>
						<td>${goods.name }</td>
						<td>${goods.extendsParts }</td>
						<td>${goods.price }</td>
						<td>${goods.remark }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</body>
	<script type="text/javascript">
		function selectGoods(){
			var words=$("#words").val();
			var type=$("#selectType").find("option:selected").val();
			$("#goodstable  tr:not(:first)").html("");
			$.ajax({
				"url": "selectGoodsByType",
				"type": "get",
				"data": {
					"words": words,
					"type": type
				},
				success: function(response){
					if(response.message=="success"){
						goodslist=response.object;
						
						for(var i=0;i<goodslist.length;i++){
							$("#goodstable").append("<tr><td>"+goodslist[i].num+
													"</td><td>"+goodslist[i].name+
													"</td><td>"+goodslist[i].extendsParts+
													"</td><td>"+goodslist[i].price+
													"</td><td>"+goodslist[i].remark+
													"</td></tr>");
						}
					}
				}
			});
		}
	</script>
</html>