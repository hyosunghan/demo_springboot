package com.example.demo.service;

import com.example.demo.mapper.ProductMapper;
import com.example.demo.entity.Product;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    @Autowired
    private ProductMapper productMapper;

    public PageInfo<Product> findAll(int page, int size) {
        PageHelper.startPage(page, size);
        List<Product> list = productMapper.findAll();
        return new PageInfo<>(list);
    }

    public void save(Product product) {
        productMapper.save(product);
    }
}
