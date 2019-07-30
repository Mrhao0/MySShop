package com.aishang.dao;

import com.aishang.po.*;

import java.util.List;

public interface IProductTypeDao {
    List<ProductTypeListSp> selectProductTypeList();

    List<ProductInfmation> selectProductByCsId(Integer csid);

    List<ProductInfmation> searchProduct(SearchProduct searchProduct);

    Integer getProductRowCount(SearchProduct searchProduct);

    ProductInfmation getOneProduct(ProductInfmation productInfmation);

    void insertHotBot(String pname);

    List<HotBot> getHotBotList();


}
