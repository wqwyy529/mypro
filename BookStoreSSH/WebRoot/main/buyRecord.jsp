<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�����¼</title>
    
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
  <div id="header">
  	<p align="right"><input type="button" value="����" onClick="window.history.go(-1)"></p>
  </div>
    	<table border="1" align="center" width="80%">
	    	<tr class="tr"><th colspan="11">�����¼</th></tr>
	    	<tr>
	    	<th>�������</th><th>����</th><th>����</th><th>��������</th><th>��������</th><th>�����ܼ�</th><th>��ϵ�绰</th>
	    	<th>��ַ</th><th>��ݹ�˾</th><th>֧������</th><th>��������</th>
	    	</tr>
	    	<c:forEach var="br" items="${buyRecords}" varStatus="st">
	    	<tr class="tr">
	    	<td>${br.brid}</td><td>${br.bname}</td><td>${br.price}</td><td>${br.buynum}</td><td>${br.buyamount}</td>
	    	<td>${br.allmoney}</td><td>${br.telephone}</td><td>${br.address}</td><td>${br.deliver}</td>
	    	<td>${br.paybank}</td><td><fmt:formatDate value="${br.buydate}" pattern="yyyy-MM-dd HH:mm"/></td>
	    	</tr>
	    	</c:forEach>
	    </table>
  </body>
</html>
