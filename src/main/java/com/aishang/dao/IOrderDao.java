package com.aishang.dao;

import com.aishang.po.*;

import javax.persistence.criteria.Order;
import java.util.List;

public interface IOrderDao {

    void insertOrderForm(OrdersExt ordersExt);

    void insertOrderItem(OrderItemExt orderItemExt);

    OrdersExt getAorders(OrdersExt ordersExt);

    void upDateState(OrdersExt ordersExt);

    List<OrdersExt> OrderFormList(OrderBean orderBean);

    Integer getOrderRowCount(User user);

    List<Orders> getOlist(User user);

    void deleteOrder(Integer oid);

    void signinOrder(Integer oid);
}
