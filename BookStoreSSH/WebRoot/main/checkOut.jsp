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
    
    <title>checkOut</title>
    
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
  		<div id="header">
    	<p style="text-align:center;font-size:20px;font-weight:bold;">确认信息</p>
	    </div>
	    
	    <div id="container">
	    	<form action="<%=basePath%>main_checkOut.action">
	    		<table align="center">
	    			<tr>
				    <th>书名</th><th>作者</th><th>价格(元)</th><th>出版社</th><th>数量</th>
	    			</tr>
	    			<tr>
	    				<c:forEach var="bk" items="${books}">
					    <tr align="center">
					    <td>${bk.bname}</td><td>${bk.author}</td><td>${bk.price}</td><td>${bk.press}</td>
					    <td>${bk.buynum}<input type="hidden" name="bk${bk.bookid}" value="${bk.buynum}"></td>
					    </tr>
				    	</c:forEach>
	    			</tr>
	    			<tr><th>收件人姓名：</th><td>${user.uname}<input type="hidden" name="br.uname" value="${user.uname}"></td></tr>
	    			<tr><th>收件人电话：</th><td>${br.telephone}<input type="hidden" name="br.telephone" value="${br.telephone}"></td></tr>
	    			<tr><th>收件人地址：</th><td>${br.address}<input type="hidden" name="br.address" value="${br.address}"></td></tr>
	    			<tr><th>物流：</th><td>${br.deliver}<input type="hidden" name="br.deliver" value="${br.deliver}"></td></tr>
	    			<tr><th>支付银行：</th><td>${br.paybank}<input type="hidden" name="br.paybank" value="${br.paybank}"></td></tr>
	    			
	    			<tr><td colspan="5" align="right">总价：${br.allmoney}<input type="hidden" name="br.allmoney" value="${br.allmoney}"></td></tr>
	    			<tr>
	    				<td colspan="5" align="center">
	    				<input type="submit" value="确认信息">
	    				<input type="button" value="返回" onClick="window.history.go(-1)">
	    				</td>
	    			</tr>
	    		</table>
	    	
	    	</form>
	    	
	    </div>
  </c:if>
  <c:if test="${not empty msg}">
    	<p align="center"><img src="<%=basePath%>images/buysuccess.jpg" width=300 height=500></img>${msg}</p>
    	<p align="center"><input type="button" onClick="window.location='<%=basePath%>main_bookList.action'" value="返回首页"></p>
  </c:if>
  </body>
</html>
