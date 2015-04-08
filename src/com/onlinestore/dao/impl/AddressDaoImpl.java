package com.onlinestore.dao.impl;

import com.onlinestore.dao.AddressDao;
import com.onlinestore.entity.Address;
import com.onlinestore.entity.Customer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Set;

/**
 * Created by zhuke on 2015/4/9.
 */
@Repository
public class AddressDaoImpl implements AddressDao {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Set<Address> findAddress(int customer_id) {
        Session session = sessionFactory.getCurrentSession();
        return ((Customer) session.get(Customer.class, customer_id)).getAddresses();
    }

    @Override
    public void addAddress(int customer_id, Address address) {
        Session session = sessionFactory.getCurrentSession();
        Customer customer = (Customer) session.get(Customer.class, customer_id);
        customer.getAddresses().add(address);
        session.update(customer);
    }
}
