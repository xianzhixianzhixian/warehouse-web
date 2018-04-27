<%@ page pageEncoding="utf-8"%>
<html>
	<head>
		<title>仓储管理系统登陆页面</title> 
		<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<link href="css/login.css" rel="stylesheet" type="text/css"/>
		<script src="js/jquery-1.4.2.min.js"></script>
	</head>
	<body>
		<div class="login panel panel-default">
			<div class="login_internal">
				<form action="/login" method="POST">
					<h2 class="text-center">登陆页面</h2>
					<div class="form-group">
						<label for="inputUsername">用户名</label>
						<input type="text" class="form-control" id="inputUsername" placeholder="用户名"  required autofocus>
					</div>
					<div class="form-group">
						<label for="inputPassword">密码</label>
						<input type="password" class="form-control" id="inputPassword" placeholder="密码"  required>
					</div>
					<div class="col-sm-offset-1 col-sm-4">
					    <button type="submit" class="btn btn-primary btn-block"
					        style="font-size:16px;font-weight: 700;" id="submit">登
					        录</button>
					</div>
					<div class="col-sm-offset-2 col-sm-4">
					    <button type="submit" class="btn btn-default btn-block"
					        style="font-size:16px;font-weight: 700;" id="reset">取消</button>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>