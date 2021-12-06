 /*
  校验用户性别是否已选
  */
  function checkGender()
  {
	  //获取所有的名称为gender的input标签
	  var genderNum = document.getElementsByName("gender");
	  var gender = "" ;
	  //遍历这些名称为gender的标签
	  for(var i=0;i<genderNum.length;++i)
	  {
		  //如果某个gender被选中，则记录
		  if(genderNum[i].checked)
		  	gender = genderNum[i].value;
	  }
	  if( gender == "")
	  {
		  document.getElementById("tips_gender").innerHTML = "<em style='color:#FF0000'>至少选择其中一项</em>";   
		  return false;
	  }
	  else
	  {
		   document.getElementById("tips_gender").innerHTML = "OK！"; 
	  }
  }
  function checkForm()
  {  
	  //使用document.getElementById()获取id为txtUser即用户名的输入域的值，判断其长度是否合法
	  if(document.getElementById("txtUser").value.length < 6 ||document.getElementById("txtUser").value.length > 18 )
	  {
	 		 //设置id为tips_username的<span>的HTML，显示错误信息
			 document.getElementById("tips_username").innerHTML = "<em style='color:#FF0000'>用户名由6-18个字符组成</em>";
			 document.getElementById("txtUser").focus();
			 return false;
	  }
	  else
	  {
			document.getElementById("tips_username").innerHTML ="OK！";	
	  }
	  //正则表达式，由字母、数字和下划线组成。
	  var reg=/[^A-Za-z0-9_]+/;
	  var regs =  /^[a-zA-Z0-9_\u4e00-\u9fa5]+$/;
	  //判断密码长度，是否符合规则。
	  if(document.getElementById("txtPwd").value.length < 6 ||document.getElementById("txtPwd").value.length > 18 || 
	  						regs.test(document.getElementById("txtPwd").value) )
	  {	
			document.getElementById("tips_password").innerHTML= "<em style='color:#FF0000'>密码由6-18个字符、数字和标点符号组成</em>"
			document.getElementById("txtPwd").focus();
			return false;  
	  }
	  else
	  {
		 document.getElementById("tips_password").innerHTML = "OK！"; 
	  }
	  //校验两次密码输入是否一致
	  if(document.getElementById("txtRpt").value != document.getElementById("txtPwd").value)
	  {
			document.getElementById("tips_repeat").innerHTML = "<em style='color:#FF0000'>两次输入的密码不一致</em>";
			document.getElementById("txtRpt").focus();
			return false;  
	  }
	  else
	  {
		 document.getElementById("tips_repeat").innerHTML = "OK！";
		 
	  }
	  //校验用户类别，如果选择的是第0项，表示未选择
	  if(document.getElementById("selUser").selectedIndex == 0)
	  {
		  document.getElementById("tips_usertype").innerHTML = "<em style='color:#FF0000'>没有选择用户类型</em>";
		  document.getElementById("selUser").focus();
		  return false;
	  }
	  else
	  {
		  document.getElementById("tips_usertype").innerHTML = "OK！";
	  }
	  
	  if(document.getElementById("txtDate").value == "")
	  {
		  document.getElementById("tips_birthdate").innerHTML = "<em style='color:#FF0000'>没有填写出生日期</em>";
		  document.getElementById("txtDate").focus();
		  return false;
	  }
	  else
	  {
		   document.getElementById("tips_birthdate").innerHTML = "OK！";
	  }
	  
	  //获取Email输入域的值
	  var email = document.getElementById("txtMail").value;
	  //电子邮件的正则表达式
	  var pattern = /^[a-zA-Z0-9#_\^\$\.\*\+\-\?\=\!\:\|\\\/\(\)\[\]\{\}]+@[a-zA-Z0-9]+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
	  if(email.length == 0) 
	  {
		document.getElementById("tips_email").innerHTML = "<em style='color:#FF0000'>电子邮箱不能为空</em>";
		document.getElementById("txtMail").focus();
		return false;
	  } 
	  else if(!pattern.test(email)) 
	  {
		document.getElementById("tips_email").innerHTML = "<em style='color:#FF0000'>Email不合法</em>";
		document.getElementById("txtMail").focus();
		return false;
	  }
	  else 
	  {
		document.getElementById("tips_email").innerHTML = "OK！";
	  }  
	  //判断自我介绍的长度是否超过100个字符
	  if(document.getElementById("txtIntro").value.length > 100)
	  {
		  
		  document.getElementById("tips_introduction").innerHTML = "<em style='color:#FF0000'>长度不能超过100个字符</em>";
		  document.getElementById("txtIntro").focus();
		  return false;
	  }
	  else
	  {
		   document.getElementById("tips_introduction").innerHTML = "OK！"
	  }
  }
  /*
  校验爱好是否合法
  */
  function changeHobby()
  { 
      var hobby = 0;
	  //objNum为所有名称为hobby的input标签
	  var objNum = document.getElementsByName("hobby");
	  //遍历所有的hobby标签
	  for(var i=0;i<objNum.length;++i)
	  {
		  //判断某个hobby标签是否被选中
		  if(objNum[i].checked == true)
		  	hobby++;
	  }
	  //如果有选中的hobby标签
	  if( hobby >= 1)
	  {
		  document.getElementById("tips_hobby").innerHTML = "OK！"; 
	  }
	  else
	  {
		  document.getElementById("tips_hobby").innerHTML = "<em style='color:#FF0000'>至少选择其中一项</em>"; 
		  return false;
	  }  
  }