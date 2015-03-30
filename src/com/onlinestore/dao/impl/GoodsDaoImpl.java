package com.onlinestore.dao.impl;

import com.onlinestore.dao.GoodsDao;
import com.onlinestore.entity.Goods;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by zhuke on 2015/3/27.
 */
@Repository
public class GoodsDaoImpl implements GoodsDao {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addGoods(Goods goods) {
        Session session = sessionFactory.getCurrentSession();
        session.save(goods);
        session.flush();
    }
}
