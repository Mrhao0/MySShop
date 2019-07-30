package com.aishang.util;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.Tuple;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.*;
import java.util.Set;

@WebListener
public class MyListener implements ServletContextListener {
    Connection connection;
    PreparedStatement ps;
    ResultSet resultSet;

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        HotBotFun.toJedis();
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        Jedis jedis = JedisUtil.getjedis();
        HotBotFun.delete();
        Set<Tuple> hotlist = jedis.zrevrangeWithScores("hotlist",0,-1);
        for (Tuple tp:hotlist
             ) {
            HotBotFun.insert(tp.getElement(),tp.getScore());
        }
        JedisUtil.closeRedis(jedis);
    }
}
