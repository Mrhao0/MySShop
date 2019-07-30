package com.aishang.service.impl;

import com.aishang.dao.IOrderDao;
import com.aishang.po.*;
import com.aishang.service.IOrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.persistence.criteria.Order;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class OrderService implements IOrderService {
    @Resource
    IOrderDao iOrderDao;
    @Resource
    HttpSession session;
    @Override
    public void insertOrderForm(OrdersExt ordersExt) {
        iOrderDao.insertOrderForm(ordersExt);
    }

    @Override
    public void insertOrderItem(OrderItemExt orderItemExt) {
        iOrderDao.insertOrderItem(orderItemExt);
    }

    @Override
    public OrdersExt getAorders(OrdersExt ordersExt) {
       return iOrderDao.getAorders(ordersExt);
    }

    @Override
    public void upDateState(OrdersExt ordersExt) {
        iOrderDao.upDateState(ordersExt);
    }

    @Override
    public OrderBean OrderFormList(OrderBean orderBean) {
        User user=(User)session.getAttribute("user");
        orderBean.setUid(user.getUid());
        orderBean.setPageSize(3);
        List<OrdersExt> list=iOrderDao.OrderFormList(orderBean);
        orderBean.setList(list);

       Integer RowCount= iOrderDao.getOrderRowCount(user);
       orderBean.setRowCount(RowCount);

       return orderBean;
    }

    @Override
    public List<Orders> getOlist() {
        User user=(User)session.getAttribute("user");
        return iOrderDao.getOlist(user);
    }

    @Override
    public void deleteOrder(Integer oid) {
        iOrderDao.deleteOrder(oid);
    }

    @Override
    public void signinOrder(Integer oid) {
        iOrderDao.signinOrder(oid);
    }
}
