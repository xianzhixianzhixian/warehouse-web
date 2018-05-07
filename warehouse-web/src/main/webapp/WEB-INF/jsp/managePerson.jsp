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
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/bootstrap-table.min.css">
		<!-- Latest compiled and minified JavaScript -->
		<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/bootstrap-table.min.js"></script>
		<!-- Latest compiled and minified Locales -->
		<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/locale/bootstrap-table-zh-CN.min.js"></script>
	</head>
	<body>
		<div style="width: 100%; text-align: center;"><h2>仓库员工管理</h2></div>
		<div class="div_table">
			<table id="usertable" class="table table-bordered table-hover">
				<tr>
					<th>用户名</th><th>权限</th><th>密码</th><th>备注</th><th>创建时间</th><th>修改时间</th><th>操作</th>
				</tr>
				<tr >
					<td>admin</td><td name="level">管理员</td><td>123456</td><td>超级管理员</td><td>31321</td><td>132654</td>
					<td>
						<button id="changeInfo">修改</button> <button id="deleteInfo">删除</button>
					</td>
				</tr>
			</table>
		</div>
	</body>
	<script type="text/javascript">
		//动态表格实现
		$("#changeInfo").on("click",function(){
			var value = $(this).text()=="修改"?"确认":"修改";
	        
	        $(this).parent().siblings("td").each(function(){ //获取当前其它单元格
	        	inner_text=$(this).find("input:text"); //判断单元格中是否有文本框
	        	if(!inner_text.length){ //沒有文本框则生成一个文本框
	        		if($(this).attr("name")=="level"){
	        			if($(this).text()=="管理员"){
	        				$(this).html("<input type='radio' name='levelRadios' value='2' checked='checked'/>管理员"
		        					+	"<input type='radio' name='levelRadios' value='3' />普通用户")
	        			}else if($(this).text()=="普通用户"){
	        				$(this).html("<input type='radio' name='levelRadios' value='2' />管理员"
		        					+	"<input type='radio' name='levelRadios' value='3' checked='checked' />普通用户")
	        			}else if(value=="修改" && $(this).find("input:radio").size()>0){
	        				var level=$(this).find("input[name='levelRadios']:checked").val();
	        				if(level=="2"){
	        					$(this).html("管理员");
	        				}else if(level=="3"){
	        					$(this).html("普通用户");
	        				}
	        			}
	        		}else{
	        			$(this).html("<input type='text' class='form-control' value="+$(this).text()+" style='width:99%;' />");
	        		}
	        	}else{
	        		$(this).html(inner_text.val());
	        	}
	        });
	        
	        $(this).text(value); //更改按钮的值
		});
		
		$("#deleteInfo").click(function(){
			if(confirm("确定删除该用户？")){
				alert("该用户已删除");
				var rowindex=$(this).parent().parent().remove();
			}else{
				
			}
		});
	</script>
</html>