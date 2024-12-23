# NewsManagement
JSP-MySQL新闻中心管理系统

这是基于Tomcat9.0的Dynamic Web Project项目  

----

* 浏览者可以浏览全部新闻，并且根据唯一关键字查找对应的新闻。  
* 管理员可以增，删，改，查，并且跟用户的查询结果页面会提供编辑和删除选项。

----

将build和src文件夹，覆盖你的项目的对应文件夹

----
## MySQL库名为newmanager  

**表一admin**  

CREATE TABLE `admin` (  
  `adminid` int NOT NULL AUTO_INCREMENT COMMENT '自动编码',  
  `adminname` varchar(50) NOT NULL COMMENT '用户名',  
  `adminpass` varchar(50) NOT NULL COMMENT '用户密码',  
  PRIMARY KEY (`adminid` DESC)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;  

----
**表二newdetail**  

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

----

## 运行展示  

![image](https://github.com/user-attachments/assets/93addda9-410e-48fe-a0f0-e0d8dec1937a)
![image](https://github.com/user-attachments/assets/1d42d21e-1a00-4f6a-b263-96afb0bf29c2)
![image](https://github.com/user-attachments/assets/c12dbc22-3e44-4114-a1e3-878966fbf909)
![image](https://github.com/user-attachments/assets/2a5f8cbc-4a4e-48a9-bcb6-bcad845a1f8d)
![image](https://github.com/user-attachments/assets/719f55c8-a885-49ec-bc3a-36565aee4b44)
![image](https://github.com/user-attachments/assets/c06b01e5-c999-43ae-b066-79a9e57a3185)

