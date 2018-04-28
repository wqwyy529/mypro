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
  			<li style="width:150px">欢迎您，【${user.uname}】</li>
  			<li><a class="top" href="user_userInfo.action?uname=${user.uname}">个人信息</a></li>
  			<li><a class="top" href="<%=basePath%>main_bookList.action">进入前台</a></li>
  			<li><a class="top" href="<%=basePath%>user_logOut.action">退出</a></li>
  		</ul>
	</div>
  	<hr width="1200px">
  	<div id="menu">
  		<ul>
			<li><a href="<%=basePath%>back_allBook.action">查看全部图书</a></li>
			<li><a href="<%=basePath%>user_allUser.action">查看全部用户</a></li>
			<li><a href="<%=basePath%>back/AddBook.jsp">新增图书</a></li>
			<li><a href="<%=basePath%>back/SelectBook.jsp">查询图书</a>
			<li><a href="<%=basePath%>back_seeMessage.jsp">查看留言</a></li>
			<li><a href="<%=basePath%>back_buyInfo.action">查看购买信息</a></li>
		</ul>
  	</div>
    <div id="type">
		<ul id="st">
			<li><a>查询分类</a>
				<ul>
					<li id="sc1" onClick="setTab('sc',1,3)"><a>按作者查询</a></li>
					<li id="sc2" onClick="setTab('sc',2,3)"><a>按出版社查询</a></li>
					<li id="sc3" onClick="setTab('sc',3,3)"><a>按价格查询</a></li>
				</ul>
			</li>			
		</ul>
		
		<ul id="inp">
    		<li id="con_sc_1">
    			<form action="<%=basePath%>back_selectByAuthor.action" method=post>
	    			按作者查询：<input type="text" name="author" style="height:25px">
			  		<input class="sub" type="submit" value="提交">
    			</form>    			
		  	</li>    			
    		<li id="con_sc_2" style="display:none;">
    			<form action="<%=basePath%>back_selectByPress.action" method=post>
	    			按出版社查询：<input type="text" name="press" style="height:25px">
			  		<input class="sub" type="submit" value="提交">
    			</form>    			
		  	</li>    			
    		<li id="con_sc_3" style="display:none;">
	    		<form action="<%=basePath%>back_selectByPrice.action" method=post>
	    			按价格查询：<input name="price1" type="text" size="10" style="height:25px"/>--<input name="price2" type="text" size="10" style="height:25px"/>
		    		<input class="sub" type="submit" value="提交">
	    		</form>	    		
    		</li>    		
    	</ul>          
	 </div>    
       <div id="result">
       		<c:if test="${not empty bkList}">
       			<table border=1 width="100%">
       			<tr>
	    		<th>封面</th><th>图书id</th><th>图书名</th><th>作者</th><th>单价</th><th>出版社</th>
	    		<th>库存</th><th>出版日期</th><th>简介</th><th>操作</th>
	    		</tr>
       			<c:forEach var="bk" items="${bkList}">
       				<tr align="center">
			    	<td width="90"><img src="<%=basePath%>PicSvl?bid=${bk.bookid}" width=90 height=100/></td>
			    	<td>${bk.bookid}</td><td>${bk.bname}</td><td>${bk.author}</td><td>${bk.price}</td>
			    	<td>${bk.press}</td><td>${bk.store}</td><td>${bk.pubdate}</td><td width="300"><textarea rows="5" cols="30" style="background-color:#AADFAA">${bk.detail}</textarea></td>
			    	<td><a href="back_updateBook.action?bookid=${bk.bookid}">更新</a> | <a href="back_deletBook.action?bookid=${bk.bookid}">删除</a></td>
			    	</tr>
       			</c:forEach>
       			</table>
       		</c:if>
       </div>
  </body>
</html>
