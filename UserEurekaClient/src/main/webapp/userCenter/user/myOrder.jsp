<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header1.jsp" %>
<div class="ficationFl fl">
<%@ include file="../functionLeft.jsp" %>
</div>
<script type="text/javascript">
$(function() {
	$("#order").attr("class","active");
});
</script>

<script>
        $('.dels').click(function(){
            var _url="/index.php/Home/Goods/dels.html";
            var _id=$(this).attr('data');
            $.post(_url,{id:_id},function(data){
                if(data.status==0){
                    layer.msg(data.message);
                }
            })
            var _count=parseInt($('#couts').html());
            $(this).parent().parent().remove('dd');
            $('#couts').html(_count-1);
        })
    </script>


<script>
        function addAd(ele){
            var _id=$(ele).attr('g');
            var _reurl=$(ele).attr('data');
            var _locatUrl="/index.php/Home/Ad/addhit.html";
            $.post(_locatUrl, {id:_id},function(data){
                console.log(data.msg);
            },'JSON')
            window.location.href=_reurl;
        }
    </script>
<script>
		$("#formsarch").submit(function(){
			$("#ser-id").remove();
		});

	</script>

<div class="mordrMain fr">
<div class="title clearfix">
<ul class="clearfix fl">
<li id="all" class="fl "><a href="javascript:showOrder(10)">所有订单</a></li>
<li id="waitmoney" class="fl "><a href="javascript:showOrder(0)">待付款</a></li>
<li id="waitgoods" class="fl "><a href="javascript:showOrder(1)">待发货</a></li>
<li id="waitrecive" class="fl "><a href="javascript:showOrder(2)">待收货</a></li>
<li id="waitreview" class="fl "><a href="javascript:showOrder(3)">待评价</a></li>
<li id="over" class="fl "><a href="javascript:showOrder(4)">已完成</a></li>
</ul>
<a href="delOrder.jsp" class="recovery fr clearfix">
<em class="fl"></em>
<span class="fr">订单回收站</span>
</a>
</div>

<form action="http://demo.shopsn.net/index.php/Home/Order/search_order.html" method="post" class="form">
<div class="rangeSearch">
<div class="search clearfix">
<input type="text" name="name" class="fl t" id="name" placeholder="请输入商品标题或者订单编号进行搜索">
<input type="button" value="订单搜索" class="fl b" id="search" onclick="check_order()">
<div class="cndo fl">
<h2 class="clearfix">
<span class="fl">精简筛选条件</span>
<em class="fl"></em>
</h2>
</div>
</div>
<div class="more-part clearfix">
<div class="fl type clearfix">
<span class="fl">订单类型</span>
<select name="type" id="" class="fl typeCh">
<option>全部</option>
</select>
</div>
<div class="fl dealTimer clearfix">
<span class="fl">成交时间</span>
<input type="text" name="control_date" id="control_date" placeholder="请选择开始时间范围" class="fl">
<em class="fl">-</em>
<input type="text" name="control_date2" id="control_date2" placeholder="请选择结束时间范围" class="fl">
</div>
<script>
							$('.mordrMain .rangeSearch .more-part  .dealTimer input').on('focus',function(){
								new Calendar().show(this);
							}).on('blur',function(){
								new Calendar().show();
							});
							
						</script>
<div class="fl type clearfix">
<span class="fl">交易状态</span>
<select name="trans" id="" class="fl typeCh">
<option value="">全部</option>
<option value="11">待付款</option>
<option value="1">已付款</option>
<option value="3">已发货</option>
<option value="4">已收货</option>
<option value="5">退款中的订单</option>
</select>
</div>
<div class="fl type clearfix" style="margin-left:100px;">
<span class="fl">评价状态</span>
<select name="comment" id="" class="fl typeCh">
<option value="">全部</option>
<option value="2">待评价</option>
<option value="1">已评价</option>
</select>
</div>
</div>
</div>
</form>

<ol class="clearfix tradingStatus">
<li class="fl one">宝贝</li>
<li class="fl two">单价</li>
<li class="fl three">数量</li>
<li class="fl four">商品操作</li>
<li class="fl four">实付款</li>
<li class="fl five">交易状态</li>
<li class="fl four">交易操作</li>
</ol>
<div id="showAll">

</div>
</div></div></div></div>
 <div class="page">
<div>共&nbsp;<b>19</b>&nbsp;条&nbsp;&nbsp;&nbsp;<b>1</b>/<b>4</b> 页&nbsp;&nbsp; <span class="current">1</span><a class="num" href="http://demo.shopsn.net/index.php/Home/Order/order_myorder/p/2.html">2</a><a class="num" href="http://demo.shopsn.net/index.php/Home/Order/order_myorder/p/3.html">3</a><a class="num" href="http://demo.shopsn.net/index.php/Home/Order/order_myorder/p/4.html">4</a> <a class="next" href="http://demo.shopsn.net/index.php/Home/Order/order_myorder/p/2.html">下一页</a> </div> </div>
</div>

<ul class="home-tab">
<li>
<em></em>
<span>0</span>
<div class="userTips">
<%@ include file="../tip.jsp" %>
</div>
</div><div class="easemobim-prompt-wrapper"><div class="loading"><div class="em-widget-loading"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 70 70"><circle opacity=".3" fill="none" stroke="#000" stroke-width="4" stroke-miterlimit="10" cx="35" cy="35" r="11"></circle><path fill="none" stroke="#E5E5E5" stroke-width="4" stroke-linecap="round" stroke-miterlimit="10" d="M24 35c0-6.1 4.9-11 11-11 2.8 0 5.3 1 7.3 2.8"></path></svg></div></div></div>

<div class="ui-alert-main">
<h5 class="title clearfix">
<i class="layui-layer-ico layui-layer-ico0 fl"></i>
<span class="fl">订单取消申请</span>
</h5>
<div class="input-main clearfix">
<span class="fl"><i>*</i>取消原因:</span>
<div class="input-main fl"><input type="text" id="reason"></div>
</div>
<dl>
<dt>温馨提示:</dt>
<dd>·&nbsp;订单成功取消后无法恢复</dd>
<dd>·&nbsp;该商品已服金额将返还银行卡/平台账户</dd>
<dd>·&nbsp;拆单后取消订单,使用优惠券将不再返回</dd>
</dl>
<div class="drop-down clearfix">
<label class="fl clearfix">
<input type="radio" name="data" class="fl">
<span class="fl">不想买了</span>
</label>
<label class="fl clearfix">
<input type="radio" name="data" class="fl">
<span class="fl">该商品降价了</span>
 </label>
<label class="fl clearfix">
<input type="radio" name="data" class="fl">
<span class="fl">其他渠道价格更低</span>
</label>
<label class="fl clearfix">
<input type="radio" name="data" class="fl">
<span class="fl">支付方式有误/无法支付</span>
</label>
<label class="fl clearfix">
<input type="radio" name="data" class="fl">
<span class="fl">重复下单/误下单</span>
</label>
<label class="fl clearfix">
<input type="radio" name="data" class="fl">
<span class="fl">商品买了(颜色丶尺寸丶是的撒)</span>
</label>
<label class="fl clearfix">
<input type="radio" name="data" class="fl">
<span class="fl">忘记使用优惠券</span>
</label>
<label class="fl">
<input type="radio" name="data">
<span>发票信息有误</span>
</label>
<label class="fl clearfix">
<input type="radio" name="data" class="fl">
<span class="fl">配送信息有误</span>
</label>
<label class="fl clearfix">
<input type="radio" name="data" class="fl">
<span class="fl">订单不能预计时间送达</span>
</label>
</div>
</div>
<script src="./myOrder_files/order.js"></script>

<script src="./myOrder_files/myOrder.js"></script>
<script src="./myOrder_files/Calendar.js"></script><div id="__calendarPanel" style="position:absolute;visibility:hidden;z-index:9999;background-color:#FFFFFF;border:1px solid #666666;width:200px;height:216px;">
<iframe name="__calendarIframe" id="__calendarIframe" width="100%" height="100%" scrolling="no" frameborder="0" style="margin:0px;" src="./myOrder_files/saved_resource.html"></iframe>
</div>
<script type="text/javascript">
$(function() {
	showOrder(10);
})
function showOrder(i) {
	if(i==10) {
		$("#all").attr("class","fl hover");
		$("#waitmoney").attr("class","fl");
		$("#waitgoods").attr("class","fl");
		$("#waitrecive").attr("class","fl");
		$("#waitreview").attr("class","fl");
		$("#over").attr("class","fl");
		showAllOrder(i);
	} else if(i==0) {
		$("#all").attr("class","fl");
		$("#waitmoney").attr("class","fl hover");
		$("#waitgoods").attr("class","fl");
		$("#waitrecive").attr("class","fl");
		$("#waitreview").attr("class","fl");
		$("#over").attr("class","fl");
		showAllOrder(i);
	}else if(i==1) {
		$("#all").attr("class","fl");
		$("#waitmoney").attr("class","fl");
		$("#waitgoods").attr("class","fl hover");
		$("#waitrecive").attr("class","fl");
		$("#waitreview").attr("class","fl");
		$("#over").attr("class","fl");
		showAllOrder(i);
	}else if(i==2) {
		$("#all").attr("class","fl");
		$("#waitmoney").attr("class","fl");
		$("#waitgoods").attr("class","fl");
		$("#waitrecive").attr("class","fl hover");
		$("#waitreview").attr("class","fl");
		$("#over").attr("class","fl");
		showAllOrder(i);
	}else if(i==3) {
		$("#all").attr("class","fl");
		$("#waitmoney").attr("class","fl");
		$("#waitgoods").attr("class","fl");
		$("#waitrecive").attr("class","fl");
		$("#waitreview").attr("class","fl hover");
		$("#over").attr("class","fl");
		showAllOrder(i);
	}else if(i==4) {
		$("#all").attr("class","fl");
		$("#waitmoney").attr("class","fl");
		$("#waitgoods").attr("class","fl");
		$("#waitrecive").attr("class","fl");
		$("#waitreview").attr("class","fl");
		$("#over").attr("class","fl hover");
		showAllOrder(i);
	}
}
function showAllOrder(type) {
	$.getJSON("http://localhost:8762/service-user/showOrder.action",{"type":type},function(data) {
		if(data.code==1) {
			var str = "";
			if(data.rows.length>0) {
				for(var i=0;i<data.rows.length;i++) {
					var obj = data.rows[i];
					//alert(obj.order_time)
					str += "<div class='myderCentent' id='del27'><div class='ctitle clearfix'><label class='fl'><input type='checkbox'>";
					str += "<span>"+obj.order_time+"</span></label><span class='fl sPent'><em>订单号：</em><em>"+obj.order_id+"</em></span>";
					str += "<div  class='fr clearfix conFr'><div class='four fl'><span>总价格:￥"+obj.order_totalmoney+"</span>";
					str += "</span></div><div class='five fl'><span>等待买家付款</span><a href='orderdetail.jsp?orderdetail_id="+obj.order_id+"' class='hover'>订单详情</a></div>";
					if(obj.order_status==0) {
						str += "<div class='five fl details'><a  href='javascript:;' class='hover' onclick='cancelOrder("+obj.order_id+")'>取消订单</a>";
						str += "<a href='pay.jsp?id="+obj.order_id+"&money="+obj.order_totalmoney+"' class='payment'>立即支付</a></div>";
					} else if(obj.order_status==1) {
						str += "<div class='five fl details'><a href='javascript:;' class='convertible'>已支付,待发货</a>'</div>";
					} else if(obj.order_status==2) {
						str += "<div class='five fl details'><a href='javascript:;' class='hover' onclick='cancelOrder("+obj.order_id+")'>查看物流</a>";
						str += "<a href='javascript:receive("+obj.order_id+");' class='confirm receipt'>待收货</a></div>";
					} else if(obj.order_status==3) {
						str += "<div class='five fl details'><a href='http://localhost:8762/service-user/userCenter/user/review.jsp' class='convertible'>待评价</a>'</div>"
					}else if(obj.order_status==4) {
						str += "<div class='five fl details'><a href='javascript:;' class='payment' onclick='delOrder("+obj.order_id+")'>删除订单</a></div>";
					}
					for(var j=0;j<obj.orderDetail.length;j++) {
						var detail = obj.orderDetail[j];
						str += " </div></div><div class='con clearfix'><div class='fl clearfix conFl'><div class='conLoop clearfix'>";
						str += "<div class='one clearfix fl'><div class='imgsPt fl'><img src='http://localhost:8762/service-admin/imgGoods/"+detail.goodsDetail.images[0].image_path+"'>";
						str += "</div><div class='conRight fl'><a href=''>"+detail.goodsDetail.goods.goods_name+"</a>";
						str += "<p>商品编号："+detail.orderdetail_id+"</p></div></div><div class='two fl'>￥"+detail.goods_buyprice+"</div><div class='three fl'>"+detail.goods_count+"</div><div class='four fl'>";
						str += "</div><div class='status fl'><a href='' class='tui'>再次购买</a> </div></div>";
					} 
				}
				$("#showAll").html(str);
			} else {
				$("#showAll").html("<div style='width:100%;margin-left:40%;font-size:30px;color:red;'>亲!暂时没有数据!</div>");
			}
			
		}
	})
}
function cancelOrder(id) {
	$.getJSON("http://localhost:8762/service-user/changeOrder.action",{"status":"取消","order_id":id},function(data) {
		if(data.code==1) {
			alert("订单已取消");
			showOrder(10);
		}
	})
}
function delOrder(id) {
	$.getJSON("http://localhost:8762/service-user/changeOrder.action",{"status":"删除","order_id":id},function(data) {
		if(data.code==1) {
			alert("订单已删除");
			showOrder(10);
		}
	})
}
function receive(id) {
	parent.layer.confirm('真的要确认收货吗？', {
		btn : [ '确认', '取消' ],
		shade : 0.5
	}, function() {
		$.getJSON("http://localhost:8762/service-user/changeOrder.action",{"status":"收货","order_id":id},function(data) {
			if(data.code==1) {
				showOrder(2);
			}
		})
	});
}
</script>
<script>	
 //下拉
 $('.ui-alert-main .input-main .input-main input').on('focus',function(){
 	$(this).parents('.ui-alert-main').find('.drop-down').addClass('block');
 });
  $('.ui-alert-main .input-main .input-main input').on('blur',function(){
  	var _this = $(this)
 	setTimeout(function(){
 		_this.parents('.ui-alert-main').find('.drop-down').removeClass('block');
 	},200);
 });
  $('.ui-alert-main .drop-down label').on('click',function(){
  	$(this).parents('.ui-alert-main').find('.input-main input').val($(this).find('span').html())
  });
</script>


<%@ include file="../bottom.jsp"%>