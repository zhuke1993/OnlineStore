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

}
