package com.onlinestore.action;

import com.onlinestore.dao.AddressDao;
import com.onlinestore.entity.Address;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * Created by zhuke on 2015/4/9.
 */
@Controller
@Scope("request")
public class AddressAction extends DefaultActionSupport {
    @Autowired
    private AddressDao dao;
    private String receiverName;
    private String phoneNumber;
    private String detailAddress;
    private int postCode;//邮编

    public AddressDao getDao() {
        return dao;
    }

    public void setDao(AddressDao dao) {
        this.dao = dao;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getDetailAddress() {
        return detailAddress;
    }

    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }

    public int getPostCode() {
        return postCode;
    }

    public void setPostCode(int postCode) {
        this.postCode = postCode;
    }

    @Override
    public String execute() throws Exception {
        dao.addAddress(Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("lg_user").toString()), new Address(receiverName, detailAddress, phoneNumber, postCode));
        ServletActionContext.getResponse().getWriter().print("add new address success!");
        return null;
    }
}
