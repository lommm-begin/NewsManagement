<%
if (session.getAttribute("allist") == null) {
    response.sendRedirect(request.getContextPath() + "/jsp/index.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/admin/error.jsp"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach" import="java.util.*" import="com.AllShow" import="web.user.ShowNew" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻中心-搜索结果</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/search.css">

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
				<li><a href="${pageContext.request.contextPath}/jsp/allNew.jsp" class="header-text">所有新闻</a></li>
				<li><a href="${pageContext.request.contextPath}/jsp/login.jsp" class="header-text">后台管理</a></li>
			</ul>
		</div>
		<div style="clear:both;"></div>
	</header>
	<div class="center"">
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
				<div class="all-time all first">发布时间</div>
			</div>
			<div class="row two">
				<div class="all-title all a-two"><a href="${pageContext.request.contextPath}/Detail?id=<%=all.getId() %>" class="detail a-two"><%=all.getTitle() %></a></div>
				<div class="all-author all a-two"><%=all.getAuthor() %></div>
				<div class="all-time all a-two"><%=all.getTime() %></div>
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