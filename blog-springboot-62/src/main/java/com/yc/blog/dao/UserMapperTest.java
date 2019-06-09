package com.yc.blog.dao;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@ContextConfiguration("/beans.xml")
public class UserMapperTest {
	@Resource
	UserMapper um;
	
	@Test
	public void test(){
		System.out.println(um.selectByExample(null));
	}
}
