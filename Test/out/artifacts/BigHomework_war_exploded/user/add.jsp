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
    //设置请求报文的字符编码为utf-8
	request.setCharacterEncoding("utf-8");
	//获取表单输入域的值
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String usertype = request.getParameter("usertype");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	String birthdate = request.getParameter("birthdate");
	String introduction = request.getParameter("introduction");
	//获取表单中“爱好”输入域
	String[] hobbies = request.getParameterValues("hobby");
	String hobby = "";
	//遍历hobbies数组，将其转化为一个字符串
	for(int i=0;i<hobbies.length;i++)
	{
		hobby = hobby + " " + hobbies[i];
	}
	
	//编写SQL语句
	String sql = "INSERT INTO tb_users(fd_username,fd_password,fd_usertype,fd_gender,fd_email," +
			"fd_birthdate, fd_introduction,fd_hobby) VALUES (?,?,?,?,?,?,?,?)";
	
	/*
	String sql = "INSERT INTO tb_users(fd_username,fd_password,fd_usertype,fd_gender,fd_email," +
			"fd_birthdate, fd_introduction,fd_hobby) VALUES ('" + username + "','" +
	password +"','" + usertype + "','" + 
			gender + "','" + email + "','" +birthdate + "','" + introduction + "','" + hobby +"')";
	System.out.println(sql);
	*/

	int result = 0;
	//为动态SQL的参数赋值
	try{
	PreparedStatement ps = DbUtil.executePreparedStatement(sql);
	ps.setString(1, username);
	ps.setString(2, password);
	ps.setString(3, usertype);
	ps.setString(4, gender);
	ps.setString(5, email);
	ps.setString(6, birthdate);
	ps.setString(7, introduction);
	ps.setString(8, hobby);
	//执行SQL语句
	result =ps.executeUpdate();
	ps.close();
	}catch(SQLException e)
	{
		e.printStackTrace();
	}
	//如果执行成功，查询数据库
	if(result >0 )
	{
		//查询所有的用户信息
		String sqlSearch = "SELECT * FROM tb_users";
		ResultSet rs = null;
		rs = DbUtil.executeQuery(sqlSearch);
		StringBuffer sb = new StringBuffer();
		try{
		//编历查询结果，拼接为StringBuffer对象。
		while(rs.next())
		{
			sb.append("<tr><td>");
			sb.append(rs.getString("fd_username"));
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
			sb.append("<a href='#'>删除</a>");
			sb.append("&nbsp;");
			sb.append("<a href='#'>修改</a>");
			sb.append("</td></tr>");
		}
		DbUtil.close();
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		//将查询结果存入session名为search的属性中
		session.setAttribute("search", sb);
		//跳转至userAdmin.jsp页面
		response.sendRedirect("userAdmin.jsp");
	}
%>
</body>
</html>