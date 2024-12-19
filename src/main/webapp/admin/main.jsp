<%
	String adminname = (String)session.getAttribute("adminname");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/admin/error.jsp"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach" import="java.util.*" import="com.AllShow"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻中心-管理员-所有新闻</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
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
				<li><a href="${pageContext.request.contextPath}/admin/main.jsp" class="header-text fresh">刷新</a></li>
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
		<div class="all-row">
			<div class="row first-div">
				<div class="all-title all first">新闻标题</div>
				<div class="all-author all first">作者信息</div>
				<div class="all-type all first">新闻类型</div>
				<div class="all-time all first">发布时间</div>
				<div class="all-del all first">是否删除</div>
				<div class="all-edit all first">是否编辑</div>
			</div>
			<div class="scroll-other">
		<% 
		Boolean stop = true;
		int id = 0;
		
    	// 获取从Servlet传来的allist
    	List<AllShow> allist = (List<AllShow>) request.getAttribute("allist");
		int allistLength = allist.size();
		
    	if (allist != null ) {
        	boolean isOne = true; 
        	for (AllShow all : allist) {
            	String className = isOne ? "one" : "two";
            	String className2 = isOne ? "a-one" : "a-two";
            	isOne = !isOne;
    	%>
    			<div class="row <%= className %>">
					<div class="all-title all"><a href="${pageContext.request.contextPath}/Detail?id=<%=all.getId()%>" class="detail a-title <%= className2 %>"  style="width: 384px;"><%=all.getTitle() %></a></div>
					<div class="all-author all <%= className2 %>"><%=all.getAuthor() %></div>
					<div class="all-type all <%= className2 %>"><%=all.getType() %></div>
					<div class="all-time all <%= className2 %>"><%=all.getTime() %></div>
					<div class="all-del all <%= className2 %>"><a href="${pageContext.request.contextPath}/DelNew?id=<%=all.getId()%>" class="detail">删除</a></div>
					<div class="all-edit all <%= className2 %>"><a href="${pageContext.request.contextPath}/admin/editNew.jsp?id=<%=all.getId()%>" class="detail">编辑</a></div>	
				</div>
		<%
				if (all.getId() != id + 1 && stop) {
					session.setAttribute("id-new", String.valueOf(id + 1));
					stop = false;
    			}
				id = all.getId();
       		}
        	if (session.getAttribute("id-new") == null) {
				session.setAttribute("id-new", String.valueOf(id + 1));
			}
    	}
        %>
        	</div>
		</div>
	</div>
</body>
</html>