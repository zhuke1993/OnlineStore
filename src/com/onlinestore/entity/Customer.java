package com.onlinestore.entity;

import java.util.Date;
import java.util.Set;

/**
 * Created by zhuke on 2015/3/1.
 */
public class Customer {
    private int id;
    private String name;
    private String pwd;
    private String phone;
    private String email;
    private Date reg_date;//注册时间
    private Set<Address> Addresses;//收货地址
    private Set<COrder> orders;//订单
    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", pwd='" + pwd + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", reg_date=" + reg_date +
                ", Addresses=" + Addresses +
                ", orders=" + orders.size() +
                '}';
    }

    public Customer() {
    }

    public Customer( String name, String pwd, String phone, String email, Date reg_date, Set<Address> addresses, Set<COrder> orders) {
        this.name = name;
        this.pwd = pwd;
        this.phone = phone;
        this.email = email;
        this.reg_date = reg_date;
        Addresses = addresses;
        this.orders = orders;
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
        return Addresses;
    }

    public void setAddresses(Set<Address> addresses) {
        Addresses = addresses;
    }

    public Set<COrder> getOrders() {
        return orders;
    }

    public void setOrders(Set<COrder> orders) {
        this.orders = orders;
    }
}
