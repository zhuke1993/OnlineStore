package com.onlinestore.entity;

import java.util.Date;
import java.util.List;

/**
 * Created by zhuke on 2015/3/1.
 * 店铺
 */
public class Shop {
    private int id;
    private String name;
    private String pwd;
    private String phone;
    private String email;
    private Date reg_date;//注册时间
    private List<Address> Addresses;//收货地址
    private List<Order> orders;//订单
    private int credit;//信誉等级
    private List<Goods> goodsList;
    private String brief;//店铺简介

    public Shop() {
    }

    public Shop(int id, String name, String pwd, String phone, String email, Date reg_date, List<Address> addresses, List<Order> orders, int credit, List<Goods> goodsList, String brief) {
        this.id = id;
        this.name = name;
        this.pwd = pwd;
        this.phone = phone;
        this.email = email;
        this.reg_date = reg_date;
        Addresses = addresses;
        this.orders = orders;
        this.credit = credit;
        this.goodsList = goodsList;
        this.brief = brief;
    }

    @Override
    public String toString() {
        return "Shop{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", pwd='" + pwd + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", reg_date=" + reg_date +
                ", Addresses=" + Addresses +
                ", orders=" + orders +
                ", credit=" + credit +
                ", goodsList=" + goodsList +
                ", brief='" + brief + '\'' +
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

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    public List<Address> getAddresses() {
        return Addresses;
    }

    public void setAddresses(List<Address> addresses) {
        Addresses = addresses;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public int getCredit() {
        return credit;
    }

    public void setCredit(int credit) {
        this.credit = credit;
    }

    public List<Goods> getGoodsList() {
        return goodsList;
    }

    public void setGoodsList(List<Goods> goodsList) {
        this.goodsList = goodsList;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }
}
