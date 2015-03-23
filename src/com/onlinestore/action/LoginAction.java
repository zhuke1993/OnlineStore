package com.onlinestore.action;

import com.onlinestore.dao.CustomerDao;
import com.onlinestore.entity.Customer;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

/**
 * Created by zhuke on 2015/3/23.
 */
@Controller
public class LoginAction extends DefaultActionSupport {
    private String login_name;
    private String login_pwd;
    @Autowired
    @Qualifier("customerDaoImpl")
    private CustomerDao dao;

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
        Customer customer = new Customer();
        customer.setName(login_name);
        customer.setPwd(login_pwd);
        int i = dao.findLogin(customer);
        if (i > 0) {
            return SUCCESS;
        } else
            return INPUT;
    }
}
