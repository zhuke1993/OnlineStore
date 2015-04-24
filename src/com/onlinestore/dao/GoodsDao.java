package com.onlinestore.dao;

import com.onlinestore.entity.Goods;
import com.onlinestore.entity.Shop;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by zhuke on 2015/3/27.
 */
public interface GoodsDao {
    public void addGoods(Goods goods);

    public String allList(int shiop_id, int page, int rows);

    public List allList(int shop_id);

    public List allList();

    public Goods findGoods(int id);

    public Goods findGoods(String name);

    public List<Goods> findGoods_Search(String name);

    public Goods findGoods_Search(int id);

    public void modifyGoods(Goods goods);

    public void deleteGoods(int goods_id);

    public ArrayList<Goods> getGoodsPage(int shop_id, int page, int rows);

    public HashMap<Goods, Shop> findShopids(int[] goods_ids);

    public void modifyDownInv(int goods_id, int num);
}
