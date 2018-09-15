package com.yc.web.controllers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.yc.bean.Address;
import com.yc.bean.CartDetail;
import com.yc.bean.GoodsDetail;
import com.yc.bean.OrderDetail;
import com.yc.bean.Orders;
import com.yc.bean.Review;
import com.yc.bean.Users;
import com.yc.biz.AddressBiz;
import com.yc.biz.CartBiz;
import com.yc.biz.GoodsDetailBiz;
import com.yc.biz.OrderBiz;
import com.yc.biz.ReviewBiz;
import com.yc.biz.UsersBiz;
import com.yc.fileupload.UploadFile;
import com.yc.model.JsonModel;
import com.yc.model.PageBean;

@Slf4j
@RestController
public class OrderController {
	@Resource(name="orderBizImpl")
	private OrderBiz orderBiz;
	
	@Resource(name="reviewBizImpl")
	private ReviewBiz reviewBiz;
	
	@Resource(name="uploadFileService")
	private UploadFile uf;
	
	@Resource(name="addressBizImpl")
	private AddressBiz addressBiz;
	
	@Resource(name="cartBizImpl")
	private CartBiz cartBiz;
	
	@Resource(name="goodsDetailBizImpl")
	private GoodsDetailBiz goodsDetailBiz;
	
	@RequestMapping("showOrder.action")
	public PageBean showOrder(@RequestParam(name="type")int type,HttpSession session) {
		Users user = (Users) session.getAttribute("user");
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("user_id", user.getUser_id());
		PageBean<Orders> list = new PageBean<Orders>();
		if(type==10) {
			list = orderBiz.selectOrder(map);
		} else {
			map.put("order_status", type);
			list = orderBiz.selectOrder(map);
		}
		log.info("list{}",list);
		list.setCode(1);
		return list;
	}
	
	@RequestMapping("changeOrder.action")
	public JsonModel changeOrder(@RequestParam(name="status")String status,Orders order) {
		JsonModel jsonModel = new JsonModel();
		System.out.println(status+order);
		if(status.trim().equals("还原")) {
			order.setOrder_status(4);
			orderBiz.updateOrderstatus(order);
			jsonModel.setCode(1);
		} else if(status.trim().equals("删除")) {
			order.setOrder_status(6);
			orderBiz.updateOrderstatus(order);
			jsonModel.setCode(1);
		} else if(status.trim().equals("取消")) {
			order.setOrder_status(5);
			orderBiz.updateOrderstatus(order);
			jsonModel.setCode(1);
		}else if(status.trim().equals("收货")) {
			order.setOrder_status(3);
			orderBiz.updateOrderstatus(order);
			jsonModel.setCode(1);
		}else {
			jsonModel.setCode(0);
		}
		return jsonModel;
	}
	
	@RequestMapping("orderDetail.action")
	public JsonModel orderDetail(OrderDetail orderDetail) {
		Map<String,Object> map = new HashMap<String,Object>();
		JsonModel jsonModel = new JsonModel();
		map.put("orderdetail_id", orderDetail.getOrderdetail_id());
		OrderDetail detail = orderBiz.selectOrderDetail(map).getRows().get(0);
		log.info("detail{}",detail);
		jsonModel.setCode(1);
		jsonModel.setObj(detail);
		return jsonModel;
	}
	
	@RequestMapping("getOrderDetail.action")
	public JsonModel getOrderDetail(HttpSession session,GoodsDetail goodsDetail) {
		Users user = (Users) session.getAttribute("user");
		List<Address> list = addressBiz.getAddressById(user);
		GoodsDetail detail = goodsDetailBiz.findGoodsDetailById(goodsDetail);
		JsonModel jsonModel = new JsonModel();
		jsonModel.setCode(1);
		jsonModel.setRows(list);
		log.info("list{}",list);
		jsonModel.setObj(detail);
		log.info("detail{}",detail);
		return jsonModel;
	}
	
	@RequestMapping("insertOrder.action")
	public JsonModel insertOrder(HttpSession session,Orders orders,CartDetail cartDetail) {
		JsonModel jsonModel = new JsonModel();
		Users user = (Users) session.getAttribute("user");
		orders.setUser(user);
		List<CartDetail> list = new ArrayList<CartDetail>();
		list.add(cartDetail);
		orders.setCartDetail(list);
		orderBiz.insertOrder(orders);
		log.info("orders{}",orders);
		jsonModel.setCode(1);
		return jsonModel;
	}
	
	@RequestMapping("pay.action")
	public JsonModel pay(Orders order) {
		log.info("order{}",order);
		JsonModel jsonModel = new JsonModel();
		order.setOrder_status(1);
		orderBiz.updateOrderstatus(order);
		jsonModel.setCode(1);
		return jsonModel;
	}
	
	@RequestMapping("getOrderDetailFromCart.action")
	public JsonModel getOrderDetailFromCart(HttpSession session,@RequestParam(name="id_str")String id_str) {
		log.info("id_str{}",id_str);
		Users user = (Users) session.getAttribute("user");
		List<Address> list = addressBiz.getAddressById(user);
		List<String> ids = Arrays.asList(id_str.split(","));
		System.out.println(ids);
		List<CartDetail> detailList = cartBiz.selectCartDetailListById(ids);
		JsonModel jsonModel = new JsonModel();
		jsonModel.setCode(1);
		jsonModel.setRows(list);
		log.info("detailList{}",detailList);
		jsonModel.setObj(detailList);
		log.info("list{}",list);
		return jsonModel;
	}
	
	@RequestMapping("insertOrderFromCart.action")
	public JsonModel insertOrderFromCart(HttpSession session,Orders orders,@RequestParam(name="id_str")String id_str) {
		JsonModel jsonModel = new JsonModel();
		Users user = (Users) session.getAttribute("user");
		orders.setUser(user);
		List<String> ids = Arrays.asList(id_str.split(","));
		orderBiz.insertOrderFromCart(user, ids, orders);
		jsonModel.setCode(1);
		return jsonModel;
	}
}