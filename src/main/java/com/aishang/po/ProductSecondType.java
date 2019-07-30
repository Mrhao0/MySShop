package com.aishang.po;

import java.util.ArrayList;
import java.util.List;

public class ProductSecondType {
    Integer csid;
    String csname;
    Integer cid;
    private List<ProductInfmation> SuperSentedList;

    @Override
    public String toString() {
        return "ProductSecondType{" +
                "csid=" + csid +
                ", csname='" + csname + '\'' +
                ", cid=" + cid +
                ", SuperSentedList=" + SuperSentedList +
                '}';
    }

    public Integer getCsid() {
        return csid;
    }

    public void setCsid(Integer csid) {
        this.csid = csid;
    }

    public String getCsname() {
        return csname;
    }

    public void setCsname(String csname) {
        this.csname = csname;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public List<ProductInfmation> getSuperSentedList() {
        return SuperSentedList;
    }

    public void setSuperSentedList(List<ProductInfmation> superSentedList) {
        SuperSentedList = superSentedList;
    }
}
