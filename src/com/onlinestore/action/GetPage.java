package com.onlinestore.action;

import com.onlinestore.dao.GoodsDao;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by zhuke on 2015/3/30.
 */
@Controller
@Scope("request")
public class GetPage extends DefaultActionSupport {
    @Autowired
    @Qualifier("goodsDaoImpl")
    private GoodsDao dao;

    private int page;
    private int rows;

    private String flag;

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

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

    public int getRows() {
        return rows;
    }

    public void setRows(int row) {
        this.rows = row;
    }

    @Override
    public String execute() throws Exception {
        if (flag == null) {
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpServletResponse response = ServletActionContext.getResponse();
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            System.out.println("page=" + page + "\trows=" + rows);
            response.getWriter().write(dao.allList(1, page, rows));
            return null;
        } else {
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpServletResponse response = ServletActionContext.getResponse();
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            System.out.println("用户请求获得商品列表");
            request.getSession().setAttribute("goodsPage", dao.getGoodsPage(page, rows));
            return null;
        }

    }
}
