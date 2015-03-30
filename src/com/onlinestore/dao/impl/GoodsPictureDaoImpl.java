package com.onlinestore.dao.impl;

import com.onlinestore.dao.GoodsPictureDao;
import com.onlinestore.entity.GoodsPicture;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

/**
 * Created by zhuke on 2015/3/27.
 */
@Repository
@Scope("singleton")
public class GoodsPictureDaoImpl implements GoodsPictureDao{

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
    public void addGoodsPicture(GoodsPicture picture) {
        Session session = sessionFactory.getCurrentSession();
        session.save(picture);
        session.flush();
    }

    @Override
    public void delGoodsPicture(GoodsPicture picture) {

    }

    @Override
    public GoodsPicture findGoodsPicture(int id) {
        return null;
    }

    @Override
    public void modGoodsPicture(GoodsPicture picture) {

    }
}
