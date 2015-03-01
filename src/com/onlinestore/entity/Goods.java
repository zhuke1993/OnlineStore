package com.onlinestore.entity;

import java.util.List;

/**
 * Created by zhuke on 2015/3/1.
 * 商品
 */
public class Goods {
    private int id;
    private String name;
    private float price;
    private String briefIntroduction;//简介
    private String specification;//规格
    private float inventory;//库存数量
    private float postage;//邮费
    private Shop shop;
    private List<Evaluation> evaluationList;
    private List<GoodsPicture> pictureList;
    private List<Category> categoryList;

    public Goods() {
    }

    public Goods(int id, String name, float price, String briefIntroduction, String specification, float inventory, float postage, Shop shop, List<Evaluation> evaluationList, List<GoodsPicture> pictureList, List<Category> categoryList) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.briefIntroduction = briefIntroduction;
        this.specification = specification;
        this.inventory = inventory;
        this.postage = postage;
        this.shop = shop;
        this.evaluationList = evaluationList;
        this.pictureList = pictureList;
        this.categoryList = categoryList;
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
                ", shop=" + shop +
                ", evaluationList=" + evaluationList +
                ", pictureList=" + pictureList +
                ", categoryList=" + categoryList +
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

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
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

    public float getInventory() {
        return inventory;
    }

    public void setInventory(float inventory) {
        this.inventory = inventory;
    }

    public float getPostage() {
        return postage;
    }

    public void setPostage(float postage) {
        this.postage = postage;
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    public List<Evaluation> getEvaluationList() {
        return evaluationList;
    }

    public void setEvaluationList(List<Evaluation> evaluationList) {
        this.evaluationList = evaluationList;
    }

    public List<GoodsPicture> getPictureList() {
        return pictureList;
    }

    public void setPictureList(List<GoodsPicture> pictureList) {
        this.pictureList = pictureList;
    }

    public List<Category> getCategoryList() {
        return categoryList;
    }

    public void setCategoryList(List<Category> categoryList) {
        this.categoryList = categoryList;
    }
}
