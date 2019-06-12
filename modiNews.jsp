<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="news.beans.News"%>
<%@page import="news.beans.Newstype"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="image/main.css">
		
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
			<jsp:useBean id="newstypeDAO" class="news.beans.NewstypeDAO" scope="page"/>
			<%
				ArrayList<Newstype>newstypeList=newstypeDAO.getAllNewstype();
				String id=request.getParameter("id");
				News news=newsDAO.getByID(id);
				request.setAttribute("newstypeList",newstypeList);
				request.setAttribute("news",news);
			%>
			<div class="inputform">
				<div class="top-bar">
					<h1>新闻修改</h1>
				</div>
				<br/>
				<form action="doModiNews.jsp" method="post">
					<input type="hidden" name="author" value="${sessionScope.username}">
					<input type="hidden" name="id" value="${news.id}"><br/>
					<input type="hidden" name="acnumber" value="${news.acnumber}"><br/>
					<input type="hidden" name="pubtime" value="${news.pubtime}"><br/>
					标题：<input type="text" name="title" id="title" value="${news.title}"><br/><br/>
					类别：<select name="newstype">
							<c:forEach var="newstype" items="${newstypeList}">
								<c:choose>
									<c:when test="${newstype.id==news.newstype}">
										<option value="${newstype.id}" selected="selected">
											${newstype.newstype}
										</option>
									</c:when>
									<c:otherwise>
										<option value="${newstype.id}">${newstype.newstype}
										</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					      </select>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					关键字：<input type="text" name="keyword" id="keyword" value="${news.keyword}"><br/><br/>
					内容：<textarea name="content" cols="25" rows="5">${news.content}</textarea><br/><br/>
					&nbsp&nbsp&nbsp&nbsp&nbsp
					<input type="submit" value="修改">
				</form>
			</div>
		</div>
	 </div>
	</body>
</html>