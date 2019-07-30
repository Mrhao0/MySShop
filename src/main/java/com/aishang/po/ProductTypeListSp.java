package com.aishang.po;

import java.util.List;

public class ProductTypeListSp extends ProductFirstType{

    List<ProductSecondType> productSuperList;

    public List<ProductSecondType> getProductSuperList() {
        return productSuperList;
    }

    public void setProductSuperList(List<ProductSecondType> productSuperList) {
        this.productSuperList = productSuperList;
    }

    @Override
    public String toString() {
        return "ProductTypeListSp{" +
                "productSuperList=" + productSuperList +
                '}';
    }
}
