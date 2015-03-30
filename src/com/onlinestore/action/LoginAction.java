package com.onlinestore.action;

import com.onlinestore.dao.CustomerDao;
import com.onlinestore.dao.ShopDao;
import com.onlinestore.entity.Customer;
import com.onlinestore.entity.Shop;
import com.opensymphony.xwork2.ActionContext;
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
@Scope("session")
public class LoginAction extends DefaultActionSupport {
    private String login_name;
    private String login_pwd;
    @Autowired
    @Qualifier("shopDaoImpl")
    private ShopDao dao;

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
        Shop shop = new Shop();
        shop.setName(login_name);
        shop.setPwd(login_pwd);
        Map session = (Map) ActionContext.getContext().getSession();
        int id = dao.findLogin(shop);
        if (id > 0) {
            //在session中加入登陆信息
            session.put("lg_id",id);
            return SUCCESS;
        } else{
            session.put("lg_msg","登陆失败");
            return INPUT;
        }
    }
}
