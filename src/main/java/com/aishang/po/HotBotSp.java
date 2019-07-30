package com.aishang.po;

import java.util.List;

public class HotBotSp {
    private String pname;
    private List<HotBot> list;

    @Override
    public String toString() {
        return "HotBotSp{" +
                "pname='" + pname + '\'' +
                ", list=" + list +
                '}';
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public List<HotBot> getList() {
        return list;
    }

    public void setList(List<HotBot> list) {
        this.list = list;
    }
}
