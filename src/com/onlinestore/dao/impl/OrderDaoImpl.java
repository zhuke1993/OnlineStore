package com.onlinestore.dao.impl;

import com.onlinestore.dao.GoodsDao;
import com.onlinestore.dao.OrderDao;
import com.onlinestore.entity.*;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.*;

/**
 * Created by zhuke on 2015/4/15.
 */
@Repository
public class OrderDaoImpl implements OrderDao {
    @Autowired
    @Qualifier("sessionFactory")
    private SessionFactory sessionFactory;
    @Autowired
    @Qualifier("goodsDaoImpl")
    private GoodsDao goodsDao;

    /**
     * 添加订单
     *
     * @param goods_ids  商品id列表
     * @param goods_nums 商品数量id，和goods_ids相对应
     * @param address_id 地址id
     */
    @Override
    public void addOrder(int customer_id, int[] goods_ids, int[] goods_nums, int address_id) {
        Session session = sessionFactory.getCurrentSession();
        //用treeset保证元素有序并且唯一
        TreeSet<Shop> shopTreeSet = new TreeSet<Shop>();
        Set<Goods2Num> goodsSet = new HashSet<Goods2Num>();
        double totalPay = 0;
        for (int i = 0; i < goods_ids.length; i++) {
            Goods goods = (Goods) session.get(Goods.class, goods_ids[i]);
            shopTreeSet.add(goods.getShop());
            goodsSet.add(new Goods2Num(goods, goods_nums[i]));
            totalPay = totalPay + goods.getPrice() * goods_nums[i];
        }
        //对不同商家的订单进行分发
        for (Shop shop : shopTreeSet) {
            //对商品进行分发
            //OLOrder cOrder = new OLOrder();
            Set<Goods2Num> set = new HashSet<Goods2Num>();
            double price = 0;
            //对商品列表进行循环
            for (Goods2Num goods2Num : goodsSet) {
                if (goods2Num.getGoods().getShop().getId() == shop.getId()) {
                    session.save(goods2Num);
                    set.add(goods2Num);
                    price = goods2Num.getGoods().getPrice() + price;
                }
            }
            COrder cOrder = new COrder();
            cOrder.setShop(shop);
            cOrder.setGoods2NumSet(set);
            cOrder.setCustomer((Customer) session.get(Customer.class, customer_id));
            cOrder.setAddress((Address) session.get(Address.class, address_id));
            cOrder.setBargainDate(new Date());
            cOrder.setPrice(price);
            session.save(cOrder);

        }
    }

    @Override
    public List<COrder> findCusOrder(int customer_id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from COrder where customer = ? and cus_delete = 0");
        query.setParameter(0, session.get(Customer.class, customer_id));
        return query.list();
    }

    @Override
    public List<COrder> findShopOrder(int shop_id, int page, int row) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from COrder where shop = ? and shop_delete = 0");
        query.setParameter(0, session.get(Shop.class, shop_id));
        query.setFirstResult(row * (page - 1));
        query.setMaxResults(row * page);
        return query.list();
    }

    @Override
    public void statusOrder(int id) {
        Session session = sessionFactory.getCurrentSession();
        COrder cOrder = (COrder) session.get(COrder.class, id);
        cOrder.setStatus(1);
        session.update(cOrder);
    }

    @Override
    public void shop_deleOrder(int id) {
        Session session = sessionFactory.getCurrentSession();
        COrder cOrder = (COrder) session.get(COrder.class, id);
        cOrder.setShop_delete(1);
        session.update(cOrder);
    }

    @Override
    public void cus_deleOrder(int id) {
        Session session = sessionFactory.getCurrentSession();
        COrder cOrder = (COrder) session.get(COrder.class, id);
        cOrder.setCus_delete(1);
        session.update(cOrder);
    }


}
