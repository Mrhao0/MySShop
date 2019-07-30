package com.aishang.po;

import java.util.List;

public class OrdersExt extends Orders {
    List<OrderItemExt> orderItemExts;

    @Override
    public String toString() {
        return "OrdersExt{" +
                "orderItemExts=" + orderItemExts +
                '}';
    }

    public List<OrderItemExt> getOrderItemExts() {
        return orderItemExts;
    }

    public void setOrderItemExts(List<OrderItemExt> orderItemExts) {
        this.orderItemExts = orderItemExts;
    }
}
