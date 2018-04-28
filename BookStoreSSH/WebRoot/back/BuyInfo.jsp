<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
  			<li><a class="top" href="<%=basePath%>main.do">进入前台</a></li>
  			<li><a class="top" href="<%=basePath%>user/logOut.do">退出</a></li>
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
  		<p align="center" class="p">购买信息列表</p>
  		<table border="1" align="center" width="80%">
	    	<tr>
	    	<th>用户名</th><th>书名</th><th>书id</th><th>购书总数</th><th>花费总额</th><th>购买数量</th><th>书单价</th><th>购买日期</th>
	    	</tr>
	    	
	    	<c:forEach var="bi" items="${buyinfoList}">
	    	<tr class="tr">
	    	<td>${bi.uname}</td><td>${bi.bname}</td><td>${bi.bookid}</td><td>${bi.buyamount}</td>
	    	<td>${bi.allmoney}</td><td>${bi.buynum}</td><td>${bi.price}</td><td><fmt:formatDate value="${bi.buydate}" pattern="yyyy-MM-dd HH:mm"/></td>
	    	</tr>
	    	</c:forEach>
	    	<tr>
	    	 <td colspan="9" class="tr">
	    	 	<table id="tblTurnPage" cellSpacing="0" cellPadding="1" width="100%" border="0" style="font-family:arial;color:red;font-size:12px;">	    		
		    			<tr>
		    				<td>总记录数：${RecordCount}</td> 
		    				<td>总页数：${PageCount}</td>
		    				<td>当前页：${CurrentPageNo}</td>
		    				<td><a href="<%=basePath%>back_buyInfo.action?page=1">首页|</a>
		    				    <a href="<%=basePath%>back_buyInfo.action?page=${CurrentPageNo-1}">《前页|</a>
		    				    <a href="<%=basePath%>back_buyInfo.action?page=${CurrentPageNo+1}">后页》|</a>
		    				    <a href="<%=basePath%>back_buyInfo.action?page=${PageCount}">末页|</a></td>
		    				<td >跳转到:第<input type="text" size="3" >页<input type="button" value="go" ></td>
		    			</tr>	    		
		    		</table>
	    	 </td>
	    	</tr>
    	</table>
  	</div>
    
  </body>
</html>
