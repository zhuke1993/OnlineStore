package com.onlinestore.dao.impl;

import com.onlinestore.dao.ShopDao;
import com.onlinestore.entity.Shop;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

/**
 * Created by zhuke on 2015/3/17.
 */
@Repository
@Scope("singleton")
public class ShopDaoImpl implements ShopDao {
    @Autowired
    @Qualifier("sessionFactory")
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public int addShop(Shop Shop) {
        return 0;
    }

    @Override
    public Shop findShop(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Shop where id=?");
        query.setInteger(0, id);
        int size = query.list().size();
        if (size == 0) {
            return null;
        } else {
            return (Shop) query.list().get(0);
        }
    }

    @Override
    public int delShop(int id) {
        return 0;
    }

    /**
     * 判断是否登陆成功
     *
     * @param shop
     * @return ==-1登陆失败，>0登陆成功，返回登陆成功的id
     */
    @Override
    public int findLogin(Shop shop) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Shop where name=? and pwd = ?");
        query.setString(0, shop.getName());
        query.setString(1, shop.getPwd());
        int size = query.list().size();
        if (size == 0) {
            return -1;
        } else {
            shop = (Shop) query.list().get(0);
            return shop.getId();
        }
    }

    @Override
    public void modifyShop(Shop shop) {
        Session session = sessionFactory.getCurrentSession();
        Shop shop1 = (Shop) session.get(Shop.class, shop.getId());
        shop1.setName(shop.getName());
        shop1.setEmail(shop.getEmail());
        shop1.setPhone(shop.getPhone());
        shop1.setPwd(shop.getPwd());
        session.save(shop1);
    }

    @Override
    public int isNameExist(String name) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Shop where name=?");
        query.setString(0, name);
        return query.list().size();
    }

}
