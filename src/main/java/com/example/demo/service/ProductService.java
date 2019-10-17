package com.example.demo.service;

import com.example.demo.mapper.OrdersMapper;
import com.example.demo.mapper.ProductMapper;
import com.example.demo.entity.Product;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

@Service
public class ProductService {

    @Autowired
    private OrdersMapper ordersMapper;

    @Autowired
    private ProductMapper productMapper;

    public PageInfo<Product> findAll(int page, int size) {
        PageHelper.startPage(page, size);
        List<Product> list = productMapper.findAll();
        return new PageInfo<>(list);
    }

    public void create(Product product) {
        productMapper.create(product);
    }

    public Product query(Integer id) {
        return productMapper.findById(id);
    }

    public void update(Product product) {
        productMapper.update(product);
    }

    public void delete(String idList) {
        String[] strings = idList.split(",");
        List<String> list = new ArrayList<>(Arrays.asList(strings));

        Iterator<String> iterator = list.iterator();
        while(iterator.hasNext()){
            if(ordersMapper.checkProductUsed(iterator.next()) > 0){
                iterator.remove();
            }
        }
        if (!list.isEmpty()) {
            productMapper.delete(list);
        }
    }

    public void change(Integer status, String idList) {
        String[] strings = idList.split(",");
        List<String> list = new ArrayList<>(Arrays.asList(strings));

        productMapper.change(status, list);
    }
}
