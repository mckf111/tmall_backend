package com.how2java.tmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.how2java.tmall.pojo.Category;
import com.how2java.tmall.pojo.Product;
import com.how2java.tmall.service.CategoryService;
import com.how2java.tmall.service.ProductService;
import com.how2java.tmall.util.Page;

@Controller
@RequestMapping("")
public class ProductController {
    @Autowired
    ProductService productService;
    @Autowired
    CategoryService categoryService;
    
    @RequestMapping("admin_product_list")
    public String list(int cid, Model model, Page page) {
	PageHelper.offsetPage(page.getStart(), page.getCount());
	List<Product> ps = productService.list(cid);
	int total = (int) new PageInfo<>(ps).getTotal();
	page.setTotal(total);
	Category c = categoryService.get(cid);
	page.setParam("&cid="+c.getId());
	
	model.addAttribute("c", c);
	model.addAttribute("ps", ps);
	model.addAttribute("page", page);
	
	return "admin/listProduct";
    }
    
    @RequestMapping("admin_product_add")
    public String add(Product product) {
	productService.add(product);
	
	return "redirect:/admin_product_list?cid="+product.getCid();
    }
    
    @RequestMapping("admin_product_delete")
    public String delete(int id) {
	Product product = productService.get(id);
	productService.delete(id);
	
	return "redirect:/admin_product_list?cid="+product.getCid();
    }
    
    @RequestMapping("admin_product_edit")
    public String edit(int id, Model model) {
	Product p = productService.get(id);
	Category c = categoryService.get(p.getCid());
	
	model.addAttribute("p", p);
	model.addAttribute("c", c);
	
	return "admin/editProduct";
    }
    
    @RequestMapping("admin_product_update")
    public String update(Product product) {
	productService.update(product);
	
	return "redirect:/admin_product_list?cid="+product.getCid();
    }
}
