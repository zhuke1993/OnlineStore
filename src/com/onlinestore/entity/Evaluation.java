package com.onlinestore.entity;

import java.util.Date;

/**
 * Created by zhuke on 2015/3/1.
 * 评价
 */
public class Evaluation {
    private int id;
    private int level;
    private String detail;
    private Date date;
    private Goods goods;

    @Override
    public String toString() {
        return "Evaluation{" +
                "id=" + id +
                ", level=" + level +
                ", detail='" + detail + '\'' +
                ", date=" + date +
                ", goods=" + goods +
                '}';
    }

    public Evaluation() {
    }

    public Evaluation(int id, int level, String detail, Date date, Goods goods) {
        this.id = id;
        this.level = level;
        this.detail = detail;
        this.date = date;
        this.goods = goods;
    }

    public int getId() {
        return id;
    }

    public int getLevel() {
        return level;
    }

    public String getDetail() {
        return detail;
    }

    public Date getDate() {
        return date;
    }

    public Goods getGoods() {
        return goods;
    }
}
