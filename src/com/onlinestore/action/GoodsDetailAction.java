package com.onlinestore.action;

import com.onlinestore.util.GoodsPic2Json;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * Created by zhuke on 2015/4/6.
 */
@Controller
@Scope("request")
public class GoodsDetailAction extends DefaultActionSupport {

    @Autowired
    private GoodsPic2Json goodsPic2Json;

    private int goods_id;

    public int getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(int goods_id) {
        this.goods_id = goods_id;
    }

    @Override
    public String execute() throws Exception {
        String s = goodsPic2Json.goodsPic2Json(goods_id);
        ServletActionContext.getResponse().getWriter().print(s);
        return null;
    }
}
