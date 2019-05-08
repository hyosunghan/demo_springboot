package com.example.demo.dao;

import com.example.demo.entity.Product;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ProductMapper {
    @Select("select * from product")
    List<Product> findAll();
}
