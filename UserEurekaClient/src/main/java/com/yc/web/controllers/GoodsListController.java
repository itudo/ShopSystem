package com.yc.web.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.bean.Attribute;
import com.yc.bean.FirstType;
import com.yc.bean.Goods;
import com.yc.bean.GoodsDetail;

import com.yc.bean.SecondType;
import com.yc.bean.ThirdType;
import com.yc.biz.AttributeBiz;
import com.yc.biz.GoodsBiz;
import com.yc.biz.GoodsDetailBiz;
import com.yc.model.JsonModel;
import com.yc.model.PageBean;

@Controller

public class GoodsListController {
	@Resource(name="attributeBizImpl")
	private AttributeBiz attributeBiz;
	@Resource(name="goodsBizImpl")
	private GoodsBiz goodsBiz;
	@Resource(name="goodsDetailBizImpl")
	private GoodsDetailBiz goodsDetailBiz;
	
	@RequestMapping("secondType.action")
	//注解传参数
	public String SecondType(HttpServletRequest request,FirstType firstType){
		 
	
		//得到所有的一级类
		ServletContext application = request.getServletContext();
		List<FirstType> firstTypelist  = (List<FirstType>) application.getAttribute("firstTypelist");
		//得到一个家用电器下的二三级类
		FirstType first = firstTypelist.get(firstType.getFirsttype_id()-1);
		
		List<SecondType> secondList = first.getSecondType();
		SecondType secondtype=secondList.get(firstType.getSecondtype_id()-1);
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("thirdtype_id", firstType.getThirdtype_id());
		PageBean<Goods> pageBean = goodsBiz.findGoodsByCondition(map);
		List<Goods> goodsList = pageBean.getRows();
	     
		//System.out.println(goodsList);
		List<Attribute> allAttr = attributeBiz.getAttributeBySecondType(secondtype.getSecondtype_id());
		request.setAttribute("first", first);
		request.setAttribute("secondType", secondtype);
		request.setAttribute("allAttr", allAttr);
		request.setAttribute("goodsList", goodsList);
		return "goodsList";
		
	}
	
	@RequestMapping("goodsdetail.action")
	public String goodsdetail(HttpServletRequest request,Goods goods){
		Goods singlegoods = goodsBiz.getGoodsById(goods.getGoods_id());
		List<GoodsDetail> goodsDetail = goodsDetailBiz.findGoodsDetailByGoodsId(goods.getGoods_id());
		request.setAttribute("goodsDetail", goodsDetail);
		request.setAttribute("singlegoods", singlegoods);
		System.out.println(goodsDetail);
		
		return "goodsDetail";
		
	}
	
	
	
}
