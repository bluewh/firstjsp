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
				<div class="inputform">
					<div class="top-bar">
						<h1>操作提示</h1>
					</div><br>
<%
	Connection conn=null;
	//Statement stmt=null;
	String sDBDriver="com.mysql.jdbc.Driver";
	String sConnStr="jdbc:mysql://localhost:3306/newsdb";
	String username="root";
	String password="infinite";

	String id=null;
	id=request.getParameter("id");
	try{
		Class.forName(sDBDriver);
	}catch(ClassNotFoundException ex){
		System.err.println(ex.getMessage());
	}

	try{
		conn=DriverManager.getConnection(sConnStr,username,password);
		//stmt=conn.createStatement();
		String sql="DELETE FROM user WHERE id=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,id);
		int result=ps.executeUpdate();


		if(result==1){
			response.sendRedirect("manageUser.jsp");
		}else{
			out.println("用户删除数据失败，请联系管理员！");
		}
		out.println("单击<a href='index.jsp'>回到首页</a>");
	}catch(SQLException e1) { out.println(e1);}
	finally
	{
		conn.close();
	}
%>
</div>
</div>
            <div class="blank20"></div>
			<div class="blank10"></div>	
		</div>
		<%@include file="common/bottom.txt"%>
	</body>
</html>