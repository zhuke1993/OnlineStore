package com.onlinestore.dao.impl;

import com.onlinestore.dao.GoodsDao;
import com.onlinestore.dao.ShopDao;
import com.onlinestore.entity.Goods;
import com.onlinestore.util.Goods2Json;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
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

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public ShopDao getShopDao() {
        return shopDao;
    }

    public void setShopDao(ShopDao shopDao) {
        this.shopDao = shopDao;
    }

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
        s = "from Goods as g where g.shop =?";
        Query q = session.createQuery(s);
        q.setParameter(0, shopDao.findShop(shop_id));
        int total = q.list().size();
        q.setFirstResult(rows * (page - 1));
        q.setMaxResults(rows * page);
        System.out.println(q.getQueryString());
        list = (ArrayList<Goods>) q.list();
        session.flush();
        //拼接json字符串
        StringBuilder sb = new StringBuilder();
        sb.append("{\"total\":" + total + ",\"rows\":");
        sb.append(new Goods2Json().goodslist2json(list) + "}");
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
<<<<<<< HEAD
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
=======
    /**
     * 返回为1，修改成功；
     * 返回为0，修改失败
     */
    public int modifyGoods(Goods goods) {
        Session session = sessionFactory.getCurrentSession();
        try {
            Goods goods1 = (Goods) session.get(Goods.class,goods.getId());
            goods1.setName(goods.getName());
            goods1.setPrice(goods.getPrice());
            goods1.setBriefIntroduction(goods.getBriefIntroduction());
            goods1.setSpecification(goods.getSpecification());
            goods1.setInventory(goods.getInventory());
            goods1.setPostage(goods.getPostage());
            session.flush();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public int deleteGoods(int goods_id) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(session.load(Goods.class, goods_id));
        session.flush();
        return 0;
>>>>>>> 541d28fd81933f28c00bfa2fee38ffeae12005bb
    }
}
