package com.onlinestore.entity;

import java.util.Date;
import java.util.List;

/**
 * Created by zhuke on 2015/3/1.
 * 订单
 */
public class Order {
    private int id;
    private Customer customer;
    private List<Goods> goodsList;
    private Shop shop;
    private float price;
    private float postage;
    private int status;
    private Date bargainDate;//成交时间
    private Date paymentDate;//付款时间
    private Date confirmDate;//确认时间

    public Order() {
    }

    public Order(int id, Customer customer, List<Goods> goodsList, Shop shop, float price, float postage, int status, Date bargainDate, Date paymentDate, Date confirmDate) {
        this.id = id;
        this.customer = customer;
        this.goodsList = goodsList;
        this.shop = shop;
        this.price = price;
        this.postage = postage;
        this.status = status;
        this.bargainDate = bargainDate;
        this.paymentDate = paymentDate;
        this.confirmDate = confirmDate;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", customer=" + customer +
                ", goodsList=" + goodsList +
                ", shop=" + shop +
                ", price=" + price +
                ", postage=" + postage +
                ", status=" + status +
                ", bargainDate=" + bargainDate +
                ", paymentDate=" + paymentDate +
                ", confirmDate=" + confirmDate +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public List<Goods> getGoodsList() {
        return goodsList;
    }

    public void setGoodsList(List<Goods> goodsList) {
        this.goodsList = goodsList;
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getPostage() {
        return postage;
    }

    public void setPostage(float postage) {
        this.postage = postage;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getBargainDate() {
        return bargainDate;
    }

    public void setBargainDate(Date bargainDate) {
        this.bargainDate = bargainDate;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public Date getConfirmDate() {
        return confirmDate;
    }

    public void setConfirmDate(Date confirmDate) {
        this.confirmDate = confirmDate;
    }
}
