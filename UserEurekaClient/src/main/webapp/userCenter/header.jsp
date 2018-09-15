<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单中心</title>
</head>
<body>
<link rel="stylesheet" href="order_files/base.css">
<link rel="stylesheet" href="order_files/style.css">
<link rel="stylesheet" href="order_files/payment.css">
<link rel="stylesheet" href="order_files/page.css">
<script src="order_files/jquery.min.js"></script>
<link rel="stylesheet" href="order_files/layer.css" id="layui_layer_skinlayercss"></head>
<link rel="stylesheet" href="../index_files/base.css">
<link rel="stylesheet" href="../index_files/style.css">
<script src="../index_files/jquery.min.js"></script>
<script src="../index_files/layer.js"></script><link rel="stylesheet" href="../index_files/layer.css" id="layui_layer_skinlayercss">
<div class="top1">
<div class="header-2016">
<div class="w clearfix">

<ul class="fl" id="areaList">
</ul>

<ul class="fr clearfix nav-right">
<li class="fl clearfix">
<div id="loginUser">

</div>
</li>
<li class="fl">
|<a href="myOrder.jsp">我的订单</a>|
</li>
<li class="fl customerService">
<a href="myOrder.jsp">个人中心<i></i></a>
<div>
<p><a href="userInfo.jsp">我的信息</a></p>
<p><a href="myOrder.jsp">我的订单</a></p>
<p><a href="http://demo.shopsn.net/index.php/Home/Assets/coupon.html">我的优惠券</a></p>
<p><a href="collect.jsp">我的收藏</a></p>
<p><a href="points.jsp">我的积分</a></p>
</div>
</li>
<li class="fl clearfix mobile">
<span class="fl">|</span>
<div class="mobile-phone fl">
<b></b>
<s></s>
</div>
<a href="javascript:;" class="fl">APP下载</a>
</li>
<li class="fl telephone"><em></em>400-800-900</li>
</ul>
</div>
</div>
</div>
<script type="text/javascript">
$(function() {
	$.getJSON("http://localhost:8762/service-user/loginUser.action",function(data) {
		if(data.code==1) {
			$("#loginUser").append("<span class='fl'><span style='color:red;'>"+data.obj.user_name+"</span>&nbsp;欢迎来到淘宝贝！</span><a href='javascript:logout()' class='fl active'>【退出】</a>")
		} else {
			$("#loginUser").append("<a href='userCenter/login.jsp' class='fl active'>【登录】</a><a href='userCenter/reg.jsp' class='fl active'>【注册】</a></span>")
		}
	});
})
function logout() {
	$.getJSON("http://localhost:8762/service-user/logout.action",function(data) {
		if(data.code==1) {
			$("#loginUser").html("");
			$("#loginUser").append("<a href='userCenter/login.jsp' class='fl active'>【登录】</a><a href='userCenter/reg.jsp' class='fl active'>【注册】</a></span>")
		}
	})
}	
</script>
