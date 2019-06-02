package com.example.demo.service;

import com.example.demo.mapper.ProductMapper;
import com.example.demo.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    @Autowired
    private ProductMapper productMapper;

    public List<Product> findAll() {
        return productMapper.findAll();
    }

    public void save(Product product) {
        productMapper.save(product);
    }
}
