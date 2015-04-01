package com.onlinestore.entity;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.Set;

/**
 * Created by zhuke on 2015/3/1.
 * 商品
 */
@Component
@Scope("prototype")
public class Goods {
    private int id;
    private String name;
    private double price;
    private String briefIntroduction;//简介
    private String specification;//规格
    private double inventory;//库存数量
    private double postage;//邮费
    private Shop shop;
    private Set<GoodsPicture> pictureSet;
    private Set<Category> categorySet;

    public Goods() {
    }

    public Goods(String name, double price, String briefIntroduction, String specification, double inventory, double postage) {
        this.name = name;
        this.price = price;
        this.briefIntroduction = briefIntroduction;
        this.specification = specification;
        this.inventory = inventory;
        this.postage = postage;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", briefIntroduction='" + briefIntroduction + '\'' +
                ", specification='" + specification + '\'' +
                ", inventory=" + inventory +
                ", postage=" + postage +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getBriefIntroduction() {
        return briefIntroduction;
    }

    public void setBriefIntroduction(String briefIntroduction) {
        this.briefIntroduction = briefIntroduction;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public double getInventory() {
        return inventory;
    }

    public void setInventory(double inventory) {
        this.inventory = inventory;
    }

    public double getPostage() {
        return postage;
    }

    public void setPostage(double postage) {
        this.postage = postage;
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    public Set<GoodsPicture> getPictureSet() {
        return pictureSet;
    }

    public void setPictureSet(Set<GoodsPicture> pictureSet) {
        this.pictureSet = pictureSet;
    }

    public Set<Category> getCategorySet() {
        return categorySet;
    }

    public void setCategorySet(Set<Category> categorySet) {
        this.categorySet = categorySet;
    }
}
