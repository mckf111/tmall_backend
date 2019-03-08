package com.how2java.tmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.how2java.tmall.pojo.Category;
import com.how2java.tmall.pojo.Property;
import com.how2java.tmall.service.CategoryService;
import com.how2java.tmall.service.PropertyService;
import com.how2java.tmall.util.Page;

@Controller
@RequestMapping("")
public class PropertyController {

    @Autowired
    PropertyService propertyService;
    
    @Autowired
    CategoryService categoryService;
    
    @RequestMapping("admin_property_list")
    public String list(int cid, Model model, Page page) {
	PageHelper.offsetPage(page.getStart(), page.getCount());
	List<Property> ps = propertyService.list(cid);
	Category c = categoryService.get(cid);
	page.setParam("&cid=" + c.getId());
	int total = (int) new PageInfo<>(ps).getTotal();
	page.setTotal(total);
	model.addAttribute("ps", ps);
	model.addAttribute("c", c);
	model.addAttribute("page", page);
	
	return "admin/listProperty";
    }
    
    @RequestMapping("admin_property_delete")
    public String delete(int id) {
	Property p = propertyService.get(id);
	propertyService.delete(id);
	return "redirect:admin_property_list?cid=" + p.getCid();
    }
    
    @RequestMapping("admin_property_add")
    public String add(Property property) {
	propertyService.add(property);
	return "redirect:admin_property_list?cid=" + property.getCid();
    }
    
    @RequestMapping("admin_property_edit")
    public String edit(int id, Model model) {
	Property p = propertyService.get(id);
	model.addAttribute("p", p);
	return "admin/editProperty";
    }
    
    @RequestMapping("admin_property_update")
    public String update(Property property) {
	propertyService.update(property);
	return "redirect:admin_property_list?cid=" + property.getCid();
    }
}
