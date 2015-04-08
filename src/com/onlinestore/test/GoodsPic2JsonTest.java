package com.onlinestore.test;

import com.onlinestore.util.GoodsPic2Json;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by zhuke on 2015/4/6.
 */
public class GoodsPic2JsonTest extends SpringWebBaseTest {
    @Autowired
    private GoodsPic2Json goodsPic2Json;
    @Test
    public void goodspictest(){
        System.out.println(goodsPic2Json.goodsPic2Json(10));
    }
}
