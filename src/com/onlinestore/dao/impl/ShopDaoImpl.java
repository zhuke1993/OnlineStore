package com.onlinestore.dao.impl;

import com.onlinestore.dao.ShopDao;
import com.onlinestore.entity.Shop;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

/**
 * Created by zhuke on 2015/3/17.
 */
@Repository
@Scope("singleton")
public class ShopDaoImpl implements ShopDao {
    @Override
    public int addShop(Shop Shop) {
        return 0;
    }

    @Override
    public Shop findShop(int id) {
        return null;
    }

    @Override
    public int delShop(int id) {
        return 0;
    }
}
