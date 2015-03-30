package com.onlinestore.util;

import com.onlinestore.entity.Category;
import com.onlinestore.entity.Goods;
import com.onlinestore.entity.GoodsPicture;
import org.springframework.stereotype.Component;

import java.util.Iterator;
import java.util.List;

/**
 * Created by zhuke on 2015/3/31.
 */
@Component
public class Goods2Json {

    /*@Autowired
    @Qualifier("goodsDaoImpl")
    private GoodsDao dao;

    @Test
    public void testthis() {
        String s1 = new Goods2Json().goodslist2json(dao.allList(1));
        System.out.println(s1);
        System.out.println("+++++++++++++++++++++");
        System.out.println(new Goods2Json().stringUtil(s1));

    }*/

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
        sb.append("\"pictureSet\":[");
        while (iterator.hasNext()) {
            sb.append("{\"url\":\"" + iterator.next().getUrl() + "\"}");
        }
        sb.append("],");

        Iterator<Category> iterator1 = goods.getCategorySet().iterator();
        sb.append("\"categorySet\":[");
        while (iterator1.hasNext()) {
            sb.append("{\"category_id\":\"" + iterator1.next().getId() + "\"}");
        }
        sb.append("]");

        return sb.toString();
    }
}
