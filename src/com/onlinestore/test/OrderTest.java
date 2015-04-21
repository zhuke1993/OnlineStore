package com.onlinestore.test;

import com.onlinestore.dao.OrderDao;
import com.onlinestore.entity.COrder;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by zhuke on 2015/4/20.
 */
public class OrderTest extends SpringWebBaseTest {
    @Autowired
    private OrderDao dao;

    @Test
    public void testAddOrder() {
        int goods_ids[] = new int[]{1, 2, 3};
        int num[] = new int[]{1, 2, 2};
        dao.addOrder(1, goods_ids, num, 1);
    }

    @Test
    public void testGetOrder() {
        for (COrder order : dao.findCusOrder(1)) {
            System.out.println(order);
        }
    }

}
