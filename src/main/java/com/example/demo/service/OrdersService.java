package com.example.demo.service;

import com.example.demo.mapper.MemberMapper;
import com.example.demo.mapper.OrdersMapper;
import com.example.demo.mapper.ProductMapper;
import com.example.demo.mapper.TravellerMapper;
import com.example.demo.entity.Orders;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrdersService {

    @Autowired
    private OrdersMapper ordersMapper;

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private MemberMapper memberMapper;

    @Autowired
    private TravellerMapper travellerMapper;

    public PageInfo<Orders> findAll(int page, int size) {
        PageHelper.startPage(page, size);
        List<Orders> list = ordersMapper.findAll();
        return new PageInfo<>(list);
    }

    public Orders findById(int id) {

        // 查询订单信息
        Orders orders = ordersMapper.findById(id);

        // 查询订单的会员、产品、游客列表信息
        orders.setMember(memberMapper.findById(orders.getMemberId()));
        orders.setProduct(productMapper.findById(orders.getProductId()));
        orders.setTravellerList(travellerMapper.getListByOrdersId(id));

        return orders;
    }

    public List<Orders> findPending() {
        return ordersMapper.findPending();
    }

}
