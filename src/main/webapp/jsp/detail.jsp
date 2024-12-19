<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach" import="java.util.*" import="com.AllShow" errorPage="/admin/error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻中心-内容详情</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/detail.css">

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
	<div class="center">
		<% 
   		 // 获取从Servlet传来的allist
    	List<AllShow> allist = (List<AllShow>) request.getAttribute("allist");
   		if (allist != null) {
        	for (AllShow all : allist) {   
    	%>
    	<div style="position: absolute; padding-left: 37px; color: #6A2CFF; font-weight: 600; font-size: 19px;">(编号：<%=(String)request.getAttribute("id") %>)</div>
		<div class="all-row">
            <div class="one row">
				<div class="all-title all all-left">新闻标题</div>
                <div class="all-right all"><%=all.getTitle() %></div>
			</div>
            <div class="two row">
				<div class="all-type all all-left">新闻类型</div>
                <div class="all-right all"><%=all.getType() %></div>
			</div>
            <div class="one row">
				<div class="all-author all all-left">作者信息</div>
                <div class="all-right all"><%=all.getAuthor() %></div>
			</div>
            <div class="two row context">
				<div class="all-context all all-left">新闻内容</div>
                <div class="all-right all all-right-context"><%=all.getContent() %></div>
			</div>
            <div class="one row">
				<div class="all-time all all-left">新闻时间</div>
                <div class="all-right all"><%=all.getTime() %></div>
			</div>
        </div>
        <%
        	}
   		}
        %>
	</div>
</body>
</html>