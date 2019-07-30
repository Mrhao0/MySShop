package com.aishang.service;

import com.aishang.po.OrderBean;
import com.aishang.po.OrderItemExt;
import com.aishang.po.Orders;
import com.aishang.po.OrdersExt;

import javax.persistence.criteria.Order;
import java.util.List;

public interface IOrderService {
    void insertOrderForm(OrdersExt ordersExt);

    void insertOrderItem(OrderItemExt orderItemExt);

    OrdersExt getAorders(OrdersExt ordersExt);

    void upDateState(OrdersExt ordersExt);

    OrderBean OrderFormList(OrderBean orderBean);

    List<Orders> getOlist();

    void deleteOrder(Integer oid);

    void signinOrder(Integer oid);
}
