package com.onlinestore.entity;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.Set;

/**
 * Created by zhuke on 2015/3/1.
 */
@Component
@Scope("prototype")
public class Customer {
    private int id;
    private String name;
    private String pwd;
    private String phone;
    private String email;
    private Date reg_date;//注册时间
    private Set<Address> Addresses;//收货地址
    private int level;

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", levle='" + level + '\'' +
                ", pwd='" + pwd + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", reg_date=" + reg_date +
               // ", Addresses=" + Addresses +
               // ", orders=" + orders.size() +
                '}';
    }

    public Customer() {
    }

    public Customer( String name,int levle, String pwd, String phone, String email, Date reg_date) {
        this.name = name;
        this.level = levle;
        this.pwd = pwd;
        this.phone = phone;
        this.email = email;
        this.reg_date = reg_date;
    }
    public Customer( String name,int levle, String pwd, String phone, String email) {
        this.name = name;
        this.level = levle;
        this.pwd = pwd;
        this.phone = phone;
        this.email = email;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
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

}
