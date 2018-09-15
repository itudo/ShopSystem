package com.yc.test;

import java.util.List;

import org.hamcrest.Matchers;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import com.yc.AdminEurekaClient;
import com.yc.bean.FirstType;
import com.yc.bean.SecondType;
import com.yc.bean.Users;
import com.yc.biz.SecondTypeBiz;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import javax.annotation.Resource;
import javax.annotation.Resources;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = AdminEurekaClient.class)
public class SecondTypeBiztest {

	@Autowired
	private SecondTypeBiz secondTypeBiz;

	@Test
	public void findAllSecondType() {
		List<SecondType> list = secondTypeBiz.findAllSecondType();
		System.out.println(list);

	}

	@Test
	public void findSecondTypeById() {
		List<SecondType> list = secondTypeBiz.findSecondTypeByFirstTypeId(1);
		System.out.println(list);

	}

	@Test
	public void addSecondType() {
		SecondType secondType = new SecondType();
		secondType.setSecondtype_name("q");
		FirstType fristType = new FirstType();
		fristType.setFirsttype_id(1);
		secondType.setFristType(fristType);
		int list = secondTypeBiz.addSecondType(secondType);
		System.out.println(list);
	}
	
	@Test
	public void delSecondType() {
		int list = secondTypeBiz.delSecondType(9);
		System.out.println(list);
	}
	
	@Test
	public void updateSecondType() {
		SecondType secondType = new SecondType();
		secondType.setSecondtype_id(8);
		secondType.setSecondtype_name("个人护理");
		FirstType fristType = new FirstType();
		fristType.setFirsttype_id(6);
		secondType.setFristType(fristType);
		int list = secondTypeBiz.updateSecondType(secondType );
		System.out.println(list);
	}
	
	@Test
	public void findThirdTypeBySecondTypeId() {
		List<SecondType> list = secondTypeBiz.findThirdTypeBySecondTypeId(7);
		System.out.println(list);

	}
	
	
	@Test
	public void findThirdTypeById() {
		List<SecondType> list = secondTypeBiz.findSecondTypeByFirstTypeId(1);
		System.out.println(list);

	}
}
