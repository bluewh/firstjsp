<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.sql.*"%>
<div class="inputform">
	<div class="top-bar">
		<h1>操作提示</h1>
	</div>
<%
	Connection conn=null;
	//Statement stmt=null;
	String sDBDriver="com.mysql.jdbc.Driver";
	String sConnStr="jdbc:mysql://localhost:3306/newsdb";
	String username="root";
	String password="infinite";

	String id=null,uname=null,upwd=null,gender=null,resume=null;
	request.setCharacterEncoding("UTF-8");
	id=request.getParameter("id");
    uname=request.getParameter("username");
	upwd=request.getParameter("password");
	gender=request.getParameter("gender");
	resume=request.getParameter("resume");

	try{
		Class.forName(sDBDriver);
	}catch(ClassNotFoundException ex){
		System.err.println(ex.getMessage());
	}

	try{
		conn=DriverManager.getConnection(sConnStr,username,password);
		//stmt=conn.createStatement();
		String sql="UPDATE user SET username=?,password=?,gender=?,resume=? where id=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,uname);
		ps.setString(2,upwd);
		ps.setString(3,gender);
		ps.setString(4,resume);
		ps.setString(5,id);
		int result=ps.executeUpdate();

		if(result==1){
			out.println("用户修改成功，请继续使用。");
		}else{
			out.println("用户修改失败，请联系管理员！");
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
	</body>
</html>