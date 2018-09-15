package com.yc.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.yc.AdminEurekaClient;
import com.yc.bean.Attribute;
import com.yc.bean.Attrvalue;
import com.yc.bean.FirstType;
import com.yc.bean.SecondType;
import com.yc.bean.ThirdType;
import com.yc.biz.AttributeBiz;
import com.yc.biz.AttrvalueBiz;
import com.yc.biz.FirstTypeBiz;
import com.yc.biz.ThirdTypeBiz;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = AdminEurekaClient.class)
public class testAttribute{
	
 
	@Autowired
	private AttributeBiz attributeBiz;
	@Autowired
	private AttrvalueBiz attrvalueBiz;
	
	@Test
	public void findAllFirstType() {
		List<Attrvalue>  list =  attrvalueBiz.getAttrvalueByPid(1);
		System.out.println(list);
	}
	
	
	@Test
	public void getAttributeBySecondType() {
		List<Attribute>  list =  attributeBiz.getAttributeBySecondType(1);
		System.out.println(list);
	}
	 
	 
}