package com.example.demo.controller;

import com.example.demo.entity.Product;
import com.example.demo.service.ProductService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    /**
     * 产品列表
     * @param page
     * @param size
     * @return
     */
    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public ModelAndView findAllProduct(@RequestParam(defaultValue = "1") Integer page,
                                       @RequestParam(defaultValue = "10") Integer size) {

        PageInfo<Product> pageInfo = productService.findAll(page, size);
        return new ModelAndView("content-product-list", "pageInfo", pageInfo);
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView addProduct() {
        return new ModelAndView("content-product-edit");
    }

    /**
     * 产品创建，产品修改
     * @param product
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveProduct(Product product) {
        if (product.getId() == 0 ) {
            productService.create(product);
        } else {
            productService.update(product);
        }
        return "redirect:findAll";
    }

    /**
     * 产品查询
     * @param id
     * @return
     */
    @RequestMapping(value = "/query", method = RequestMethod.GET)
    public ModelAndView query(Integer id) {
        Product product = productService.query(id);
        return new ModelAndView("content-product-edit", "product", product);
    }

    /**
     * 产品删除
     * @param ids
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(String ids) {
        productService.delete(ids);
        return "redirect:findAll";
    }

    /**
     * 修改状态
     * @param status
     * @param ids
     * @return
     */
    @RequestMapping(value = "/change", method = RequestMethod.GET)
    public String change(Integer status, String ids) {
        productService.change(status, ids);
        return "redirect:findAll";
    }

}
