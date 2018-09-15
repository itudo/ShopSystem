<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="success_files/toastr.min.css" />
<script type="text/javascript" src="success_files/toastr.min.js"></script>
<script type="text/javascript">
$(function() {
	var href=window.location.href;
	var params = href.substring(href.indexOf("?")+1,href.length);
	var id = (params.split("&")[0]).substring((params.split("&")[0]).indexOf("=")+1,(params.split("&")[0].length));
	var price = (params.split("&")[1]).substring((params.split("&")[1]).indexOf("=")+1,(params.split("&")[1].length));
	var count = (params.split("&")[2]).substring((params.split("&")[2]).indexOf("=")+1,(params.split("&")[2].length));
	$.getJSON("http://localhost:8762/service-user/getOrderDetail.action",{goodsdetail_id:id},function(data) {
		if(data.code==1) {
			var address = data.rows;
			var str="";
			for(var i=0;i<address.length;i++) {
				str+="<div data-id='"+address[i].address_id+"' class='consignee-item clearfix '><div class='fl myAddress place' data-id='"+address[i].address_id+"' onclick='InterAddress.choseAddress(this)'>";
				str+="<span>"+address[i].address_user+"</span><em></em></div> <span class='fl' id='toaddr'>"+address[i].address_name+"</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class='fl' id='totel'>"+address[i].address_tel+"</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class='fl'>"+address[i].address_code+"</span>";
				str+="</div><b></b></div>";
			}
			$("#receive").html(str);
			var order = data.obj;
			var s = "<div class='con-parent clearfix fl'><a href='javascript:;' class='fl position-parent'> <img src='http://localhost:8762/service-user/imgGoods/"+order.images[0].image_path+"'>";
			s += "</a><div class='fl ition'><a href='javascript:;'>"+order.goods.goods_name+"</a></div></div><div class='fl atte'>"+order.attr_name+"</div>";
			s += "<div class='fl price'>"+price+"</div><div class='fl number'>"+count+"</div><div class='fl sual' id='sslh'>"+price*count+"</div>";
			$("#orderdetail").html(s);
			$("#count").html(count);
			$("#price").html(price*count);
			$("#total").html(price*count);
			
			$("#order_totalmoney").val(price*count);
			$("#goods_count").val(count);
			$("#goods_money").val(price*count)
			$("#goodsdetail_id").val(id);
		}
	})
});
</script>
<div class="home-section">

<div class="home-header">
<div class="home-header-main clearfix">

<a href="http://demo.shopsn.net/index.php/Home/Index/index.html" class="logo fl">
<img src="http://localhost:8762/service-user/index_files/5b35ac047dc6f.jpg" alt="">
</a>
<h5 class="fl title">结算页</h5>

<div class="home-search-parent fr">
<div class="home-search clearfix">
<input type="text" class="fl input" id="pp">
<input type="hidden" name="id" class="fl input" value="">
<input type="submit" class="fl btn" id="search" onmouseover="searcher()" value="搜 索">
<div class="gg"></div>
</div>
<dl class="home-hotsearch clearfix">
<dt class="fl">热门搜索：</dt>
<dd class="fl">
<a href="javascript:;">冰箱</a>
</dd><dd class="fl">
<a href="javascript:;">单反</a>
</dd><dd class="fl">
<a href="javascript:;">电饭煲</a>
</dd><dd class="fl">
<a href="javascript:;">空调</a>
</dd><dd class="fl">
<a href="javascript:;">手机</a>
</dd><dd class="fl">
<a href="javascript:;">笔记本</a>
</dd><dd class="fl">
<a href="javascript:;">电视机</a>
</dd> </dl>
</div>
</div>
</div>
</div>

<link rel="stylesheet" type="text/css" href="./success_files/buynow.css">
<script src="./success_files/jquery-1.7.2.min.js"></script>

<div class="conrm-section w">
<div class="thisPon">
<div class="ponState clearfix">
<span class="fl one">1</span> <span class="fl two">2</span> <span class="fl three active">3</span>
</div>
<div class="ponTitle clearfix">
<i class="fl l">我的购物车</i> <i class="fl c">确认订单信息</i> <i class="fl r active">成功提交订单</i>
</div>
</div>

<div class="orInfio">
<h2 class="t">填写并核对订单信息</h2>
<ul class="detailed">
<li class="receipt">
<div class="clearfix receiptCh">
<h6 class="fl">收货人信息</h6>
<a href="javascript:;" class="fr sd">新增加收货地址</a>
</div>
<div id="receive" class="receive">

</div>
</li>
<li class="confirm">
<div class="clearfix titPart">
<h4 class="fl">确认订单信息</h4>
<a href="http://demo.shopsn.net/index.php/Home/Cart/goods.html" class="fr">返回修改购物车</a>
</div>
<div class="payment clearfix">
<div class="subject clearfix">
<span class="fl ition">商品信息</span> <span class="fl atte">商品属性</span> <span class="fl price">单价</span> <span class="fl number">数量</span> <span class="fl sual"></span> <span class="fl sual">小计</span>
</div>
<div id="orderdetail" class="paymentCon clearfix">

</div>

<div class="paymentCon clearfix gift-pid-3596" style="display: none; margin-left: 10%">
<div class="con-parent clearfix fl">
<div class="fl ition">
<a href="javascript:;"></a>
</div>
</div>
</div>

<div class="rderNote clearfix">
<span class="fl">添加订单备注：</span> <input type="text" class="fl" name="remarks" placeholder="提示：请勿填写有关支付、收货、发票方面的信息">
<em class="fl"> 提示：请勿填写有关支付、收货、发票方面的信息</em>
</div>
</div>
</li>



</ul>
<div class="atmoney">
<p>
<b id="count"></b>件商品，总商品金额：￥<em id="price"></em>
</p>
<p>
优惠券：<em id="whatCoupon">0.0</em>
</p>
<p id="shipping"><em>运费：￥0</em></p>
</div>
<div class="total">
<p class="one">
<span>应付总额：</span>￥ <b id="total" style="color: red;font-size: large">100</b>
</p>
<p class="two"></p>
</div>
<div class="randbtn clearfix">
<form id="formId" method="post" action="">
<input type="hidden" id="to_userName" name="to_userName" value="">
<input type="hidden" id="to_addr" name="to_addr" value="">
<input type="hidden" id="to_tel" name="to_tel" value="">
<input type="hidden" name="order_totalmoney" id="order_totalmoney" value="">
<input type="hidden" name="goods_count" id="goods_count" value="">
<input type="hidden" id="goods_money" name="goods_money" value="">
<input type="hidden" id="goodsdetail_id" name="goodsDetail.goodsdetail_id" value="">
<!-- <input type="hidden" id="priceMonery" name="price_sum" value="100">
<input type="hidden" id="express" name="freight_id" value="1"> -->
<input type="hidden" id="check" name="check" value="891440">
<input type="button" onclick="InterAddress.submitOrder()" value="提交订单" class="fr"> <a href="" class="fr">返回购物车</a>
<span id="font-botton">库存以实际支付时间为准，手慢无</span>
</div>
</div>
</div>
</form>
<script type="text/javascript" src="./success_files/alert.js"></script> <script type="text/javascript" src="./success_files/jquery-form.js"></script> <script type="text/javascript" src="./success_files/jquery.validate.min.js"></script>
<script type="text/javascript" src="./success_files/validateCustom.js"></script>
<script type="text/javascript" src="./success_files/Settlement.js"></script>
<script type="text/javascript" src="./success_files/confirm.js"></script>
<script type="text/javascript" src="./success_files/address.js"></script>
<script type="text/javascript">
        var PAY_ID = 4;
        var AREA_LIST = "/index.php/Home/Settlement/getAreaList.html";
        var SHIPPING  = "/index.php/Home/Settlement/shipping.html";
        var COUPON	  = "/index.php/Home/Settlement/coupon.html";
        var INVOICE	  = "/index.php/Home/Settlement/invoice.html";
        var BALANCE   = "/index.php/Home/Settlement/getBalaceMoney.html";
        var GOODS_NUM = "1";
        var RECEIVE   = "/index.php/Home/Settlement/getAreaListByUserId.html";
        var allBox = $(":checkbox");
        var gift_url  = "/index.php/Home/Settlement/getGiftInfo.html";
        var grtUrl = "/index.php/Home/Settlement/getaddresstype.html";
        var CHECK = "/index.php/Home/Settlement/check.html";
        allBox.click(function () {
            allBox.removeAttr("checked");
            $(this).attr("checked", "checked");
        });
	</script>
<script type="text/javascript" src="./success_files/pay_type.js"></script>

<div class="ui-dialog" id="however">
<div class="ui-dialog-child"></div>
<div class="consignee">
<div class="ui-dialog-title clearfix">
<span class="fl">新增收货人信息</span> <a href="javascript:;" class="fr"></a>
</div>
<div class="inPtn">
<form id="formAddressId" method="post">
<p class="clearfix">
<span class="fl"><i>*</i> 收货人：</span> <input type="text" msg="请输入中文" name="realname" validaterule="1" class="fl itxt req">
</p>
<p class="clearfix">
<span class="fl"><i>*</i> 所在地区：</span> <select isnumber="1" name="prov" class="fl req" id="parent" onclick="InterAddress.getAreaListClear($(this), &#39;/index.php/Home/Settlement/getAreaList.html&#39;, $(&#39;#city&#39;));"><option value="0">请选择</option><option =="" value="1">B 北京市</option><option =="" value="3">H 河北省</option><option =="" value="4">S 山西省</option><option =="" value="5">N 内蒙古</option><option =="" value="6">L 辽宁省</option><option =="" value="7">J 吉林省</option><option =="" value="8">H 黑龙江省</option><option =="" value="9">S 上海市</option><option =="" value="10">J 江苏省</option><option =="" value="11">Z 浙江省</option><option =="" value="12">A 安徽省</option><option =="" value="13">F 福建省</option><option =="" value="14">J 江西省</option><option =="" value="15">S 山东省</option><option =="" value="16">H 河南省</option><option =="" value="17">H 湖北省</option><option =="" value="18">H 湖南省</option><option =="" value="19">G 广东省</option><option =="" value="91139">G 广西壮族自治区</option><option =="" value="21">H 海南省</option><option =="" value="22">Z 重庆市</option><option =="" value="23">S 四川省</option><option =="" value="24">G 贵州省</option><option =="" value="25">Y 云南省</option><option =="" value="26">X 西藏</option><option =="" value="27">S 陕西省</option><option =="" value="28">G 甘肃省</option><option =="" value="29">Q 青海省</option><option =="" value="30">N 宁夏</option><option =="" value="31">X 新疆</option><option =="" value="32">T 台湾省</option><option =="" value="33">X 香港</option><option =="" value="34">A 澳门</option><option =="" value="35">H 海外</option><option =="" value="36">Q 其他</option><option =="" value="2">T 天津市</option></select> <select name="city" class="fl req" id="city" isnumber="1" onclick="InterAddress.getAreaListClear($(this), &#39;/index.php/Home/Settlement/getAreaList.html&#39;, $(&#39;#dist&#39;));">
<option value="0">—请选择—</option>
</select> <select name="dist" class="fl req" isnumber="1" id="dist">
<option value="0">—请选择—</option>
</select>
</p>
<p class="clearfix">
<span class="fl"><i>*</i> 详细地址：</span> <input type="text" name="address" class="fl req" nsg="请输入详细地址">
</p>
<p class="clearfix">
<span class="fl"><i>*</i> 手机号码：</span> <input type="text" isnumber="1" name="mobile" validaterule="2" class="fl itxt req" msg="请输入电话号码"> <span class="fl deviation">固定电话：</span> <input type="text" isnumber="1" name="telphone" validaterule="3" class="fl itxt req">
</p>
<p class="clearfix">
<span class="fl">&nbsp;&nbsp; 邮箱：</span> <input type="text" validaterule="4" name="email" class="fl itxt req">
<em class="fl deviation ">用来接收订单提醒邮件，便于您及时了解订单状态</em>
</p>
<p class="clearfix">
<span class="fl">地址别名：</span> <input type="text" name="alias" class="fl itxt">
</p>
<input type="submit" onclick="InterAddress.addUserAddress(&#39;formAddressId&#39;, &#39;/index.php/Home/UserAddress/addReceiveAddress.html&#39;);" class="submit" value="保存收货人信息">
</form>
</div>
</div>
</div>
</div>
<div class="Invoice_background"></div>

<ul class="home-tab">
<li>
<em></em>
<span>0 </span>
<div class="userTips">
<%@ include file="../tip.jsp" %>
</div>

<%@ include file="../bottom.jsp"%>