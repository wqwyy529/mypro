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
  			<li><a href="user_userInfo.action?uname=${user.uname}">个人信息</a></li>
  			<li><a href="<%=basePath%>main_bookList.action">进入前台</a></li>
  			<li><a href="<%=basePath%>user_logOut.action">退出</a></li>
  		</ul>
	</div>
  	<hr width="1200px">
  	<div id="menu">
  		<ul id="menu">
			<li><a href="<%=basePath%>back_allBook.action">查看全部图书</a></li>
			<li><a href="<%=basePath%>user_allUser.action">查看全部用户</a></li>
			<li><a href="<%=basePath%>back/AddBook.jsp">新增图书</a></li>
			<li><a href="<%=basePath%>back/SelectBook.jsp">查询图书</a>
			<li><a href="<%=basePath%>back_seeMessage.jsp">查看留言</a></li>
			<li><a href="<%=basePath%>back_buyInfo.action">查看购买信息</a></li>
		</ul>
  	</div>
  	
  	<div id="container">
  		<div id="main">
  			<p align="center" class="p">全部图书列表</p>
  			<table border="1" width="100%">
	    	<tr>
	    	<th>封面</th><th>图书id</th><th>图书名</th><th>作者</th><th>单价</th><th>出版社</th>
	    	<th>库存</th><th>出版日期</th><th>简介</th><th>操作</th>
	    	</tr>
	    	<c:forEach var="bk" items="${booklist}">
	    	<tr align="center">
	    	<td width="90"><img src="<%=basePath%>imgAction.action?bid=${bk.bookid}" width=90 height=100/></td>
	    	<td>${bk.bookid}</td><td>${bk.bname}</td><td>${bk.author}</td><td>${bk.price}</td>
	    	<td>${bk.press}</td><td>${bk.store}</td><td>${bk.pubdate}</td><td width="300"><textarea rows="5" cols="30" style="background-color:#AADFAA">${bk.detail}</textarea></td>
	    	<td><a href="<%=basePath%>back_updateBook.action?bookid=${bk.bookid}">更新</a> | <a href="<%=basePath%>back_deletBook.action?bookid=${bk.bookid}">删除</a></td>
	    	</tr>
	    	</c:forEach>
	    	</table>
  		</div>
  		
    	<div id="turnpage">
 				<table width="100%">	    		
	    			<tr>
	    				<td>总记录数：${RecordCount}</td> 
	    				<td>总页数：${PageCount}</td>
	    				<td>当前页：${CurrentPageNo}</td>
	    				<td><a href="<%=basePath%>back_allBook.action?page=1">首页|</a>
	    				    <a href="<%=basePath%>back_allBook.action?page=${CurrentPageNo-1}">《前页|</a>
	    				    <a href="<%=basePath%>back_allBook.action?page=${CurrentPageNo+1}">后页》|</a>
	    				    <a href="<%=basePath%>back_allBook.action?page=${PageCount}">末页|</a></td>
	    				<td >跳转到:第<input type="text" size="3" >页<input type="button" value="go" ></td>
	    			</tr>	    		
	    		</table>
 			
 			</div>
  	</div>
    
  </body>
</html>
