<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.utils.DbUtil,java.sql.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户信息修改</title>
<link rel="stylesheet" href="../css/add.css" />
<script type="text/javascript" src="../js/check.js"></script>

</head>
<%
//获取查询字符串中参数name的值
String name = request.getParameter("name");
//定义SQL语句
String sql = "SELECT * FROM tb_users WHERE fd_username='" + name + "'";
ResultSet rs = DbUtil.executeQuery(sql);
String username="",introduction="",email="",birthdate="",usertype="",gender="",hobby="";
while(rs.next())
{
	username = rs.getString("fd_username");
	introduction = rs.getString("fd_introduction");
	email = rs.getString("fd_email");
	birthdate = rs.getString("fd_birthdate");
	usertype = rs.getString("fd_usertype");
	gender = rs.getString("fd_gender");
	hobby = rs.getString("fd_hobby");
}
DbUtil.close();
%>

<body>
<form id="userForm" name="user" method="post" action="update.jsp">
<table>
<tr>
<td>用 户 名</td>
<td>
  <input name="username" type="text" id="txtUser" onBlur="return checkForm()" value="<%=username %>"></input>
</td>
<td><span id="tips_username">* 用户名由6-18位字符组成</span></td>
</tr>
<tr>
<td>密&nbsp;&nbsp;码</td>
<td><input name="password" type="password" id="txtPwd"  onBlur="return checkForm()"></input></td>
<td><span id="tips_password">* 密码由6-18位字符组成，且必须包含字母、数字和标点符号</span></td>
</tr>
<tr>
<td>确认密码</td>
<td><input name="pwdrepeat" type="password" id="txtRpt" onBlur="return checkForm()"></input></td>
<td><span id="tips_repeat">* 请再次输入你的密码</span></td>
</tr>
<tr>
<td>用户类型</td>
<td><select name="usertype" id="selUser" onBlur="return checkForm()">
<option>请选择</option>
<option value="管理员" <%if(usertype.equals("管理员"))
		out.print("selected='true'"); %>>管理员</option>
<option value="普通用户"  <%if(usertype.equals("普通用户"))
		out.print("selected='true'"); %>>普通用户</option>
</select></td>
<td><span id="tips_usertype">* 请选择用户类型</span></td>
</tr>
<tr>
<td>性&nbsp;&nbsp;别</td>
<td>
<input name="gender" type="radio" value="男" <%if(gender.equals("男")) out.print("checked='true'"); %> onClick="return checkGender()"/>男
<input name="gender" type="radio" value="女" <%if(gender.equals("女")) out.print("checked='true'"); %> onClick="return checkGender()"/>女</td>
<td><span id="tips_gender">* 请选择你的性别</span></td>
</tr>
<tr>
<td>出生日期</td>
<td>
<input name="birthdate" type="date" id="txtDate" onBlur="return checkForm()" value="<%=birthdate %>"/></td>
<td><span id="tips_birthdate">* 请选择你的出生日期</span></td>
</tr>
<tr>
<td>兴趣爱好</td>

<td><input name="hobby" type="checkbox" value="阅读" <%if(hobby.contains("阅读")) out.print(" checked='true'"); %>onClick="return changeHobby()"/>阅读
<input name="hobby" type="checkbox" value="音乐" <%if(hobby.contains("音乐")) out.print(" checked='true'");%> onClick="return changeHobby()"/>音乐
<input name="hobby" type="checkbox" value="运动" <%if(hobby.contains("运动")) out.print(" checked='true'");%> onClick="return changeHobby()"/>运动
</td>
<td><span id="tips_hobby">* 请选择兴趣爱好</span></td>
</tr>
<tr>
<td>电子邮件</td>
<td><input name="email" type="email" id="txtMail" onBlur="return checkForm()" value="<%=email %>"></input></td>
<td><span id="tips_email">* 请填写常用的EMAIL，将用于密码找回</span></td>
</tr>
<tr>
<td>自我介绍</td>
<td>
  <textarea name="introduction" cols="40" rows="5" id="txtIntro" onBlur="return checkForm()"><%=introduction %></textarea>
</td>
<td><span id="tips_introduction">*  限100字以内</span></td>
</tr>
<tr>
<td colspan="2" align="center">
  <input type="submit" name="submit" value="提交"/>
 <input  type="reset" name="reset" value="重置" />
</td>
</tr>
</table>
</form>
</body>
</html>