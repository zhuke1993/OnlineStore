package com.onlinestore.test;

import com.onlinestore.dao.GoodsDao;
import com.onlinestore.entity.Goods;
import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

/**
 * Created by zhuke on 2015/3/30.
 */
public class TestGetpage extends SpringWebBaseTest {

    @Autowired
    private SessionFactory sessionFactory;

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
        Goods goods =new Goods();
        goods.setId(15);
        goods.setName("就是这么帅000");
        goods.setInventory(10000000);
        dao.modifyGoods(goods);
    }
}
