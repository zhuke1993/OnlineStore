package com.onlinestore.test;

import com.onlinestore.entity.COrder;
import org.hibernate.Transaction;
import org.junit.Test;

/**
 * Created by zhuke on 2015/3/16.
 */
public class HibernateTableTest extends TestSpringBase {
    @Test
    public void testAddress() {
        Transaction tx = session.beginTransaction();
        COrder c_order = (COrder) session.get(COrder.class,1);
        System.out.println(c_order.getCustomer());
        tx.commit();
    }
}
