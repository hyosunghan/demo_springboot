package com.example.demo.mapper;

import com.example.demo.entity.Orders;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface OrdersMapper {

    @Select("select * from orders where orderStatus=1")
    List<Orders> findPending();

    @Select("select * from orders")
    List<Orders> findAll();

    @Select("select * from orders where id=#{id}")
    Orders findById(@Param("id") int id);

    @Select("select count(*) from orders where productId=#{productId}")
    Integer checkProductUsed(@Param("productId") String productId);

    @Update("<script>update orders set orderStatus=0 where id in " +
            "   <foreach collection=\"list\" item=\"id\" open=\"(\" close=\")\" separator=\",\">" +
            "       #{id}" +
            "   </foreach>" +
            "</script>")
    void change(@Param("list") List<String> list);
}
