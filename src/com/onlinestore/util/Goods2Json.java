package com.onlinestore.util;

import com.onlinestore.dao.GoodsDao;
import com.onlinestore.entity.Category;
import com.onlinestore.entity.Goods;
import com.onlinestore.entity.GoodsPicture;
import com.onlinestore.test.SpringWebBaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import java.util.Iterator;
import java.util.List;

/**
 * Created by zhuke on 2015/3/31.
 */
@Component
public class Goods2Json extends SpringWebBaseTest {

    @Autowired
    @Qualifier("goodsDaoImpl")
    private GoodsDao dao;

    @Test
    public void testthis() {
        String s1 = dao.allList(1, 1, 10);
        System.out.println(s1);
        System.out.println("+++++++++++++++++++++");

    }


    /**
     * goods的arraylist转化为json字符串
     *
     * @param list
     * @return
     */
    /**
     * 将goodslist转换为json字符串
     *
     * @param list
     * @return
     */
    public String goodslist2json(List<Goods> list) {
        //需要的有效信息为 id, name, price, briefIntroduction, specification, inventory, postage, shop_id, pictureSet,  pictureSet, categorySet
        StringBuilder sb = new StringBuilder();
        sb.append("[\n");
        for (Goods g : list) {
            sb.append(new Goods2Json().goods2json(g) + "},\n");
        }
        sb.append("]");

        char[] temp = sb.toString().toCharArray();
        char[] chars = new char[temp.length - 1];
        chars[chars.length - 1] = temp[temp.length - 1];
        chars[chars.length - 2] = temp[temp.length - 2];
        chars[chars.length - 3] = temp[temp.length - 4];
        for (int i = chars.length - 3; i >= 0; i--) {
            chars[i] = temp[i];
        }
        return new String(chars);
    }

    /**
     * 将goods对象转换为字符串
     *
     * @param goods
     * @return
     */
    public String goods2json(Goods goods) {
        StringBuilder sb = new StringBuilder();
        sb.append("{");
        //利用反射得到属性名,返回的数组中的元素没有进行排序，也没有任何特定的顺序
        sb.append("\"id\":" + goods.getId() + ",");
        sb.append("\"name\":" + "\"" + goods.getName() + "\",");
        sb.append("\"price\":" + goods.getPrice() + ",");
        sb.append("\"briefIntroduction\":" + "\"" + goods.getBriefIntroduction() + "\",");
        sb.append("\"specification\":" + "\"" + goods.getSpecification() + "\",");
        sb.append("\"inventory\":" + goods.getInventory() + ",");
        sb.append("\"postage\":" + goods.getPostage() + ",");
        sb.append("\"shop_id\":" + goods.getShop().getId() + ",");
        Iterator<GoodsPicture> iterator = goods.getPictureSet().iterator();

        StringBuffer sb1 = new StringBuffer();
        sb1.append("\"pictureSet\":[");
        while (iterator.hasNext()) {
            sb1.append("{\"url\":\"" + iterator.next().getUrl() + "\"},");
        }
        sb1.append("]");
        if (sb1.toString().length() > 15) {
            char[] temp = sb1.toString().toCharArray();
            char[] chars = new char[temp.length - 1];
            chars[chars.length - 1] = temp[temp.length - 1];
            chars[chars.length - 2] = temp[temp.length - 3];
            for (int i = chars.length - 3; i >= 0; i--) {
                chars[i] = temp[i];
            }
            sb.append(new String(chars) + ",");
        }else{
            sb.append(sb1.toString()+",");
        }

        StringBuffer sb2 = new StringBuffer();
        Iterator<Category> iterator1 = goods.getCategorySet().iterator();
        sb2.append("\"categorySet\":[");
        while (iterator1.hasNext()) {
            sb2.append("{\"category_id\":\"" + iterator1.next().getId() + "\"},");
        }
        sb2.append("]");
        if (sb2.toString().length() > 16) {
            char[] temp = sb2.toString().toCharArray();
            char[] chars = new char[temp.length - 1];
            chars[chars.length - 1] = temp[temp.length - 1];
            chars[chars.length - 2] = temp[temp.length - 3];
            for (int i = chars.length - 3; i >= 0; i--) {
                chars[i] = temp[i];
            }
            sb.append(new String(chars));
        }else{
            sb.append(sb2.toString());
        }
        return sb.toString();
    }
}
