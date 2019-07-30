package com.aishang.dao;

import com.aishang.po.ProductTypeListSp;
import com.aishang.po.User;

public interface IUserDao {

    User selectUserByUserName(String userName);

    void insertUser(User user);

    User selectUserByPassWord(User user);

    void updateUserInformation(User user);

}
