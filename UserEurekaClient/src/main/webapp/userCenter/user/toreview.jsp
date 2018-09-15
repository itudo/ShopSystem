<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ include file="../header1.jsp" %>
<link rel="stylesheet" href="./toreview_files/base.css">
<link rel="stylesheet" href="./toreview_files/style.css">
<link rel="stylesheet" href="./toreview_files/payment.css">
<link rel="stylesheet" href="./toreview_files/page.css">
<script src="./toreview_files/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="./toreview_files/uploadify-base.css">
<link rel="stylesheet" type="text/css" href="./toreview_files/comment.css">
<script type="text/javascript">
$(function() {
	var href = window.location.href;
	var orderdetailid = href.substring(href.indexOf("=")+1,href.length);
	$("#detailid").html(orderdetailid);
	$.getJSON("http://localhost:8762/service-user/orderDetail.action",{orderdetail_id:orderdetailid},function(data) {
		if(data.code==1) {
			var obj = data.obj;
			$(".title").html("<h2>评价详情</h2><p>订单号："+obj.orders.order_id+" &nbsp; 时间："+obj.orders.order_time+"</p>")
			$(".screenshot").html("<img src='http://localhost:8762/service-admin/imgGoods/"+obj.goodsDetail.images[0].image_path+"'>")
			$(".products-description").html("<a href='javascript:;'>"+obj.goodsDetail.goods.goods_name+"</a>")
			$(".products-prices").html("¥"+obj.goods_buyprice);
			$("#orderid").html(obj.orders.order_id);
		}
	})
})
</script>

<div class="viewts-centent-wrap fr">
<div class="title">

</div>
<div class="con-main clearfix">
<div class="fl products stats">
<div class="screenshot"></div>
<p class="products-description">
</p>
<p class="products-prices"></p>
</div>
<div class="fl products-review">
<form id="tf">
<div class="msg clearfix">
<span class="fl"></span>
<em class="fl">请如实的添加评论</em>
</div>
<div class="score clearfix">
<div class="fl degree-title">商品满意度</div>
<div class="fl clearfix cmt">
<span class="fl active"></span>
<span class="fl active"></span>
<span class="fl active"></span>
<span class="fl"></span>
<span class="fl"></span>
<em class="fl" name="level">3分</em>
</div>
</div>
<div class="score clearfix">
<div class="fl degree-title">买家印象</div>
<div class="fl clearfix cSelection">
</div>
</div>
<div class="score clearfix">
<div class="fl degree-title">添加评论</div>
<div class="fl clearfix">
<textarea name="context"></textarea>
<textarea style="display:none" id="level" name="level"></textarea>
<textarea style="display:none" id="orderid" name="orders.order_id"></textarea>
<textarea style="display:none" id="detailid" name="orderdetail_id"></textarea>
</div>
</div>
<div class="clearfix">
<div class="fl degree-title" style="width: 102px;">我的晒单</div>
<div class="fl">

<div id="file_upload" class="uploadify" style="height: 30px; width: 120px;"><input name="file" type="file" id="file_upload-button" class="uploadify-button " style="height: 30px; line-height: 30px; width: 300px;"/></div>
</form>
</div>
</div>
<div class="submit-parent">
<input id="submit" type="submit" class="submit">
</div>
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
</div><div class="easemobim-prompt-wrapper"><div class="loading"><div class="em-widget-loading"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 70 70"><circle opacity=".3" fill="none" stroke="#000" stroke-width="4" stroke-miterlimit="10" cx="35" cy="35" r="11"></circle><path fill="none" stroke="#E5E5E5" stroke-width="4" stroke-linecap="round" stroke-miterlimit="10" d="M24 35c0-6.1 4.9-11 11-11 2.8 0 5.3 1 7.3 2.8"></path></svg></div></div></div>

<script type="text/javascript" src="./toreview_files/jquery.uploadify.js"></script>
<script>

	$(function(){
		var aSpan = $('.viewts-centent-wrap .con-main .products-review .cmt span');
		var oEm   = $('.viewts-centent-wrap .con-main .products-review .cmt em');
		var aBtn  = $('.viewts-centent-wrap .con-main .products-review .cSelection span');
		var iNow  = 0;
		aSpan.on('mouseenter',function(){
			oEm.html($(this).index()+1 +'分');
			$("#level").html($(this).index()+1)
			for(var i = 0; i < aSpan.length; i++){
				if(i <= $(this).index()){
					aSpan.eq(i).addClass('hover');
				}
			}
		}).on('mouseleave',function(){
			oEm.html(iNow +'分');
			$("#level").html(iNow);
			aSpan.removeClass('hover');
		}).on('click',function(){
			iNow = $(this).index()+1;
			oEm.html(iNow +'分');
			$("#level").html(iNow);
			aSpan.removeClass('active')
			for(var i = 0; i < aSpan.length; i++){
				if(i <= $(this).index()){
					aSpan.eq(i).addClass('active');
				}
			}
		});
		$("#submit").click(function(){
            var form = new FormData(document.getElementById("tf"));
            $.ajax({
                url:"http://localhost:8762/service-user/insertReview.action",
                type:"post",
                data:form,
                processData:false,
                contentType:false,
                success:function(data){
                	if(data.code==1) {
                		alert("恭喜您，评论完成！")
                		window.location.href = "http://localhost:8762/service-user/userCenter/user/review.jsp";
                	} else{
                		alert("抱歉，评论失败！")
                	}
                },
            });        
        })

	});
</script>
<%@ include file="../bottom.jsp"%>