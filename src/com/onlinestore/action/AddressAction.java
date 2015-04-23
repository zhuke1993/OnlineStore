package com.onlinestore.action;

import com.google.gson.Gson;
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
    private String flag;//flag==get时为获得地址,flag=find时为查找
    private int address_id;
    private String receiverName;
    private String phoneNumber;
    private String detailAddress;
    private int postCode;//邮编

    public int getAddress_id() {
        return address_id;
    }

    public void setAddress_id(int address_id) {
        this.address_id = address_id;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }


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
        ServletActionContext.getRequest().setCharacterEncoding("UTF-8");
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        ServletActionContext.getResponse().setContentType("text");
        if (flag.equals("add")) {
            int lg_user = Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("cus_lg_id").toString());
            dao.addAddress(lg_user, new Address(receiverName, phoneNumber, detailAddress, postCode));
            //System.out.println(new Address(receiverName, phoneNumber, detailAddress, postCode));
            ServletActionContext.getResponse().getWriter().print("add new address success!");
        } else if (flag.equals("find") && address_id != 0) {
            ServletActionContext.getRequest().getSession().setAttribute("address", dao.findAddressByaddressId(address_id));
            return "find_success";
        } else {
            int lg_user = Integer.parseInt(ServletActionContext.getRequest().getSession().getAttribute("cus_lg_id").toString());
            ServletActionContext.getResponse().getWriter().print(new Gson().toJson(dao.findAddress(lg_user)));
        }
        return null;
    }
}
