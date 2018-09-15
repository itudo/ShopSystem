package com.yc.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.yc.AdminEurekaClient;
import com.yc.bean.FirstType;
import com.yc.bean.SecondType;
import com.yc.bean.ThirdType;
import com.yc.biz.FirstTypeBiz;
import com.yc.biz.ThirdTypeBiz;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = AdminEurekaClient.class)
public class testThirdType{
	
 
	@Autowired
	private ThirdTypeBiz  thirdTypeBiz;
	
	@Test
	public void findAllFirstType() {
		List<ThirdType>  list =  thirdTypeBiz.findAllThirdType();
		System.out.println(list);
	}
	
	@Test
	public void findThirdTypeById() {
		 ThirdType   list =  thirdTypeBiz.findThirdTypeById(1);
		System.out.println(list);
	}
	
	@Test
	public void findThirdTypeBySecondTypeId() {
		List<ThirdType>     list =  thirdTypeBiz.findThirdTypeBySecondTypeId(1);
		System.out.println(list);
	}
	
	@Test
	public void addThirdtype() {
		ThirdType  thirdType = new ThirdType();
		thirdType.setThirdtype_name("熨斗");
		SecondType  secondType = new SecondType();
		secondType.setSecondtype_id(7);
		thirdType.setSecondType(secondType);
		int list =  thirdTypeBiz.addThirdtype(thirdType);
		System.out.println(list);
	}
	
	@Test
	public void updateThirdType() {
		ThirdType  thirdType = new ThirdType();
		thirdType.setThirdtype_id(17);
		thirdType.setThirdtype_name("熨斗");
		SecondType  secondType = new SecondType();
		secondType.setSecondtype_id(8);
		thirdType.setSecondType(secondType);
		int list =  thirdTypeBiz.updateThirdType(thirdType);
		System.out.println(list);
	}
	
	@Test
	public void delThirdType() {
		int list =  thirdTypeBiz.delThirdType(17);
		System.out.println(list);
	}
	 
}