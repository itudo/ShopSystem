package com.yc.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.yc.UserEurekaClient;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = UserEurekaClient.class)
public class testAttribute{
	
	
	@Test
	public void TestSolr() {
		System.out.println("dfsdf");
	}
	
	 
}