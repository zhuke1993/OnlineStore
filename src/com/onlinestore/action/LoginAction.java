package com.onlinestore.action;

import com.onlinestore.dao.CustomerDao;
import com.onlinestore.dao.ShopDao;
import com.onlinestore.entity.Customer;
import com.onlinestore.entity.Shop;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.Map;

/**
 * Created by zhuke on 2015/3/23.
 */
@Controller
@Scope("request")
public class LoginAction extends DefaultActionSupport {
    private String login_name;
    private String login_pwd;
    @Autowired
    @Qualifier("shopDaoImpl")
    private ShopDao dao;

    @Autowired
    @Qualifier("customerDaoImpl")
    private CustomerDao c_dao;
    /**
     * flag==customer--对应为普通用户登陆
     * flag==null--对应为商家登陆
     */
    private String flag;

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public ShopDao getDao() {
        return dao;
    }

    public void setDao(ShopDao dao) {
        this.dao = dao;
    }

    public String getLogin_name() {
        return login_name;
    }

    public void setLogin_name(String login_name) {
        this.login_name = login_name;
    }

    public String getLogin_pwd() {
        return login_pwd;
    }

    public void setLogin_pwd(String login_pwd) {
        this.login_pwd = login_pwd;
    }

    @Override
    public String execute() throws Exception {
        //商家登陆
        if (flag.equals("shop")) {
            Shop shop = new Shop();
            shop.setName(login_name);
            shop.setPwd(login_pwd);
            Map session = (Map) ActionContext.getContext().getSession();
            int id = dao.findLogin(shop);
            if (id > 0) {
                //在session中加入登陆信息
                session.put("shop_lg_id", id);
                return SUCCESS;
            } else {
                session.put("lg_msg", "登陆失败");
                return INPUT;
            }
        } else if (flag.equals("customer")) {
            //普通用户登陆
            Customer customer = new Customer();
            customer.setName(login_name);
            customer.setPwd(login_pwd);
            Map session = (Map) ActionContext.getContext().getSession();
            int id = c_dao.findLogin(customer);
            if (id > 0) {
                //在session中加入登陆信息
                session.put("cus_lg_id", id);
                return "c_success";
            } else {
                session.put("lg_msg", "登陆失败");
                return "c_input";
            }
        } else if (flag.equals("isnameexist")) {
            int isnameexist = c_dao.isNameExist(login_name);
            ServletActionContext.getResponse().getWriter().print(isnameexist+"");
        }else if(flag.equals("shop_isexist")){
            int isnameexist = dao.isNameExist(login_name);
            ServletActionContext.getResponse().getWriter().print(isnameexist+"");
        }
        return null;
    }
}
