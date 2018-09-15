<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header1.jsp" %>
<div class="ficationFl fl">
<%@ include file="../functionLeft.jsp" %>
</div>
<link rel="stylesheet" href="./toreview_files/base.css">
<link rel="stylesheet" href="./toreview_files/style.css">
<link rel="stylesheet" href="./toreview_files/payment.css">
<link rel="stylesheet" href="./toreview_files/page.css">
<script type="text/javascript">
$(function() {
	$("#balance").attr("class","active");
});

</script>
		<div class="toBeted fr">
<ul class="title clearfix">
<li class="fl active"><a href="javascript:;">待评价订单</a></li>
<li class="fl"><a href="javascript:;">已评价</a></li>
</ul>
<div class="centent-wrap active">
<ol class="tobeData">
<li class="fl details">订单详情</li>
<li class="fl consignee">数量</li>
<li class="fl dollar">单价</li>
<li class="fl operation">操作</li>
</ol>
<div class="centent-main">
<dl>
<div id="orders">

</div>
<div id="orderdetail">

</div>
</dl> <div class="page">
<div>共&nbsp;<b>1</b>&nbsp;条&nbsp;&nbsp;&nbsp;<b>1</b>/<b>1</b> 页&nbsp;&nbsp; </div> </div>
</div>
</div>
<div class="centent-wrap">
<ol class="clearfix products-title">
<li class="fl products-description">商品详情</li>
<li class="fl data">评价详情</li>
<li class="fl state">操作</li>
</ol>
<div class="centent-main">
<dl>
<div id="review">

</div>
</dl> <div class="page">
<div>共&nbsp;<b>1</b>&nbsp;条&nbsp;&nbsp;&nbsp;<b>1</b>/<b>1</b> 页&nbsp;&nbsp; </div> </div>
</div>
</div>
</div>

<ul class="home-tab">
<li>
<em></em>
<span>0</span>
		<div class="userTips">
		<%@ include file="../tip.jsp" %>
</div>
	</div>
	<!--尾部-->
	
<!-- <script src="js/header.js"></script>
 -->
 <script src="./review_files/toBeEvaluated.js"></script>


<script type="text/javascript">
$(function() {
	showAllOrder(3);
	myreview();
})
function showAllOrder(type) {
	$.getJSON("http://localhost:8762/service-user/showOrder.action",{"type":type},function(data) {
		if(data.code==1) {
			var str = "";
			if(data.rows.length>0) {
				for(var i=0;i<data.rows.length;i++) {
					var obj = data.rows[i];
					str = "<dt><span>2018-08-16 09:16;52</span><span>订单号："+obj.order_id+"</span><span>总金额："+obj.order_totalmoney+"</span><span>收货人："+obj.to_userName+"</span><span></span></dt>"
					for(var j=0;j<obj.orderDetail.length;j++) {
						var detail = obj.orderDetail[j];
						//alert(detail.orderdetail_id)
						//alert(detail.orderdetail_id)
						str+="<dd class='clearfix' style='height:93px'><div class='fl conFl clearfix'><div class='loop'>";
						str+="<div class='fl imgParent'><img src='http://localhost:8762/service-admin/imgGoods/"+detail.goodsDetail.images[0].image_path+"'></div>";
						str+="<div class='fl conParent'><a href=''>"+detail.goodsDetail.goods.goods_name+"</a>";
						str+="</div>";
						str+="</div> </div><div class='fr conFr'><span class='fl name'>X"+detail.goods_count+"</span><span class='fl payment'>￥"+detail.goodsDetail.goodsdetail_price+"</span>";
						str+="<span class='fl evaluate'>";
						if(detail.orderdetail_status==1) {
							str += "<a style='cursor:default;opacity: 0.2;'  href='javascript:void(0)' class='fr btn'>已评价</a><br></span></div></dd>";
						} else {
							str += "<a  href='toreview.jsp?order_id="+detail.orderdetail_id+"' class='fr btn'>评价</a><br></span></div></dd>";
						}
					}
				}
				$("#orders").html(str);
			} else {
				$("#orders").html("<div style='width:100%;margin-left:40%;font-size:30px;color:red;'>亲!暂时没有数据!</div>");
			}
			
		}
	})
}
function myreview() {
	$.getJSON("http://localhost:8762/service-user/myRiview.action",function(data) {
		if(data.code==1) {
			var str = "";
			var obj = data.obj;
			if(obj.length>0) {
				for(var i=0;i<obj.length;i++) {
					//alert(obj[i].orderDetail.goodsDetail.images[0].image_path)
					str+="<dd class='clearfix' style='height:93px'><div class='fl conFl clearfix'><div class='loop'>";
					str+="<div class='fl imgParent'><img src='http://localhost:8762/service-admin/imgGoods/"+obj[i].orderDetail.goodsDetail.images[0].image_path+"'></div>";
					str+="<div class='fl conParent'><a href=''>"+obj[i].orderDetail.goodsDetail.goods.goods_name+"</a>";
					str+="</div>";
					str+="</div> </div><div class='fr conFr'><span class='fl payment'>"+obj[i].review_content+"</span>";
					str+="<div class='fl imgParent' ><img style='width:90px;height:90px;' src='http://localhost:8762/service-user/imgReview/"+obj[i].review_image+"'></div><span class='fl evaluate'>";
					str += "<a  href='javascript:delReview("+obj[i].review_id+")' class='fr btn'>删除 评价</a><br></span></div></dd>";
				}
				$("#review").html(str);
			} else {
				$("#review").html("<div style='width:100%;margin-left:40%;font-size:30px;color:red;'>亲!暂时没有数据!</div>");
			}
			
		}
	})
}
function delReview(id) {
	$.getJSON("http://localhost:8762/service-user/delReview.action",{review_id:id},function(data) {
		if(data.code==1) {
			alert("删除评论成功！")
			showAllOrder(3);
			myreview();
		} else{
			alert("抱歉，删除失败！")
		}
	})
}
function delOrder(id) {
	$.getJSON("http://localhost:8762/service-user/changeOrder.action",{"status":"删除","order_id":id},function(data) {
		if(data.code==1) {
			alert("订单已删除");
			showAllOrder(3);
			myreview();
		}
	})
}
     $('.person-section .toBeted .centent-wrap .products-parent .products .conFr a').on('click',function(){
     	var id = $(this).attr('data-value');
     	$('#review'+id+'').toggle(); 
     })
</script>


<%@ include file="../bottom.jsp"%>