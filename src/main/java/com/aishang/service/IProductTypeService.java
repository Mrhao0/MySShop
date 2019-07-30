package com.aishang.service;

import com.aishang.po.*;

import java.util.List;

public interface IProductTypeService {

    List<ProductTypeListSp> selectProductTypeList();

    List<ProductTypeListSp> selectProductByCsId();

    SearchProduct searchProduct(SearchProduct searchProduct);

    ProductInfmation getOneProduct(ProductInfmation productInfmation);

    List<HotBot> getHotBotList();


}
