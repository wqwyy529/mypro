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
    			<li style="width:150px;">��ӭ�����麣����</li>
    			<li><a class="hr" href="<%=basePath%>main/login.jsp">[���¼]</a></li>
    			<li><a class="hr" href="<%=basePath%>main/register.jsp">[��ע��]</a></li>
    		</ul>
    		</c:if>
    		<c:if test="${user!=null}">
    			<ul>
	    			<li style="width:230px;">��${user.uname}��,��ӭ�������麣����</li>
	    			<li style="width:130px;">����<c:if test="${user.role=='a'}">����Ա</c:if><c:if test="${user.role=='c'}">��ͨ�û�</c:if>!</li>
	    			<li><a class="hr" href="<%=basePath%>main_shopCart.action">���ﳵ</a></li>
	    			<li><a class="hr" href="<%=basePath%>user_buyRecord.action">�����¼</a></li>
	    			<li><a class="hr" href="<%=basePath%>user_userInfo.action?uname=${user.uname}">������Ϣ</a></li>
	    			<c:if test="${user.role=='a'}"><li><a class="hr" href="<%=basePath%>back_allBook.action">��̨����</a></li></c:if>
	    			<li><a class="hr" href="<%=basePath%>user_logOut.action">�˳�</a></li>
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
					   <tr><th>�۸�</th><th>��${bk.price}</th></tr>
					   <tr><th>���ߣ�</th><th>${bk.author}</th></tr>
					   <tr><th>��棺</th><th>${bk.store}</th></tr>
					   <tr><th>�����磺</th><th>${bk.press}</th></tr>
					   <tr><th><a href="<%=basePath%>main_bookDetail.action?bookid=${bk.bookid}">ͼ����</a></th><th colspan="2"><a href="<%=basePath%>main_shopAdd.action?bookid=${bk.bookid}">����</a></th></tr>
					  </table>
				 </div>
					
				</c:if>
				
				<c:if test="${bk.bookid mod 2 == 1}">
				  <div class="tab">
					<table border="1" width="450">
					   <tr>
					   <td rowspan="5" width="150"><img src="<%=basePath%>imgAction.action?bid=${bk.bookid}" width=150 height=160/></td><th colspan="2"><a href="<%=basePath%>main_bookDetail.action?bookid=${bk.bookid}">${bk.bname}</a></th>
					   </tr>
					   <tr><th>�۸�</th><th>��${bk.price}</th></tr>
					   <tr><th>���ߣ�</th><th>${bk.author}</th></tr>
					   <tr><th>��棺</th><th>${bk.store}</th></tr>
					   <tr><th>�����磺</th><th>${bk.press}</th></tr>
					   <tr><th><a href="<%=basePath%>main_bookDetail.action?bookid=${bk.bookid}">ͼ����</a></th><th colspan="2"><a href="<%=basePath%>main_shopAdd.action?bookid=${bk.bookid}">����</a></th></tr>
					  </table>
				  </div>
					
				</c:if>
			</c:forEach>
 			<div id="turnpage">
 				<table width="100%">	    		
	    			<tr>
	    				<td>�ܼ�¼����${RecordCount}</td> 
	    				<td>��ҳ����${PageCount}</td>
	    				<td>��ǰҳ��${CurrentPageNo}</td>
	    				<td><a href="<%=basePath%>main_bookList.action?page=1">��ҳ|</a>
	    				    <a href="<%=basePath%>main_bookList.action?page=${CurrentPageNo-1}">��ǰҳ|</a>
	    				    <a href="<%=basePath%>main_bookList.action?page=${CurrentPageNo+1}">��ҳ��|</a>
	    				    <a href="<%=basePath%>main_bookList.action?page=${PageCount}">ĩҳ|</a></td>
	    				<td >��ת��:��<input type="text" size="3" >ҳ<input type="button" value="go" ></td>
	    			</tr>	    		
	    		</table>
 			
 			</div>
 		</div>
   
  </body>
</html>
