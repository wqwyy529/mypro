<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <link rel="stylesheet" href="<%=basePath%>css/back.css" type="text/css"></link>
  </head>
  
  <body>
  	<div id="top_login">
  		<ul>
  			<li style="width:150px">欢迎您，【${user.uname}】</li>
  			<li><a class="top" href="user_userInfo.action?uname=${user.uname}">个人信息</a></li>
  			<li><a class="top" href="<%=basePath%>main_bookList.action">进入前台</a></li>
  			<li><a class="top" href="<%=basePath%>user_logOut.action">退出</a></li>
  		</ul>
	</div>
	<hr width="1200px">
  	<div id="menu">
  		<ul>
			<li><a href="<%=basePath%>back_allBook.action">查看全部图书</a></li>
			<li><a href="<%=basePath%>user_allUser.action">查看全部用户</a></li>
			<li><a href="<%=basePath%>back/AddBook.jsp">新增图书</a></li>
			<li><a href="<%=basePath%>back/SelectBook.jsp">查询图书</a>
			<li><a href="<%=basePath%>back_seeMessage.jsp">查看留言</a></li>
			<li><a href="<%=basePath%>back_buyInfo.action">查看购买信息</a></li>
		</ul>
  	</div>
  	<div id="container">
  		<p align="center" class="p">全部用户列表</p>
  		<table border="1" width="100%" align="center">
	    	<tr class="tr">
	    	<th>用户名</th><th>密码</th><th>真实姓名</th><th>性别</th><th>地址</th><th>电话</th>
	    	<th>角色</th>
	    	</tr>
	    	<c:forEach var="au" items="${allUser}">
	    	<tr align="center" class="tr">
	    	<td>${au.uname}</td><td>${au.pwd}</td><td>${au.realname}</td><td>${au.sex}</td>
	    	<td>${au.address}</td><td>${au.telephone}</td><td>${au.role}</td>
	    	</tr>
	    	</c:forEach>
    	</table>
  	</div>
    
  </body>
</html>
