package com.onlinestore.test;

import com.onlinestore.dao.GoodsDao;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

/**
 * Created by zhuke on 2015/3/30.
 */
public class TestGetpage extends SpringWebBaseTest {


    @Autowired
    @Qualifier("goodsDaoImpl")
    private GoodsDao dao;

    public GoodsDao getDao() {
        return dao;
    }

    public void setDao(GoodsDao dao) {
        this.dao = dao;
    }

    @Test
    public void getPageTest() {
        String s = dao.allList(1, 1, 10);
        System.out.println(s);
    }
}
