package com.example.demo.dao;

import com.example.demo.entity.Product;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ProductMapper {

    @Select("select * from product")
    List<Product> findAll();

    @Select("select * from product where id=#{id}")
    Product findById(@Param("id") int id);

    @Insert("insert into product(productNum,productName,cityName,departureTime,productPrice,productDesc,productStatus)" +
            " values(#{product.productNum},#{product.productName},#{product.cityName},#{product.departureTime}," +
            "#{product.productPrice},#{product.productDesc},#{product.productStatus})")
    void save(@Param("product") Product product);
}
