package henu.utils;

import java.sql.*;
import java.util.Properties;
import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.commons.dbcp2.BasicDataSourceFactory;
public class DbcpPool { 
		/**
		 * ����JDBC��ض���
		 */
		protected static Statement s=null;
		protected static ResultSet rs = null;
		protected static Connection conn = null;
		private static BasicDataSource dataSource = null;

	    //��ʼ�����ݿ����ӳ�
	    public static void init() 
	    {
	        if (dataSource != null)
	        {
	            try
	            {
	                dataSource.close();
	            } catch (Exception e)
	            {
	                e.printStackTrace();
	            }
	            dataSource = null;
	        }
	        //ʹ��Properties���������ݿ����ӳ���Ϣ
	        try {
	            Properties p = new Properties();
	            p.setProperty("driverClassName", "com.mysql.jdbc.Driver");
	            p.setProperty("url", "jdbc:mysql://localhost:3306/userdb");
	            p.setProperty("username", "root");
	            p.setProperty("password", "123456");
	            p.setProperty("maxActive", "30");
	            p.setProperty("maxIdle", "10");
	            p.setProperty("maxWait", "1000");
	            p.setProperty("removeAbandoned", "false");
	            p.setProperty("removeAbandonedTimeout", "120");
	            p.setProperty("testOnBorrow", "true");
	            p.setProperty("logAbandoned", "true");       
	            //��ָ����Ϣ��������Դ
	            dataSource = (BasicDataSource) BasicDataSourceFactory.createDataSource(p);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    //�����ӳ��л�ȡ����
	    public static synchronized Connection getConnection() throws  SQLException {
	        if (dataSource == null) {
	            init();
	        }
	        Connection conn = null;
	        if (dataSource != null) {
	            conn = dataSource.getConnection();
	        }
	        return conn;
	    }
		/**
		 * ִ��INSERT/UPDATE/DELETE SQL���
		 * @param sql SQL��䣬�ַ�������
		 * @return ִ�н����int����
		 */
		public static int executeUpdate(String sql)
		{
			int result = 0;
			try {
				s = getConnection().createStatement();
				result = s.executeUpdate(sql);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			return result;
		}
		/**
		 * ִ��SELECT SQL���
		 * @param sql SQL��䣬�ַ�������
		 * @return ResultSet�����
		 */
		public static ResultSet executeQuery(String sql)
		{
			
			try {
				s = getConnection().createStatement();
				rs = s.executeQuery(sql);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			return rs;
		}
		/**
		 * ִ�ж�̬SQL���
		 * @param sql ���в����Ķ�̬SQL��䡣 
		 * @return ����PreparedStatement����
		 */
		public static PreparedStatement executePreparedStatement(String sql)
		{
			PreparedStatement ps = null;
			try
			{
				ps = getConnection().prepareStatement(sql);
			}catch(Exception e)
			{
				e.printStackTrace();
			}
			return ps;
		}
		/**
		 * ����ع�
		 */
		public static void rollback() {
			try {
				getConnection().rollback();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
		}
		/**
		 * �ر����ݿ����Ӷ���
		 */
		public static void close()
		{
			try
			{
				if(rs!=null)
					rs.close();
				if(s!= null)
					s.close();
				if(conn!=null)
					conn.close();
				
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
		public static void main(String[] args) {
			/*
			String sql = "INSERT INTO tb_users(fd_username,fd_password,fd_usertype,fd_gender,fd_birthdate,fd_email) VALUES ('Wangli','aWeY92,zeP', " +
			"'����Ա','Ů','1999-10-22','allen@henu.edu.cn')";
			executeUpdate(sql);
			close();
			*/
			//��дSQL���
			String sql = "INSERT INTO tb_users(fd_username,fd_password,fd_usertype,fd_gender,fd_email," +
					"fd_birthdate, fd_introduction,fd_hobby) VALUES (?,?,?,?,?,?,?,?)";
			
			//ִ��SQL
			PreparedStatement ps = DbUtil.executePreparedStatement(sql);
			try {
				ps.setString(1, "liang");
				ps.setString(2, "password");
				ps.setString(3, "1");
				ps.setString(4, "��");
				ps.setString(5, "email");
				ps.setString(6, "birthdate");
				ps.setString(7, "introduction");
				ps.setString(8, "hobby");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			
			int result = 0;
			try {
				result = ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
}
