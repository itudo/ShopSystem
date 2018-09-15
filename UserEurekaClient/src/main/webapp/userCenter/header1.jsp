<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<div class="public-header1">
<div class="center-parent w clearfix">

<a href="http://localhost:8762/service-user/index.jsp" class="logo fl">
<h2>淘宝贝</h2>
<img src="order_files/logo_center.png">
</a>

<div class="myHome fl">
<h2>我的商城</h2>
<a href="http://localhost:8762/service-user/index.jsp">返回商城首页</a>
</div>

<ul class="nav clearfix fl">
<li class="fl">
<a href="http://localhost:8762/service-user/index.jsp">首页</a>
</li>
<li class="fl clearfix">
<a href="javascript:;" class="fl">账户设置</a>
<em class="fl"></em>
<div class="like clearfix">
<em></em>
<dl class="fl">
 <dt>安全设置</dt>
<dd><a href="password.jsp">修改登录密码</a></dd>
<dd><a href="javascript:;">手机绑定</a></dd>
</dl>
<dl class="fl">
<dt>个人资料</dt>
<dd><a href="address.jsp">收货地址</a></dd>
<dd><a href="userInfo.jsp">修改头像、昵称</a></dd>
</dl>
</div>
</li>
<li class="fl">
<a href="message.jsp">消息</a>
<i>0</i>
</li>
</ul>

<div class="mainRight fr clearfix">

<form id="formsarch" action="http://demo.shopsn.net/index.php/Home/Product/ProductList.html" method="get" class="clearfix fl search">
<input type="hidden" name="show" value="show">
<input type="text" class="fl input" id="pp" name="keyword" value="">
<input type="hidden" id="ser-id" name="id" class="fl input" value="">
<input type="submit" class="fl btn" id="search" onmouseover="" value="搜 索">
<div class="gg"></div>
</form>

<div class="home-shopping hover fl">
<div class="home-shopping-top clearfix">
<em class="fl"></em>
<span class="fl"><a href="http://localhost:8762/service-user/userCenter/user/cart.jsp">我的购物车</a></span>
<i class="fl"></i>
</div>
<div class="home-individual clearfix">
<span class="fl"></span><em class="fl" id="couts">1</em><i></i></div>
<dl class="home-shopping-up">

</dl>
</div>
</div>
</div>
</div>
	 <!--ajax商品搜索功能-->
<script>
 $(function() {
	showCart();
});
function showCart() {
	$.getJSON("http://localhost:8762/service-user/getCart.action",function(data) {
		if(data.code==1) {
			var obj = data.obj;
			$("#couts").html(obj.length);
			var str = "";
			for(var i=0;i<obj.length;i++) {
				str+="<dd class='clearfix active'><a href='javscript:;' class='fl'><img src='http://localhost:8762/service-admin/imgGoods/"+obj[i].goodsDetail.images[0].image_path+"' alt=''>";
				str+="</a><a href='' class='fl con'>"+obj[i].goodsDetail.goods.goods_name+" </a><strong class='fl'><span>￥"+obj[i].goodsDetail.goodsdetail_price+"</span>";
				str+="x"+obj[i].goodsDetail.goods_count+"<br><a href='javascript:delCartDetail("+obj[0].cartdetail_id+");' class='dels' >删除</a></strong></dd>";
			}
			$(".home-shopping-up").html(str);
			 
		}
	})
}
function delCartDetail(id){
	 $.getJSON("http://localhost:8762/service-user/delCartDetail.action",{"cartdetail_id":id},function(data) {
		 if(data.code==1) {
			 showCart();
		 }
	 })
}
 
        var _this = null;
        var clear = null;
        var timer = null;
        $('#pp').on('input',function(){
            _this = $(this);
            clearInterval(clear);
            clear = setTimeout(function(){
                var _url ="/index.php/Home/Goods/search.html";
                var _data = _this.val();
                $.post(_url,{title:_data},function(data){
                    if(data.status==0){
                        /*	layer.msg(data.message);*/
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
                    $('input[name="id"]').val(_a[0].id);
                    if(data.status==2){
                        $('.gg').html('');
                    }
                },'json')
            },300);
        }).on('keydown',function(ev){
            if(ev.keyCode == 13){
                if($(this).val() == ''){
                    alert('搜索不能为空！');
                }else{
                    clearTimeout(timer);
                    timer = setTimeout(function(){
                        $('#pp').parents('form').submit();
                    },800);
                }
                return false;
            }
            ev.stopPropagation();
        });
    </script>
    <!--ajax删除购物车里面的商品-->
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
    <!--搜索跳转-->
    <!--<script>
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
    </script>-->
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
<div class="person-section clearfix">