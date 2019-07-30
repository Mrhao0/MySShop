package com.aishang.po;

public class OrderItemExt extends OrderItem {

    private ProductInfmation productInfmation;

    @Override
    public String toString() {
        return "OrderItemExt{" +
                "productInfmation=" + productInfmation +
                '}';
    }

    public ProductInfmation getProductInfmation() {
        return productInfmation;
    }

    public void setProductInfmation(ProductInfmation productInfmation) {
        this.productInfmation = productInfmation;
    }
}
