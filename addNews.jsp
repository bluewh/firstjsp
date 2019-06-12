<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="news.beans.News"%>
<%@page import="news.beans.Newstype"%>
<!DOCTYPE html >
<html>
	<head>
	    <style>
			.inputform{
				width:400px;
				height:320px;
				margin:60px;
				background:#bfdaf5;
				padding:20px;
			}
		</style>
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
			<jsp:useBean id="newstypeDAO" class="news.beans.NewstypeDAO" scope="page"/>
			<%
				ArrayList<Newstype>newstypeList=newstypeDAO.getAllNewstype();
			%>
			<div class="inputform">
				<div class="top-bar">
					<span style="font-size:20px">新闻发布</span>
				</div>
				<form action="doAddNews.jsp" method="post">
					<input type="hidden" name="author" value="<%=session.getAttribute("username")%>"/><br/>
					标题：<input type="text" name="title" id="title"><br/><br/>
					类别：
					<select name="newstype">
						<%
							for(Newstype newstype:newstypeList){
						%>
							<option value="<%=newstype.getId()%>">
								<%=newstype.getNewstype()%>
							</option>
						<%}%>
					</select>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					关键字：<input type="text" name="keyword" id="keyword"><br/><br/>
					内容：<textarea name="content" cols="25" rows="5"></textarea><br/><br/>
					<input type="submit" value="发布"/>
				</form>
			</div>
		</div>
	  </div>
	  	 <%@include file="common/bottom.txt"%> 
	 </body>
</html>