package com.example.demo.mapper;

import com.example.demo.entity.Product;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
    void create(@Param("product") Product product);

    @Update("update product set productNum=#{product.productNum},productName=#{product.productName}," +
            "cityName=#{product.cityName},departureTime=#{product.departureTime},productPrice=#{product.productPrice}," +
            "productDesc=#{product.productDesc},productStatus=#{product.productStatus} where id=#{product.id}")
    void update(@Param("product") Product product);

    @Delete("<script>delete from product where id in " +
            "   <foreach collection=\"list\" item=\"id\" open=\"(\" close=\")\" separator=\",\">" +
            "       #{id}" +
            "   </foreach>" +
            "</script>")
    void delete(@Param("list") List<String> list);

    @Update("<script>update product set productStatus=#{status} where id in " +
            "   <foreach collection=\"list\" item=\"id\" open=\"(\" close=\")\" separator=\",\">" +
            "       #{id}" +
            "   </foreach>" +
            "</script>")
    void change(@Param("status") Integer status, @Param("list") List<String> list);
}
