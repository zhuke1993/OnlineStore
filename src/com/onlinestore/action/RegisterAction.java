package com.onlinestore.action;

import com.onlinestore.dao.CustomerDao;
import com.onlinestore.entity.Customer;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;

import java.util.Date;

/**
 * Created by zhuke on 2015/3/23.
 */
@Controller
public class RegisterAction extends DefaultActionSupport {
    private String name;
    private String pwd;
    private String phone;
    private String email;
    private int level;

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

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    @Override
    public String execute() throws Exception {

        Customer customer = new Customer(name, level, pwd, phone, email, new Date());
        ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
        CustomerDao dao = (CustomerDao) context.getBean("customerDaoImpl");
        dao.addCustomer(customer);
        return SUCCESS;
    }
}
