<%@page language="java" contentType="text/html;charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/fun.js"></script>
<div id="logo">
	<div id="logo_main">
		<span id="myspan" style="float:right; margin: 0;color:#000099;"></span>
				<script>
				    showTime();
				</script>
	</div>
</div>
<div id="menu">
	<div id="user">
		<c:choose>
				<c:when test="${empty sessionScope.username}">
					<a href="userLogin.jsp">用户登录</a>
				</c:when>
				<c:otherwise>
					当前用户：<c:out value="${sessionScope.username}"></c:out>
					|<a href="doLogout.jsp">退出登录</a>					
				</c:otherwise>
		</c:choose>
	</div>
	<div id="menu-list" style="float:right; height:30px; margin:0 20px;">
			<ul style="float:left ; margin:0;">
				<c:if test="${!empty sessionScope.username}">
					<c:choose>
						<c:when test="${sessionScope.username=='admin'}">
							<li><a href="manageNews.jsp">新闻管理</a></li>|
							<li><a href="#">评论管理</a></li>|
							<li><a href="manageUser.jsp">用户管理</a></li>|
						</c:when>
						<c:otherwise>
							<li><a href="#">评论管理</a></li>|
							<li><a href="modiUser.jsp">用户管理</a></li>|
						</c:otherwise>
					</c:choose>
				</c:if>
				<li><a href="index.jsp">首  页</a></li>
			</ul>
		</div>
</div>