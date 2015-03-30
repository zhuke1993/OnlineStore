package com.onlinestore.action;

import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.springframework.stereotype.Controller;

/**
 * Created by zhuke on 2015/3/30.
 */
@Controller
public class GetPage extends DefaultActionSupport {

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
        return super.execute();
    }
}
