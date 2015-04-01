package com.onlinestore.dao;

import com.onlinestore.entity.Goods;

import java.util.List;

/**
 * Created by zhuke on 2015/3/27.
 */
public interface GoodsDao {
    public void addGoods(Goods goods);

    public String allList(int shiop_id, int page, int rows);

    public List allList(int shop_id);

<<<<<<< HEAD
    public Goods findGoods(int id);

    public Goods findGoods(String name);
=======
    public int modifyGoods(Goods goods);

    public int deleteGoods(int goods_id);
>>>>>>> 541d28fd81933f28c00bfa2fee38ffeae12005bb
}
