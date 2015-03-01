package com.onlinestore.entity;

import java.util.List;

/**
 * Created by zhuke on 2015/3/1.
 * 商品类别
 */
public class Category {
    private int id;
    private String name;
    private String remark;//备注
    private List<Category> fathers;//父结点
    private List<Category> sons;//子节点

    public Category() {
    }

    public Category(int id, String name, String remark, List<Category> fathers, List<Category> sons) {
        this.id = id;
        this.name = name;
        this.remark = remark;
        this.fathers = fathers;
        this.sons = sons;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", remark='" + remark + '\'' +
                ", fathers=" + fathers +
                ", sons=" + sons +
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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public List<Category> getFathers() {
        return fathers;
    }

    public void setFathers(List<Category> fathers) {
        this.fathers = fathers;
    }

    public List<Category> getSons() {
        return sons;
    }

    public void setSons(List<Category> sons) {
        this.sons = sons;
    }
}
