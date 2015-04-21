package com.onlinestore.test;

import com.onlinestore.dao.GoodsDao;
import com.onlinestore.entity.Goods;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by zhuke on 2015/4/20.
 */
public class GoodsTest extends SpringWebBaseTest {
    @Autowired
    private GoodsDao dao;

    @Test
    public void testSearch() {
        for (Goods g : dao.findGoods_Search("a")) {
            System.out.println(g);
        }
    }
}
