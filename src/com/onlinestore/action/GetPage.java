package com.onlinestore.action;

import com.onlinestore.dao.GoodsDao;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
<<<<<<< HEAD
=======
import org.springframework.context.annotation.Scope;
>>>>>>> 541d28fd81933f28c00bfa2fee38ffeae12005bb
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
<<<<<<< HEAD
=======
import java.io.PrintWriter;
>>>>>>> 541d28fd81933f28c00bfa2fee38ffeae12005bb

/**
 * Created by zhuke on 2015/3/30.
 */
@Controller
@Scope("request")
public class GetPage extends DefaultActionSupport {
    @Autowired
    @Qualifier("goodsDaoImpl")
    private GoodsDao dao;

    @Autowired
    @Qualifier("goodsDaoImpl")
    private GoodsDao dao;

    private int page;
    private int rows;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    @Override
    public String execute() throws Exception {
<<<<<<< HEAD
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(dao.allList(1,page,rows));
        return super.execute();
=======
        String s = dao.allList(1, page, rows);
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter writer = response.getWriter();
        writer.print(s);
        writer.flush();
        writer.close();
        return null;
>>>>>>> 541d28fd81933f28c00bfa2fee38ffeae12005bb
    }
}
