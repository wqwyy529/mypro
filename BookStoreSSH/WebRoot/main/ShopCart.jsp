<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
  </head>
  
  <body>
  	<div id="header">
  		<p align="center"><img src="<%=basePath%>images/shoppingcart.jpg" width=300 height=200 /></p>
  	</div>
  
  	<div id="container">
  		<c:if test="${not empty books}">
		    <form action="<%=basePath%>main_makeOrder.action" method="post">
	  			<table width="800" align="center">
		  			<tr><th colspan="6" style="color:#800080;font-size:25px">购物车<br></th></tr>
				    <tr>
				    <th>书名</th><th>作者</th><th>价格(元)</th><th>出版社</th><th>数量</th><th>操作</th>
				    </tr>
				    <c:forEach var="bk" items="${books}">
					    <tr align="center">
					    <td>${bk.bname}</td><td>${bk.author}</td><td>${bk.price}</td><td>${bk.press}</td>
					    <td><input type="text" name="bk${bk.bookid}" size=3 value="1"></td><td><a href="<%=basePath%>main_removeBook.action?bid=${bk.bookid}">移除</a></td>
					    </tr>
				    </c:forEach>
			    	<tr><th colspan="6"><input type="submit" value="结    算"><input type="button" value="去购书" onClick="window.location='<%=basePath%>main_bookList.action'" style="margin:20px 30px;"></th></tr>
		    	</table>
	  		</form>
		</c:if>
		<c:if test="${books==null||empty books}">
		    <p align="center">购物车为空，请先购物！</p>
		   	<p align="center"><input type="button" value="去购书" onClick="window.location='<%=basePath%>main_bookList.action'"></p>
		</c:if>
  	</div>
	 
    
  </body>
</html>
