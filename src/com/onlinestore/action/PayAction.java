package com.onlinestore.action;

import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * Created by zhuke on 2015/4/8.
 */
@Controller
@Scope("request")
public class PayAction extends DefaultActionSupport {

    private int[] goods_ids;

    public int[] getGoods_ids() {
        return goods_ids;
    }

    public void setGoods_ids(int[] goods_ids) {
        this.goods_ids = goods_ids;
    }

    @Override
    public String execute() throws Exception {


        return SUCCESS;
    }
}
