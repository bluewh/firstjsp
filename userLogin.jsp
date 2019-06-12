<%@page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>新闻发布系统v2.0</title>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="expires" content="0"/>
		<link rel="stylesheet" type="text/css" href="image/main.css"/>
	</head>
	<body>
	<jsp:include page="common/top.jsp"/>
	<div id="content">
		<div id="sidebar">
			<jsp:include page="common/left.jsp"/>
		</div>
		<div id="main">
			<div class="inputform">
				<form action="doLogin.jsp" method="post">
				用户名：<input type="text" name="username"></input><br><br>
				密&nbsp&nbsp码：<input type="password" name="password"></input><br><br>
				<input type="submit" value="登录"></input>
				<a href="userRegister.jsp">用户注册</a><br>
				</form>
			</div>
		</div>
		<div class="blank20"></div>
		<div class="blank10"></div>			
	</div>
	<%@include file="common/bottom.txt"%>
	</body>
</html>

