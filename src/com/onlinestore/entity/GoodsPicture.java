package com.onlinestore.entity;

/**
 * Created by zhuke on 2015/3/1.
 * 商品图片
 */
public class GoodsPicture {
    private int id;
    private Goods goods;
    private String url;

    public GoodsPicture() {
    }

    public GoodsPicture(int id, Goods goods, String url) {
        this.id = id;
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
