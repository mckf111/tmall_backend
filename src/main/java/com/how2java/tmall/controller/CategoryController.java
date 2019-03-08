package com.how2java.tmall.controller;
 
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.how2java.tmall.pojo.Category;
import com.how2java.tmall.service.CategoryService;
import com.how2java.tmall.util.ImageUtil;
import com.how2java.tmall.util.Page;
import com.how2java.tmall.util.UploadedImageFile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
 
@Controller
@RequestMapping("")
public class CategoryController {
    @Autowired
    CategoryService categoryService;
  
    @RequestMapping("admin_category_list")
    public String list(Model model, Page page){
	PageHelper.offsetPage(page.getStart(), page.getCount());
        List<Category> cs= categoryService.list();
        int total = (int) new PageInfo<>(cs).getTotal();
        page.setTotal(total);
        model.addAttribute("page", page);
        model.addAttribute("cs", cs);
        return "admin/listCategory";
    }
    
    @RequestMapping("admin_category_add")
    public String add(Category category, UploadedImageFile uploadedImageFile, HttpSession session)
     throws IOException {
	System.out.println(category.getId());
	categoryService.add(category);
	System.out.println(category.getId());
	File imageFolder = new File(session.getServletContext().getRealPath("img/category"));
	File file = new File(imageFolder, category.getId()+".jpg");
	if (!file.getParentFile().exists()) {
	    file.getParentFile().mkdirs();
	}
	System.out.println(uploadedImageFile);
	System.out.println(uploadedImageFile.getImage());
	System.out.println(file);
	uploadedImageFile.getImage().transferTo(file);
	BufferedImage img = ImageUtil.change2jpg(file);
	ImageIO.write(img, "jpg", file);
	
	return "redirect:/admin_category_list";
    }
    
    @RequestMapping("admin_category_delete")
    public String delete(int id, HttpSession session) {
	categoryService.delete(id);
	File imageFolder = new File(session.getServletContext().getRealPath("img/category"));
	File file = new File(imageFolder, id+".jpg");
	file.delete();
	
	return "redirect:/admin_category_list";
    }
    
    @RequestMapping("admin_category_edit")
    public String edit(int id, Model model) throws IOException {
	Category c = categoryService.get(id);
	model.addAttribute("c", c);
	return "admin/editCategory";
    }
    
    @RequestMapping("admin_category_update")
    public String update(Category category, HttpSession session, UploadedImageFile imageFile) 
    throws IOException {
	categoryService.update(category);
	MultipartFile image = imageFile.getImage();
	if (image!=null & !image.isEmpty()) {
	    File imageFolder = new File(session.getServletContext().getRealPath("img/category"));
	    File file = new File(imageFolder, category.getId() + ".jpg");
	    image.transferTo(file);
	    BufferedImage img = ImageUtil.change2jpg(file);
	    ImageIO.write(img, "jpg", file);
	}
	return "redirect:/admin_category_list";
    }
}