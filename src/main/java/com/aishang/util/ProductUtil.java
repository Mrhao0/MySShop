package com.aishang.util;

import com.aishang.po.*;
import com.aishang.service.IProductTypeService;
import org.springframework.stereotype.Component;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.Tuple;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Component
public class ProductUtil {
    public static ProductUtil productUtil;
    @PostConstruct
    public void init(){
        productUtil=this;
    }
    @Resource
    IProductTypeService ProductTypeService;
    public List<ProductTypeListSp> selectProductByCsId(){
       return ProductTypeService.selectProductByCsId();
    }
    public ProductInfmation getOneProduct(ProductInfmation productInfmation){
        return ProductTypeService.getOneProduct(productInfmation);
    }
    public SearchProduct searchProduct(SearchProduct searchProduct){
        return ProductTypeService.searchProduct(searchProduct);
    }

    public  Set<String> getHotBotList() {
        Jedis jedis = JedisUtil.getjedis();
        Set<String> hotlist1 = jedis.zrevrange("hotlist", 0, 7);
        JedisUtil.closeRedis(jedis);
        return hotlist1;
    }

}
