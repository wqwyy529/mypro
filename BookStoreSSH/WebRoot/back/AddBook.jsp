<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  			<li style="width:150px">��ӭ������${user.uname}��</li>
  			<li><a class="top" href="user_userInfo.action?uname=${user.uname}">������Ϣ</a></li>
  			<li><a class="top" href="<%=basePath%>main_bookList.action">����ǰ̨</a></li>
  			<li><a class="top" href="<%=basePath%>user_logOut.action">�˳�</a></li>
  		</ul>
	</div>
  	<hr width="1200px">
  	<div id="menu">
  		<ul>
			<li><a href="<%=basePath%>back_allBook.action">�鿴ȫ��ͼ��</a></li>
			<li><a href="<%=basePath%>user_allUser.action">�鿴ȫ���û�</a></li>
			<li><a href="<%=basePath%>back/AddBook.jsp">����ͼ��</a></li>
			<li><a href="<%=basePath%>back/SelectBook.jsp">��ѯͼ��</a>
			<li><a href="<%=basePath%>back_seeMessage.jsp">�鿴����</a></li>
			<li><a href="<%=basePath%>back_buyInfo.action">�鿴������Ϣ</a></li>
		</ul>
  	</div>
  	<div id="main">
  		<c:if test="${empty msg}">
  			<form action="<%=basePath%>back_addBook.action" enctype="multipart/form-data" method = "post">
			    <table align="center">
			    <tr>
			    <th> ������</th>
			    <td><input type="text" name="bk.bname" ></td>
			    </tr>
			    <tr>
			    <th>��ۣ�</th>
			    <td><input type="text" name="bk.price" size="5"></td>
			    </tr>
			    <tr>
			    <th>���ߣ�</th>
			    <td><input type="text" name="bk.author" size="10"></td>
			    </tr>
			    <tr>
			    <th>�����磺</th>
			    <td><input type="text" name="bk.press"></td>
			    </tr>
			    <tr>
			    <th>��棺</th><td><input type="text" name="bk.store" size="5" value="0"></td>
			    </tr>
			    <tr>
			    <th>���棺</th>
			    <td><input type="file" name="pic"></td>
			    </tr>
			    <tr>
			    <th>��飺</th>
			    <td><textarea rows="10" cols="30" name="bk.detail"></textarea></td>
			    </tr>
			    <tr>
			    <td colspan="2" align="center">
			    <input type = "submit" value = "�ύ">
			    &nbsp;&nbsp;&nbsp;&nbsp;
			    <input type = "reset" value = "����"></td>
			    </tr>
			    </table>
			    </form>
  		</c:if>
  		
  		<c:if test="${not empty msg}">  		
  		<h2 align="center"><img src="<%=basePath%>images/right.png"></img>����¼��ɹ���</h2><br>
  		<h3 align="center"><a href="<%=basePath%>back_addBook.action">�������</a></h3>
  		</c:if>
  	</div>
    
  </body>
</html>
