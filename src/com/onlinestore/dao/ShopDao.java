package com.onlinestore.dao;

import com.onlinestore.entity.Shop;

/**
 * Created by zhuke on 2015/3/17.
 */
public interface ShopDao {
    /**
     * 添加新的Shop用户
     *
     * @param Shop 待添加的用户对象
     * @return 数据库改变的条数
     */
    public int addShop(Shop Shop);

    /**
     * 根据id查找相应的Shop对象
     *
     * @param id 查找用户的id
     * @return 查找得到的Shop对象，如未查找到，则返回null
     */
    public Shop findShop(int id);

    /**
     * 删除Shop用户
     *
     * @param id 待删除的用户id
     * @return 数据库改变的条数
     */
    public int delShop(int id);
}
