<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.sql.*"%>
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
<div class="news_list">
	<div class="top-bar">
		<h1>用户管理</h1>
	</div><br>
	<div class="table">
		<table class="listening" cellpadding="0" cellspacing="0">
			<tr>
				<th class="first" width="40">序号</th>
				<th>用户名</th>
				<th>删除</th>
			</tr>
<%
	Connection conn=null;
	ResultSet rs=null;
	//Statement stmt=null;
	String sDBDriver="com.mysql.jdbc.Driver";
	String sConnStr="jdbc:mysql://localhost:3306/newsdb";
	String username="root";
	String password="infinite";

	try{
		Class.forName(sDBDriver);
	}catch(ClassNotFoundException ex){
		System.err.println(ex.getMessage());
	}

	try{
		conn=DriverManager.getConnection(sConnStr,username,password);
		//stmt=conn.createStatement();
		String sql="select * from user";
		PreparedStatement ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();

		if(rs!=null){
			int count=0;
			while(rs.next()){
				count++;
				int id=rs.getInt("id");
				String uname=rs.getString("username");
			%>
			<tr>
			<td><%=count%></td>
			<td><%=uname%></td>
			<td>
				<a href="deleteUser.jsp?id=<%=id%>" onclick="return confirm('确定删除吗？')">
				<img src="image/hr.jpg" width="16" height="16" alt="删除"/></a>
			</td>
			</tr>
		<%    }
			}
		} catch (SQLException e1){
			out.println(e1);
		}finally
	{
		conn.close();
	}%>
	</table>
	</div>
</div>				
		</div>
		<div class="blank20"></div>
		<div class="blank10"></div>			
	</div>
	<%@include file="common/bottom.txt"%>
	</body>
</html>

