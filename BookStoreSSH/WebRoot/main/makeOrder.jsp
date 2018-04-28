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
  	<p style="text-align:center;font-size:20px;font-weight:bold;">生成订单</p>
  </div>
  
  <div id="container">
  		<form action="<%=basePath%>main_confirmBuyInfo.action" method="post">
		  	<table width="70%" align="center">
			    <tr>
			    <th>书名</th>
			    <th>作者</th>
			    <th>价格(元)</th>
			    <th>出版社</th>
			    <th>数量</th>
			    </tr>
			    <c:forEach var="bk" items="${books}">
				    <tr align="center">
				    <td>${bk.bname}</td><td>${bk.author}</td><td>${bk.price}</td><td>${bk.press}</td>
				    <td>${bk.buynum}<input type="hidden" name="bk${bk.bookid}" value="${bk.buynum}" readonly="readonly" size="3"></td>
				    </tr>
			    </c:forEach>
			    <tr><th style="padding-top:80px">收件人姓名：</th><td style="padding-top:80px" colspan="4">${user.uname}</td></tr>
			   	<tr><th>收件人电话：</th><td colspan="4"><input type="text" name="br.telephone" value="${user.telephone}"></td></tr>
			    <tr><th>收件人地址：</th><td colspan="4"><input type="text" name="br.address" value="${user.address}"></td></tr>
			    <tr>
			    	<th>选择物流：</th>			    
			    	<td colspan="4">
			    	<select name="br.deliver">
			    	<option>--请选择</option>
			    	<option>圆通快递</option>
			    	<option>中通快递</option>
			    	<option>顺丰快递</option>
			    	<option>申通快递</option>
			    	<option>韵达快递</option>
			    	</select>
			    	</td>
			    </tr>
			    <tr><th>支付银行：</th>
			    	<td colspan="4">
			    		<input type="radio"  name="br.paybank" value="中国人民银行" checked="checked">中国人民银行
   						<input type="radio"  name="br.paybank" value="中国农业银行">中国农业银行
   						<input type="radio"  name="br.paybank" value="中国工商银行">中国工商银行
   						<input type="radio"  name="br.paybank" value="中国建设银行">中国建设银行
   					</td></tr>
			    <tr><td colspan="5" align="right" style="font-weight:bold"><br>总价：${allMoney}元</td></tr>
			    <tr align="center">
				    <td colspan="5"><input type="submit" value="提 交">&nbsp;&nbsp;&nbsp;&nbsp;
				    				<input type="button" value="返回" onClick="window.history.go(-1)">
				    </td>
			    </tr>
		     </table>
	  	</form>
  </div>
  
   
  </body>
</html>
