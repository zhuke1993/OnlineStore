package com.onlinestore.action;

import com.onlinestore.dao.GoodsDao;
import com.onlinestore.entity.Goods;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * Created by zhuke on 2015/4/1.
 */
@Controller
@Scope("request")
public class ModifyGoodsAction extends DefaultActionSupport {
    @Autowired
    @Qualifier("goodsDaoImpl")
    private GoodsDao dao;

    private int id;
    private String name;
    private double price;
    private String briefIntroduction;//简介
    private String specification;//规格
    private double inventory;//库存数量
    private double postage;//邮费

    public GoodsDao getDao() {
        return dao;
    }

    public void setDao(GoodsDao dao) {
        this.dao = dao;
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

    @Override
    public String execute() throws Exception {
        System.out.println("goods_id=" + id);
        Goods goods = new Goods(name,price,briefIntroduction,specification,inventory,postage);
        goods.setId(id);
        dao.modifyGoods(goods);
        ServletActionContext.getResponse().getWriter().write("success");
        return null;
    }
}
