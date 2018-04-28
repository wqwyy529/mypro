
function umvalid(){
	  var uname=document.getElementById("iuname").value;
	  var url ="../NameValidSvl";
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
		if(um()&&rum()&&pass()&&pass2()){
			return true;
		}else{ alert("输入项为空或者错误，请重新输入！");return false;}
	}