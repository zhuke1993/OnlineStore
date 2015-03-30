package com.onlinestore.test;

import com.onlinestore.dao.impl.CustomerDaoImpl;
import com.onlinestore.entity.Customer;
import org.junit.Test;

import java.io.*;
import java.util.Collection;
import java.util.Collections;
import java.util.Map;

/**
 * Created by zhuke on 2015/3/22.
 */
public class JDBCTest {
    public static void main(String[] args) throws IOException {
        String savePath = "D:\\OnlineStore\\upload\\1.txt";
        File file = new File(savePath);
        System.out.println(file.getAbsolutePath());


    }

}
