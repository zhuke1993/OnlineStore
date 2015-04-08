package com.onlinestore.test;

import com.google.gson.Gson;
import com.onlinestore.dao.AddressDao;
import com.onlinestore.entity.Address;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by zhuke on 2015/4/9.
 */
public class AddressTest extends SpringWebBaseTest {
    @Autowired
    private AddressDao dao;

    @Test
    public void testGetAddress() {
        System.out.println(new Gson().toJson(dao.findAddress(1)));
    }

    @Test
    public void testAddAddress() {
        dao.addAddress(1, new Address("zhangzhang", "12346", "重庆市南岸区重庆邮电大学", 123456));
    }
}
