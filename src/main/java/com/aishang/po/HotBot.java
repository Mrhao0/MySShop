package com.aishang.po;

public class HotBot {
    private Integer hotId;
    private String hotBot;
    private Integer sort;


    @Override
    public String toString() {
        return "HotBot{" +
                "hotId=" + hotId +
                ", hotBot='" + hotBot + '\'' +
                ", sort=" + sort +
                '}';
    }

    public Integer getHotId() {
        return hotId;
    }

    public void setHotId(Integer hotId) {
        this.hotId = hotId;
    }

    public String getHotBot() {
        return hotBot;
    }

    public void setHotBot(String hotBot) {
        this.hotBot = hotBot;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }
}
