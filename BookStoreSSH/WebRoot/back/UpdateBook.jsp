<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图书更新</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  
  <c:if test="${empty msg}">
  		<form action="<%=basePath%>back_updateBookSub.action" enctype="multipart/form-data" method = "post">
		    <table align="center">
		    <tr>
		    <th>书id</th><td><input type="text"  name ="bookid" value="${bk.bookid}" readonly="readonly"></td>
		    </tr>
		    <tr>
		    <th> 书名：</th><td><input type="text"  name ="bname" value="${bk.bname}"></td>
		    </tr>
		    <tr>
		    <th>书价：</th><td><input type="text" name="price" value="${bk.price}"></td>
		    </tr>
		    <tr>
		    <th>作者：</th><td><input type = "text" name = "author" value="${bk.author}"></td>
		    </tr>
		    <tr>
		    <th>出版社：</th><td><input type = "text" name = "press" value="${bk.press }"></td>
		    </tr>
		    <tr>
		    <th>库存</th><td><input type = "text" name = "store" value="${bk.store}"></td>
		    </tr>
		    <tr>
		    <th>封面：</th><td><input type = "file" name = "pic2"></td>
		    </tr>
		    <tr><th colspan="2"><img src="<%=basePath%>imgAction.action?bid=${bk.bookid}" width=120 height=130/></th></tr>
		    <tr>
		    <th>简介：</th>
		    <td><textarea rows="10" cols="30" name = "detail">${bk.detail}</textarea></td>
		    </tr>
		    <tr>
		    <td align="center" colspan="2">
			    <input type = "submit" value = "更新" style="margin:20px 40px;">
			   	<input type = "button" value = "返回" onClick="window.history.go(-1)" style="margin:20px 0px;">
		   	</td>
		    </table>
	    </form>
  </c:if>
  <c:if test="${not empty msg}">
   <p align="center"><img src="<%=basePath%>images/right.png"></img> ${msg}</p>
   <P align="center"><input type = "button" value = "去查看" onClick="window.location='<%=basePath%>back/main.do'" style="margin:20px 0px;"></P>
  </c:if>
  </body>
</html>
