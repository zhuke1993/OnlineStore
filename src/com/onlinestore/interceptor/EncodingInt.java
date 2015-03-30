package com.onlinestore.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by zhuke on 2015/3/25.
 */
public class EncodingInt extends AbstractInterceptor {
    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        Map request = (Map) actionInvocation.getInvocationContext().get("request");


        return null;
    }
}
