<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header1.jsp" %>
<div class="ficationFl fl">
<%@ include file="../functionLeft.jsp" %>
</div>
<link rel="stylesheet" href="./delOrder_files/base.css">
<link rel="stylesheet" href="./delOrder_files/style.css">
<link rel="stylesheet" href="./delOrder_files/payment.css">
<link rel="stylesheet" href="./delOrder_files/page.css">
<script src="./delOrder_files/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#order").attr("class","active");
});

</script>
<div class="mordrMain fr">
<div class="title clearfix">
<ul class="clearfix fl">
<li class="fl hover"><a href="javascript:;">取消订单记录</a></li>
</ul>
</div>


<div style="margin-top:20px;">
<ol class="clearfix tradingStatus">
<li class="fl one">宝贝</li>
<li class="fl two">单价</li>
<li class="fl three">数量</li>
<li class="fl four">商品操作</li>
<li class="fl four">实付款</li>
<li class="fl five">交易状态</li>
<li class="fl four">交易操作</li>
</ol>
</div>

<div id="showAll">

</div>

<div class="page">
<div>共&nbsp;<b>19</b>&nbsp;条&nbsp;&nbsp;&nbsp;<b>1</b>/<b>4</b> 页&nbsp;&nbsp; <span class="current">1</span><a class="num" href="http://demo.shopsn.net/index.php/Home/Order/order_myorder/p/2.html">2</a><a class="num" href="http://demo.shopsn.net/index.php/Home/Order/order_myorder/p/3.html">3</a><a class="num" href="http://demo.shopsn.net/index.php/Home/Order/order_myorder/p/4.html">4</a> <a class="next" href="http://demo.shopsn.net/index.php/Home/Order/order_myorder/p/2.html">下一页</a> </div> </div>
</div>
</div>

<ul class="home-tab">
<li>
<em></em>
<span>0</span>
<script type="text/javascript">
$(function() {
	showAllOrder(5);
})
function showAllOrder(type) {
	$.getJSON("http://localhost:8762/service-user/showOrder.action",{"type":type},function(data) {
		if(data.code==1) {
			var str = "";
			if(data.rows.length>0) {
				for(var i=0;i<data.rows.length;i++) {
					var obj = data.rows[i];
					str = "<div class='myderCentent' id='del27'><div class='ctitle clearfix'><label class='fl'><input type='checkbox'>";
					str += "<span>"+obj.order_time+"</span></label><span class='fl sPent'><em>订单号：</em><em>"+obj.order_id+"</em></span>";
					str += "<div class='fr clearfix conFr'><div class='four fl'><span>总价格:￥"+obj.order_totalmoney+"</span>";
					str += "</div><div class='five fl details'><a href='javascript:;' class='hover' onclick='delOrder("+obj.order_id+")'>删除订单</a>";
					for(var j=0;j<obj.orderDetail.length;j++) {
						var detail = obj.orderDetail[i];
						//alert(detail.goodsDetail.goods)
						str += "</div> </div></div><div class='con clearfix'><div class='fl clearfix conFl'><div class='conLoop clearfix'>";
						str += "<div class='one clearfix fl'><div class='imgsPt fl'><img src='http://localhost:8762/service-admin/imgGoods/"+detail.goodsDetail.images[0].image_path+"'>";
						str += "</div><div class='conRight fl'><a href=''>"+detail.goodsDetail.goods.goods_name+"</a>";
						str += "<p>商品编号："+detail.orderdetail_id+"</p></div></div><div class='two fl'>￥"+detail.goods_buyprice+"</div><div class='three fl'>"+detail.goods_count+"</div><div class='four fl'>";
						str += "<a href='http://demo.shopsn.net/index.php/Home/Service/report/goods/3384.html' class='hover'>投诉卖家</a>";
						str += "</div><div class='status fl'><a href='' class='tui'>再次购买</a> </div>";
						str += "</div></div></div></div>";
					}
				}
				$("#showAll").html(str);
			} else {
				$("#showAll").html("<div style='width:100%;margin-left:40%;font-size:30px;color:red;'>亲!暂时没有数据!</div>");
			}
		}
	})
}
function delOrder(id) {
	$.getJSON("http://localhost:8762/service-user/changeOrder.action",{"status":"删除","order_id":id},function(data) {
		if(data.code==1) {
			alert("订单已删除");
			showAllOrder(5);
		}
	})
}
</script>
<div class="userTips">
<%@ include file="../tip.jsp" %>
</div>
</div><div class="easemobim-prompt-wrapper"><div class="loading"><div class="em-widget-loading"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 70 70"><circle opacity=".3" fill="none" stroke="#000" stroke-width="4" stroke-miterlimit="10" cx="35" cy="35" r="11"></circle><path fill="none" stroke="#E5E5E5" stroke-width="4" stroke-linecap="round" stroke-miterlimit="10" d="M24 35c0-6.1 4.9-11 11-11 2.8 0 5.3 1 7.3 2.8"></path></svg></div></div></div>

<script src="./delOrder_files/order.js"></script>

<script src="./delOrder_files/myOrder.js"></script>
<script src="./delOrder_files/Calendar.js"></script><div id="__calendarPanel" style="position:absolute;visibility:hidden;z-index:9999;background-color:#FFFFFF;border:1px solid #666666;width:200px;height:216px;">
<iframe name="__calendarIframe" id="__calendarIframe" width="100%" height="100%" scrolling="no" frameborder="0" style="margin:0px;" src="./delOrder_files/saved_resource.html"></iframe>
</div>
<%@ include file="../bottom.jsp"%>