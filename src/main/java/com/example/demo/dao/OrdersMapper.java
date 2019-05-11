package com.example.demo.dao;

import com.example.demo.entity.Member;
import com.example.demo.entity.Orders;
import com.example.demo.entity.Product;
import com.example.demo.entity.Traveller;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface OrdersMapper {

    @Select("select * from orders")
    List<Orders> findAll();

    @Select("select * from orders where id=#{id}")
    Orders findById(@Param("id") int id);
}
