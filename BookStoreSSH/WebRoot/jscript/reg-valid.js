
function umvalid(){
	  var uname=document.getElementById("iuname").value;
	  var url ="../NameValidSvl";
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
		if(um()&&rum()&&pass()&&pass2()){
			return true;
		}else{ alert("������Ϊ�ջ��ߴ������������룡");return false;}
	}