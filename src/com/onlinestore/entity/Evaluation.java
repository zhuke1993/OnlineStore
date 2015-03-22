package com.onlinestore.entity;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * Created by zhuke on 2015/3/1.
 * 评价
 */
@Component
@Scope("prototype")
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

    public Evaluation( int level, String detail, Date date) {
        this.level = level;
        this.detail = detail;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }
}
