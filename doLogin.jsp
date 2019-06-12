<%@page contentType="text/html;charset=UTF-8"%>
<jsp:useBean id="userDAO" class="news.beans.UserDAO" scope="page" />
<%
	String uName=request.getParameter("username");
	String upwd=request.getParameter("password");
	//out.print(username);
	if(userDAO.queryByNamePwd(uName,upwd)){
		session.setAttribute("username",uName);
		response.sendRedirect("index.jsp");
		
	}
	else{
		response.sendRedirect("userLogin.jsp");
	}
%>