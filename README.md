# NewsManager
Java Web-MySQL新闻中心管理系统

这是基于Tomcat9.0的Dynamic Web Project项目  

-------------------------------------------------
1.浏览者可以浏览全部新闻，并且根据唯一关键字查找对应的新闻。  
2.管理员可以增，删，改，查，并且跟用户的查询结果页面会提供编辑和删除选项。

-------------------------------------------------
MySQL库名为newmanager  

表一admin  

CREATE TABLE `admin` (  
  `adminid` int NOT NULL AUTO_INCREMENT COMMENT '自动编码',  
  `adminname` varchar(50) NOT NULL COMMENT '用户名',  
  `adminpass` varchar(50) NOT NULL COMMENT '用户密码',  
  PRIMARY KEY (`adminid` DESC)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;  

---------------------------------------------------
表二newdetail  

CREATE TABLE `newsdetail` (  
  `id` int NOT NULL AUTO_INCREMENT COMMENT '新闻记录编号',  
  `title` varchar(50) NOT NULL COMMENT '新闻标题',  
  `content` varchar(4000) NOT NULL COMMENT '新闻内容',  
  `author` varchar(50) NOT NULL COMMENT '作者信息',  
  `time` varchar(50) NOT NULL COMMENT '新闻时间',  
  `type` int DEFAULT NOT NULL COMMENT '新闻类别',  
  PRIMARY KEY (`id`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;  

其中type类型用数字表示:  
  1.金融  
  2.餐饮  
  3.科技  
  4.生活  
  5.娱乐  
  6.知识  
  7.其他（除上面以外，什么数字都可以）
