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
    
    <title>userInfo</title>
    
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
	  	<form action="<%=basePath%>user_updateUser.action" method="post">
	  	<table style="margin:30px auto 0;width:300px;height:500px;">
	  		<thead><tr><th colspan="2">������Ϣҳ��</th></tr></thead>
	    	<tr>
	    	<td>�û�����</td><td>${user.uname}<input type="hidden" name="user.uname" value="${user.uname}"></td>
	    	</tr>
	    	<tr>
	    	<td>��ɫ��</td><td><c:if test="${user.role=='a'}">����Ա</c:if><c:if test="${user.role=='c'}">��ͨ�û�</c:if></td>
	    	</tr>
	    	<tr>
	    	<td>���룺</td><td><input type="password" name="user.pwd" value="${user.pwd}"></td>
	    	</tr>
	    	<tr>
	    	<td>��ʵ������</td><td><input type="text" name="user.realname" value="${user.realname}"></td>
	    	</tr>
	    	<tr>
	    	<td>�Ա�</td>
	    	<td>
		    	<select name="user.sex">
		    		<option>${user.sex}</option>
		    		<option>��</option>
		    		<option>Ů</option>
		    	</select>
	    	</td>
	    	</tr>
	    	<tr>
	    	<td>��ַ��</td><td><input type="text" name="user.address" value="${user.address}"></td>
	    	</tr>
	    	<tr>
	    	<td>�绰���룺</td><td><input type="text" name="user.telephone" value="${user.telephone}"></td>
	    	</tr>
	    	<tr>
	    	<td>�˻���</td><td><input type="text" name="user.account" value="${user.account}" size="8"></td>
	    	</tr>
	    	<tr><td colspan="2"><input type="submit" value="�޸���Ϣ">
	    		<input type="button" value="����" onClick="window.history.go(-1)">
	    		</td>
	    	</tr>
	    </table>
	  </form>
  	</c:if>
  	<c:if test="${not empty msg}">
  		<div>
  			<p align="right"><input type="button" value="����" onClick="window.history.go(-1)"></p>
  			<p><img src="<%=basePath%>images/right.png">${msg}</p>
  			<p><input type="button" value="�鿴������Ϣ" onClick="window.location='<%=basePath%>user_userInfo.action?uname=${user.uname}'"></p>
  		</div>
  		
  	</c:if>
    
  </body>
</html>
