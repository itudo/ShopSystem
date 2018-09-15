package com.yc.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.netflix.infix.lang.infix.antlr.EventFilterParser.boolean_expr_return;
import com.yc.AdminEurekaClient;
import com.yc.bean.FirstType;
import com.yc.bean.GoodsDetail;
import com.yc.bean.Image;
import com.yc.bean.SecondType;
import com.yc.biz.ContactBiz;
import com.yc.biz.FirstTypeBiz;
import com.yc.biz.ImageBiz;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = AdminEurekaClient.class)
public class testContact {

	@Autowired
	private ContactBiz contactBiz;
	@Autowired
	private ImageBiz imageBiz;

	@Test
	public void findImageByGoodsdetailId() {
	 
       boolean r =  imageBiz.findImageByGoodsdetailId(17);
       System.out.println(r);
	}
}