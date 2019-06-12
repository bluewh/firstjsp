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
				<div class="top-bar">
					<h1>用户注册</h1>
				</div>
				<br>
				<form action="userVeriRegister.jsp" method="popst">
				用户名：<input type="text" name="username"></input><br><br>
				密&nbsp&nbsp码：<input type="password" name="password"></input><br><br>
				性&nbsp&nbsp别：男<input type="radio" value="male" name="gender">
								   女<input type="radio" value="female" name="gender"><br>
				个人简介<textarea name="resume" cols="12" rows="6"></textarea>
				<br><input type="submit" value="提交"></input><br/>
				</form>
			</div>
		</div>
		<div class="blank20"></div>
		<div class="blank10"></div>			
	</div>
	<%@include file="common/bottom.txt"%>
	</body>
</html>

