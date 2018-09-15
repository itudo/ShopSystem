package com.yc.test;

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

import com.netflix.discovery.converters.Auto;
import com.yc.AdminEurekaClient;
import com.yc.bean.Goods;
import com.yc.bean.GoodsDetail;
import com.yc.bean.ThirdType;
import com.yc.bean.Users;
import com.yc.biz.FirstTypeBiz;
import com.yc.biz.GoodsBiz;
import com.yc.biz.GoodsDetailBiz;
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
public class testGoodsDetail {

	@Autowired
	private GoodsDetailBiz goodsDetailBiz;

	@Test
	public void addGoodsDetail() {
		GoodsDetail  goodsDetail = new GoodsDetail();
		goodsDetail.setGoods_count(1200);
		goodsDetail.setGoodsdetail_price(4500);
		Goods goods = new Goods();
		goods.setGoods_id(2 );
		goodsDetail.setGoods(goods);
		int list = goodsDetailBiz.addGoodsDetail(goodsDetail);
	}

	@Test
	public void updateGoodsDetail() {
		GoodsDetail  goodsDetail = new GoodsDetail();
		goodsDetail.setGoods_count(1200);
		goodsDetail.setGoodsdetail_price(4600);
		Goods goods = new Goods();
		goods.setGoods_id(2 );
		goodsDetail.setGoods(goods);
		int list=  goodsDetailBiz.updateGoodsDetail(goodsDetail);
	}

	@Test
	public void findGoodsDetailByGoodsId() {
		List<GoodsDetail> list = goodsDetailBiz.findGoodsDetailByGoodsId(1);
		System.out.println(list);
	}

}
