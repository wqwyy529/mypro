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
  <link rel="stylesheet" href="<%=basePath%>css/main.css" type="text/css"></link>
  </head>
  
  <body>
    	<div id="top_login">
    		<c:if test="${user==null}">
    		<ul>
    			<li style="width:150px;">欢迎进入书海网！</li>
    			<li><a class="hr" href="<%=basePath%>main/login.jsp">[请登录]</a></li>
    			<li><a class="hr" href="<%=basePath%>main/register.jsp">[请注册]</a></li>
    		</ul>
    		</c:if>
    		<c:if test="${user!=null}">
    			<ul>
	    			<li style="width:230px;">【${user.uname}】,欢迎您进入书海网！</li>
	    			<li style="width:130px;">您是<c:if test="${user.role=='a'}">管理员</c:if><c:if test="${user.role=='c'}">普通用户</c:if>!</li>
	    			<li><a class="hr" href="<%=basePath%>main_shopCart.action">购物车</a></li>
	    			<li><a class="hr" href="<%=basePath%>user_buyRecord.action">购买记录</a></li>
	    			<li><a class="hr" href="<%=basePath%>user_userInfo.action?uname=${user.uname}">个人信息</a></li>
	    			<c:if test="${user.role=='a'}"><li><a class="hr" href="<%=basePath%>back_allBook.action">后台管理</a></li></c:if>
	    			<li><a class="hr" href="<%=basePath%>user_logOut.action">退出</a></li>
    			</ul>			
    		  </c:if>	
   		</div>
   		<hr width="1200px">
 		<div id="container">
 		  <c:forEach var="bk" items="${bookList}">
				<c:if test="${bk.bookid mod 2 == 0}">
				  <div class="tab">
					<table  border="1" width="450">
					   <tr>
					   <td rowspan="5" width="150"><img src="<%=basePath%>imgAction.action?bid=${bk.bookid}" width=150 height=160/></td><th colspan="2"><a href="<%=basePath%>main_bookDetail.action?bookid=${bk.bookid}">${bk.bname}</a></th>
					   </tr>
					   <tr><th>价格：</th><th>￥${bk.price}</th></tr>
					   <tr><th>作者：</th><th>${bk.author}</th></tr>
					   <tr><th>库存：</th><th>${bk.store}</th></tr>
					   <tr><th>出版社：</th><th>${bk.press}</th></tr>
					   <tr><th><a href="<%=basePath%>main_bookDetail.action?bookid=${bk.bookid}">图书简介</a></th><th colspan="2"><a href="<%=basePath%>main_shopAdd.action?bookid=${bk.bookid}">购买</a></th></tr>
					  </table>
				 </div>
					
				</c:if>
				
				<c:if test="${bk.bookid mod 2 == 1}">
				  <div class="tab">
					<table border="1" width="450">
					   <tr>
					   <td rowspan="5" width="150"><img src="<%=basePath%>imgAction.action?bid=${bk.bookid}" width=150 height=160/></td><th colspan="2"><a href="<%=basePath%>main_bookDetail.action?bookid=${bk.bookid}">${bk.bname}</a></th>
					   </tr>
					   <tr><th>价格：</th><th>￥${bk.price}</th></tr>
					   <tr><th>作者：</th><th>${bk.author}</th></tr>
					   <tr><th>库存：</th><th>${bk.store}</th></tr>
					   <tr><th>出版社：</th><th>${bk.press}</th></tr>
					   <tr><th><a href="<%=basePath%>main_bookDetail.action?bookid=${bk.bookid}">图书简介</a></th><th colspan="2"><a href="<%=basePath%>main_shopAdd.action?bookid=${bk.bookid}">购买</a></th></tr>
					  </table>
				  </div>
					
				</c:if>
			</c:forEach>
 			<div id="turnpage">
 				<table width="100%">	    		
	    			<tr>
	    				<td>总记录数：${RecordCount}</td> 
	    				<td>总页数：${PageCount}</td>
	    				<td>当前页：${CurrentPageNo}</td>
	    				<td><a href="<%=basePath%>main_bookList.action?page=1">首页|</a>
	    				    <a href="<%=basePath%>main_bookList.action?page=${CurrentPageNo-1}">《前页|</a>
	    				    <a href="<%=basePath%>main_bookList.action?page=${CurrentPageNo+1}">后页》|</a>
	    				    <a href="<%=basePath%>main_bookList.action?page=${PageCount}">末页|</a></td>
	    				<td >跳转到:第<input type="text" size="3" >页<input type="button" value="go" ></td>
	    			</tr>	    		
	    		</table>
 			
 			</div>
 		</div>
   
  </body>
</html>
