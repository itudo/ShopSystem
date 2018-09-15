<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ include file="../header1.jsp" %>
<link rel="stylesheet" href="./cart_files/base.css">
<link rel="stylesheet" href="./cart_files/style.css">
<script src="./cart_files/saved_resource"></script><script src="./cart_files/shoppingCart.js"></script><script src="./cart_files/jquery.min.js"></script>
<script src="./cart_files/layer.js"></script><link rel="stylesheet" href="./cart_files/layer.css" id="layui_layer_skinlayercss">
<script>
function searcher(){
    var _url ="/index.php/Home/Goods/searchOne.html";
    var _data=$('#pp').val();
    $.post(_url,{title:_data},function(data){
        if(data.status==0){
            layer.msg(data.message);
        }
        if(data.status==1){
            $("input[name='id']").val(data.data);
        }
    })
}

$('#pp').keyup(function(){
    var _url ="/index.php/Home/Goods/search.html";
    var _data=$(this).val();
    $.post(_url,{title:_data},function(data){
        if(data.status==0){
            /*  layer.msg(data.message);*/
        }
        if(data.status==1){
            var _a=data.data;
            var _b="/index.php/Home/Goods/goodsDetails.html"
            var _html='';
            for (var i in _a){
                _html +='<div><a href="'+_b+'?id='+_a[i].id+'"> '+_a[i].title+'</a></div>';
            }
        }
        $('.gg').html(_html);
        if(data.status==2){
            $('.gg').html('');
        }
    })
});
</script>
<link rel="stylesheet" href="./cart_files/goods.css">
<div class="cart w">
<div class="cart-filter-bar clearfix">
<div class="fl">
<ul class="switch-cart clearfix">
<li class="fl active"><a href="javascript:#">我的购物车</a></li>
</ul>
</div>

<div class="cart-store fr">
<span>已选商品（不含运费） <b>￥0.00</b></span>
<input type="button" value="结算" onclick="comfirm_now()">
</div>
</div>
<div class="cart-main">
<div class="cart-thead clearfix">
<label class="fl t-checkbox"><input type="checkbox"> 全选</label>
<span class="fl t-goods">商品信息</span>
<span class="fl t-good">颜色</span>
<span class="fl t-price">单价</span>
<span class="fl t-quantity">数量</span>
<span class="fl t-sum">金额</span>
<span class="fl">操作</span>
</div>
<dl class="cart-list" style="display: block;">

		<c:forEach items="${cartList }" var="cartDetail">
			<dd class="clearfix" data-id="${cartDetail.cartdetail_id}" data-goods-id="3405"
				data-url="http://localhost:8762/service-user/updateCartDetailCount.action">
				<div class="cart-checkbox fl">
					<input type="checkbox">
				</div>
				<div class="p-goods fl clearfix">
					<div class="p-img fl">
						<a href="javascript:;"><img
							src="http://localhost:8762/service-admin/imgGoods/${cartDetail.goodsDetail.images[0].image_path }"></a>
					</div>
					<div class="p-name fl">
						<a
							href="http://demo.shopsn.net/index.php/Home/goods/goodsDetails/id/3405.html">
							${cartDetail.goodsDetail.goods.goods_name }</a>
					</div>
				</div>
				<div class="p-good fl">${cartDetail.goodsDetail.goods.goods_desc }</div>
				<div class="p-price fl">
					<!-- <i>￥0.01</i><br> --> <b>￥${cartDetail.goodsDetail.goodsdetail_price}</b>
				</div>
				<div class="p-quantity fl clearfix">
					<a href="javascript:;" class="fl decrement  ">-</a> <input
						type="text" class="fl" value="${cartDetail.goodsDetail.goods_count}"
						onblur="update_input_number('http://localhost:8762/service-user/updateCartDetailCount.action',${cartDetail.cartdetail_id}, this,1)">
					<a href="javascript:;" class="fl increment">+</a>
				</div>
				<div class="p-sum fl">
					￥<em>${cartDetail.goods_money}</em>
				</div>
				<div class="p-ops fl">
					<a
						href=""
						class="cart-follow">移入收藏夹</a> <a id="delCart"
						href="javascript:;" value="${cartDetail.cartdetail_id}"
						class="cart-remove">删除</a>
				</div>
			</dd>
			</c:forEach>
		</dl>

<script type="text/javascript">
</script>
<div class="ui-ceilinglamp active">
<div class="toolbar-wrap w">
<div class="fl toolbar-left">
<label><input type="checkbox"> 全选</label>
<a href="http://demo.shopsn.net/index.php/Home/cart/cart_del.html" onclick="return delete_many(this);" class="remove-batch">删除</a>
<a href="http://demo.shopsn.net/index.php/Home/cart/move_coll.html" onclick="return move_many(this)" class="follow-batch">移入收藏夹</a>
</div>
<div class="fr toolbar-right">
<span class="fl">已选商品 <em class="active">0</em> 件合计</span>
<span class="fl active">（不含运费）：<em>￥</em><b>0.00</b></span>
<input type="button" value="结算" class="fl" onclick="comfirm_now()">
</div>
</div>
</div>

</div>
</div>

<div class="ui-dia-parent-t">
<div class="ui-mask"></div>
<div class="ui-dia">
<div class="ui-dialog-title clearfix">
<span class="fl"></span>
<a href="javascript:;" class="fr"></a>
</div>
<div class="ui-dialog-content">
<div class="item-fore">
<h3></h3>
<p></p>
</div>
<div class="op-btns">
<a href="javascript:;" class="btn-2"></a>
<a href="javascript:;" class="btn-1"></a>
</div>
</div>
</div>
</div>
<script src="./cart_files/shoppingCart(1).js"></script>
<script src="./cart_files/cart.js"></script>
<script type="text/javascript">
var BUILD = "/index.php/Home/Settlement/cartSettlement.html";
var delete_many_url = "/index.php/Home/Cart/goods.html";
</script>

<ul class="home-tab">
<li>
<em></em>
<span>0 </span>
<div class="userTips">
<%@ include file="../tip.jsp" %>
</div>

<%@ include file="../bottom.jsp"%>