package com.utils;

import java.sql.*;


public class DbUtil {
    private static final String url = "jdbc:mysql://localhost:3306/userdb";
    private static final String user ="root";
    private static final String password ="123456";

    protected static Statement s =null;
    protected static ResultSet rs =null;
    protected static Connection conn =null;

    public static synchronized Connection getConnection(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url,user,password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static int executeUpdate(String sql){
        int result = 0;
        try {
            s = getConnection().createStatement();
            result = s.executeUpdate(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }

    public static ResultSet executeQuery(String sql){
        try {
            s = getConnection().createStatement();
            rs = s.executeQuery(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rs;
    }

    public static PreparedStatement executePreparedStatement(String sql){
        PreparedStatement ps = null;
        try {
            ps = getConnection().prepareStatement(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return ps;
    }

    public static void rollback(){
        try {
            getConnection().rollback();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public static void close(){
        try {
            if (rs!=null)
                rs.close();
            if (s!=null)
                s.close();
            if (conn!=null)
                conn.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
