package com.onlinestore.dao;

import com.onlinestore.entity.GoodsPicture;

/**
 * Created by zhuke on 2015/3/27.
 */
public interface GoodsPictureDao {
    public void addGoodsPicture(GoodsPicture picture);
    public void delGoodsPicture(GoodsPicture picture);
    public GoodsPicture findGoodsPicture(int id);
    public void modGoodsPicture(GoodsPicture picture);
}
