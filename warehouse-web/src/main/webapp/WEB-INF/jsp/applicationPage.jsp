<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title> 后台管理页面 </title>
		<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<script src="../js/jquery-2.1.1.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<link href="../css/mainPage.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" src="../js/login.js"></script>
	</head>
	<body>
		<div class="div_left">
			<div class="navbar navbar-duomi navbar-static-top" style="height: 15%;" role="navigation">
				<div class="container-fluid">
					<div class="navbar-header text-center" style="margin:7% 17%;">
						<font class="navbar-brand" id="logo">仓库管理系统</font>
					</div>
				</div>
			</div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-14 ">
						<ul id="main-nav" class="nav nav-tabs nav-stacked">
							<li>
								<a href="#fundationtalInfoSetting" class="nav-header collapsed" data-toggle="collapse">
									<i class="glyphicon glyphicon-th-list"></i> 基本信息管理
									<span class="pull-right glyphicon glyphicon-chevron-down"></span>
								</a>
								<ul id="fundationtalInfoSetting" class="nav nav-list collapse secondmenu" style="height: 0px;">
									<li><a href="${pageContext.request.contextPath}/warehouseManage" target="function_frame"><i class="glyphicon glyphicon-home"></i> 仓库信息管理</a></li>
									<li><a href="#" target="function_frame"><i class="glyphicon glyphicon-briefcase"></i> 物资信息管理</a></li>
									<li><a href="#" target="function_frame"><i class="glyphicon glyphicon-indent-left"></i> 供应商信息管理</a></li>
								</ul>
							</li>
							<li>
								<a href="#searchAndAnalyse" class="nav-header collapsed" data-toggle="collapse">
									<i class="glyphicon glyphicon-zoom-in"></i> 查询与统计
									<span class="pull-right glyphicon glyphicon-chevron-down"></span>
								</a>
								<ul id="searchAndAnalyse" class="nav nav-list collapse secondmenu" style="height: 0px;">
									<li><a href="#" target="function_frame"><i class="glyphicon glyphicon-search"></i> 物资查询</a></li>
									<li><a href="#" target="function_frame"><i class="glyphicon glyphicon-file"></i> 物资统计</a></li>
								</ul>
							</li>
							<li>
								<a href="#goodsManage" class="nav-header collapsed" data-toggle="collapse">
									<i class="glyphicon glyphicon-shopping-cart"></i> 库存操作管理
									<span class="pull-right glyphicon glyphicon-chevron-down"></span>
								</a>
								<ul id="goodsManage" class="nav nav-list collapse secondmenu" style="height: 0px;">
									<li><a href="#" target="function_frame"><i class="glyphicon glyphicon-arrow-down"></i> 物资入库</a></li>
									<li><a href="#" target="function_frame"><i class="glyphicon glyphicon-arrow-up"></i> 物资出库</a></li>
									<li><a href="#" target="function_frame"><i class="glyphicon glyphicon-cloud-download"></i> 物资入库日志</a></li>
									<li><a href="#" target="function_frame"><i class="glyphicon glyphicon-cloud-upload"></i> 物资出库日志</a></li>
									<li><a href="#" target="function_frame"><i class="glyphicon glyphicon-info-sign"></i> 库存预警</a></li>
								</ul>
							</li>
							<li>
								<a href="#systemSetting" class="nav-header collapsed" data-toggle="collapse">
									<i class="glyphicon glyphicon-compressed"></i> 系统管理
									<span class="pull-right glyphicon glyphicon-chevron-down"></span>
								</a>
								<ul id="systemSetting" class="nav nav-list collapse secondmenu" style="height: 0px;">
								<%
									String username=(String)session.getAttribute("username");
									Integer level=(Integer)session.getAttribute("level");
									if(level<=2){
								%>
									<li><a href="${pageContext.request.contextPath }/addPerson" target="function_frame"><i class="glyphicon glyphicon-plus"></i> 仓库员工添加</a></li>
									<li><a href="${pageContext.request.contextPath }/person/managePerson" target="function_frame"><i class="glyphicon glyphicon-user"></i> 仓库员工管理</a></li>
								<%
									}
								%>
									<li><a href="${pageContext.request.contextPath }/changePassword" target="function_frame"><i class="glyphicon glyphicon-certificate"></i> 用户个人密码修改</a></li>
								</ul>
							</li>
							<li>
								<a href="#aboutSystem" class="nav-header collapsed" data-toggle="collapse">
									<i class="glyphicon glyphicon-qrcode"></i> 关于系统
									<span class="pull-right glyphicon glyphicon-chevron-down"></span>
								</a>
								<ul id="aboutSystem" class="nav nav-list collapse secondmenu">
									<li class="text-center">仓库管理系统</li>
									<li class="text-center">@CopyRight 2018</li>
									<li class="text-center">com.warehouse.manager</li>
								</ul>
					    	</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="div_right">
			<div class="div_top">
				<%
					String words="尊敬的";
					if(level==1){
						words+="超级管理员";
					} else if(level==2){
						words+="管理员";
					} else if(level==3){
						words+="用户";
					}
					words=words+username+"，欢迎使用本系统！";
				%>
				<p><%=words  %></p>
			</div>
			<div class="div_bottom">
				<iframe class="jsp_frame" name="function_frame" src=""></iframe>
			</div>
		</div>
		<div style="clear:both;"></div>
	</body>
</html>