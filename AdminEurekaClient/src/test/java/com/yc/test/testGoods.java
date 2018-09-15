 package com.yc.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.netflix.infix.lang.infix.antlr.EventFilterParser.boolean_expr_return;
import com.yc.AdminEurekaClient;
import com.yc.bean.Goods;
import com.yc.bean.ThirdType;
import com.yc.bean.Users;
import com.yc.biz.FirstTypeBiz;
import com.yc.biz.GoodsBiz;
import com.yc.biz.SecondTypeBiz;
import com.yc.model.PageBean;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import javax.annotation.Resource;
import javax.annotation.Resources;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = AdminEurekaClient.class)
public class testGoods {

	@Autowired
	private GoodsBiz goodsBiz;
	@Autowired
	private FirstTypeBiz categoryBiz;
 
	@Test
	public void updateGoods() {
		Goods  goods = new Goods();
		goods.setGoods_id(1);
		goods.setGoods_name("HDR人工智能网络电视");
		goods.setGoods_isnew(0);
		goods.setGoods_desc("62英寸原色量子点超薄");
		goods.setGoods_sale(20);
		ThirdType thirdType  = new ThirdType();
		thirdType.setThirdtype_id(2);
		goods.setThirdType(thirdType);
		int  list = goodsBiz.updateGoods(goods);
		System.out.println(list);
	}

	@Test
	public void findGoodsByCondition() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("goods_id", 1);
		// map.put("minPrice", 1000);
		// map.put("maxPrice", 100000);
		// map.put("goods_detail", "摄像头");
		// map.put("startPubtime", "2018-8-20");
		// map.put("endPubtime", "2018-8-20");
		// map.put("goods_isnew", 0);
		// map.put("goods_sale", 600);
		// map.put("goods_id", 3);

		map.put("start", 0);
		map.put("pages", 1);
		map.put("pageSize", 2);

		
		  map.put("orderby", "goods_sale"); map.put("orderway", "desc");
		 
		PageBean<Goods> list = goodsBiz.findGoodsByCondition(map);
		System.out.println("-----------" + list);
	}

	@Test
	public void testAddGoods() {
		Goods goods = new Goods();
		goods.setGoods_name("HDR智能液晶电视机");
		goods.setGoods_desc("彩电4k高清超薄64位");
		goods.setGoods_isnew(1);
		goods.setGoods_sale(0);
		ThirdType thirdType  = new ThirdType();
		thirdType.setThirdtype_id(2);
		goods.setThirdType(thirdType);

		int r = goodsBiz.addGoods(goods);
		if (r > 0) {
			System.out.println("-------------------" + r);
		}
	}
	
	@Test
	public void testDelsingle() {
		  boolean l = goodsBiz.delSingleGoods(5);
		  System.out.println(l);
	}
	
	@Test
	public void testDelsingle1() {
		  /*boolean l = goodsBiz.
		  System.out.println(l);*/
	}
	
	@Test
	public void testDelMany() {
		  Goods  g1 = new Goods();
		  g1.setGoods_id(3);
		  Goods  g2 = new Goods();
		  g2.setGoods_id(4);
		  Goods  g4 = new Goods();
		  g4.setGoods_id(7);
		  List<Goods>  list = new  ArrayList<Goods>();
		  list.add(g1);
		  list.add(g2);
		  list.add(g4);
		  boolean l = goodsBiz.delManyGoods(list);
		  System.out.println(l);
	}

}
 