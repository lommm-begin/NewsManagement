<%
	String adminname = (String)session.getAttribute("adminname");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/admin/error.jsp"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach" import="java.util.*" import="com.AllShow" import="web.user.ShowNew" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻中心-管理员-搜索结果</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/search.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login-message.css">
</head>
<body>
	<header>
		<span class="span-head">新闻管理系统</span>
		<div class="header-search">
			<form class="header-form" action="${pageContext.request.contextPath}/ShowNew">
				<div class="search">
					<div>
						<input type="text" class="text-search" name="id" maxlength="50">
					</div>
					<div>
						<input type="submit" value="搜索" class="butt">
					</div>
				</div>	
			</form>
		</div>
		<div class="ulf">
			<ul>
				<li><a href="${pageContext.request.contextPath}/admin/main.jsp" class="header-text fresh">所有新闻</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/addNew.jsp" class="header-text">添加新闻</a></li>
				<li><a href="${pageContext.request.contextPath}/jsp/login.jsp" class="header-text">系统登录</a></li>
				<li><a href="${pageContext.request.contextPath}/jsp/index.jsp" class="header-text">新闻主页</a></li>
			</ul>
		</div>
		<div style="clear:both;"></div>
	</header>
	<div class="big-left">
		<div class="admin-message">
			<div class="hello">欢迎你:</div>
			<span class="adminname"><%=adminname %></span>
			<div class="box"></div>
			<div class="login-time"><a href="${pageContext.request.contextPath}/Exit">退出登录</a></div>
		</div>
	</div>
	<div class="center" style="margin-left: 180px;">
		<!-- 这里写内容 -->
		<div class="all-row">
			<% 
    // 获取从Servlet传来的allist
    		List<AllShow> allist = (List<AllShow>) session.getAttribute("allist");
			
			if (allist != null && allist.size() != 0) {
				for (AllShow all : allist) {
			%>
			<div class="show-search first-div all">
				您搜索的新闻关键字是 <span class="search-result"><%=all.getId() %></span>, 搜索结果如下：
			</div>
			<div class="row one">
				<div class="all-title all first">新闻标题</div>
				<div class="all-author all first">作者信息</div>
				<div class="all-time all first admin-time">发布时间</div>
				<div class="all-del all first">是否删除</div>
				<div class="all-edit all first">是否编辑</div>
			</div>
			<div class="row two">
				<div class="all-title all"><a href="${pageContext.request.contextPath}/Detail?id=<%=all.getId() %>" class="detail a-two"><%=all.getTitle() %></a></div>
				<div class="all-author all a-two"><%=all.getAuthor() %></div>
				<div class="all-time all admin-time a-two"><%=all.getTime() %></div>
				<div class="all-del all a-two"><a href="${pageContext.request.contextPath}/DelNew?id=<%=all.getId()%>" class="detail">删除</a></div>
				<div class="all-edit all a-two"><a href="${pageContext.request.contextPath}/admin/editNew.jsp?id=<%=all.getId()%>" class="detail">编辑</a></div>	
			</div>
			<%
				} 
			}
			else {
				out.println("<div class=\"show-search first-div all\">您搜索的新闻关键字不存在！</div>");
				}
			%>
		</div>
	</div>
</body>
</html>