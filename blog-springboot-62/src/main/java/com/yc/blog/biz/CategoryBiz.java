package com.yc.blog.biz;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.blog.bean.Category;
import com.yc.blog.dao.CategoryMapper;

@Service
public class CategoryBiz {
	
	@Resource
	CategoryMapper cm;
	public List<Category> findAll(){
		//查询所有分类传入null
		return cm.selectByExample(null);
	}
}
