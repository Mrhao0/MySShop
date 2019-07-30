package com.aishang.po;

import java.util.List;

public class PageBean<T> {
    private Integer pageNow=1;
    private Integer pageSize=12;
    private Integer pageCount;
    private Integer rowCount;
    private Integer star;
    private List<T> list;

    @Override
    public String toString() {
        return "PageBean{" +
                "pageNow=" + pageNow +
                ", pageSize=" + pageSize +
                ", pageCount=" + pageCount +
                ", rowCount=" + rowCount +
                ", star=" + star +
                ", list=" + list +
                '}';
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public Integer getStar() {
        star=(pageNow-1)*pageSize;
        return star;
    }

    public void setStar(Integer star) {
        this.star = star;
    }

    public Integer getPageNow() {
        if(pageNow<1){
            pageNow=1;
        }else if(pageNow>pageCount){
            pageNow=pageCount;
        }
        return pageNow;
    }

    public void setPageNow(Integer pageNow) {
        this.pageNow = pageNow;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageCount() {
        if(rowCount%pageSize==0){
            pageCount=rowCount/pageSize;
        }else {
            pageCount = rowCount / pageSize + 1;
        }
        return pageCount;
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }

    public Integer getRowCount() {

        return rowCount;
    }

    public void setRowCount(Integer rowCount) {
        this.rowCount = rowCount;
    }
}
