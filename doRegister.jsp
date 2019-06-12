<%@page contentType="text/html;charset=UTF-8"%>
<jsp:useBean id="userDAO" class="news.beans.UserDAO" scope="page" />
<jsp:useBean id="user" class="news.beans.User" scope="page" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:setProperty name="user" property="*" />
<%
	if(userDAO.addUser(user)){
		out.println("用户注册成功，请登录使用。");
	}else{
			out.println("用户注册失败，请联系管理员！");
	}
	out.println("<a href='userLogin.jsp'>登录</a>");
%>