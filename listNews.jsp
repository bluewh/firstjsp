<%@page language="java" contentType="text/html;charset=UTF-8"%>
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
			<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
				<div class="news_list">
					<ul>
						<c:forEach items="${requestScope.newsList}" var="news">
							<li>
								<div class="dd_lm">[国内]</div>
									<div class="dd_bt">
										<a href="dispNews.jsp?id=${news.id}">${news.title}</a>
									</div>
									<div class="db_time">${news.pubtime}</div>
							<li>
							</c:forEach>
					</ul>
				</div>
			</div>
            <div class="blank20"></div>
			<div class="blank10"></div>			
		</div>
		<%@include file="common/bottom.txt"%>
	</body>
</html>



