<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header1.jsp" %>

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
<script type="text/javascript">
$(function(){
	$.getJSON("http://localhost:8762/service-user/getCollect.action",function(data) {
		if(data.code==1) {
			var obj = data.obj;
			var str = "";
			for(var i=0;i<obj.length;i++) {
				str+="<li class='fl' id='"+obj[i].goods_id+"'><div class='screenshot'><a href='javascript:;'><img src='http://localhost:8762/service-admin/imgGoods/"+obj[i].goodsDetails[0].images[0].image_path+"'></a></div>";
				str+="<div class='products-description'><p><a href='http://localhost:8762/service-user/goodsdetail.action?goods_id="+obj[i].goods_id+"'>"+obj[i].goods_name+" </a></p>";
				str+="<span class='products-prices'>¥ "+obj[i].goodsDetails[0].goodsdetail_price+"</span></div><div class='products-operation clearfix'>";
				str+="<input type='button' value='加入购物车' data-value='"+obj[i].goodsDetails[0].goodsdetail_id+"' class='fl search-text cart_add'>";
				str+="<input type='button' name='del' value='删除' data-value='"+obj[i].goods_id+"' class='fl search-btn'></div></li>";
			}
			$("#collect").html(str);
		}
	})
})
function addCart(id){
	$.post("http://localhost:8762/service-user/addCart.action", { 'goodsdetail_id':id},function(data){
	    if (data.code == 1) {
	    	parent.layer.msg('添加成功', {icon: 1, time: 3000 });
	    	showCart();
	    }else{
	        parent.layer.msg('添加失败', {icon: 2, time: 2000 }); 
	    };
	});
}
</script>
<div class="mcole-section-wrap w">
<div class="nav clearfix">
<ol class="clearfix fl">
<li class="fl active"><a href="">收藏列表</a></li>
</ol>
<form action="" method="post" id="form">
<div class="search fr clearfix">
<input type="text" name="search" id="search" class="fl text">
<input type="submit" class="fl btn" value="">
</div>
</form>
</div>
<ul id="collect" class="content-main clearfix">

</ul>
</div>
<div class="page"><div>共&nbsp;<b>1</b>&nbsp;条&nbsp;&nbsp;&nbsp;<b>1</b>/<b>1</b> 页&nbsp;&nbsp; </div></div>

<ul class="home-tab">
<li>
<em></em>
<span>0</span>
<div class="userTips">
<%@ include file="../tip.jsp" %>
</div>

<script src="./collect_files/assets.js"></script>

<script>


	$('.mcole-section-wrap .content-main').on('mouseenter','li',function(){
		$(this).addClass('hover');
	}).on('mouseleave','li',function(){
		$(this).removeClass('hover');
	});
	$('.mcole-section-wrap .nav ol li').on('click',function(){
		$('.mcole-section-wrap .nav ol li').removeClass('active').eq($(this).index()).addClass('active');
	});
	 $('.mcole-section-wrap .content-main').on('click','.products-operation .cart_add',function(){
	 	var goods_id = $(this).attr('data-value');
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
        $.post("http://localhost:8762/service-user/addCart.action", { 'goodsdetail_id':goods_id},function(data){
            if (data.code == 1) {
            	parent.layer.msg('添加成功', {icon: 1, time: 3000 });
            	showCart();
            }else{
                parent.layer.msg('添加失败', {icon: 2, time: 2000 }); 
            };
        });
    });
</script>
<%@ include file="../bottom.jsp"%>