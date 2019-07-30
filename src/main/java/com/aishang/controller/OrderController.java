package com.aishang.controller;

import com.aishang.po.*;
import com.aishang.service.IOrderService;
import com.aishang.util.ProductUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Resource
    HttpSession session;
    @Resource
    IOrderService iOrderService;
    @RequestMapping("/confirmAnOrder")
    public String confirmAnOrder(Integer[] pid,Integer pid1, Model model){
        System.out.println("\n\n\n"+pid+"\n\n\n");
        if(pid1!=null){
            pid =new Integer[1];
            pid[0]=pid1;
        }
        if(pid==null){
            return "redirect:/product/cart.do";
        }
        model.addAttribute("pids",pid);
        return "ConfirmAnOrder";
    }
    @RequestMapping("/orderform")
    public String orderForm(Model model,OrderBean orderBean){
        User user=(User)session.getAttribute("user");
        if(user==null){
            return "redirect:/user/login.do";
        }
        List<Orders> Olist=iOrderService.getOlist();
        orderBean=iOrderService.OrderFormList(orderBean);
        List<ProductTypeListSp> productTypeList= ProductUtil.productUtil.selectProductByCsId();
        model.addAttribute("productType",productTypeList);
        model.addAttribute("orderBean",orderBean);
        model.addAttribute("Olist",Olist);
        return "orderForm";
    }
    @RequestMapping("/topay1")
    public String topay1(Integer oid,Model model){
        model.addAttribute("oid",oid);
        return "toPay";
    }
    @RequestMapping("/topay")
    public String topay(OrdersExt ordersExt,Integer[] pids,Model model){
        User user=(User)session.getAttribute("user");
        if(user==null){
            return "redirect:/user/login.do";
        }
        OrderItemExt orderItemExt = new OrderItemExt();
        Date date=new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
        String now=simpleDateFormat.format(date);

        CartSp cartSp= (CartSp)session.getAttribute("Cart");
        Map<Integer, CartUnit> cartMap = cartSp.getCartMap();
        Double subtatol=0.0;
        if(pids!=null){
            for (Integer pid:pids) {
                subtatol=cartMap.get(pid).getSubtotal()+subtatol;

            }
        }else{
            return "redirect:/product/cart.do";
        }

        ordersExt.setOrdertime(now);
        ordersExt.setTotal(subtatol);
        ordersExt.setUid(user.getUid());
        iOrderService.insertOrderForm(ordersExt);

        Integer oid=ordersExt.getOid();
        for (Integer pid:pids) {
            orderItemExt.setProductInfmation(cartMap.get(pid).getProductInfmation());
            orderItemExt.setCount(cartMap.get(pid).getNumber());
            orderItemExt.setSubtotal(cartMap.get(pid).getSubtotal());
            orderItemExt.setPid(pid);
            orderItemExt.setOid(oid);
            iOrderService.insertOrderItem(orderItemExt);
        }
        for (Integer pid:pids) {
            cartMap.remove(pid);
        }
        model.addAttribute("oid",oid);
        List<ProductTypeListSp> productTypeList= ProductUtil.productUtil.selectProductByCsId();
        model.addAttribute("productType",productTypeList);
        return "toPay";
    }
    @RequestMapping("/paysuccess")
    public String paysuccess(OrdersExt ordersExt,Model model){
        iOrderService.upDateState(ordersExt);
        ordersExt = iOrderService.getAorders(ordersExt);
        model.addAttribute("ordersExt",ordersExt);
        List<ProductTypeListSp> productTypeList= ProductUtil.productUtil.selectProductByCsId();
        model.addAttribute("productType",productTypeList);

        return "paySuccess";
    }
    //假删
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(Orders orders){
        Integer oid = orders.getOid();
        iOrderService.deleteOrder(oid);
        return "t";
    }
    @RequestMapping("/signin")
    @ResponseBody
    public String signin(Orders orders){
        Integer oid = orders.getOid();
        iOrderService.signinOrder(oid);
        return "t";
    }
}
