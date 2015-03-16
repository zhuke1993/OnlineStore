package com.onlinestore.entity;

import java.util.Set;

/**
 * Created by zhuke on 2015/3/1.
 * 商品类别
 */
public class Category {
    private int id;
    private String name;
    private String remark;//备注
    private Category father;//父结点
    private Set<Category> sons;//子节点

    public Category() {
    }

    public Category(String name, String remark) {
        this.name = name;
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", remark='" + remark + '\'' +
                ", father=" + father.getName() +
                ", sons=" + sons.size() +
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

    public Category getFather() {
        return father;
    }

    public void setFather(Category father) {
        this.father = father;
    }

    public Set<Category> getSons() {
        return sons;
    }

    public void setSons(Set<Category> sons) {
        this.sons = sons;
    }
}
