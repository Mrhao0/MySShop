package com.aishang.po;

public class ProductFirstType {
    Integer cid;
    String cname;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    @Override
    public String toString() {
        return "ProductFirstType{" +
                "cid=" + cid +
                ", cname='" + cname + '\'' +
                '}';
    }
}
