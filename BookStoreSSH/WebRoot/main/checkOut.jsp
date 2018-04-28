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
    	<p style="text-align:center;font-size:20px;font-weight:bold;">ȷ����Ϣ</p>
	    </div>
	    
	    <div id="container">
	    	<form action="<%=basePath%>main_checkOut.action">
	    		<table align="center">
	    			<tr>
				    <th>����</th><th>����</th><th>�۸�(Ԫ)</th><th>������</th><th>����</th>
	    			</tr>
	    			<tr>
	    				<c:forEach var="bk" items="${books}">
					    <tr align="center">
					    <td>${bk.bname}</td><td>${bk.author}</td><td>${bk.price}</td><td>${bk.press}</td>
					    <td>${bk.buynum}<input type="hidden" name="bk${bk.bookid}" value="${bk.buynum}"></td>
					    </tr>
				    	</c:forEach>
	    			</tr>
	    			<tr><th>�ռ���������</th><td>${user.uname}<input type="hidden" name="br.uname" value="${user.uname}"></td></tr>
	    			<tr><th>�ռ��˵绰��</th><td>${br.telephone}<input type="hidden" name="br.telephone" value="${br.telephone}"></td></tr>
	    			<tr><th>�ռ��˵�ַ��</th><td>${br.address}<input type="hidden" name="br.address" value="${br.address}"></td></tr>
	    			<tr><th>������</th><td>${br.deliver}<input type="hidden" name="br.deliver" value="${br.deliver}"></td></tr>
	    			<tr><th>֧�����У�</th><td>${br.paybank}<input type="hidden" name="br.paybank" value="${br.paybank}"></td></tr>
	    			
	    			<tr><td colspan="5" align="right">�ܼۣ�${br.allmoney}<input type="hidden" name="br.allmoney" value="${br.allmoney}"></td></tr>
	    			<tr>
	    				<td colspan="5" align="center">
	    				<input type="submit" value="ȷ����Ϣ">
	    				<input type="button" value="����" onClick="window.history.go(-1)">
	    				</td>
	    			</tr>
	    		</table>
	    	
	    	</form>
	    	
	    </div>
  </c:if>
  <c:if test="${not empty msg}">
    	<p align="center"><img src="<%=basePath%>images/buysuccess.jpg" width=300 height=500></img>${msg}</p>
    	<p align="center"><input type="button" onClick="window.location='<%=basePath%>main_bookList.action'" value="������ҳ"></p>
  </c:if>
  </body>
</html>
