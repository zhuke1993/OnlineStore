package com.onlinestore.action;

import com.onlinestore.dao.GoodsDao;
import com.onlinestore.entity.Goods;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by zhuke on 2015/4/20.
 */
@Controller
@Scope("request")
public class SearchGoods extends DefaultActionSupport {
    private String info;
    @Autowired
    private GoodsDao dao;

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    @Override
    public String execute() throws Exception {
        List<Goods> goodsList = dao.findGoods_Search(info);
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        System.out.println("用户请求查找：" + info);
        request.getSession().setAttribute("goodsPage", goodsList);
        return SUCCESS;
    }
}
