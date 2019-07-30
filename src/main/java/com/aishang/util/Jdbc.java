package com.aishang.util;

import java.sql.*;

public class Jdbc {
    static Connection connection;
    static PreparedStatement ps;
    static ResultSet resultSet;
    static{
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    public static Connection getConn(){
        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true","root","root");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
    public static void close(Connection connection,PreparedStatement ps,ResultSet resultSet){
        try {
            if(resultSet!=null){
                resultSet.close();
            }
            if(ps!=null){
                ps.close();
            }
            if(connection!=null){
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
