package com.aishang.util;

import com.aishang.po.HotBot;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.annotation.Resource;
import java.util.List;

public class JedisUtil {
    public static Jedis getjedis(){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        JedisPool pool = (JedisPool) applicationContext.getBean("jedisPool");
        Jedis jedis = null;
        try {
            jedis = pool.getResource();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return jedis;
    }
    // 关闭连接
    public static void closeRedis(Jedis jedis){
            if (jedis != null) {

                jedis.close();
            }
    }
//public static void setHotBot(){

//}
}
