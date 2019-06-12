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
			<div class="verifyform">
				<div class="top-bar">
					<h1>注册确认</h1>
				</div><br>
				<%
					request.setCharacterEncoding("UTF-8");
					String uName=request.getParameter("username");
					String uPwd=request.getParameter("password");
					String uGender=request.getParameter("gender");
					String uResume=request.getParameter("resume");
				%>
				<table>
					<tr>
						<td>用户名：</td><td><%=uName %></td>
					</tr>
					<tr>
						<td>密码：</td><td><%=uPwd %></td>
					</tr>
					<tr>
						<td>性别：</td><td><%=uGender %></td>
					</tr>
					<tr>
						<td>个人简介：</td><td><%=uResume %></td>
					</tr>
				</table>

				<form action="doRegister.jsp" method="post">
					<div style="display:none">
					  用户名：<input type="text" name="username" value="<%=uName%>"/><br>
					  密&nbsp&nbsp码：<input type="text" name="password" value="<%=uPwd%>"/><br>
					  性&nbsp&nbsp别：<input type="text" name="gender" value="<%=uGender%>"/><br>
					  个人简介<br> <textarea name="resume" cols="20" rows="6"><%=uResume%></textarea>
					  <br><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>
					  <input class="btn" type="submit" value="注册"></input>
					  <a href="javascript:history.go(-1)">返回</a><br>
				</form>
			</div>
		</div>
		<div class="blank20"></div>
		<div class="blank10"></div>			
	</div>
	<%@include file="common/bottom.txt"%>
	</body>
</html>

