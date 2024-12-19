<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/admin/error.jsp"%>
<%@ page import="java.util.Date" import="java.text.SimpleDateFormat" %>
<%
	String adminname = (String)session.getAttribute("adminname");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻中心-管理员-添加新闻</title>
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
				<li><a href="${pageContext.request.contextPath}/admin/addNew.jsp" class="header-text fresh">刷新</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/main.jsp" class="header-text">所有新闻</a></li>
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
                <h2>添加新闻(编号：<%=(String)session.getAttribute("id-new") %>)</h2>
                <form action="${pageContext.request.contextPath}/AddNew" method="post">
                    <!-- 新闻标题 -->
                    <label for="newsTitle">新闻标题：</label>
                    <input type="text" id="newsTitle" name="Title" required maxlength="50">
                    
                    <!-- 新闻类型 -->
                    <label for="newsType">新闻类型：</label>
                    <select name="Type" id="newsType" required>
                    	<option value="1">金融</option>
                    	<option value="2">餐饮</option>
                    	<option value="3">科技</option>
                    	<option value="4">生活</option>
                    	<option value="5">娱乐</option>
                    	<option value="6">知识</option>
                    	<option value="7" selected>其他</option>
                    </select>
    
                    <!-- 新闻作者 -->
                    <label for="newsAuthor">新闻作者：</label>
                    <input type="text" id="newsAuthor" name="Author" required maxlength="50">
                    
                    <!-- 新闻内容 -->
                    <label for="newsContent">新闻内容：</label>
                    <textarea id="newsContent" name="Content" rows="10" cols="50" required maxlength="4000"></textarea>
                    
                    <%
                    	SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            			Date now = new Date();
            			String time = fm.format(now);
            			session.setAttribute("time", time);
                    %>
                    <!-- 提交和取消按钮 -->
                    <div class="but-all">
                        <input type="submit" class="but first-but"/>
                        <a href="${pageContext.request.contextPath}/admin/main.jsp" class="but two-but">返回</a>
                        <div class="but time">发布时间<span style="color: #AB3F6E; font-size: 18px;"><%=time %></span></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>