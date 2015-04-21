package com.onlinestore.test;

import com.onlinestore.dao.GoodsDao;
import com.onlinestore.entity.Goods;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.ArrayList;

/**
 * Created by zhuke on 2015/4/6.
 */
public class TestGetPageGoods extends SpringWebBaseTest {

    @Autowired
    @Qualifier("goodsDaoImpl")
    private GoodsDao dao;

    @Test
    public void getTest() {
        ArrayList<Goods> goodses = dao.getGoodsPage(2, 1, 4);
        for (Goods g : goodses) {
            System.out.println(g);
        }
    }
}
