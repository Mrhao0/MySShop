package com.aishang.service.impl;

import com.aishang.dao.IProductTypeDao;
import com.aishang.po.*;
import com.aishang.service.IProductTypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ProductTypeService implements IProductTypeService {
    @Resource
    IProductTypeDao iProductTypeDao;

    @Override
    public List<ProductTypeListSp> selectProductTypeList() {
        return iProductTypeDao.selectProductTypeList();
    }

    @Override
    public List<ProductTypeListSp> selectProductByCsId() {
        List<ProductTypeListSp> typeListSp=selectProductTypeList();
        for (ProductTypeListSp as:typeListSp) {
            for (ProductSecondType sa:as.getProductSuperList()) {
                List<ProductInfmation> productList=iProductTypeDao.selectProductByCsId(sa.getCsid());
                for (ProductInfmation proi:productList) {
                    if(proi.getPdesc().length()>20){
                        proi.setpDesced(proi.getPdesc().substring(0,20)+"...");
                    }else{
                        proi.setpDesced(proi.getPdesc());
                    }
                }
                sa.setSuperSentedList(productList);
            }
        }
        return typeListSp;
    }

    @Override
    public SearchProduct searchProduct(SearchProduct searchProduct) {

        searchProduct.setRowCount(iProductTypeDao.getProductRowCount(searchProduct));
        List<ProductInfmation> productInfmations = iProductTypeDao.searchProduct(searchProduct);
        for (ProductInfmation proi:productInfmations) {
            if(proi.getPdesc().length()>13){
                proi.setpDesced(proi.getPdesc().substring(0,13)+"...");
            }else{
                proi.setpDesced(proi.getPdesc());
            }
        }
        searchProduct.setList(productInfmations);

//        String pname=searchProduct.getPname();
//        if(pname!=null && !"".equals(pname)){
//            HotBot hotBot=iProductTypeDao.selectHotBot(pname);
//            if(hotBot!=null){
//                iProductTypeDao.updateHotBot(pname);
//            }else{
//                iProductTypeDao.insertHotBot(pname);
//            }
//        }

        return searchProduct;
    }

    @Override
    public ProductInfmation getOneProduct(ProductInfmation productInfmation) {
        ProductInfmation AProduct=iProductTypeDao.getOneProduct(productInfmation);
        if(AProduct.getPdesc().length()>20){
            AProduct.setpDesced(AProduct.getPdesc().substring(0,14)+"...");
        }else{
            AProduct.setpDesced(AProduct.getPdesc());
        }
        return AProduct;
    }

    @Override
    public List<HotBot> getHotBotList() {

        return iProductTypeDao.getHotBotList();
    }


}
