<%@page contentType="text/html;charset=UTF-8"%>
<%
	String username=(String)session.getAttribute("username");
	if(username==null)
	{
		Cookie[]cookies=request.getCookies();
		String autologin=null;
		if(cookies!=null){
			for(int i=0;i<cookies.length;i++){
				if("autologin".equals(cookies[i].getName())){
					autologin=cookies[i].getValue();
					break;
				}
			}
		}
		if(autologin==null){
			response.sendRedirect("userLogin.jsp");
		}else{
			String[] parts=autologin.split("-");
			String name=parts[0];
			String pwd=parts[1];
			if(!(("tom".equals(name)&&"123".equals(pwd))||("admin".equals(name)&&"456".equals(pwd)))){
				response.sendRedirect("userLogin.jsp");
			}else{
				session.setAttribute("username",name);
			}
		}
	}
%>