package com.onlinestore.action;

import com.onlinestore.dao.OrderDao;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.Map;

/**
 * Created by zhuke on 2015/4/8.
 */
@Controller
@Scope("request")
public class PayAction extends DefaultActionSupport {
    @Autowired
    private OrderDao dao;

    private int[] goods_ids;
    private int[] goods_nums;
    private int address_id;

    public int[] getGoods_nums() {
        return goods_nums;
    }

    public void setGoods_nums(int[] goods_nums) {
        this.goods_nums = goods_nums;
    }

    public int[] getGoods_ids() {
        return goods_ids;
    }

    public void setGoods_ids(int[] goods_ids) {
        this.goods_ids = goods_ids;
    }

    public int getAddress_id() {
        return address_id;
    }

    public void setAddress_id(int address_id) {
        this.address_id = address_id;
    }

    @Override
    public String execute() throws Exception {
        //一个订单的必要条件为：
        //得到商品id列表，进行订单的数据库操作
        Map session = ServletActionContext.getContext().getSession();
        int lg_id = 0;
        if (session.get("lg_id").toString() != null) {
            lg_id = Integer.parseInt(session.get("cus_lg_id").toString());
        }
        dao.addOrder(lg_id, goods_ids, goods_nums, address_id);
        return SUCCESS;
    }
}
