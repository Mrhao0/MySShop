package com.aishang.po;

public class ProductInfmation {
    Integer pid;
    String pname;
    Double marketPrice;
    Double shopPrice;
    String image;
    String pDesc;
    Integer isHot;
    String pDate;
    Integer cSid;
    String pDesced;
    Integer pdel;

    public Integer getPdel() {
        return pdel;
    }

    public void setPdel(Integer pdel) {
        this.pdel = pdel;
    }

    public String getpDesced() {
        return pDesced;
    }

    public void setpDesced(String pDesced) {
        this.pDesced = pDesced;
    }

    @Override
    public String toString() {
        return "ProductInfmation{" +
                "pid=" + pid +
                ", pname='" + pname + '\'' +
                ", marketPrice=" + marketPrice +
                ", shopPrice=" + shopPrice +
                ", image='" + image + '\'' +
                ", pdesc='" + pDesc + '\'' +
                ", isHot=" + isHot +
                ", pdate='" + pDate + '\'' +
                ", csid=" + cSid +
                ", pDesced=" + pDesced +
                ", pdel=" + pdel +
                '}';
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public Double getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(Double marketPrice) {
        this.marketPrice = marketPrice;
    }

    public Double getShopPrice() {
        return shopPrice;
    }

    public void setShopPrice(Double shopPrice) {
        this.shopPrice = shopPrice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getPdesc() {
        return pDesc;
    }

    public void setPdesc(String pdesc) {
        this.pDesc = pdesc;
    }

    public Integer getIsHot() {
        return isHot;
    }

    public void setIsHot(Integer isHot) {
        this.isHot = isHot;
    }

    public String getPdate() {
        return pDate;
    }

    public void setPdate(String pdate) {
        this.pDate = pdate;
    }

    public Integer getCsid() {
        return cSid;
    }

    public void setCsid(Integer csid) {
        this.cSid = csid;
    }
}
