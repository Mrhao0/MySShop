package com.aishang.service.impl;

import com.aishang.dao.IUserDao;
import com.aishang.po.ProductTypeListSp;
import com.aishang.po.User;
import com.aishang.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("userService")
public class UserServiceImpl implements IUserService{

    @Resource
    private IUserDao userDao;

   public User selectUserByUserName(String userName){

        return userDao.selectUserByUserName(userName);
    }


    public void insertUser(User user){
        userDao.insertUser(user);

    }

    @Override
    public User selectUserByPassWord(User user) {
        return userDao.selectUserByPassWord(user);
    }

    @Override
    public void updateUserInformation(User user) {
        userDao.updateUserInformation(user);
    }
}

