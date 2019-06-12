<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>新闻发布系统v2.0</title>
		<link rel="stylesheet" type="text/css" href="./image/main.css">
		<script src="js/fun.js"></script>
		
	</head>
	<body>
		<jsp:include page="common/top.jsp"/>
		<div id="content">
			<div id="sidebar">
				<jsp:include page="common/left.jsp"/>
			</div>
			<div id="main">

<%
	Connection conn=null;
	ResultSet rs=null;
	//Statement stmt=null;
	String sql=null;

	String sDBDriver="com.mysql.jdbc.Driver";
	String sConnStr="jdbc:mysql://localhost:3306/newsdb";
	String username="root";
	String password="infinite";

	int id=0;
	String uname=null,upwd=null,gender=null,resume=null;
	uname=(String)session.getAttribute("username");

	try{
		Class.forName(sDBDriver);
	}catch(ClassNotFoundException ex){
		System.err.println(ex.getMessage());
	}

	try{
		conn=DriverManager.getConnection(sConnStr,username,password);
		//stmt=conn.createStatement();
		sql="SELECT * from user where username=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,uname);
		rs=ps.executeQuery();

	if(rs!=null&&rs.next()){
		id=rs.getInt(1);
		upwd=rs.getString("password");
		gender=rs.getString("gender");
		resume=rs.getString("resume");
	}
	}catch(SQLException e1) { out.println(e1);}
	finally
	{
		conn.close();
	}
%>


			<div class="inputform">
				<div class="top-bar">
					<h1>用户管理</h1>
			</div>
			<br/>
			<form action="doModiUser.jsp" method="post">
				<input type="hidden" name="id" value="<%=id %>"/>
				用户名：<input type="text" name="username" value="<%=uname %>"/><br>
				密&nbsp&nbsp&nbsp码：<input type="text" name="password" value="<%=upwd %>"/><br><br>
				性&nbsp&nbsp&nbsp别：
				<%if("male".equals(gender)){%>
				男<input type="radio" value="male" name="gender" checked/>
				女<input type="radio" value="female" name="gender" /><br>
				<%}else{%>
				男<input type="radio" value="male" name="gender" />
				女<input type="radio" value="female" name="gender" checked/><br>
				<%} %>
				个人简介<textarea name="resume" cols="12" rows="6"><%=resume %></textarea><br><br>
				<input type="submit" value="修改"/><br>
			</form>
			</div>
		</div>
		<div class="blank20"></div>	
		<div class="blank10"></div>			
	</div>
	<%@include file="common/bottom.txt"%>
	</body>
</html>

