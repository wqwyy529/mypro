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
				   dataType:"text", 		//�ڴ����ݷ��ص����ݸ�ʽ(���� "xml", "html", "script",�� "json")
				   timeout:5000, 					//����ʱ���ӳ������ʱ��
				   success: function(msg){			     
				     document.getElementById("sum").innerHTML = msg;
				   },
				   error:function(msg) 						//������ʧ��ʱ�����ĺ���
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
	  	srum.innerHTML = "��ȷ"; return true;
	  }else{ 
	  	srum.innerHTML="����"; return false;
	  }
  }  
  	function pass(){
	  var pwd=document.getElementById("pwd").value;
	  var sp=document.getElementById("sp");
	  var f=/^\w{1,8}$/;
	  if(f.test(pwd)){ 
	  	sp.innerHTML = "��ȷ"; return true;
	  }else{ 
	  	sp.innerHTML="����"; return false;
	  }
  }  
   	function pass2(){
	  var pwd=document.getElementById("pwd").value;
	  var pwd2=document.getElementById("pwd2").value;
	  var sp2=document.getElementById("sp2");
	  
	  if(pwd==pwd2){
	  	sp2.innerHTML="��ȷ!";return true;
	  }else{ 
	  	sp2.innerHTML="����!"; return false;
	  }
  }
	function sub(){
		if(rum()&&pass()&&pass2()){
			return true;
		}else{ alert("������Ϊ�ջ��ߴ������������룡");return false;}
	}
	</script>
</head>

  <body>
   	<h2 align="center">���û�ע��ҳ��</h2>
  	<br/><br/><br/>
  	<div >
	  	<form action="<%=basePath%>user_reg.action" name = "form" onSubmit = "return sub()" method="post">
		    <table align="center" width=600>
		    <tr>
		    <th> �û�����</th>
		    <td width="400"><input type="text" id="iuname" name ="uname" onBlur="umvalid()" width="500"><span id = "sum">Ҫ������1-6���ַ���</span></td>
		    </tr>
		    <tr>
		    <th>��ʵ������</th>
		    <td><input type="text" name="realname" id="rname" onBlur="rum()" width="500"><span id = "srum">Ҫ���֣�</span></td>
		    </tr>
		    <tr>
		    <th>�� &nbsp; &nbsp;�룺</th>
		    <td><input type = "password" name = "pwd" id = "pwd" onBlur="pass()" width="500"><span id = "sp">Ҫ��8-12����ĸ�����ֻ��»��ߣ�</span></td>
		    </tr>
		    <tr>
		    <th>ȷ���� �룺</th>
		    <td><input type = "password" name = "pwd2" id = "pwd2" onBlur="pass2()"><span id = "sp2">�ٴ��������룡</span></td>
		    </tr>
		    <tr>
		    <th> �� &nbsp; &nbsp;��</th>
		    <td> <input type="radio" name="sex" value="��" checked="checked">��
		    <input type = "radio" name = "sex" value = "Ů">Ů<br></td>
		    </tr>
		    <tr>
		    <th>��ϵ�绰��</th><td><input type="text" name="telephone"></td>
		    </tr>
		    <tr>
		    <th>��ַ��</th><td><input type="text" name="address"></td>
		    </tr>
		    <tr>
		    <td colspan="2">
		    <input type = "submit" value = "ע��" style="margin:20px 20px 10px 150px;">
		    <input type = "reset" value = "����" style="margin:20px 20px;">
		    <input type="button" value="����" onClick="window.location='<%=basePath%>main_bookList.do'" style="margin:20px 20px;">
		    </td>
		    
		    </tr>
		    <tr><td colspan="2">${errMsg}</td></tr>
		    </table>
	    </form>
  	</div>
    
  </body>
</html>