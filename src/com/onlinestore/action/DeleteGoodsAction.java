package com.onlinestore.action;

import com.onlinestore.dao.GoodsDao;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

/**
 * Created by zhuke on 2015/4/2.
 */
@Controller
public class DeleteGoodsAction extends DefaultActionSupport {

    @Autowired
    @Qualifier("goodsDaoImpl")
    private GoodsDao dao;

    private int[] id;

    public GoodsDao getDao() {
        return dao;
    }

    public void setDao(GoodsDao dao) {
        this.dao = dao;
    }

    public int[] getId() {
        return id;
    }

    public void setId(int[] id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {

        System.out.println("待删除goods_id列表：");
        for (int i : id) {
            System.out.print(i + " ");
            dao.deleteGoods(i);
        }
        System.out.println();
        ServletActionContext.getResponse().getWriter().print("success");
        return null;
    }
}
