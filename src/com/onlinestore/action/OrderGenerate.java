package com.onlinestore.action;

import org.apache.struts2.dispatcher.DefaultActionSupport;
import org.springframework.stereotype.Controller;

/**
 * Created by zhuke on 2015/4/20.
 */
@Controller
public class OrderGenerate extends DefaultActionSupport {

    @Override
    public String execute() throws Exception {

        return SUCCESS;
    }
}
