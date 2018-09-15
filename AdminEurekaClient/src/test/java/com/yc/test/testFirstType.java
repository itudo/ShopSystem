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
import com.yc.biz.FirstTypeBiz;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = AdminEurekaClient.class)
public class testFirstType{
	
	@Resource(name="firstTypeBizImpl")
	private FirstTypeBiz FirstTypeBiz ;
	
	@Test
	public void findAllFirstType() {
		List<FirstType>  list = FirstTypeBiz.findAllFirstType();
		System.out.println(list);
	}
	
	@Test
	public void findFirstTypeById() {
		FirstType   list = FirstTypeBiz.findFirstTypeById(1);
		System.out.println(list);
	}
	
	@Test
	public void addFirstType() {
		FirstType f = new FirstType();
		f.setFirsttype_name("家用电器");
		int  list = FirstTypeBiz.addFirstType(f);
		System.out.println(list);
	}
	
	
	@Test
	public void delFirstType() {
		int   list = FirstTypeBiz.delFirstType(12);
		System.out.println(list);
	}
	
	@Test
	public void findSecondTypeByFirstTypeId() {
		List<FirstType>  list = FirstTypeBiz.findSecondTypeByFirstTypeId(1);
		System.out.println(list);
	}
	
}