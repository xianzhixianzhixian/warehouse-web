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
		<link href="../css/managePerson.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div style="width: 100%; text-align: center;"><h2>仓库员工管理</h2></div>
		<div class="div_table">
			<table id="usertable" class="table table-bordered table-hover">
				<tr>
					<th>用 户 名</th><th>权 限</th><th>密 码</th><th>备 注</th><th>创 建 时 间</th><th>修 改 时 间</th><th>操 作</th>
				</tr>
				<c:forEach items="${userlist}" var="user">
					<tr>
						<td name="username">${user.username }</td>
						<td name="level">
							<c:set var="level" scope="page" value="${user.level }"/>
							<c:choose>
								<c:when test="${level==2 }">管理员</c:when>
								<c:when test="${level==3 }">普通用户</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
						</td>
						<td name="password"></td>
						<td name="remark">${user.remark }</td>
						<td name="createAt"><fmt:formatDate value="${user.createdAt }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td name="updateAt"><fmt:formatDate value="${user.updatedAt }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
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
						if($(this).attr("name")=="username"
							|| $(this).attr("name")=="createAt"
							|| $(this).attr("name")=="updateAt"){
							return true;
		        		}	        		
		        		if($(this).attr("name")=="level"){
		        			if($(this).text().trim()=="管理员"){
		        				$(this).html("<input type='radio' name='levelRadios' value='2' checked='checked'/>管理员<br>"
			        					+	"<input type='radio' name='levelRadios' value='3' />普通用户")
		        			}else if($(this).text().trim()=="普通用户"){
		        				$(this).html("<input type='radio' name='levelRadios' value='2' />管理员<br>"
			        					+	"<input type='radio' name='levelRadios' value='3' checked='checked' />普通用户")
		        			}else if(value=="修 改" && $(this).find("input:radio").size()>0){
		        				var level=$(this).find("input[name='levelRadios']:checked").val();
		        				if(level=="2"){
		        					$(this).html("管 理 员");
		        				}else if(level=="3"){
		        					$(this).html("普 通 用 户");
		        				}
		        			}
		        		}else{
		        			if($(this).attr("name")=="password"){
		        				$(this).html("<input type='text' class='form-control' style='width:99%;' />");
		        			}else{
		        				$(this).html("<input type='text' class='form-control' value='"+$(this).text()+"' style='width:99%;' />");
		        			}
		        		}
		        	}else{
		        		$(this).html(inner_text.val());
		        	}
		        });
		        
		        $(this).text(value); //更改按钮的值
		        if(value=="修 改"){
		        	if(confirm("确定输入的数据无误？")){
			        	var parent=$(this).parent().parent();
			        	var username=parent.find("td[name='username']").text().trim();
			        	var level=parent.find("td[name='level']").text().trim();
			        	var password=parent.find("td[name='password']").text();
			        	var remark=parent.find("td[name='remark']").text().trim();
			        	
			        	if(level=="管 理 员"){
			        		level=2;
			        	}else if(level=="普 通 用 户"){
			        		level=3;
			        	}
			        	
		        		$.ajax({
		        			type: "post",
			        		url: "updateUserinfo",
		        			data: {
			        			"username": username,
			        			"level": level,
			        			"password": password,
			        			"remark": remark
			        		},
			        		success: function(response){
			        			if(response.message=="success"){
			        				alert("修改用户信息成功");
			        			}else if(response.message=="fail"){
			        				alert("修改用户信息错误");
			        			}else if(response.message=="passwd_same"){
			        				alert("输入的新密码与原密码相同，用户信息未更新");
			        			}
			        		}
			        	});
		        	}
		        }
			});
		});
		
		$(function(){
			$("[id='deleteInfo']").click(function(){
				if(confirm("确定删除该用户？")){
					var parent=$(this).parent().parent();
		        	var username=parent.find("td[name='username']").text().trim();
		        	$.ajax({
		        		type: "post",
		        		url: "deletePerson",
		        		data: {
		        			"username": username
		        		},
		        		success: function(response){
		        			if(response.message=="success"){
		        				alert("删除用户信息成功");
		        			}else if(response.message=="fail"){
		        				alert("删除用户信息错误");
		        			}
		        		}
		        	});
					var rowindex=$(this).parent().parent().remove();
				}
			});
		});
	</script>
</html>