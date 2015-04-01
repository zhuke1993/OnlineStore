package com.onlinestore.dao.impl;

import com.google.gson.Gson;
import com.onlinestore.dao.GoodsDao;
import com.onlinestore.dao.ShopDao;
import com.onlinestore.entity.Goods;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by zhuke on 2015/3/27.
 */
@Repository
public class GoodsDaoImpl implements GoodsDao {
    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    private ShopDao shopDao;

    @Override
    public void addGoods(Goods goods) {
        Session session = sessionFactory.getCurrentSession();
        session.save(goods);
        session.flush();
    }


    /**
     * 获得一页的数据
     *
     * @param page 页数
     * @param rows 一共有多少页
     * @return 一页对象的json字符串
     */
    @Override
    public String allList(int shop_id, int page, int rows) {

        Session session = sessionFactory.getCurrentSession();
        ArrayList<Goods> list = new ArrayList<Goods>();
        String s;
        s = "from Goods as g where g.shop =" + shopDao.findShop(shop_id);
        Query q = session.createQuery(s);
        int total = q.list().size();
        q.setFirstResult(rows * (page - 1));
        q.setMaxResults(rows * page);
        System.out.println(q.getQueryString());
        list = (ArrayList<Goods>) q.list();
        session.flush();
        //拼接json字符串
        StringBuilder sb = new StringBuilder();
        sb.append("{\"total\":" + total + ",\"rows\":");
        Gson json = new Gson();
        sb.append(json.toJson(list) + "}");
        return sb.toString();
    }

    @Override
    public List allList(int shop_id) {

        Session session = sessionFactory.getCurrentSession();
        ArrayList<Goods> list = new ArrayList<Goods>();
        String s;
        s = "from Goods as g where g.shop =?";
        Query q = session.createQuery(s);
        q.setParameter(0, shopDao.findShop(shop_id));
        list = (ArrayList<Goods>) q.list();
        return list;
    }

    @Override
    public Goods findGoods(int id) {
        Session session = sessionFactory.getCurrentSession();
        return (Goods) session.get(Goods.class, id);
    }

    @Override
    public Goods findGoods(String name) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Goods where name = ?");
        query.setParameter(0, name);
        if (query.list().size() > 0) {
            return (Goods) query.list().get(0);
        }
        return null;
    }
}
