package com.onlinestore.dao;

import com.onlinestore.entity.Customer;

import java.util.List;

/**
 * Created by zhuke on 2015/3/17.
 */
public interface CustomerDao {
    /**
     * 添加新的customer用户
     *
     * @param customer 待添加的用户对象
     * @return 数据库改变的条数
     */
    public void addCustomer(Customer customer);

    /**
     * 根据id查找相应的customer对象
     *
     * @param id 查找用户的id
     * @return 查找得到的customer对象，如未查找到，则返回null
     */
    public Customer findCustomer(int id);

    /**
     * 删除customer用户
     *
     * @param id 待删除的用户id
     * @return 数据库改变的条数
     */
    public int delCustomer(int id);

    public List<Customer> findAllCustomer();

    public int findLogin(Customer customer);

    public int isNameExist(String name);
}
