package com.example.demo.mapper;

import com.example.demo.entity.Traveller;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface TravellerMapper {

    @Select("select t.* from orders_traveller ot,traveller t" +
            " where ot.ordersId=#{ordersId} and t.id=ot.travellerId")
    List<Traveller> getListByOrdersId(@Param("ordersId") int ordersId);
}
