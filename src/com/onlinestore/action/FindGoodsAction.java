package com.onlinestore.action;

import com.onlinestore.dao.GoodsDao;
import com.onlinestore.util.Goods2Json;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by zhuke on 2015/4/2.
 */
@Controller
@Scope("request")
public class FindGoodsAction extends DefaultActionSupport {

    @Autowired
    @Qualifier("goodsDaoImpl")
    private GoodsDao dao;

    private int id;
    private String name;

    public GoodsDao getDao() {
        return dao;
    }

    public void setDao(GoodsDao dao) {
        this.dao = dao;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String execute() throws Exception {

        String s = null;
        if (id != 0) {
            s = new Goods2Json().goods2json(dao.findGoods(id));
        } else if (name != null) {
            s = new Goods2Json().goods2json(dao.findGoods(name));
        }
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(s);
        return null;
    }
}
