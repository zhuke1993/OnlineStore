package com.onlinestore.action;

import com.onlinestore.dao.CustomerDao;
import com.onlinestore.dao.ShopDao;
import com.onlinestore.entity.Customer;
import com.onlinestore.entity.Shop;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;

import java.util.Date;

/**
 * Created by zhuke on 2015/3/23.
 */
@Controller
@Scope("request")
public class RegisterAction extends DefaultActionSupport {
    @Autowired
    @Qualifier("customerDaoImpl")
    private CustomerDao c_dao;

    @Autowired
    @Qualifier("shopDaoImpl")
    private ShopDao dao;

    public ShopDao getDao() {
        return dao;
    }

    public void setDao(ShopDao dao) {
        this.dao = dao;
    }

    private String flag;
    private String rg_name;
    private String rg_pwd;
    private String rg_phone;
    private String rg_email;

    public CustomerDao getC_dao() {
        return c_dao;
    }

    public void setC_dao(CustomerDao c_dao) {
        this.c_dao = c_dao;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getRg_name() {
        return rg_name;
    }

    public void setRg_name(String rg_name) {
        this.rg_name = rg_name;
    }

    public String getRg_pwd() {
        return rg_pwd;
    }

    public void setRg_pwd(String rg_pwd) {
        this.rg_pwd = rg_pwd;
    }

    public String getRg_phone() {
        return rg_phone;
    }

    public void setRg_phone(String rg_phone) {
        this.rg_phone = rg_phone;
    }

    public String getRg_email() {
        return rg_email;
    }

    public void setRg_email(String rg_email) {
        this.rg_email = rg_email;
    }

    @Override
    public String execute() throws Exception {

        if (flag == null) {
            Shop shop = new Shop(rg_name, rg_pwd, rg_phone, rg_email, new Date(), 1);
            System.out.println("请求注册新shop:"+shop);
            dao.addShop(shop);
            return "shop_success";
        } else {
            Customer customer = new Customer(rg_name, 1, rg_pwd, rg_phone, rg_email, new Date());
            System.out.println("请求注册新customer:"+customer);
            c_dao.addCustomer(customer);
            return "c_success";
        }

    }
}
