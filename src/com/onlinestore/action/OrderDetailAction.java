package com.onlinestore.action;

import com.onlinestore.dao.OrderDao;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by zhuke on 2015/4/20.
 */
@Controller
@Scope("request")
public class OrderDetailAction extends DefaultActionSupport {
    @Autowired
    private OrderDao dao;
    private int row;
    private int page;

    public int getRow() {
        return row;
    }

    public void setRow(int row) {
        this.row = row;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        if (session.getAttribute("cus_lg_id") != null) {
            session.setAttribute("order_list", dao.findCusOrder(Integer.parseInt(session.getAttribute("cus_lg_id").toString())));
            return "cus_order";
        }
        if (session.getAttribute("shop_lg_id") != null) {
            session.setAttribute("order_list", dao.findShopOrder(Integer.parseInt(session.getAttribute("shop_lg_id").toString()), page, row));
            return "shop_order";
        }
        session.setAttribute("lg_msg", "您未登录，请登录。");
        return ERROR;
    }
}
