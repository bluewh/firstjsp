<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="news.beans.News"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="image/main.css"/>
		
		<title>新闻发布系统V2.0</title>
		<style>
		a{
			list-style:none;
		}
		</style>
	</head>
	<body>
	  <jsp:include page="common/top.jsp"/>
      <div id="content">
		<div id="sidebar">
		  <jsp:include page="common/left.jsp"/>
		</div>
		<div id="main">
			<jsp:useBean id="newsDAO" class="news.beans.NewsDAO" scope="page"/>
			<%
		 		ArrayList<News>newsList=newsDAO.getAllNews();
				request.setAttribute("newsList",newsList);
			%>
			<div class="news_list">
		 		<div class="top-bar">
					<h1 style="font-size:25px">新闻管理</h1>
					<span style="margin-left:450px;">
						<a href="addNews.jsp">发布新闻</a>
					</span>
				</div>
				<div class="table">
					<table class="listing" cellpadding="3" cellsapcing="0" border="1">
						<tr>
							<th class="first" width="40">序号</th>
							<th>新闻标题</th>
							<th>发布时间</th>
							<th>修改</th>
							<th>删除</th>
						</tr>
					    <c:forEach var="news" items="${newsList}" varStatus="status">
					    <tr>
							<td>${status.count}</td>
							<td class="title"><a href="dispNews.jsp?id=${news.id}">${news.title}</a></td>
							<td class="ntime">&nbsp;&nbsp;${news.pubtime}&nbsp;&nbsp;</td>
							<td><a href="modiNews.jsp?id=${news.id}" list-style:none;>修改</a></td>
							<td><a href="deleteNews.jsp?id=${news.id}" list-style:none;>删除</a></td>
						</tr>
						</c:forEach>	
					</table>
				</div>
			</div>
		 </div>
	  </div>
	  <%@include file="common/bottom.txt"%> 
	</body>
</html>