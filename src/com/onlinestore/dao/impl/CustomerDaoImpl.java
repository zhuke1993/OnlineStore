package com.onlinestore.dao.impl;

import com.onlinestore.dao.CustomerDao;
import com.onlinestore.entity.Customer;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by zhuke on 2015/3/17.
 */
@Repository
@Scope("prototype")
public class CustomerDaoImpl implements CustomerDao {
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
    public void addCustomer(Customer customer) {
        Session session = sessionFactory.getCurrentSession();
        session.save(customer);
        session.flush();
    }

    @Override
    public Customer findCustomer(int id) {
        return (Customer) sessionFactory.getCurrentSession().get(Customer.class, id);
    }

    @Override
    public int delCustomer(int id) {
        return 0;
    }

    @Override
    public List<Customer> findAllCustomer() {
        return null;
    }

    /**
     * 根据传入的customer判断是否登陆成功
     *
     * @param customer 待判断登陆的customer对象
     * @return -1---登陆失败，登陆成功返回该customer的id
     */
    @Override
    public int findLogin(Customer customer) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Customer where name=? and pwd = ?");
        query.setString(0, customer.getName());
        query.setString(1, customer.getPwd());
        int size = query.list().size();
        if (size == 0) {
            return -1;
        } else {
            customer = (Customer) query.list().get(0);
            return customer.getId();
        }
    }

    @Override
    public int isNameExist(String name) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Customer where name=?");
        query.setString(0, name);
        return query.list().size();
    }
}
