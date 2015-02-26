package com.onlinestore.test;

import com.onlinestore.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.BlockJUnit4ClassRunner;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by zhuke on 2015/2/9.
 */
@RunWith(BlockJUnit4ClassRunner.class)
public class TestSpringBase{

    ApplicationContext context = null;
    @Test
    public void initContext(){
        context =new ClassPathXmlApplicationContext("spring-config.xml");
        SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
        Session session = sessionFactory.openSession();
        System.out.println(session.get(User.class,1));
    }

}
