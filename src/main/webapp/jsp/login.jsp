<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  errorPage="/admin/error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻中心-登录</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
	<header>
		<span class="span-head">新闻管理系统</span>
		<div class="header-search">
			<form class="header-form" action="${pageContext.request.contextPath}/ShowNew">
				<div class="search">
					<div>
						<input type="text" class="text-search"  name="id" maxlength="50"/>
					</div>
					<div>
						<input type="submit" value="搜索" class="butt"/>
					</div>
				</div>	
			</form>
		</div>
		<div class="ulf">
			<ul>
				<li><a href="${pageContext.request.contextPath}/admin/main.jsp" class="header-text">所有新闻</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/addNew.jsp" class="header-text">添加新闻</a></li>
				<li><a href="#" class="header-text">系统登录</a></li>
				<li><a href="${pageContext.request.contextPath}/jsp/index.jsp" class="header-text">新闻主页</a></li>
			</ul>
		</div>
		<div style="clear:both;"></div>
	</header>
	<div class="center">
		<div class="left">
            <img src="${pageContext.request.contextPath}/image/index.png" height="400" width="600px">
        </div>
		<div class="right">
			<div class="title">管理员登录</div>
			<form action="${pageContext.request.contextPath}/LoginUserAction">
				<div class="login">
				    <div class="row">
					    <div class="text">账号：</div>
					    <div class="in">
						    <input type="text" name="adminname" maxlength="50" placeholder="1~50"/>
					    </div>
					</div>
					<div class="row">
					    <div class="text">密码：</div>
					    <div class="in">
                            <input type="password" name="adminpass" maxlength="50" placeholder="1~50"/>
                        </div>
					</div>
				</div>
                <div class="but-all">
                    <input type="submit" class="but but1" value="确认">
                    <input type="reset" class="but but2" value="重置">
                </div>
			</form>
		</div>
	</div>
</body>
</html>