
package com.aishang.po;

import javax.servlet.http.HttpSession;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class CartSp {
    private Double count=0.0;
    Map<Integer,CartUnit> CartMap=new LinkedHashMap<Integer,CartUnit>();

    public void addCartItem( CartUnit cartUnit){

        Integer pid=cartUnit.getProductInfmation().pid;
        Integer num=cartUnit.getNumber();
        if(CartMap.containsKey(pid)){
            Integer oldNum=CartMap.get(pid).getNumber();
            CartMap.get(pid).setNumber(num+oldNum);
            CartMap.get(pid).setSubtotal((num+oldNum)*CartMap.get(pid).getProductInfmation().shopPrice);
        }else{
            cartUnit.setSubtotal(cartUnit.getProductInfmation().shopPrice*cartUnit.getNumber());
            CartMap.put(pid,cartUnit);
        }
    }

    @Override
    public String toString() {
        return "CartSp{" +
                "count=" + count +
                ", CartMap=" + CartMap +
                '}';
    }


    public Double getCount() {
        count=0.0;
        Set<Integer> integers = CartMap.keySet();
        for (Integer integer:integers) {
            count=CartMap.get(integer).getSubtotal()+count;
        }
        return count;
    }

    public void setCount(Double count) {
        this.count = count;
    }

    public Map<Integer, CartUnit> getCartMap() {

        return CartMap;
    }

    public void setCartMap(Map<Integer, CartUnit> cartMap) {
        CartMap = cartMap;
    }
}

