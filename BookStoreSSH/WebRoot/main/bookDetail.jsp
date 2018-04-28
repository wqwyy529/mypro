<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<link rel="stylesheet" href="<%=basePath%>css/main.css" type="text/css"></link>
	</head>
  <body>
  <div>
  	<p><input type="button" value="返回" onClick="window.history.go(-1)"  style="width:50px;height:30px;margin:20px 30px;"></p>
  	<p style="text-align:center;font-size:25px;font-weight:bold;">图书详情</p>
  </div>
  <div id="container">
  		<div id="main">
  			<table border=1 width=600 align="center">
			   <tr>
			   <td rowspan="6" width=200><img src="<%=basePath%>imgAction.action?bid=${book.bookid}" width=200 height=250/></td><th colspan="2">${book.bname}</th>
			   </tr>
			   <tr><th>价格：</th><th>${book.price} 元</th></tr>
			   <tr><th>作者：</th><th>${book.author}</th></tr>
			   <tr><th>库存：</th><th>${book.store} 本</th></tr>
			   <tr><th>出版社：</th><th>${book.press}</th></tr>
			   <tr><th colspan=2><a href="<%=basePath%>main_shopAdd.action?bookid=${book.bookid}">加入购物车</a></th></tr>
			   <tr><td colspan="3" style="padding-top:30px;">简介：<br>${book.detail}</td></tr>
			   <tr><th colspan="3" style="height:50px;">
			   		
			   </tr>
		  	</table>
  		</div>
  		<div id="msg">
  			<table align="center" border=1 width=600>
  				<tr>
  				<td width=100>用户名：</td><td>莉莉</td><td align="right">时间：</td><td>2014-5-9</td>
  				</tr>
  				<tr>
  				<td colspan=4>评论内容:</td>
  				</tr>
  			</table>
  		</div>
	  	
		<div id="comment">
  			<form action="">
	  			<table align="center" width=600>
	  				<tr><td style="font-weight:bold">评价：</td></tr>
	  				<tr><td><textarea rows="15" cols="60"></textarea></td></tr>
	  				<tr><td><input type="submit" value="发表" style="width:50px;height:25px;"></td></tr>
	  			</table>
  			</form>
  		</div>
  </div>
  
  </body>
 </html>