package com.onlinestore.entity;

import java.util.Date;
import java.util.Set;

/**
 * Created by zhuke on 2015/4/20.
 */
public class COrder {
    private int id;
    private Customer customer;
    private Shop shop;
    private double price;
    private double postage;
    private int status;
    private Date bargainDate;//成交时间
    private Date paymentDate;//付款时间
    private Date confirmDate;//确认时间
    private Set<Goods2Num> goods2NumSet;//商品列表
    private Address address;//邮寄地址*/
    private int shop_delete;//店家的逻辑删除，0-未删除，1-已删除
    private int cus_delete;//用户的逻辑删除，同上
    public COrder() {
    }

    public COrder(double price, double postage, int status, Date bargainDate, Date paymentDate, Date confirmDate) {
        this.price = price;
        this.postage = postage;
        this.status = status;
        this.bargainDate = bargainDate;
        this.paymentDate = paymentDate;
        this.confirmDate = confirmDate;
    }

    public int getShop_delete() {
        return shop_delete;
    }

    public void setShop_delete(int shop_delete) {
        this.shop_delete = shop_delete;
    }

    public int getCus_delete() {
        return cus_delete;
    }

    public void setCus_delete(int cus_delete) {
        this.cus_delete = cus_delete;
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

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getPostage() {
        return postage;
    }

    public void setPostage(double postage) {
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

    public Set<Goods2Num> getGoods2NumSet() {
        return goods2NumSet;
    }

    public void setGoods2NumSet(Set<Goods2Num> goods2NumSet) {
        this.goods2NumSet = goods2NumSet;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "COrder{" +
                "id=" + id +
                ", customer=" + customer.getName() +
                ", shop=" + shop +
                ", price=" + price +
                ", postage=" + postage +
                ", status=" + status +
                ", bargainDate=" + bargainDate +
                ", paymentDate=" + paymentDate +
                ", confirmDate=" + confirmDate +
                ", goods2NumSet=" + goods2NumSet.size() +
                ", address=" + address.getDetailAddress() +
                '}';
    }
}
