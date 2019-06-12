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
				request.setCharacterEncoding("utf-8");
				String id=request.getParameter("id");
			%>
			<jsp:useBean id="newsDAO" class="news.beans.NewsDAO" scope="page"/>
			<jsp:useBean id="news" class="news.beans.News" scope="page"/>
			<jsp:setProperty name="news" property="*"/>
			<%
				if(newsDAO.delete(id)){
					out.println("新闻删除成功，单击返回<a href='manageNews.jsp'>新闻管理页面</a>");
				}else{
					out.println("新闻删除失败，请联系管理员！");
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