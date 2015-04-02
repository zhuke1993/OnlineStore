package com.onlinestore.test;

import com.onlinestore.entity.*;
import org.hibernate.Transaction;
import org.junit.Test;

import java.util.Date;
import java.util.HashSet;

/**
 * Created by zhuke on 2015/3/16.
 */
public class HibernateTableTest extends TestSpringBase{

    @Test
    public void testall() {
        Transaction tx = session.beginTransaction();

        Address address1 = new Address("朱轲", "18883283704", "重庆市南岸区重庆邮电大学", 400065);
        Address address2 = new Address("张三", "18883283704", "重庆市南岸区重庆邮电大学", 400065);
        Address address3 = new Address("李四", "18883283704", "重庆市南岸区重庆邮电大学", 400065);
        Address address4 = new Address("王老五", "18883283704", "重庆市南岸区重庆邮电大学", 400065);
        session.save(address1);
        session.save(address2);
        session.save(address3);
        session.save(address4);

        HashSet<Address> addressHashSet1 = new HashSet<Address>();
        addressHashSet1.add(address1);
        addressHashSet1.add(address2);
        HashSet<Address> addressHashSet2 = new HashSet<Address>();
        addressHashSet1.add(address3);
        addressHashSet1.add(address4);

        Customer customer = new Customer("朱轲",1, "123", "18883283704", "929184318@qq.com", new Date());
        customer.setAddresses(addressHashSet1);
        session.save(customer);

        Goods g1 = new Goods("舒肤佳", 8.7, "呵护肌肤", "200g", 1000, 0);
        Goods g2 = new Goods("蓝月亮", 8.7, "洁净如新", "500h", 1000, 0);
        session.save(g1);
        session.save(g2);

        Shop shop = new Shop("我的店铺", "zhuke", "18883283704", "zhuke_1993@qq.com", new Date(), 1, "我的店铺不加特技duangduang");
        shop.setAddresses(addressHashSet2);
        session.save(shop);

        g1.setShop(shop);
        g2.setShop(shop);

        GoodsPicture goodsPicture1 = new GoodsPicture(g1, "images/1.png");
        GoodsPicture goodsPicture2 = new GoodsPicture(g1, "images/2.png");
        GoodsPicture goodsPicture3 = new GoodsPicture(g2, "images/1.png");
        session.save(goodsPicture1);
        session.save(goodsPicture2);
        session.save(goodsPicture3);

        HashSet<GoodsPicture> pictureHashSet1 = new HashSet<GoodsPicture>();
        pictureHashSet1.add(goodsPicture1);
        pictureHashSet1.add(goodsPicture2);
        HashSet<GoodsPicture> pictureHashSet2 = new HashSet<GoodsPicture>();
        pictureHashSet2.add(goodsPicture3);
        g1.setPictureSet(pictureHashSet1);
        g2.setPictureSet(pictureHashSet2);

        Evaluation evaluation1 = new Evaluation(1, "棒棒哒", new Date());
        session.save(evaluation1);
        evaluation1.setGoods(g1);
        Evaluation evaluation2 = new Evaluation(1, "用起来感觉还是不错的", new Date());
        session.save(evaluation2);
        evaluation2.setGoods(g1);
        HashSet<Evaluation> evaluationHashSet1 = new HashSet<Evaluation>();
        evaluationHashSet1.add(evaluation1);
        evaluationHashSet1.add(evaluation2);

        Category c1 = new Category("日用品", "日常用品");
        Category c2 = new Category("洗衣用品", "洗衣用品");
        Category c3 = new Category("洗浴用品", "洗浴用品");
        Category c4 = new Category("立白洗衣液", "立白洗衣液");
        Category c5 = new Category("汰渍洗衣粉", "汰渍洗衣粉");
        Category c6 = new Category("舒肤佳", "舒肤佳");
        Category c7 = new Category("隆力奇", "隆力奇");
        c1.setFather(null);
        HashSet<Category> set1 = new HashSet<Category>();
        c2.setFather(c1);
        c3.setFather(c1);
        set1.add(c2);
        set1.add(c3);
        c1.setSons(set1);
        c4.setFather(c2);
        c5.setFather(c2);
        HashSet<Category> set2 = new HashSet<Category>();
        set1.add(c4);
        set1.add(c5);
        c1.setSons(set2);
        c6.setFather(c3);
        c7.setFather(c4);
        HashSet<Category> set3 = new HashSet<Category>();
        set1.add(c6);
        set1.add(c7);
        c1.setSons(set3);
        HashSet<Category> ctset1 = new HashSet<Category>();
        ctset1.add(c1);
        ctset1.add(c2);
        HashSet<Category> ctset2 = new HashSet<Category>();
        ctset1.add(c1);
        ctset1.add(c3);
        g1.setCategorySet(ctset1);
        g2.setCategorySet(ctset2);

        session.save(c1);
        session.save(c2);
        session.save(c3);
        session.save(c4);
        session.save(c5);
        session.save(c6);
        session.save(c7);

        COrder order1 = new COrder(customer,shop,1,0,1,new Date(),new Date(),new Date());
        HashSet<Goods> goodsHashSet = new HashSet<Goods>();
        goodsHashSet.add(g1);
        goodsHashSet.add(g2);
        order1.setGoodsSet(goodsHashSet);
        session.save(order1);
        HashSet<COrder> cOrderHashSet = new HashSet<COrder>();
        cOrderHashSet.add(order1);
        customer.setOrders(cOrderHashSet);

        tx.commit();

        }
}
