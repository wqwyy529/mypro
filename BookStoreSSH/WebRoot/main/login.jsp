<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>login</title>
  </head>
  <body>
  <h1 align="center">��¼ҳ��</h1><br><br>
  <form action="<%=basePath%>user_login.action" method="post">
	  <table align="center">
		  <tr><th> �û�����</th><td><input type="text" name="uname" style="width:150px;height:30px;font-size:18px;font-weight:bold;"><br></td></tr>
		  <tr><th> ���룺</th><td><input type="password" name="pwd" style="width:150px;height:30px;"><br></td></tr>
		  <tr>
		   	<td colspan = "2" align = center>
		   		<input type="submit" value = "��¼" style="margin:10px 10px;">
		    	<input type = "reset" value = "����" style="margin:10px 10px;">
		    	<input type="button" value="ע��" onClick="window.location='<%=basePath%>user/reg.do'" style="margin:10px 10px;">
		    </td>
		  </tr>
		  <tr><td colspan = "2"> ${msg}</td></tr>
	  	</table>
   </form>
  </body>
</html>
