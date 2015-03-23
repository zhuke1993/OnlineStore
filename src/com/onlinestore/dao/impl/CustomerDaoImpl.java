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
@Scope("singleton")
public class CustomerDaoImpl implements CustomerDao {
    @Autowired
    @Qualifier("sessionFactory")
    private SessionFactory sessionFactory;

    @Override
    public void addCustomer(Customer customer) {
        Session session = sessionFactory.getCurrentSession();
        session.save(customer);
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

    @Override
    public int findLogin(Customer customer) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("select id from Customer where name=? and pwd = ?");
        query.setString(0,customer.getName());
        query.setString(1,customer.getPwd());
        return query.list().size();
    }
}
