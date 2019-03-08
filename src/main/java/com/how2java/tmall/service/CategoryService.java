package com.how2java.tmall.service;
import com.how2java.tmall.pojo.Category;

import java.util.List;
public interface CategoryService{
    public List<Category> list();
    public void add(Category category);
    public void delete(int id);
    public void update(Category category);
    public Category get(int id);
}