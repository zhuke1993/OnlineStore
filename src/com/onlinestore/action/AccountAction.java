package com.onlinestore.action;

import com.onlinestore.dao.CustomerDao;
import com.onlinestore.dao.ShopDao;
import com.onlinestore.entity.Customer;
import com.onlinestore.entity.Shop;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * Created by zhuke on 2015/4/24.
 */
@Controller
@Scope("request")
public class AccountAction extends DefaultActionSupport {
    @Autowired
    @Qualifier("customerDaoImpl")
    private CustomerDao c_dao;

    @Autowired
    @Qualifier("shopDaoImpl")
    private ShopDao dao;

    private String flag;
    private String name;
    private String pwd;
    private String phone;
    private String email;

    public CustomerDao getC_dao() {
        return c_dao;
    }

    public void setC_dao(CustomerDao c_dao) {
        this.c_dao = c_dao;
    }

    public ShopDao getDao() {
        return dao;
    }

    public void setDao(ShopDao dao) {
        this.dao = dao;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String execute() throws Exception {

        if (flag.equals("shop")) {
            Shop shop = new Shop(name, pwd, phone, email, 1);
            int shop_lg_id = 0;
            if (ServletActionContext.getRequest().getSession().getAttribute("shop_lg_id") != null) {
                shop_lg_id = Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("shop_lg_id").toString());
            }
            shop.setId(shop_lg_id);
            System.out.println("请求修改shop:" + shop);
            dao.modifyShop(shop);
            ServletActionContext.getResponse().getWriter().print("modify success!");

        } else {
            Customer customer = new Customer(name, 1, pwd, phone, email);
            int cus_lg_id = 0;
            if (ServletActionContext.getRequest().getSession().getAttribute("cus_lg_id") != null) {
                cus_lg_id = Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("cus_lg_id").toString());
            }
            customer.setId(cus_lg_id);
            System.out.println("请求修改customer:" + customer);
            c_dao.modifyCustomer(customer);
            ServletActionContext.getResponse().getWriter().print("modify success!");
        }
        return null;

    }
}
