package com.onlinestore.action;

import com.onlinestore.dao.CustomerDao;
import com.onlinestore.entity.Customer;
import org.apache.struts2.dispatcher.DefaultActionSupport;
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
    private String rg_name;
    private String rg_pwd;
    private String rg_phone;
    private String rg_email;

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

        Customer customer = new Customer( rg_name,1,rg_pwd,rg_phone,rg_email,new Date());
        ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
        CustomerDao dao = (CustomerDao) context.getBean("customerDaoImpl");
        dao.addCustomer(customer);
        return SUCCESS;
    }
}
