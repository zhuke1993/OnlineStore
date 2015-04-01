package com.onlinestore.action;

import com.onlinestore.dao.GoodsDao;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by zhuke on 2015/3/30.
 */
@Controller
public class GetPage extends DefaultActionSupport {
    @Autowired
    @Qualifier("goodsDaoImpl")
    private GoodsDao dao;

    private int page;
    private int row;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public GoodsDao getDao() {
        return dao;
    }

    public void setDao(GoodsDao dao) {
        this.dao = dao;
    }

    public int getRow() {
        return row;
    }

    public void setRow(int row) {
        this.row = row;
    }

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        System.out.println("page=" + page + "\trows=" + row);
        response.getWriter().write(dao.allList(1, page, row));
        return null;
    }
}
