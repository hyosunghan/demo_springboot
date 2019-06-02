package com.example.demo.controller;

import com.example.demo.entity.Product;
import com.example.demo.service.ProductService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public ModelAndView findAllProduct(@RequestParam(defaultValue = "1") Integer page,
                                @RequestParam(defaultValue = "10") Integer size) {
        ModelAndView mv = new ModelAndView();

        PageHelper.startPage(page, size);
        List<Product> products = productService.findAll();
        PageInfo<Product> pageInfo = new PageInfo<>(products);

        mv.addObject("productList", products);
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("content-product-list");
        return mv;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView addProduct() {
        return new ModelAndView("content-product-add");
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView saveProduct(Product product) {
        productService.save(product);
        return new ModelAndView("redirect:findAll");
    }

}
