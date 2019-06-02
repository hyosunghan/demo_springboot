package com.example.demo.mapper;

import com.example.demo.entity.Orders;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface OrdersMapper {

    @Select("select * from orders where orderStatus='待处理'")
    List<Orders> findPending();

    @Select("select * from orders")
    List<Orders> findAll();

    @Select("select * from orders where id=#{id}")
    Orders findById(@Param("id") int id);
}
