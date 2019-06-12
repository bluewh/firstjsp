<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page language="java" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" href="image/mainn.css">
		<link rel="stylesheet" type="text/css" href="image/normalize.css"/>
		<script src="js/fun.js"></script>
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
			<jsp:include page="common/right.jsp"/>
			    
			</div>
            <div class="blank20"></div>
			<div class="blank10"></div>			
		</div>
		<%@include file="common/bottom.txt"%>
	</body>
</html>