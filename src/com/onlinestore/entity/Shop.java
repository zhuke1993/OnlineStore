package com.onlinestore.entity;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by zhuke on 2015/3/1.
 * 店铺
 */
@Component
@Scope("prototype")
public class Shop {
    private int id;
    private String name;
    private String pwd;
    private String phone;
    private String email;
    private Date reg_date;//注册时间
    private Set<Address> addresses = new HashSet<Address>();//收货地址
    private int credit;//信誉等级
    private String brief;//店铺简介

    public Shop() {
    }

    public Shop(String name, String pwd, String phone, String email, Date reg_date, int credit, String brief) {
        this.name = name;
        this.pwd = pwd;
        this.phone = phone;
        this.email = email;
        this.reg_date = reg_date;
        this.credit = credit;
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
                ", Addresses=" + addresses.size() +
                ", credit=" + credit +
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

    public Set<Address> getAddresses() {
        return addresses;
    }

    public void setAddresses(Set<Address> addresses) {
        addresses = addresses;
    }

    public int getCredit() {
        return credit;
    }

    public void setCredit(int credit) {
        this.credit = credit;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }
}
