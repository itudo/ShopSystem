package com.yc.test;

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

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
@RunWith(SpringRunner.class)
@SpringBootTest(classes= AdminEurekaClient.class)//
@AutoConfigureMockMvc//注入MockMVC实例
/*@WebServlet(
urlPatterns= {"/user_login.action"},initParams = {
	@WebInitParam (name = "username", 		value = "a"),
	@WebInitParam (name = "password", 		value = "a"),})*/
public class testMockito {
	
		@Autowired
	    private MockMvc mvc;  /* mvc的mock对象 */
		
	    @Test
	    public void testHello() {
	    		RequestBuilder request = get("/index.jsp");  /* 定义URL，已经发起请求为get方式 */
	    		/* 模拟发起Http请求*/
	    		try {
	    			//System.out.println(mvc+">>>>>>");
	    			mvc.perform(request)
	    			.andExpect(status().isOk()) /* 比较返回码是否为200 */
	    			.andExpect(content().string(Matchers.equalTo("{" +  /* 比较返回内容 */
	    					"\"msg\":\"HelloWorld\"," +
	    					"\"status\":\"success\"" +
	    					"}")));
	    		} catch (Exception e) {
	    			e.printStackTrace();
	    		}
	    }
	    
	    @Test
	    public void testUserLogin() {
	    		RequestBuilder request =get("/userLogin.action").param("username", "a").param("password", "a");  /* 定义URL，已经发起请求为get方式 */
	    		/* 模拟发起Http请求*/
	    		try {
	    			mvc.perform(request)
	    			.andExpect(status().isOk())  //比较返回码是否为200 
	    			.andExpect(content().string(Matchers.equalTo("{\"code\":1,\"obj\":null,\"errmsg\":null,\"rows\":null}")));
	    		} catch (Exception e) {
	    			e.printStackTrace();
	    		}
	    }
	
}
