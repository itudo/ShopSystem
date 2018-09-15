<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header1.jsp" %>
<link rel="stylesheet" href="./orderdetail_files/base.css">
<link rel="stylesheet" href="./orderdetail_files/style.css">
<link rel="stylesheet" href="./orderdetail_files/payment.css">
<link rel="stylesheet" href="./orderdetail_files/page.css">
<script src="./orderdetail_files/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	var href = window.location.href.substring(window.location.href.indexOf("=")+1,window.location.href.length);
	$.getJSON("http://localhost:8762/service-user/orderDetail.action",{goodsdetail_id:href},function(data) {
		if(data.code==1) {
			var detail = data.obj;
			str = "<li>收货人："+detail.orders.to_userName+"</li>";
			str += "<li>收货电话："+detail.orders.to_tel+"</li>";
			str += "<li>收货地址："+detail.orders.to_addr+"</li>";
			str += "<li>订单编号："+detail.orders.order_id+"</li><li>成交时间："+detail.orders.order_time+"</li>";
			$("#detail").html(str);
			var s = "";
			if(detail.orders.order_status==0) {
				s += "<h2 id='orderstatus'>订单状态:未支付! </h2><h3>您可以</h3><div class='max'>";
				s += "<a href='pay.jsp?id="+detail.orders.order_id+"&money="+detail.orders.order_totalmoney+"'><input type='button' value='立即支付'></a></div>";
			} else {
				s += "<h2 id='orderstatus'>订单状态:已支付! </h2>";
			}
			$("#caozuo").html(s);
		}
	});
});
</script>
<style type="text/css">.easemobim-mobile-html{position:relative!important;width:100%!important;height:100%!important;padding:0!important;margin:0!important}.easemobim-mobile-body{position:absolute;top:0!important;left:0!important;width:100%!important;height:100%!important;overflow:hidden!important;padding:0!important;margin:0!important}.easemobim-mobile-body>*{display:none!important}.easemobim-mobile-body>.easemobim-chat-panel{display:block!important}.easemobim-chat-panel{z-index:1000;overflow:hidden;position:fixed;border:none;width:0;height:0;-webkit-transition:all .01s;-moz-transition:all .01s;transition:all .01s;box-shadow:0 4px 8px rgba(0,0,0,.2);border-radius:4px}.easemobim-chat-panel.easemobim-minimized{border:none;box-shadow:none;height:37px!important;width:104px!important}.easemobim-chat-panel.easemobim-minimized.easemobim-has-prompt{width:360px!important;height:270px!important}.easemobim-chat-panel.easemobim-mobile{position:absolute!important;width:100%!important;height:100%!important;left:0!important;top:0!important;border-radius:0;box-shadow:none}.easemobim-chat-panel.easemobim-mobile.easemobim-minimized{height:0!important;width:0!important}.easemobim-chat-panel.easemobim-hide{visibility:hidden;width:1px!important;height:1px!important;border:none}.easemobim-chat-panel.easemobim-dragging{display:none}.easemobim-iframe-shadow{left:auto;top:auto;display:none;cursor:move;z-index:16777270;position:fixed;border:none;box-shadow:0 4px 8px rgba(0,0,0,.2);border-radius:4px;background-size:100% 100%;background-repeat:no-repeat}.easemobim-iframe-shadow.easemobim-dragging{display:block}.easemobim-prompt-wrapper{display:none;z-index:16777271;position:fixed;width:30px;height:30px;padding:10px;top:0;bottom:0;margin:auto;left:0;right:0;color:#fff;background-color:#000;text-align:center;border-radius:4px;-webkit-transition:all .5s;-moz-transition:all .5s;transition:all .5s;opacity:.7;-moz-box-sizing:content-box;box-sizing:content-box}.easemobim-prompt-wrapper>.loading{position:relative;width:30px;height:30px;display:inline-block;overflow:hidden;margin:0;padding:0;-webkit-animation:easemobim-loading-frame 1s linear infinite;-moz-animation:easemobim-loading-frame 1s linear infinite;animation:easemobim-loading-frame 1s linear infinite}@-webkit-keyframes easemobim-loading-frame{0%{-webkit-transform:rotate(0);transform:rotate(0)}to{-webkit-transform:rotate(1turn);transform:rotate(1turn)}}@-moz-keyframes easemobim-loading-frame{0%{-moz-transform:rotate(0);transform:rotate(0)}to{-moz-transform:rotate(1turn);transform:rotate(1turn)}}@keyframes easemobim-loading-frame{0%{-webkit-transform:rotate(0);-moz-transform:rotate(0);transform:rotate(0)}to{-webkit-transform:rotate(1turn);-moz-transform:rotate(1turn);transform:rotate(1turn)}}.easemobim-pc-img-view{display:none;position:fixed;top:0;left:0;width:100%;height:100%;z-index:16777270}.easemobim-pc-img-view>.shadow{position:fixed;top:0;left:0;width:100%;height:100%;background-color:#000}.easemobim-pc-img-view>img{max-width:100%;max-height:100%;position:absolute;margin:auto;top:0;right:0;bottom:0;left:0}</style><style type="text/css">.easemobim-mobile-html{position:relative!important;width:100%!important;height:100%!important;padding:0!important;margin:0!important}.easemobim-mobile-body{position:absolute;top:0!important;left:0!important;width:100%!important;height:100%!important;overflow:hidden!important;padding:0!important;margin:0!important}.easemobim-mobile-body>*{display:none!important}.easemobim-mobile-body>.easemobim-chat-panel{display:block!important}.easemobim-chat-panel{z-index:1000;overflow:hidden;position:fixed;border:none;width:0;height:0;-webkit-transition:all .01s;-moz-transition:all .01s;transition:all .01s;box-shadow:0 4px 8px rgba(0,0,0,.2);border-radius:4px}.easemobim-chat-panel.easemobim-minimized{border:none;box-shadow:none;height:37px!important;width:104px!important}.easemobim-chat-panel.easemobim-minimized.easemobim-has-prompt{width:360px!important;height:270px!important}.easemobim-chat-panel.easemobim-mobile{position:absolute!important;width:100%!important;height:100%!important;left:0!important;top:0!important;border-radius:0;box-shadow:none}.easemobim-chat-panel.easemobim-mobile.easemobim-minimized{height:0!important;width:0!important}.easemobim-chat-panel.easemobim-hide{visibility:hidden;width:1px!important;height:1px!important;border:none}.easemobim-chat-panel.easemobim-dragging{display:none}.easemobim-iframe-shadow{left:auto;top:auto;display:none;cursor:move;z-index:16777270;position:fixed;border:none;box-shadow:0 4px 8px rgba(0,0,0,.2);border-radius:4px;background-size:100% 100%;background-repeat:no-repeat}.easemobim-iframe-shadow.easemobim-dragging{display:block}.easemobim-prompt-wrapper{display:none;z-index:16777271;position:fixed;width:30px;height:30px;padding:10px;top:0;bottom:0;margin:auto;left:0;right:0;color:#fff;background-color:#000;text-align:center;border-radius:4px;-webkit-transition:all .5s;-moz-transition:all .5s;transition:all .5s;opacity:.7;-moz-box-sizing:content-box;box-sizing:content-box}.easemobim-prompt-wrapper>.loading{position:relative;width:30px;height:30px;display:inline-block;overflow:hidden;margin:0;padding:0;-webkit-animation:easemobim-loading-frame 1s linear infinite;-moz-animation:easemobim-loading-frame 1s linear infinite;animation:easemobim-loading-frame 1s linear infinite}@-webkit-keyframes easemobim-loading-frame{0%{-webkit-transform:rotate(0);transform:rotate(0)}to{-webkit-transform:rotate(1turn);transform:rotate(1turn)}}@-moz-keyframes easemobim-loading-frame{0%{-moz-transform:rotate(0);transform:rotate(0)}to{-moz-transform:rotate(1turn);transform:rotate(1turn)}}@keyframes easemobim-loading-frame{0%{-webkit-transform:rotate(0);-moz-transform:rotate(0);transform:rotate(0)}to{-webkit-transform:rotate(1turn);-moz-transform:rotate(1turn);transform:rotate(1turn)}}.easemobim-pc-img-view{display:none;position:fixed;top:0;left:0;width:100%;height:100%;z-index:16777270}.easemobim-pc-img-view>.shadow{position:fixed;top:0;left:0;width:100%;height:100%;background-color:#000}.easemobim-pc-img-view>img{max-width:100%;max-height:100%;position:absolute;margin:auto;top:0;right:0;bottom:0;left:0}</style><link rel="stylesheet" href="./orderdetail_files/layer.css" id="layui_layer_skinlayercss"></head>
<body>
<div class="regod-section clearfix">

<div class="thisPosition w">
<span>您的位置：</span><b>首页</b> &gt; <b>我的商城</b> &gt; <b>我的订单</b> &gt; <b>申请售后</b>
</div>

<div class="tradingStatus w clearfix">
<div class="minFl fl">
<h2>订单信息</h2>
<ul id="detail">

</ul>
</div>
<div id="caozuo" class="minFr fr">

</div>
<script>
					window.easemobim = window.easemobim || {};
					var trueName = 'derek';
					easemobim.config = {
						//访客信息，以下参数支持变量
						visitor: {
							trueName:trueName,
							qq: '',
							phone:trueName,
							companyName: '',
							userNickname:trueName,
							description: '',
							email: ''
						},
					};
				</script>
<script src="./orderdetail_files/easemob.js"></script>

</div>


<ul class="home-tab">
<li>
<em></em>
<span>3</span>
<div class="userTips">
<%@ include file="../tip.jsp" %>
</div>
</div><div class="easemobim-prompt-wrapper"><div class="loading"><div class="em-widget-loading"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 70 70"><circle opacity=".3" fill="none" stroke="#000" stroke-width="4" stroke-miterlimit="10" cx="35" cy="35" r="11"></circle><path fill="none" stroke="#E5E5E5" stroke-width="4" stroke-linecap="round" stroke-miterlimit="10" d="M24 35c0-6.1 4.9-11 11-11 2.8 0 5.3 1 7.3 2.8"></path></svg></div></div></div><div class="easemobim-prompt-wrapper"><div class="loading"><div class="em-widget-loading"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 70 70"><circle opacity=".3" fill="none" stroke="#000" stroke-width="4" stroke-miterlimit="10" cx="35" cy="35" r="11"></circle><path fill="none" stroke="#E5E5E5" stroke-width="4" stroke-linecap="round" stroke-miterlimit="10" d="M24 35c0-6.1 4.9-11 11-11 2.8 0 5.3 1 7.3 2.8"></path></svg></div></div></div>

<script>
	//导航隐藏层弹出
	$('.public-header1 .center-parent .nav li').on('mouseenter',function(){
		$('.public-header1 .center-parent .nav li').eq($(this).index()).addClass('active');
	}).on('mouseleave',function(){
		$('.public-header1 .center-parent .nav li').removeClass('active');
	});
    
	$('.memo').on('click',function(){
		layer.msg('亲!暂时还没开通这项功能!',{icon: 2,time: 2000},function(){
        	window.location.reload();
        });
    })
    
</script>
<%@ include file="../bottom.jsp"%>