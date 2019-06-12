<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="news.beans.News"%>
<%@page import="news.beans.NewsDAO"%>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="image/main.css"/>
		<link rel="stylesheet" type="text/css" href="image/dispnew.css"/>
		<title>新闻发布系统V2.0</title>
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
				String id=request.getParameter("id");
				//newsDAO.increaseAc(id);
				News news=newsDAO.getByID(id);
			%>
			<div class="news_disp">
				<span style="font-size:20px;text-align:center;display:block;"><%=news.getTitle()%></span><br/>
				<div class="news_time">
					<span class="left-t"><%=news.getPubtime()%></span>
					<span class="right-t">(单击：<%=news.getAcnumber()%>)
						<img src="image/message.png" width="16px" height="16px"/>
						<a href="#">查看评论</a>
					</span>
					<div class="clear"></div>
				</div>
				<hr align="center" width=480px style="border:1px dashed;color:#bfdaf5;">
				<div class="left_zw" style="position:relative">
					<%=news.getContent()%>
				</div>
                <hr align="center" width=480px style="border:1px dashed;color:#bfdaf5;">
				<div class="div624 border-top-darshd">
					<h4 class="padding-left20" style="margin-top:0px;color:rgb(30,80,162);">
						<img src="image/relate.png" width="16px" height="16px"/>&nbsp&nbsp 相关新闻
					</h4>
					<ul class="padding-left20" style="margin-top:-20px;">
						<%
							//request.setAttribute("relateNews",newsDAO.getRelate(id));
						%>
						<c:forEach items="${requestScope.relateNews}" var="rnews">
							<li><a href="dispNews.jsp?id=${rnews.id}">${rnews.title}</a></li>
						</c:foreach>
					</ul>
				</div>
			</div>
		</div>
	  </div>
	  	 <%@include file="common/bottom.txt"%> 
	</body>
</html>