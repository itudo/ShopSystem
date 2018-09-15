<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<link rel="stylesheet" href="./goodsDetail_files/base.css">
<link rel="stylesheet" href="./goodsDetail_files/style.css">
<script src="./goodsDetail_files/saved_resource"></script>
<script src="./goodsDetail_files/buttonLite.js"></script>
<script src="./goodsDetail_files/jquery.min.js"></script>
<script src="./goodsDetail_files/layer.js"></script>
<link rel="stylesheet" href="./goodsDetail_files/layer.css" id="layui_layer_skinlayercss">
<script src="./goodsDetail_files/bsStatic.js" type="text/javascript" charset="utf-8"></script><style type="text/css">
.easemobim-mobile-html {
	position: relative !important;
	width: 100% !important;
	height: 100% !important;
	padding: 0 !important;
	margin: 0 !important
}

.easemobim-mobile-body {
	position: absolute;
	top: 0 !important;
	left: 0 !important;
	width: 100% !important;
	height: 100% !important;
	overflow: hidden !important;
	padding: 0 !important;
	margin: 0 !important
}

.easemobim-mobile-body>* {
	display: none !important
}

.easemobim-mobile-body>.easemobim-chat-panel {
	display: block !important
}

.easemobim-chat-panel {
	z-index: 1000;
	overflow: hidden;
	position: fixed;
	border: none;
	width: 0;
	height: 0;
	-webkit-transition: all .01s;
	-moz-transition: all .01s;
	transition: all .01s;
	box-shadow: 0 4px 8px rgba(0, 0, 0, .2);
	border-radius: 4px
}

.easemobim-chat-panel.easemobim-minimized {
	border: none;
	box-shadow: none;
	height: 37px !important;
	width: 104px !important
}

.easemobim-chat-panel.easemobim-minimized.easemobim-has-prompt {
	width: 360px !important;
	height: 270px !important
}

.easemobim-chat-panel.easemobim-mobile {
	position: absolute !important;
	width: 100% !important;
	height: 100% !important;
	left: 0 !important;
	top: 0 !important;
	border-radius: 0;
	box-shadow: none
}

.easemobim-chat-panel.easemobim-mobile.easemobim-minimized {
	height: 0 !important;
	width: 0 !important
}

.easemobim-chat-panel.easemobim-hide {
	visibility: hidden;
	width: 1px !important;
	height: 1px !important;
	border: none
}

.easemobim-chat-panel.easemobim-dragging {
	display: none
}

.easemobim-iframe-shadow {
	left: auto;
	top: auto;
	display: none;
	cursor: move;
	z-index: 16777270;
	position: fixed;
	border: none;
	box-shadow: 0 4px 8px rgba(0, 0, 0, .2);
	border-radius: 4px;
	background-size: 100% 100%;
	background-repeat: no-repeat
}

.easemobim-iframe-shadow.easemobim-dragging {
	display: block
}

.easemobim-prompt-wrapper {
	display: none;
	z-index: 16777271;
	position: fixed;
	width: 30px;
	height: 30px;
	padding: 10px;
	top: 0;
	bottom: 0;
	margin: auto;
	left: 0;
	right: 0;
	color: #fff;
	background-color: #000;
	text-align: center;
	border-radius: 4px;
	-webkit-transition: all .5s;
	-moz-transition: all .5s;
	transition: all .5s;
	opacity: .7;
	-moz-box-sizing: content-box;
	box-sizing: content-box
}

.easemobim-prompt-wrapper>.loading {
	position: relative;
	width: 30px;
	height: 30px;
	display: inline-block;
	overflow: hidden;
	margin: 0;
	padding: 0;
	-webkit-animation: easemobim-loading-frame 1s linear infinite;
	-moz-animation: easemobim-loading-frame 1s linear infinite;
	animation: easemobim-loading-frame 1s linear infinite
}

@
-webkit-keyframes easemobim-loading-frame { 0%{
	-webkit-transform: rotate(0);
	transform: rotate(0)
}

to {
	-webkit-transform: rotate(1turn);
	transform: rotate(1turn)
}

}
@
-moz-keyframes easemobim-loading-frame { 0%{
	-moz-transform: rotate(0);
	transform: rotate(0)
}

to {
	-moz-transform: rotate(1turn);
	transform: rotate(1turn)
}

}
@
keyframes easemobim-loading-frame { 0%{
	-webkit-transform: rotate(0);
	-moz-transform: rotate(0);
	transform: rotate(0)
}

to {
	-webkit-transform: rotate(1turn);
	-moz-transform: rotate(1turn);
	transform: rotate(1turn)
}

}
.easemobim-pc-img-view {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 16777270
}

.easemobim-pc-img-view>.shadow {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: #000
}

.easemobim-pc-img-view>img {
	max-width: 100%;
	max-height: 100%;
	position: absolute;
	margin: auto;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0
}
</style>
<link rel="stylesheet" href="./goodsList_files/layer.css"
	id="layui_layer_skinlayercss">
</head>

<div class="homeNavBar">
	<div class="w clearfix" style="z-index: 2;">
		<dl class="fl level paperone">
			<%@ include file="../left.jsp"%>
		</dl>
		<ul class="fr clearfix navitems-2016">

			<li class="fl"><a
				href="http://localhost:8763/index.jsp">首页</a></li>
			<li class="fl"><a
				href="http://localhost:8763/index.jsp">最新促销</a>
			</li>
		</ul>
	</div>
</div>
<link rel="stylesheet" href="./goodsDetail_files/toastr.min.css">
<link rel="stylesheet" href="./goodsDetail_files/page.css">


<div class="paper-current-main w">
	当前位置：<span><a href="http://localhost:8763/index.jsp"
		class="godos_details_font">首页</a></span> &gt; <span><span><span><a
				class="godos_details_font" href="http://localhost:8763/index.jsp">家用电器</a></span></span>
		&gt; <span><a href="http://localhost:8763/goodsList.jsp"
			class="godos_details_font">电视</a></span></span> &gt;
			 <span><a href="#"class="godos_details_font">超薄电视</a></span> &gt; 
			  <span class="active">${goodsDetail[0].goods.goods_name}</span>
		
			
</div>


<div class="productDeta-main w clearfix">

	<div class="procDetailInner clearfix">
		<div class="procDeta-fl fl">
			<div class="preview">
				<div id="vertical" class="bigImg">
					<img width="400" height="400" alt="" id="midimg" data-original=""
						src="http://localhost:8762/service-admin/imgGoods//${goodsDetail[0].images[0].image_path}">
					<div style="left: 165px; top: 0px; display: none;" id="winSelector"></div>
				</div>
				<div class="smallImg">
					<div class="scrollbutton smallImgUp disabled"></div>
					<div id="imageMenu">
						<ul id="smallImg">
								<li id="onlickImg">
									<img src="http://localhost:8762/service-admin/imgGoods//${goodsDetail[0].images[0].image_path}" width="68" height="68">
								</li>
						</ul>
					</div>
					<div class="scrollbutton smallImgDown"></div>
				</div>
				<div id="bigView"
					style="width: 522.288px; height: 466.725px; display: none;">
					<img width="889" height="889"
						src="./goodsDetail_files/5b31eea998554.jpg"
						style="left: -366.712px; top: 0px;">
				</div>
			</div>
			<div class="clearfix product-inf">
                <a href=""
					data-id="3596" class="fr collection clearfix"
					onclick="return false;" id="collection_btn"> <i class="fl"></i>
					
				</a>
				<div class="bshare-custom fr" style="margin-top: 3px;">
					<a href="javascript:;" class="fr share clearfix"
						style="padding-left: 0px;"> <span class="fl">分享</span></a><a
						title="更多平台"
						class="bshare-more bshare-more-icon more-style-sharethis fl"></a>
					<script type="text/javascript" charset="utf-8"
						src="./goodsDetail_files/buttonLite(1).js"></script>
					<script type="text/javascript" charset="utf-8"
						src="./goodsDetail_files/bshareC0.js"></script>

				</div>
			</div>
		</div>
		<div class="procDeta-fr fl">
			<h5 class="pr-title">${goodsDetail[0].goods.goods_name}</h5>
			<div class="pr-price">
				<p class="pr-price-top">
					商品价格：<span>￥<i  id="price">${goodsDetail[0].goodsdetail_price}</i>
					</span>
				</p>
				<p class="pr-price-bottom clearfix">
					 <span class="fl clearfix code-move"> <i class="fl"></i> <em
						class="fl"></em> <img
						src="${goodsDetail[0].images[0].image_path}" width="100"
						height="100" class="code-up">
					</span>
				</p>
			</div>
			<div class="promotion-main">
				<div class="promotion-fr fl" id="main">
					<div class="pr-sps clearfix spec">
						<h5 class="fl active" >规格：</h5><br/>
						<c:forEach items="${goodsDetail}" var="goodsdetail">
						<span style="width:100px;" class="fl" id="guige${goodsdetail.goodsdetail_id}" onclick="togoodsCount(${goodsdetail.goodsdetail_id})">
				         ${goodsdetail.attr_name }</span>
				         <input type="hidden" id="count${goodsdetail.goodsdetail_id}" value="${goodsdetail.goods_count}"/>
				         <input type="hidden" id="price${goodsdetail.goodsdetail_id}" value="${goodsdetail.goodsdetail_price}"/>
				         <div id="image${goodsdetail.goodsdetail_id}" style="display:none;">
				         	<li id="onlickImg">
									<img src="http://localhost:8762/service-admin/imgGoods//${goodsdetail.images[0].image_path}" width="68" height="68">
							</li>
				         </div>
				         <div id="bigimg${goodsdetail.goodsdetail_id}" style="display:none;">
							<img width="400" height="400" alt="" id="midimg" data-original="" src="http://localhost:8762/service-admin/imgGoods//${goodsdetail.images[0].image_path}">
							<div style="left: 165px; top: 0px; display: none;" id="winSelector"></div>
						</div>
				        </c:forEach>
					</div>
					<div class="pr-quantity clearfix">
						<h5 class="fl">购买数量：</h5>
						<div class="choice fl">
							<a href="javascript:;" class="fl">-</a> <input id="goodsNum"
								type="text" class="fl" value="1"> <a href="javascript:;"
								class="fl">+</a>
						</div>
						<div class="fl">
							件<span>货存:<i id="goodscount">${goodsDetail[0].goods_count }</i>件
							</span>
						</div>
					</div>
					<div class="pr-button">
						<form id="myForm" action="http://localhost:8762/service-user/userCenter/user/success.jsp">
							<input id="detailid" type="hidden" value="${goodsDetail[0].goodsdetail_id }" name="goodsdetail_id"> 
							<input id="detailprice" type="hidden" value="${goodsDetail[0].goodsdetail_price }" name="goodsdetail_price"> 
							<input id="detailcount" type="hidden" value="1" name="goods_count"> 
							<input type="button" onclick="newAddCart()" value="加入购物车" class="join"> 
							<input type="button" onclick="addOrder()" value="立即购买" class="collection">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">

$(function(){
	$('#review').click(function(goods_id){
		$.ajax({
			url:'reviewList.action',
			type:"POST",
			data:'goods_id='+1,
			dataType:'JSON',
			success:function(data){
			//alert(data.rows[1]);
		 	var str="";
				var length = data.rows.length;
				for(var i = 0;i<length;i++){
					var review = data.rows[i];
					str+="<span>买家："+review.users.user_name+"</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;";
					str+="评论内容："+review.review_content+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
					str+="评论时间："+review.review_date+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
					str+="晒图：<img style='width:90px;height:90px;' border='1' src='http://localhost:8762/service-user/imgReview/"
	                    +review.review_image+"'/>";
					str+="<hr>";
				} 
				$('#showReview').html(str);
			}		
		});
	});	
})

function addOrder(){
	$("#detailcount").val($("#goodsNum").val());
	$("#myForm").submit();
}
function newAddCart() {
	$("#detailcount").val($("#goodsNum").val());
	
	$.ajax({
		url:"http://localhost:8762/service-user/addCart.action",
		data:$("#myForm").serialize(),
		dataType:"JSON",
		success:function(data) {
			if(data.code==1) {
				layer.msg("添加成功");
				showCart();
			} else {
				layer.msg("添加失败,请您先登录");
				window.location.href="http://localhost:8762/service-user/userCenter/login.jsp";
			}
			
		}
	}) 
}
    function togoodsCount(id){
       	$("#goodscount").html($("#count"+id).val());
       	$("#guige"+id).attr("class","fl active");
       	$("#onlickImg").html($("#image"+id).html());
       	$("#vertical").html($("#bigimg"+id).html());
       	$("#price").html($("#price"+id).val());
       	
       	$("#detailid").val(id);
       	$("#detailprice").val($("#price"+id).val());
       	
    }
</script>



	<div class="pr-commodity" id="goods_recommend">
		<ul class="pr-com-title clearfix">
			<li class="fl">推荐配件</li>
			<li class="fl active">优惠套餐</li>
			<li class="fl">最佳组合</li>
		</ul>
		<ul class="pr-content clearfix">

			<div class="no_goods">暂无产品</div>
		</ul>

		<ul class="pr-content clearfix active">
			<div class="no_goods">暂无产品</div>
		</ul>
		<ul class="pr-content clearfix">
			<div class="no_goods">暂无产品</div>
		</ul>


	</div>

	<div class="eva-comment">
		<div class="productDetaLeft fl" id="bestSelling">
			<%@ include file="top10.jsp"%>
		</div>

		<div class="productDetafr fr">
			<ul class="prod-title clearfix">
				<li class="fl active">商品介绍</li>
				<li class="fl"  id="review">商品评价</li>
			</ul>

			<dl class="pro-comment active">
				<dt class="clearfix">
					<ol class="fl three">
					
						<li>颜色分类：${goodsDetail[0].attr_name}</li>
					</ol>
				</dt>
				<dd class="introduce">
					<h5 class="pr-title"
						style="word-wrap: break-word; margin: 0px; padding: 0px; font-size: 1rem; font-family: 微软雅黑; white-space: normal;">&nbsp;</h5>
					<p>
						<br>
					</p>
				</dd>
			</dl>

			<div class="pro-comment">
			<div class="comment-parentNode" id="comment">
					<div class="clearfix active">
					</div>
				<!-- 	<div class="evaluate-nav clearfix" id="comment-class">
						<a href="javascript:void(0);" onclick="showReviewByNum(0)" class="fl " >全部评价</a>
						<a href="javascript:void(0);" onclick="showReviewByNum(1)" class="fl  " >好评</a>
						<a href="javascript:void(0);" onclick="showReviewByNum(2)" class="fl  " >中评</a>
						<a href="javascript:void(0);" onclick="showReviewByNum(3)"  class="fl  " >差评</a>
					</div>  -->
					<div class="comment-parentNode" id="comment">

						<div class="comment-parent active">
							<div style="text-align: center; line-height: 100px">
							 <div id="showReview" style="text-align:left">
							 
							 </div>
							</div>
						</div>
					</div>
				</div> 
			</div>
		</div>
	</div>
</div>
</div>

<ul class="home-tab">
	<li></li>
	<li></li>
	<li>售后</li>
	<li>技术</li>
	<li>投诉</li>
	<li>关闭</li>
</ul>

<div class="hm-go-top-parent">
	<div class="hm-go-top active"></div>
	<div class="hm-tit-top">顶部</div>
</div>
<script type="text/javascript" src="./goodsDetail_files/evaluate.js"></script>
<script type="text/javascript" src="./goodsDetail_files/expansion.js"></script>
<script type="text/javascript" src="./goodsDetail_files/alert.js"></script>
<script type="text/javascript" src="./goodsDetail_files/cookie.js"></script>
<script type="text/javascript" src="./goodsDetail_files/toastr.min.js"></script>
<script type="text/javascript" src="./goodsDetail_files/goods.js"></script>

 <%@ include file="../userCenter/bottom.jsp"%>