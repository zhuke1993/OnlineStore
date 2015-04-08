package com.onlinestore.util;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 将goodspicture转化为json
 * Created by zhuke on 2015/4/6.
 */
@Component
public class GoodsPic2Json {
    @Autowired
    private SessionFactory sessionFactory;

    public String goodsPic2Json(int goods_id) {
        String sql = "select url from goods_picture where goods_id=" + goods_id;
        Session session = sessionFactory.openSession();
        Query q = session.createSQLQuery(sql);
        List<String> list = q.list();
        StringBuilder sb = new StringBuilder();
        sb.append("{" +
                "\"prod_1\": {" +
                "\"main\": {" +
                "\"orig\": \"" + list.get(0) + "\"," +
                "\"main\": \"" + list.get(0) + "\"," +
                "\"thumb\": \"" + list.get(0) + "\"," +
                "\"label\": \"\"" +
                "},\"gallery\":{ ");
        StringBuffer sb1 = new StringBuffer();
        for (int i = 0; i < list.size(); i++) {
            sb1.append(" " +
                    "\"item_" + i + "\": {" +
                    "\"orig\": \"" + list.get(i) + "\"," +
                    "\"main\": \"" + list.get(i) + "\"," +
                    "\"thumb\": \"" + list.get(i) + "\"," +
                    "\"label\": \"\"" +
                    "},");
        }
//去除最末尾的，
        char[] temp = sb1.toString().toCharArray();
        for (int i = 0; i < temp.length - 1; i++) {
            sb.append(temp[i]);
        }
        sb.append("}" +
                "}" +
                "}");
        return sb.toString();
    }
}
