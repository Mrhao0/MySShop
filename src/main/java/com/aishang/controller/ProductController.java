package com.aishang.controller;

import com.aishang.po.*;
import com.aishang.service.IProductTypeService;
import com.aishang.util.JedisUtil;
import com.aishang.util.ProductUtil;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import redis.clients.jedis.Jedis;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Resource
    HttpSession session;

    @RequestMapping("/cart")
    public String cart(Model model){
        List<ProductTypeListSp> productTypeList= ProductUtil.productUtil.selectProductByCsId();
        model.addAttribute("productType",productTypeList);
        return "Cart";
    }
    //主页
    @RequestMapping("/index")
    public String index1(Model model){
        List<ProductTypeListSp> productTypeList= ProductUtil.productUtil.selectProductByCsId();
        model.addAttribute("productType",productTypeList);
        return "index";
    }
    //产品列表页
    @RequestMapping("/productlist")
    public String productlist(Model model, SearchProduct searchProduct){

        searchProduct = ProductUtil.productUtil.searchProduct(searchProduct);
        List<ProductTypeListSp> productTypeList= ProductUtil.productUtil.selectProductByCsId();

        String pname = searchProduct.getPname();
        if(pname!=null && !"".equals(pname)){
            Jedis jedis = JedisUtil.getjedis();
            System.out.println("\n\n\n"+pname+"\n\n\n");
            jedis.zincrby("hotlist",1,pname);
            JedisUtil.closeRedis(jedis);
        }
        model.addAttribute("searchProduct",searchProduct);
        model.addAttribute("productType",productTypeList);
        return "productList";
    }
    //产品详情页
    @RequestMapping("/productInfmation")
    public String productInfmation(ProductInfmation productInfmation,Model model){
        productInfmation=ProductUtil.productUtil.getOneProduct(productInfmation);
        List<ProductTypeListSp> productTypeList= ProductUtil.productUtil.selectProductByCsId();
        model.addAttribute("productInfmation",productInfmation);
        model.addAttribute("productType",productTypeList);
        return "productInfmation";
    }
    @RequestMapping("/cart1")
    @ResponseBody
    public String cart1(Integer number,ProductInfmation productInfmation){
        System.out.println(number+"\n\n\n"+productInfmation);
        productInfmation=ProductUtil.productUtil.getOneProduct(productInfmation);
        CartUnit cartUnit=new CartUnit();
        cartUnit.setProductInfmation(productInfmation);
        cartUnit.setNumber(number);

        if(session.getAttribute("Cart")==null){
            CartSp cartSp=new CartSp();
            cartSp.addCartItem(cartUnit);
            session.setAttribute("Cart",cartSp);
            return cartSp.getCount()+"";
        }else{
            CartSp cartSp = (CartSp) session.getAttribute("Cart");
            cartSp.addCartItem(cartUnit);
            return cartSp.getCount()+"";
        }
    }
    @RequestMapping("/remove")
    @ResponseBody
    public String remove(Integer pid){
        CartSp cartSp = (CartSp) session.getAttribute("Cart");
        Double count = cartSp.getCount();
        Map<Integer, CartUnit> cartMap = cartSp.getCartMap();
        CartUnit cartUnit = cartMap.get(pid);
        Double subtotal = cartUnit.getSubtotal();
        cartSp.setCount(count-subtotal);
        Double count1 = count-subtotal;
        cartMap.remove(pid);
        return count1+"";
    }
    @ResponseBody
    @RequestMapping(value="/hotbot",produces="text/html;charset=UTF-8")
    public String hotbot(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {

        Set<String> hotBotList= ProductUtil.productUtil.getHotBotList();
        String s = JSON.toJSONString(hotBotList);
        System.out.println(s);
        return s;
    }

}
