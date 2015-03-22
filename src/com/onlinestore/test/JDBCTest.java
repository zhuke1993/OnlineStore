package com.onlinestore.test;

import com.onlinestore.dao.impl.CustomerDaoImpl;
import com.onlinestore.entity.Customer;
import org.junit.Test;

/**
 * Created by zhuke on 2015/3/22.
 */
public class JDBCTest extends  TestSpringBase {
    @Test
    public void testJDBC(){
        Customer customer = new Customer("你妹的",1,"zhui","fdf","fjdkasf");
        CustomerDaoImpl dao = (CustomerDaoImpl) context.getBean("customerDaoImpl");
        dao.addCustomer(customer);
    }
}
