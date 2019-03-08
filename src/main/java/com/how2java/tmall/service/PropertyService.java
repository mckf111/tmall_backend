package com.how2java.tmall.service;

import java.util.List;

import com.how2java.tmall.pojo.Property;

public interface PropertyService {
    
    public void add(Property property);
    public void delete(int id);
    public void update(Property property);
    public Property get(int id);
    public List<Property> list(int cid);
}
