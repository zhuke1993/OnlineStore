package com.onlinestore.entity;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * Created by zhuke on 2015/3/1.
 * 商品图片
 */
@Component
@Scope("prototype")
public class GoodsPicture {
    private int id;
    private Goods goods;
    private String url;

    public GoodsPicture() {
    }

    public GoodsPicture(Goods goods, String url) {
        this.goods = goods;
        this.url = url;
    }

    @Override
    public String toString() {
        return "GoodsPicture{" +
                "id=" + id +
                ", goods=" + goods +
                ", url='" + url + '\'' +
                '}';
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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
