package com.aishang.po;

public class OrderBean extends PageBean<OrdersExt> {
private Integer uid;
    private Integer state;
    private Integer odel=0;

    @Override
    public String toString() {
        return "OrderBean{" +
                "uid=" + uid +
                ", state=" + state +
                ", odel=" + odel +
                '}';
    }

    public Integer getOdel() {
        return odel;
    }

    public void setOdel(Integer odel) {
        this.odel = odel;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }
}
