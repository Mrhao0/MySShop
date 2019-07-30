package com.aishang.po;

public class SearchProduct extends PageBean<ProductInfmation>{
    private Integer cid;
    private Integer csid;
    private String pname;
    private Integer pdel=0;

    public Integer getPdel() {
        return pdel;
    }

    public void setPdel(Integer pdel) {
        this.pdel = pdel;
    }

    @Override
    public String toString() {
        return "SearchProduct{" +
                "cid=" + cid +
                ", csid=" + csid +
                ", pname='" + pname + '\'' +
                ", pdel=" + pdel +
                '}';
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getCsid() {
        return csid;
    }

    public void setCsid(Integer csid) {
        this.csid = csid;
    }
}
