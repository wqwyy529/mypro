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
    <title>SelectBook</title>    
  <link rel="stylesheet" href="<%=basePath%>css/back.css" type="text/css"></link>
  <script type="text/javascript" src="<%=basePath%>jscript/jquery-1.4.2.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>jscript/tab.js"></script>
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
    <div id="type">
		<ul id="st">
			<li><a>��ѯ����</a>
				<ul>
					<li id="sc1" onClick="setTab('sc',1,3)"><a>�����߲�ѯ</a></li>
					<li id="sc2" onClick="setTab('sc',2,3)"><a>���������ѯ</a></li>
					<li id="sc3" onClick="setTab('sc',3,3)"><a>���۸��ѯ</a></li>
				</ul>
			</li>			
		</ul>
		
		<ul id="inp">
    		<li id="con_sc_1">
    			<form action="<%=basePath%>back_selectByAuthor.action" method=post>
	    			�����߲�ѯ��<input type="text" name="author" style="height:25px">
			  		<input class="sub" type="submit" value="�ύ">
    			</form>    			
		  	</li>    			
    		<li id="con_sc_2" style="display:none;">
    			<form action="<%=basePath%>back_selectByPress.action" method=post>
	    			���������ѯ��<input type="text" name="press" style="height:25px">
			  		<input class="sub" type="submit" value="�ύ">
    			</form>    			
		  	</li>    			
    		<li id="con_sc_3" style="display:none;">
	    		<form action="<%=basePath%>back_selectByPrice.action" method=post>
	    			���۸��ѯ��<input name="price1" type="text" size="10" style="height:25px"/>--<input name="price2" type="text" size="10" style="height:25px"/>
		    		<input class="sub" type="submit" value="�ύ">
	    		</form>	    		
    		</li>    		
    	</ul>          
	 </div>    
       <div id="result">
       		<c:if test="${not empty bkList}">
       			<table border=1 width="100%">
       			<tr>
	    		<th>����</th><th>ͼ��id</th><th>ͼ����</th><th>����</th><th>����</th><th>������</th>
	    		<th>���</th><th>��������</th><th>���</th><th>����</th>
	    		</tr>
       			<c:forEach var="bk" items="${bkList}">
       				<tr align="center">
			    	<td width="90"><img src="<%=basePath%>PicSvl?bid=${bk.bookid}" width=90 height=100/></td>
			    	<td>${bk.bookid}</td><td>${bk.bname}</td><td>${bk.author}</td><td>${bk.price}</td>
			    	<td>${bk.press}</td><td>${bk.store}</td><td>${bk.pubdate}</td><td width="300"><textarea rows="5" cols="30" style="background-color:#AADFAA">${bk.detail}</textarea></td>
			    	<td><a href="back_updateBook.action?bookid=${bk.bookid}">����</a> | <a href="back_deletBook.action?bookid=${bk.bookid}">ɾ��</a></td>
			    	</tr>
       			</c:forEach>
       			</table>
       		</c:if>
       </div>
  </body>
</html>
