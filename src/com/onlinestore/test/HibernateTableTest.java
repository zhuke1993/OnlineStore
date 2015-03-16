package com.onlinestore.test;

import com.onlinestore.entity.Address;
import com.onlinestore.entity.Category;
import com.onlinestore.entity.Customer;
import com.onlinestore.entity.Goods;
import org.hibernate.Transaction;
import org.junit.Test;

import java.util.Date;
import java.util.HashSet;

/**
 * Created by zhuke on 2015/3/16.
 */
public class HibernateTableTest extends TestSpringBase {

    @Test
    public void testall(){
        Address address1 = new Address("朱轲","18883283704","重庆市南岸区重庆邮电大学",400065);
        Address address2 = new Address("张三","18883283704","重庆市南岸区重庆邮电大学",400065);
        Address address3 = new Address("李四","18883283704","重庆市南岸区重庆邮电大学",400065);
        Address address4 = new Address("王老五","18883283704","重庆市南岸区重庆邮电大学",400065);
        HashSet<Address> addressHashSet1 = new HashSet<Address>();
        addressHashSet1.add(address1);
        addressHashSet1.add(address2);

        HashSet<Address> addressHashSet2 = new HashSet<Address>();
        addressHashSet1.add(address3);
        addressHashSet1.add(address4);

        Customer customer = new Customer("朱轲","123","18883283704", "929184318@qq.com",new Date());
        customer.setAddresses(addressHashSet1);
        customer.setOrders(orders);

        Goods g1 = new Goods("舒肤佳",8.7,"呵护肌肤","200g",1000,0);



    }


    @Test
    public void testCategory() {
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

        Transaction tx = session.beginTransaction();
        session.save(c1);
        session.save(c2);
        session.save(c3);
        session.save(c4);
        session.save(c5);
        session.save(c6);
        session.save(c7);
        tx.commit();
        session.close();
    }
}
