package com.onlinestore.dao;

import com.onlinestore.entity.COrder;

import java.util.List;

/**
 * Created by zhuke on 2015/4/15.
 */
public interface OrderDao {
    public void addOrder(int customer_id, int[] goods_ids, int[] goods_nums, int address_id);

    public List<COrder> findCusOrder(int customer_id);

    public List<COrder> findShopOrder(int shop_id);
}
