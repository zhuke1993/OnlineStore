package com.onlinestore.test;

import com.onlinestore.dao.GoodsDao;
import com.onlinestore.entity.Goods;
import com.onlinestore.entity.Shop;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;

/**
 * Created by zhuke on 2015/4/15.
 */
public class ShopIdsTest extends SpringWebBaseTest {
    @Autowired
    private GoodsDao dao;

    @Test
    public void testShopids() {
        int ids[] = new int[]{12, 14};
        HashMap<Goods,Shop> hashMap = new HashMap<Goods, Shop>();
        hashMap = dao.findShopids(ids);
    }
}
