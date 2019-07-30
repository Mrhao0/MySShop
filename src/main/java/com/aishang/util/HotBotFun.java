package com.aishang.util;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.Tuple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;

public class HotBotFun {
    static Connection connection;
    static PreparedStatement ps;
    static ResultSet resultSet;
public static void toJedis(){
    Jedis jedis = JedisUtil.getjedis();
    try {
        Connection conn = Jdbc.getConn();
        ps = conn.prepareStatement("select * from hot_bot");
        resultSet = ps.executeQuery();
        while(resultSet.next()){
            jedis.zadd("hotlist",resultSet.getInt("sort"),resultSet.getString("hot_bot"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }finally {
        Jdbc.close(connection,ps,resultSet);
        JedisUtil.closeRedis(jedis);
    }
}
    public static void delete(){
        Jedis jedis = JedisUtil.getjedis();
        try {
            Connection conn = Jdbc.getConn();
            ps = conn.prepareStatement("delete from hot_bot");
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Jdbc.close(connection,ps,resultSet);
            JedisUtil.closeRedis(jedis);
        }
    }
    public static void insert(String hotbot,Double sort){
        int i = sort.intValue();
        try {
            Connection conn = Jdbc.getConn();
            ps = conn.prepareStatement("insert into hot_bot values(default,?,?)");
            ps.setString(1,hotbot);
            ps.setDouble(2,i);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Jdbc.close(connection,ps,resultSet);
        }
    }
}
