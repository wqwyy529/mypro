<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<head>
    <base href="<%=basePath%>">
    
    <title>register</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
	<script type="text/javascript" src="<%=basePath%>jscript/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" >	
	function umvalid(){
	  var uname=document.getElementById("iuname").value;
	  var url ="<%=basePath%>ValidUnameSvl";
	  $.ajax({
				   type: "get",
				   url: url,
				   data: "uname=" + uname,
				   dataType:"text", 		//期待数据返回的数据格式(例如 "xml", "html", "script",或 "json")
				   timeout:5000, 					//设置时间延迟请求的时间
				   success: function(msg){			     
				     document.getElementById("sum").innerHTML = msg;
				   },
				   error:function(msg) 						//当请求失败时触发的函数
				   {
						alert(msg);
				   }
				});   					            
  }
  	function rum(){
	  var rname=document.getElementById("rname").value;
	  var srum=document.getElementById("srum");
	  var f=/^[\u4e00-\u9fa5]+$/ ;
	  if(f.test(rname)){ 
	  	srum.innerHTML = "正确"; return true;
	  }else{ 
	  	srum.innerHTML="错误！"; return false;
	  }
  }  
  	function pass(){
	  var pwd=document.getElementById("pwd").value;
	  var sp=document.getElementById("sp");
	  var f=/^\w{1,8}$/;
	  if(f.test(pwd)){ 
	  	sp.innerHTML = "正确"; return true;
	  }else{ 
	  	sp.innerHTML="错误！"; return false;
	  }
  }  
   	function pass2(){
	  var pwd=document.getElementById("pwd").value;
	  var pwd2=document.getElementById("pwd2").value;
	  var sp2=document.getElementById("sp2");
	  
	  if(pwd==pwd2){
	  	sp2.innerHTML="正确!";return true;
	  }else{ 
	  	sp2.innerHTML="错误!"; return false;
	  }
  }
	function sub(){
		if(rum()&&pass()&&pass2()){
			return true;
		}else{ alert("输入项为空或者错误，请重新输入！");return false;}
	}
	</script>
</head>

  <body>
   	<h2 align="center">新用户注册页面</h2>
  	<br/><br/><br/>
  	<div >
	  	<form action="<%=basePath%>user_reg.action" name = "form" onSubmit = "return sub()" method="post">
		    <table align="center" width=600>
		    <tr>
		    <th> 用户名：</th>
		    <td width="400"><input type="text" id="iuname" name ="uname" onBlur="umvalid()" width="500"><span id = "sum">要求输入1-6个字符！</span></td>
		    </tr>
		    <tr>
		    <th>真实姓名：</th>
		    <td><input type="text" name="realname" id="rname" onBlur="rum()" width="500"><span id = "srum">要求汉字！</span></td>
		    </tr>
		    <tr>
		    <th>密 &nbsp; &nbsp;码：</th>
		    <td><input type = "password" name = "pwd" id = "pwd" onBlur="pass()" width="500"><span id = "sp">要求8-12个字母、数字或下划线！</span></td>
		    </tr>
		    <tr>
		    <th>确认密 码：</th>
		    <td><input type = "password" name = "pwd2" id = "pwd2" onBlur="pass2()"><span id = "sp2">再次输入密码！</span></td>
		    </tr>
		    <tr>
		    <th> 性 &nbsp; &nbsp;别：</th>
		    <td> <input type="radio" name="sex" value="男" checked="checked">男
		    <input type = "radio" name = "sex" value = "女">女<br></td>
		    </tr>
		    <tr>
		    <th>联系电话：</th><td><input type="text" name="telephone"></td>
		    </tr>
		    <tr>
		    <th>地址：</th><td><input type="text" name="address"></td>
		    </tr>
		    <tr>
		    <td colspan="2">
		    <input type = "submit" value = "注册" style="margin:20px 20px 10px 150px;">
		    <input type = "reset" value = "重置" style="margin:20px 20px;">
		    <input type="button" value="返回" onClick="window.location='<%=basePath%>main_bookList.do'" style="margin:20px 20px;">
		    </td>
		    
		    </tr>
		    <tr><td colspan="2">${errMsg}</td></tr>
		    </table>
	    </form>
  	</div>
    
  </body>
</html>