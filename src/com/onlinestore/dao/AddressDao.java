package com.onlinestore.dao;

import com.onlinestore.entity.Address;

import java.util.Set;

/**
 * Created by zhuke on 2015/4/9.
 */
public interface AddressDao {
    public Set<Address> findAddress(int customer_id);

    public void addAddress(int customer_id, Address address);
}
