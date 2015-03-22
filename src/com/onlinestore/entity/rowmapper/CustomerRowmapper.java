package com.onlinestore.entity.rowmapper;

import com.onlinestore.entity.Customer;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by zhuke on 2015/3/22.
 */
public class CustomerRowmapper implements RowMapper {

    @Override
    public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Customer(rs.getString("name"), rs.getInt("level"), rs.getString("pwd"), rs.getString("phone"), rs.getString("email"), rs.getDate("reg_date"));
    }
}
