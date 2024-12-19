<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach" import="java.util.*" import="com.AllShow"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/admin/error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻中心-所有新闻</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>
	<header>
		<span class="span-head">新闻管理系统</span>
		<div class="header-search">
			<form class="header-form" action="${pageContext.request.contextPath}/ShowNew">
				<div class="search">
					<div>
						<input type="text" class="text-search"  name="id" maxlength="50">
					</div>
					<div>
						<input type="submit" value="搜索" class="butt">
					</div>
				</div>	
			</form>
		</div>
		<div class="ulf">
			<ul>
				<li><a href="${pageContext.request.contextPath}/jsp/allNew.jsp" class="header-text fresh">刷新</a></li>
				<li><a href="${pageContext.request.contextPath}/jsp/index.jsp" class="header-text">新闻主页</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/main.jsp" class="header-text">后台管理</a></li>
			</ul>
		</div>
		<div style="clear:both;"></div>
	</header>
	<div class="center">
		<div class="all-row">
			<div class="row first-div ">
				<div class="all-title all first first-title">新闻标题</div>
				<div class="all-author all first first-author">作者信息</div>
				<div class="all-type all first first-type">新闻类型</div>
				<div class="all-time all first first-time border-time">发布时间</div>
			</div>
			<div class="scroll-other">
	<% 
    // 获取从Servlet传来的allist
    List<AllShow> allist = (List<AllShow>) request.getAttribute("allist");
    if (allist != null) {
        boolean isOne = true; 
        for (AllShow all : allist) {
            String className = isOne ? "one" : "two";
            String className2 = isOne ? "a-one" : "a-two";
            isOne = !isOne;
    %>
    			<div class="row <%= className %>">
					<div class="all-title all"><a href="${pageContext.request.contextPath}/Detail?id=<%=all.getId()%>" class="detail <%= className2 %>" style="width: 464px;"><%=all.getTitle() %></a></div>
					<div class="all-author all <%= className2 %>"><%=all.getAuthor() %></div>
					<div class="all-type all <%= className2 %>"><%=all.getType() %></div>
					<div class="all-time all <%= className2 %> border-time"><%=all.getTime() %></div>
				</div>
    <%
        }
    }
    %>	
    		</div>
		</div>
	</div>
</body>
</html>