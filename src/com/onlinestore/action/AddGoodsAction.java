package com.onlinestore.action;

import com.onlinestore.dao.GoodsDao;
import com.onlinestore.dao.GoodsPictureDao;
import com.onlinestore.dao.ShopDao;
import com.onlinestore.entity.Goods;
import com.onlinestore.entity.GoodsPicture;
import com.onlinestore.entity.Shop;
import com.onlinestore.util.Conf;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.persistence.metamodel.SetAttribute;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by zhuke on 2015/3/27.
 */
@Controller
@Scope("request")
public class AddGoodsAction extends DefaultActionSupport {
    @Autowired
    @Qualifier("shopDaoImpl")
    private ShopDao shopDao;

    @Autowired
    @Qualifier("goodsPictureDaoImpl")
    private GoodsPictureDao pictureDao;

    @Autowired
    @Qualifier("goodsDaoImpl")
    private GoodsDao goodsDao;

    private List<File> files;
    private List<String> filesFileName;
    private List<String> filesContentType;
    private String goods_name;
    private String goods_price;
    private String goods_brief;
    private String goods_spe;
    private String goods_inventory;
    private String goods_postage;

    public List<File> getFiles() {
        return files;
    }

    public void setFiles(List<File> files) {
        this.files = files;
    }

    public List<String> getFilesFileName() {
        return filesFileName;
    }

    public void setFilesFileName(List<String> filesFileName) {
        this.filesFileName = filesFileName;
    }

    public List<String> getFilesContentType() {
        return filesContentType;
    }

    public void setFilesContentType(List<String> filesContentType) {
        this.filesContentType = filesContentType;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public String getGoods_price() {
        return goods_price;
    }

    public void setGoods_price(String goods_price) {
        this.goods_price = goods_price;
    }

    public String getGoods_brief() {
        return goods_brief;
    }

    public void setGoods_brief(String goods_brief) {
        this.goods_brief = goods_brief;
    }

    public String getGoods_spe() {
        return goods_spe;
    }

    public void setGoods_spe(String goods_spe) {
        this.goods_spe = goods_spe;
    }

    public String getGoods_inventory() {
        return goods_inventory;
    }

    public void setGoods_inventory(String goods_inventory) {
        this.goods_inventory = goods_inventory;
    }

    public String getGoods_postage() {
        return goods_postage;
    }

    public void setGoods_postage(String goods_postage) {
        this.goods_postage = goods_postage;
    }

    @Override
    public String execute() throws Exception {
        Map session = ServletActionContext.getContext().getSession();
        int lg_id = 0;
        if (session.get("shop_lg_id").toString() != null) {
            lg_id = Integer.parseInt(session.get("shop_lg_id").toString());
        }
        String server_path = ServletActionContext.getRequest().getRealPath("/");
        Set<GoodsPicture> goodsPictures = new HashSet<GoodsPicture>();
        Goods goods = new Goods(goods_name, Double.parseDouble(goods_price), goods_brief, goods_spe, Integer.parseInt(goods_inventory), Double.parseDouble(goods_postage));
        Shop shop = (Shop) shopDao.findShop(lg_id);
        goods.setShop(shop);
        goodsDao.addGoods(goods);
        //判断是否全部为图片
        for (int i = 0; i < filesFileName.size(); i++) {
            if (filesContentType.get(i).equals("image/jpeg") || filesContentType.get(i).equals("image/png")) {
                if (lg_id != 0) {
                    String savePath = server_path + "/" + lg_id;
                    InputStream is = new FileInputStream(files.get(i));
                    File f = new File(savePath);
                    if (!f.exists()) {
                        f.mkdirs();
                    }
                    savePath = savePath + "/" + filesFileName.get(i);
                    FileOutputStream fos = new FileOutputStream(savePath);
                    byte[] buf = new byte[1024];
                    int len = 0;
                    while ((len = is.read(buf)) > 0) {
                        fos.write(buf, 0, len);
                    }
                    fos.flush();
                    String url = Conf.pictureUrlBase + "/" + new Integer(lg_id).toString() + "/" + filesFileName.get(i);
                    GoodsPicture goodsPicture = new GoodsPicture(goods, url);
                    pictureDao.addGoodsPicture(goodsPicture);
                    goodsPictures.add(goodsPicture);
                    ServletActionContext.getRequest().getSession().setAttribute("add_goods_msg","上传成功");
                } else {
                    System.out.println("用户未登陆，或者登陆时限过期");
                   ServletActionContext.getRequest().getSession().setAttribute("add_goods_msg","用户未登陆，或者登陆时限过期");
                }
            } else {
                System.out.println("用户上传了非法文件类型");
               ServletActionContext.getRequest().getSession().setAttribute("add_goods_msg","用户上传了非法文件类型");
            }
            goods.setPictureSet(goodsPictures);
        }

        return SUCCESS;
    }
}
