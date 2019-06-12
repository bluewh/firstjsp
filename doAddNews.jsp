<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="news.beans.News"%>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="image/main.css"/>
		
		<title>新闻发布系统V2.0</title>
	</head>
	<body>
	  <jsp:include page="common/top.jsp"/>
      <div id="content">
		<div id="sidebar">
		  <jsp:include page="common/left.jsp"/>
		</div>
		<div id="main">
			<div class="top-bar">
				<span style="font-size:20px">操作提示</span>
			</div>
			<br/>
			<%
				request.setCharacterEncoding("UTF-8");
			%>
			<jsp:useBean id="newsDAO" class="news.beans.NewsDAO" scope="page"/>
			<jsp:useBean id="news" class="news.beans.News" scope="page"/>
			<jsp:setProperty name="news" property="*"/>
			<%
				if(newsDAO.insert(news)){
					out.println("新闻发布成功，单击返回<a href='manageNews.jsp'>新闻管理页面</a>");
				}else{
					out.println("新闻发布失败，请联系管理员！");
				}
			%>
		</div>
	  </div>
	  	 <%@include file="common/bottom.txt"%> 
	 </body>
</html>