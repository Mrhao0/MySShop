package com.aishang.util;

import com.aishang.controller.UserController;
import com.aishang.po.HotBot;
import com.aishang.service.IUserService;
import com.aishang.service.impl.UserServiceImpl;
import org.springframework.stereotype.Component;
import redis.clients.jedis.Jedis;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.List;

@Component
public class UserUtil {
    public static UserUtil userUtil;
    @PostConstruct
    public void init(){
        userUtil=this;
    }
    @Resource
    public IUserService userService;
    static{

    }

}
