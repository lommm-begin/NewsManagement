<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/admin/error.jsp"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach" import="java.util.*" import="com.AllShow"%>    
<%
	String adminname = (String)session.getAttribute("adminname");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻中心-管理员-编辑新闻</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/add.css">
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
				<li><a href="${pageContext.request.contextPath}/admin/main.jsp" class="header-text">所有新闻</a></li>
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
	<div class="center">
        <div class="container">
            <!-- 添加新闻的表单 -->
            <div class="add-news-form">
                <h2>编辑新闻(编号：<%=(String)session.getAttribute("id") %>)
                	<span>
                		<a href="${pageContext.request.contextPath}/DelNew?id=<%=(String)session.getAttribute("id") %>" class="detail">删除</a>
                	</span>
                </h2>
                <% 
    				// 获取从Servlet传来的allist
    				String id = (String)session.getAttribute("id");
                	session.setAttribute("id", id);
    				List<AllShow> allist = (List<AllShow>) request.getAttribute("allist");
    				if (allist != null) {
        				for (AllShow all : allist) {
    			%>
                <form action="${pageContext.request.contextPath}/UpdataNew" method="post">
                    <!-- 新闻标题 -->
                    <label for="newsTitle">新闻标题：</label>
                    <input type="text" id="newsTitle" name="Title" required maxlength="50" value="<%=all.getTitle() %>">
                    
                    <!-- 新闻类型 -->
				<label for="newsType">新闻类型：</label>
				<select name="Type" id="newsType" required style="font-size:17px;">
    				<option value="金融" <%= "1".equals(all.getType()) ? "selected" : "" %>>金融</option>
    				<option value="餐饮" <%= "2".equals(all.getType()) ? "selected" : "" %>>餐饮</option>
    				<option value="科技" <%= "3".equals(all.getType()) ? "selected" : "" %>>科技</option>
    				<option value="生活" <%= "4".equals(all.getType()) ? "selected" : "" %>>生活</option>
    				<option value="娱乐" <%= "5".equals(all.getType()) ? "selected" : "" %>>娱乐</option>
    				<option value="知识" <%= "6".equals(all.getType()) ? "selected" : "" %>>知识</option>
    				<option value="其他" <%= "7".equals(all.getType()) ? "selected" : "" %>>其他</option>
				</select>
    
                    
                    <!-- 新闻作者 -->
                    <label for="newsAuthor">新闻作者：</label>
                    <input type="text" id="newsAuthor" name="Author" required maxlength="50" value="<%=all.getAuthor() %>"/>
                    
                    <!-- 新闻内容 -->
                    <label for="newsContent">新闻内容：</label>
                    <textarea id="newsContent" name="Content" rows="10" cols="50" required maxlength="4000" ><%=all.getContent() %></textarea>
                    
                    <!-- 提交和取消按钮 -->
                    <div class="but-all">
                        <input type="submit" class="but first-but" value="编辑提交"/>
                        <a href="${pageContext.request.contextPath}/admin/main.jsp" class="but two-but">返回</a>
                    	<div class="but time" >发布时间<span style="color: #AB3F6E; font-size: 18px;"><%=all.getTime().substring(0, 19) %></span></div>
                    </div>
                </form>
                 <%
        				}
    				}
    			%>	
            </div>
        </div>
    </div>
</body>
</html>