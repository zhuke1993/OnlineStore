package com.onlinestore.entity;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * Created by zhuke on 2015/4/18.
 */
@Component
@Scope("prototype")
public class Goods2Num {
    private int id;
    private Goods goods;
    private int num;

    public Goods2Num() {
    }

    public Goods2Num(Goods goods, int num) {
        this.goods = goods;
        this.num = num;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    @Override
    public String toString() {
        return "Goods2Num{" +
                "id=" + id +
                ", goods=" + goods +
                ", num=" + num +
                '}';
    }
}
