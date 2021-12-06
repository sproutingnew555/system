<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.utils.DbUtil,java.sql.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//获取查询方式和关键字
String type = request.getParameter("column");
String keyword = request.getParameter("value");
//默认查询所有的用户信息
String sqlSearch = "SELECT * FROM tb_users";
//如果查询关键字不为空，则重定义SQL语句
if(keyword != null)
{
	sqlSearch = "SELECT * FROM tb_users WHERE " + type + " LIKE '%" + keyword + "%'";
}
ResultSet rs = null;
rs = DbUtil.executeQuery(sqlSearch);
StringBuffer sb = new StringBuffer();
try{
while(rs.next())
{
	String username = "";
	username = rs.getString("fd_username");
	sb.append("<tr><td>");
	sb.append(username);
	sb.append("</td><td>");
	sb.append(rs.getString("fd_usertype"));
	sb.append("</td><td>");
	sb.append(rs.getString("fd_gender"));
	sb.append("</td><td>");
	sb.append(rs.getString("fd_hobby"));
	sb.append("</td><td>");
	sb.append(rs.getString("fd_birthdate"));
	sb.append("</td><td>");
	sb.append(rs.getString("fd_email"));
	sb.append("</td><td>");
	sb.append(rs.getString("fd_introduction"));
	sb.append("</td><td>");
	//查询字符串，传递一个名为name的参数，该参数值为username即用户名
	sb.append("<a href='delete.jsp?name=" + username + "'>删除</a>");
	sb.append("&nbsp;");
	sb.append("<a href='userUpdate.jsp?name=" + username +"'>修改</a>");
	sb.append("</td></tr>");
}
DbUtil.close();
}catch(SQLException e)
{
	e.printStackTrace();	
}
session.setAttribute("search", sb);
response.sendRedirect("userAdmin.jsp");
%>
</body>
</html>