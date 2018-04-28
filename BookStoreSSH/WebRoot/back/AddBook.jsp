<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
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
  	<div id="main">
  		<c:if test="${empty msg}">
  			<form action="<%=basePath%>back_addBook.action" enctype="multipart/form-data" method = "post">
			    <table align="center">
			    <tr>
			    <th> 书名：</th>
			    <td><input type="text" name="bk.bname" ></td>
			    </tr>
			    <tr>
			    <th>书价：</th>
			    <td><input type="text" name="bk.price" size="5"></td>
			    </tr>
			    <tr>
			    <th>作者：</th>
			    <td><input type="text" name="bk.author" size="10"></td>
			    </tr>
			    <tr>
			    <th>出版社：</th>
			    <td><input type="text" name="bk.press"></td>
			    </tr>
			    <tr>
			    <th>库存：</th><td><input type="text" name="bk.store" size="5" value="0"></td>
			    </tr>
			    <tr>
			    <th>封面：</th>
			    <td><input type="file" name="pic"></td>
			    </tr>
			    <tr>
			    <th>简介：</th>
			    <td><textarea rows="10" cols="30" name="bk.detail"></textarea></td>
			    </tr>
			    <tr>
			    <td colspan="2" align="center">
			    <input type = "submit" value = "提交">
			    &nbsp;&nbsp;&nbsp;&nbsp;
			    <input type = "reset" value = "重置"></td>
			    </tr>
			    </table>
			    </form>
  		</c:if>
  		
  		<c:if test="${not empty msg}">  		
  		<h2 align="center"><img src="<%=basePath%>images/right.png"></img>新书录入成功！</h2><br>
  		<h3 align="center"><a href="<%=basePath%>back_addBook.action">继续添加</a></h3>
  		</c:if>
  	</div>
    
  </body>
</html>
