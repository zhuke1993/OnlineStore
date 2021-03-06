package com.onlinestore.dao.impl;

import com.onlinestore.dao.GoodsDao;
import com.onlinestore.dao.ShopDao;
import com.onlinestore.entity.Goods;
import com.onlinestore.entity.Shop;
import com.onlinestore.util.Goods2Json;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by zhuke on 2015/3/27.
 */
@Repository
@Scope("singleton")
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
        s = "from Goods as g where g.shop =?";
        Query q = session.createQuery(s);
        q.setParameter(0, session.get(Shop.class, shop_id));
        int total = q.list().size();
        q.setFirstResult(rows * (page - 1));
        q.setMaxResults(rows * page);
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
    public List allList() {
        Session session = sessionFactory.getCurrentSession();
        ArrayList<Goods> list = new ArrayList<Goods>();
        String s;
        s = "from Goods as g";
        Query q = session.createQuery(s);
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

    @Override
    public List<Goods> findGoods_Search(String name) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Goods where name like ?");
        query.setParameter(0, "%" + name + "%");
        if (query.list().size() > 0) {
            return query.list();
        }
        return null;
    }

    @Override
    public Goods findGoods_Search(int id) {
        return null;
    }

    @Override
    public void modifyGoods(Goods goods) {
        Session session = sessionFactory.getCurrentSession();
        Goods goods1 = (Goods) session.get(Goods.class, goods.getId());
        goods1.setName(goods.getName());
        goods1.setPrice(goods.getPrice());
        goods1.setBriefIntroduction(goods.getBriefIntroduction());
        goods1.setSpecification(goods.getSpecification());
        goods1.setInventory(goods.getInventory());
        goods1.setPostage(goods.getPostage());
        session.flush();
    }

    @Override
    public void deleteGoods(int goods_id) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(session.get(Goods.class, goods_id));
        session.flush();
    }

    /**
     * 得到一页的goods信息
     *
     * @param page 页数
     * @param rows 一页的数量
     * @return 存储有一页goods信息的arraylist
     */
    @Override
    public ArrayList<Goods> getGoodsPage(int shop_id, int page, int rows) {
        Session session = sessionFactory.getCurrentSession();
        ArrayList<Goods> list = new ArrayList<Goods>();
        String s;
        s = "from Goods where id=?";
        Query q = session.createQuery(s);
        q.setParameter(0, shop_id);
        int total = q.list().size();
        q.setFirstResult(rows * (page - 1));
        q.setMaxResults(rows * page);
        return (ArrayList<Goods>) q.list();
    }

    /**
     * 得到shop_ids
     *
     * @param goods_ids 商品id列表
     * @return 商店id列表
     */
    @Override
    public HashMap<Goods, Shop> findShopids(int[] goods_ids) {
        Session session = sessionFactory.getCurrentSession();
        HashMap<Goods, Shop> shopHashMap = new HashMap<Goods, Shop>();
        for (int i : goods_ids) {
            shopHashMap.put((Goods) session.get(Goods.class, i), ((Goods) session.get(Goods.class, i)).getShop());
        }
        return shopHashMap;
    }

    @Override
    public void modifyDownInv(int goods_id, int num) {
        Session session = sessionFactory.getCurrentSession();
        Goods goods = (Goods) session.get(Goods.class, goods_id);
        if (goods.getInventory() - num >= 0) {
            goods.setInventory(goods.getInventory() - num);
        }
        session.save(goods);
    }
}
