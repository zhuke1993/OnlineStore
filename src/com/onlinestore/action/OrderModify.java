package com.onlinestore.action;

import com.onlinestore.dao.OrderDao;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.Map;
import java.util.StringTokenizer;

/**
 * Created by zhuke on 2015/4/20.
 */
@Controller
@Scope("request")
public class OrderModify extends DefaultActionSupport {
    private String flag;//status-改变状态,shop_delete-店家订单逻辑删除，cus_delete-用户订单逻辑删除
    private String order_ids_str;

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getOrder_ids_str() {
        return order_ids_str;
    }

    public void setOrder_ids_str(String order_ids_str) {
        this.order_ids_str = order_ids_str;
    }

    @Autowired
    private OrderDao dao;

    @Override
    public String execute() throws Exception {
        Map<String, Object> session = ActionContext.getContext().getSession();
        ArrayList<Integer> order_ids = new ArrayList<Integer>();
        //通过order_ids_str分割得到数组
        StringTokenizer st = new StringTokenizer(order_ids_str, ",");
        while (st.hasMoreElements()){
            order_ids.add(Integer.parseInt(st.nextToken()));
        }
        if (flag.equals("status")) {
            if (session.get("shop_lg_id") != null) {
                for (int i : order_ids) {
                    dao.statusOrder(i);
                }
                ServletActionContext.getResponse().getWriter().print("modify success!");
            }
        } else if (flag.equals("shop_delete")) {
            if (session.get("shop_lg_id") != null) {
                for (int i : order_ids) {
                    dao.shop_deleOrder(i);
                }
                ServletActionContext.getResponse().getWriter().print("modify success!");
            }
        } else if (flag.equals("cus_delete")) {
            if (session.get("cus_lg_id") != null) {
                for (int i : order_ids) {
                    dao.cus_deleOrder(i);
                }
                ServletActionContext.getResponse().getWriter().print("modify success!");
            }
        }
        return null;
    }
}
