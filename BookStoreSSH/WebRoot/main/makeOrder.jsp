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
  </head>
  
  <body>
  <div id="header">
  	<p style="text-align:center;font-size:20px;font-weight:bold;">���ɶ���</p>
  </div>
  
  <div id="container">
  		<form action="<%=basePath%>main_confirmBuyInfo.action" method="post">
		  	<table width="70%" align="center">
			    <tr>
			    <th>����</th>
			    <th>����</th>
			    <th>�۸�(Ԫ)</th>
			    <th>������</th>
			    <th>����</th>
			    </tr>
			    <c:forEach var="bk" items="${books}">
				    <tr align="center">
				    <td>${bk.bname}</td><td>${bk.author}</td><td>${bk.price}</td><td>${bk.press}</td>
				    <td>${bk.buynum}<input type="hidden" name="bk${bk.bookid}" value="${bk.buynum}" readonly="readonly" size="3"></td>
				    </tr>
			    </c:forEach>
			    <tr><th style="padding-top:80px">�ռ���������</th><td style="padding-top:80px" colspan="4">${user.uname}</td></tr>
			   	<tr><th>�ռ��˵绰��</th><td colspan="4"><input type="text" name="br.telephone" value="${user.telephone}"></td></tr>
			    <tr><th>�ռ��˵�ַ��</th><td colspan="4"><input type="text" name="br.address" value="${user.address}"></td></tr>
			    <tr>
			    	<th>ѡ��������</th>			    
			    	<td colspan="4">
			    	<select name="br.deliver">
			    	<option>--��ѡ��</option>
			    	<option>Բͨ���</option>
			    	<option>��ͨ���</option>
			    	<option>˳����</option>
			    	<option>��ͨ���</option>
			    	<option>�ϴ���</option>
			    	</select>
			    	</td>
			    </tr>
			    <tr><th>֧�����У�</th>
			    	<td colspan="4">
			    		<input type="radio"  name="br.paybank" value="�й���������" checked="checked">�й���������
   						<input type="radio"  name="br.paybank" value="�й�ũҵ����">�й�ũҵ����
   						<input type="radio"  name="br.paybank" value="�й���������">�й���������
   						<input type="radio"  name="br.paybank" value="�й���������">�й���������
   					</td></tr>
			    <tr><td colspan="5" align="right" style="font-weight:bold"><br>�ܼۣ�${allMoney}Ԫ</td></tr>
			    <tr align="center">
				    <td colspan="5"><input type="submit" value="�� ��">&nbsp;&nbsp;&nbsp;&nbsp;
				    				<input type="button" value="����" onClick="window.history.go(-1)">
				    </td>
			    </tr>
		     </table>
	  	</form>
  </div>
  
   
  </body>
</html>
