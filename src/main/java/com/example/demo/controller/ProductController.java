package com.example.demo.controller;

import com.example.demo.entity.Product;
import com.example.demo.service.ProductService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("/findAll")
    public ModelAndView findAll(@RequestParam(defaultValue = "1") int page,
                                @RequestParam(defaultValue = "10") int size) {
        ModelAndView mv = new ModelAndView();

        PageHelper.startPage(page, size);
        List<Product> products = productService.findAll();
        PageInfo<Product> pageInfo = new PageInfo<>(products);

        mv.addObject("productList", products);
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("content-product-list");
        return mv;
    }

    @GetMapping("/add")
    public ModelAndView add() {
        return new ModelAndView("content-product-add");
    }

    @PostMapping("/save")
    public ModelAndView save(Product product) {
        productService.save(product);
        return new ModelAndView("redirect:findAll");
    }

}
