package com.aishang.po;

public class CartUnit {
    private ProductInfmation productInfmation;
    private Integer number=0;
    private Double subtotal=0.0;

    @Override
    public String toString() {
        return "CartUnit{" +
                ", productInfmation=" + productInfmation +
                ", number=" + number +
                ", subtotal=" + subtotal +
                '}';
    }


    public ProductInfmation getProductInfmation() {
        return productInfmation;
    }

    public void setProductInfmation(ProductInfmation productInfmation) {
        this.productInfmation = productInfmation;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }
}
